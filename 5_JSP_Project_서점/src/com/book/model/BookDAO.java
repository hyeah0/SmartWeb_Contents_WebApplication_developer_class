package com.book.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.mysql.cj.xdevapi.JsonArray;


public class BookDAO {

 // 멤버변수
    Connection con = null;                      // 데이터 베이스와 연동하는 객체
    PreparedStatement pstmt = null;             // 데이터 베이스에 sql문을 전송하는 객체
    ResultSet rs = null;                        // sql문을 실행 후에 결과값을 가지고 있는 객체
    String sql = null;                          // 쿼리문을 저장할 변수
    
    // 객체 변수
    public static BookDAO instance;             // 싱글턴 : 2단계
    
    // 생성자
    public BookDAO() {  }                       // 싱글턴 : 1단계
    
    /**
     * @see .객체 생성 메서드
     */
    public static BookDAO getInstance() {   // 싱글턴 : 3단계
        
        if(instance == null) {
            instance = new BookDAO();
        }
        
        return instance;
    }

    /**
     * @see .DB연동 메서드
     */
    public void openConn() {
        try {
            Context ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/myoracle");
            con = ds.getConnection();
            
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("* ----- 데이터베이스 연결 실패! ----- *");
        }
    }
    
    /**
     * @see .DB연결 종료 메서드 
     */
    public void closeConn(ResultSet rs, PreparedStatement pstmt, Connection con) {
        
        try{
            // ResultSet rs 종료 
            if(rs != null) { rs.close(); }
            // PreparedStatement pstmt 종료
            if(pstmt != null) { pstmt.close(); }
            // Connection con 종료
            if(con != null) { con.close(); }
            
        }catch(Exception e) { e.printStackTrace(); }
    }

    /* ----------------------- 메인 페이지 ---------------------------------------------- */
    /**
     * @see .화제의 책 리스트 가져오기
     */
    public List<BookDTO> getBestBooks(){
        List<BookDTO> bookBestList = new ArrayList<BookDTO>();
        
        try {
            openConn();
            
            sql = "select rownum"
                + "     , o.book_num"
                + "     , order_month"
                + "     , b.cgy_num"
                + "     , b.book_name"
                + "     , b.book_price"
                + "     , b.book_qty"
                + "     , b.book_cont"
                + "     , b.book_img"
                + "  from (select book_num"
                + "             , sum(order_qty) as order_month"
                + "          from book_order"
                + "         where sysdate - order_date <= 30"
                + "         group by book_num"
                + "         order by order_month desc) o"
                + "  join book b "
                + "    on o.book_num = b.book_num"
                + " where rownum >=1 and rownum <=5";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                BookDTO dto = new BookDTO();
                dto.setRownum(rs.getInt("rownum"));
                dto.setBook_num(rs.getInt("book_num"));
                dto.setOrder_month(rs.getInt("order_month"));
                dto.setCgy_num(rs.getString("cgy_num"));
                dto.setBook_name(rs.getString("book_name"));
                dto.setBook_price(rs.getInt("book_price"));
                dto.setBook_qty(rs.getInt("book_qty"));
                dto.setBook_cont(rs.getString("book_cont"));
                dto.setBook_img(rs.getString("book_img"));
                
                bookBestList.add(dto);
            }
            
        } catch (Exception e) { e.printStackTrace();
        } finally { closeConn(rs, pstmt, con);
        }
        return bookBestList;
    }
    
    /**
     * @see .종로서적 pick 버튼에 따라 값 가져오기(1년간 판매량이 있는 책 한정)
     */
    public List<BookDTO> getPickBooks(String requestType) {
        
        System.out.println("-------------BookDAO : getPickBooks() 메서드 실행중..");
        
      // book_sales(누적판매순) / book_cheap(낮은가격순) / book_recent(최신 등록순)
        String requestSearch = "";
        
        if(requestType.equals("book_sales")) {
            requestSearch = "order_year desc"; 
            
        }else if(requestType.equals("book_price")) {
            requestSearch = "book_price";        //asc
            
        }else{
            requestSearch = "book_date desc";    //desc
        }
        
      // 결과값 가져오기
        List<BookDTO> bookPickList = new ArrayList<BookDTO>();
        
        try {
            openConn();
            System.out.println("requestSearch : " + requestSearch);
            
            sql = "select b.*"
                + "  from book b"
                + "   join (select book_num "
                + "              , sum(order_qty) as order_year"
                + "           from book_order"
                + "          where sysdate - order_date <= 365"
                + "          group by book_num) o"
                + "     on b.book_num = o.book_num "
                + "  order by "+ requestSearch;
            
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
               BookDTO dto = new BookDTO();
               
               dto.setBook_num(rs.getInt("book_num"));
               dto.setCgy_num(rs.getString("cgy_num"));
               dto.setBook_name(rs.getString("book_name"));
               dto.setBook_price(rs.getInt("book_price"));
               dto.setBook_qty(rs.getInt("book_qty"));
               //dto.setBook_cont(rs.getString("book_cont"));
               dto.setBook_cont(rs.getString("book_cont").replace("\r\n", "<br>"));
               dto.setBook_img(rs.getString("book_img"));
               bookPickList.add(dto);
            }
            
        } catch (Exception e) { e.printStackTrace();
        } finally { closeConn(rs, pstmt, con);
        }
        
        return bookPickList;
        
    }
    
    /**
     * @see .카테고리별 데이터 수
     */
    public int getDBCount(String cgy_num) {
        int totalRecord = 0;
        
        try {
            openConn();
            
            if(cgy_num.equals("all")) {
                sql="select count(*) from book";
                
            }else {
                sql="select count(*) from book where cgy_num = '" + cgy_num + "'";
            }
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                totalRecord = rs.getInt(1);
            }
            
            System.out.println("totalRecord : " + totalRecord);
            System.out.println("---------bookdao : getDBCount() 메서드 실행완료..");
            
        } catch (Exception e) { e.printStackTrace();
        } finally { closeConn(rs, pstmt, con);
        }
        
        return totalRecord;
    }
    
    /**
     * @see. 카테고리별 검색 데이터 갯수 
     */
    public int getDBCount(String searchType, String searchInput) {
     
        int totalRecord = 0;
        
        try {
            
            openConn();
            
            if(searchType.equals("all")) {
                sql = "select count(*)"
                        + "  from book b"
                        + "  where ( book_name like '%" +searchInput + "%'"
                        + "     or book_writer like '%" +searchInput + "%'"
                        + "     or book_publisher like '%" +searchInput + "%'"
                        + "     or book_cont like '%" + searchInput + "%')";
                pstmt = con.prepareStatement(sql);
                
            }else {
                sql = "select count(*)"
                    + "  from book b"
                    + "  where b.cgy_num = '" + searchType + "'"
                    + "    and ( book_name like '%" + searchInput + "%'"
                    + "     or book_writer like '%" + searchInput + "%'"
                    + "     or book_publisher like '%" + searchInput + "%'"
                    + "     or book_cont like '%" + searchInput + "%')";
            }
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                totalRecord = rs.getInt(1);
            }
            
        } catch (Exception e) { e.printStackTrace();
        } finally { closeConn(rs, pstmt, con);
        }
        
        return totalRecord;
    }
    
    /**
     * @see .카테고리별 리스트가져오기
     */
    public List<BookDTO> getCgyBooks(String cgy_num, String requestType, int page, int rowsize){
        System.out.println("-------------BookDAO : getCgyBooks() 메서드 실행중..");
        System.out.println("bookdao : 받아온 cgy_num : " + cgy_num);
        System.out.println("bookdao : 받아온 requestType : " + requestType);
        
        List<BookDTO> bookCgyList = new ArrayList<BookDTO>();
        
        // book_sales(누적판매순) / book_cheap(낮은가격순) / book_recent(최신 등록순)
        String requestSearch = "";
        
        if(requestType.equals("book_sales")) {
            requestSearch = "order_year desc"; 
            
        }else if(requestType.equals("book_price")) {
            requestSearch = "book_price";        
            
        }else{
            requestSearch = "book_date desc, book_num desc";    
        }
        
        // 포스트 시작, 끝 번호
        int startNo = (page * rowsize) - (rowsize -1);
        int endNo = (page * rowsize);
        System.out.println("bookdao : startNo : " + startNo);
        System.out.println("bookdao : endNo : " + endNo);
        
        try {
            openConn();
            
            // 1년 누적 판매량 기준
            // order_cnt : 기간 오더수 뽑는 쿼리_ 사용 테이블 book_order
            // order_cnt_num : 기간 동안 오더수 없는 책 포함, 주문건 없을 경우 0으로 변경, 카테고리 선택가능
            // order_cnt_row : 기간 오더수 row
            // 마지막 : 기간 오더수 row 설정(페이징)
            if(cgy_num.equals("all")){ // cgy_num=all : nav에서 도서전체 클릭
               
                sql = "with order_cnt as(select book_num"
                    + "                      , sum(order_qty) as order_year"
                    + "                   from book_order"
                    + "                  where sysdate - order_date <= 365" // 기간설정 
                    + "                  group by book_num"
                    + "),order_cnt_num as (select b.*"
                    + "                          , case when o.order_year is null then 0 else o.order_year end as order_year"
                    + "                      from book b"
                    + "                      left join order_cnt o"
                    + "                         on b.book_num = o.book_num "
                    + "),order_cnt_row as("
                    + "                    select ROW_NUMBER() over(order by "+requestSearch +" ) as row_num"
                    + "                         , y.*"
                    + "                      from order_cnt_num y"
                    + ")"
                    + "select r.*"
                    + "   from order_cnt_row r"
                    + "  where r.row_num>= "+ startNo + "and r.row_num<=" + endNo
                    + "  order by r.row_num" ;
                    
                    
                    System.out.println("dao if 1: " + requestSearch);
                
            }else if(!cgy_num.equals("all")&&requestType.equals("book_sales")){ 
                    
                    // 카테고리 선택 + 누적판매순 클릭시
                    sql = "with order_cnt as(select book_num"
                        + "                      , sum(order_qty) as order_year"
                        + "                   from book_order"
                        + "                  where sysdate - order_date <= 365" //기간설정
                        + "                  group by book_num"
                        + " ),order_cnt_num as (select b.*"
                        + "                          , case when o.order_year is null then 0 else o.order_year end as order_year"
                        + "                      from book b"
                        + "                      left join order_cnt o"
                        + "                         on b.book_num = o.book_num "
                        + "                      where b.cgy_num = '"+ cgy_num +"'" // 카테고리 설정
                        + " ),order_cnt_row as("
                        + "                    select ROW_NUMBER() over(order by "+ requestSearch +" ) as row_num"
                        + "                         , y.*"
                        + "                      from order_cnt_num y"
                        + " )"
                        + "select r.*"
                        + "   from order_cnt_row r"
                        + "  where r.row_num >= "+ startNo + " and r.row_num <= " + endNo;
                    
                    System.out.println("dao if 2: " + requestSearch);
            
            } else if(!cgy_num.equals("all")&&!requestType.equals("book_sales")) {
                
                // 카테고리 선택 + 최소주문건, 또는 최신 등록순 클릭시
                sql = "with book_db as (select ROW_NUMBER() over(order by "+ requestSearch +" ) as row_num"
                    + "                       , b.*"
                    + "                   from book b"
                    + "                  where cgy_num = '"+ cgy_num + "'"
                    + ")select d.* "
                    + "   from book_db d"
                    + "  where d.row_num >= "+ startNo + " and d.row_num <= " + endNo
                    + "  order by d.row_num";
                    
                    System.out.println("dao if 2: " + requestSearch);
            }
                   
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                BookDTO bookDto = new BookDTO();
                bookDto.setRownum(rs.getInt("row_num"));
                bookDto.setBook_num(rs.getInt("book_num"));
                bookDto.setCgy_num(rs.getString("cgy_num"));
                bookDto.setBook_name(rs.getString("book_name"));
                bookDto.setBook_price(rs.getInt("book_price"));
                bookDto.setBook_qty(rs.getInt("book_qty"));
                bookDto.setBook_cont(rs.getString("book_cont"));
                bookDto.setBook_img(rs.getString("book_img"));
                bookDto.setBook_date(rs.getString("book_date"));
                bookDto.setBook_update(rs.getString("book_update"));
                bookDto.setBook_writer(rs.getString("book_writer"));
                bookDto.setBook_publisher(rs.getString("book_publisher"));
                bookDto.setBook_sales(rs.getInt("book_sales"));
                bookDto.setBook_page(rs.getInt("book_page"));
                
                if(cgy_num.equals("all")||requestType.equals("book_sales")) {
                    bookDto.setOrder_year(rs.getInt("order_year"));
                }
                
                bookCgyList.add(bookDto);
                
            }
            
            System.out.println("-------------BookDAO : getCgyBooks() 메서드 실행완료..");
        } catch (Exception e) { e.printStackTrace();
        } finally { closeConn(rs, pstmt, con);
        }
        
        return bookCgyList;
        
    }
    
    /**
     * @see .검색시 해당하는 자료 요청 카테고리별 리스트가져오기
     */
    public List<BookDTO> getCgyBooks(String requestType, String searchType, String searchInput, int page, int rowsize){
        
        System.out.println("-------------BookDAO : getCgyBooks() 검색용 메서드 실행중..");
        System.out.println("bookbao : requestType 넘어온 값 : " + requestType);
        System.out.println("bookbao : searchType 넘어온 값 : " + searchType);
        System.out.println("bookbao : searchInput 넘어온 값 : " + searchInput);
        System.out.println("bookbao : page 넘어온 값 : " + page);
        System.out.println("bookbao : rowsize 넘어온 값 : " + rowsize);
        
        
        List<BookDTO> bookCgyList = new ArrayList<BookDTO>();
        
        // book_sales(누적판매순) / book_cheap(낮은가격순) / book_recent(최신 등록순)
        String requestSearch = "";
        
        if(requestType.equals("book_sales")) {
            requestSearch = "order_year desc"; 
            
        }else if(requestType.equals("book_price")) {
            requestSearch = "book_price";        
            
        }else{
            requestSearch = "book_date desc, book_num desc";    
        }
        
        // 포스트 시작, 끝 번호
        int startNo = (page * rowsize) - (rowsize -1);
        int endNo = (page * rowsize);
        
        try {
            openConn();
            
            // 검색 카테고리, 검색어, 어떤 정렬 방식인지, 현재 페이지
            // searchType : 페이지 카테고리가 아닌 다른 카테고리 선택시 해당 카테고리 번호로 넘어옴, 통합검색은 search_total 로 되어있음
            // searchInput : 검색어
            // requestType : 어떤 정렬을 원하는지
            // startNo : 포스트 시작 번호
            // endNo : 포스트 끝 번호
            if(searchType.equals("all")&&requestType.equals("book_sales")) { // 통합검색으로 선택시
               
                sql = "with order_cnt as(select book_num, sum(order_qty) as order_year"
                    + "                   from book_order"
                    + "                  where sysdate - order_date <= 365" // 기간설정 
                    + "                  group by book_num"
                    + "),order_cnt_num as (select b.* , case when o.order_year is null then 0 else o.order_year end as order_year"
                    + "                      from book b"
                    + "                      left join order_cnt o"
                    + "                         on b.book_num = o.book_num"
                    + "                      where (book_name like '%" + searchInput + "%'"
                    + "                         or book_writer like '%" + searchInput + "%'"
                    + "                         or book_publisher like '%" + searchInput + "%'"
                    + "                         or book_cont like '%" + searchInput + "%')"
                    + "),order_cnt_row as("
                    + "                    select ROW_NUMBER() over(order by "+requestSearch +" ) as row_num"
                    + "                         , y.*"
                    + "                      from order_cnt_num y)"
                    + "select r.*"
                    + "   from order_cnt_row r"
                    + "  where r.row_num>= "+ startNo + "and r.row_num<=" + endNo
                    + "  order by r.row_num" ;
                
            }else {
                
                sql = "with order_cnt as(select book_num, sum(order_qty) as order_year"
                    + "                   from book_order"
                    + "                  where sysdate - order_date <= 365" // 기간설정 
                    + "                  group by book_num"
                    + "),order_cnt_num as (select b.*, case when o.order_year is null then 0 else o.order_year end as order_year"
                    + "                      from book b"
                    + "                      left join order_cnt o"
                    + "                         on b.book_num = o.book_num "
                    + "                      where b.cgy_num = '"+ searchType +"'"
                    + "                        and (b.book_name like '%" + searchInput + "%'"
                    + "                         or b.book_writer like '%" + searchInput + "%'"
                    + "                         or b.book_publisher like '%" + searchInput + "%'"
                    + "                         or b.book_cont like '%" + searchInput + "%')"
                    + "),order_cnt_row as("
                    + "                    select ROW_NUMBER() over(order by "+requestSearch +" ) as row_num"
                    + "                         , y.*"
                    + "                      from order_cnt_num y)"
                    + "select r.*"
                    + "   from order_cnt_row r"
                    + "  where r.row_num>= "+ startNo + "and r.row_num<=" + endNo
                    + "  order by r.row_num" ;
            }
            
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                BookDTO bookDto = new BookDTO();
                bookDto.setRownum(rs.getInt("row_num"));
                bookDto.setBook_num(rs.getInt("book_num"));
                bookDto.setCgy_num(rs.getString("cgy_num"));
                bookDto.setBook_name(rs.getString("book_name"));
                bookDto.setBook_price(rs.getInt("book_price"));
                bookDto.setBook_qty(rs.getInt("book_qty"));
                bookDto.setBook_cont(rs.getString("book_cont"));
                bookDto.setBook_img(rs.getString("book_img"));
                bookDto.setBook_date(rs.getString("book_date"));
                bookDto.setBook_update(rs.getString("book_update"));
                bookDto.setBook_writer(rs.getString("book_writer"));
                bookDto.setBook_publisher(rs.getString("book_publisher"));
                bookDto.setBook_sales(rs.getInt("book_sales"));
                bookDto.setBook_page(rs.getInt("book_page"));
                
                bookCgyList.add(bookDto);
                
            }
            
            System.out.println("-------------BookDAO : getCgyBooks() 검색용 메서드 실행완료..");
        } catch (Exception e) { e.printStackTrace();
        } finally { closeConn(rs, pstmt, con);
        }
        
        return bookCgyList;
        
    }
}

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
/* ---------- 백업 부분 -----------------------------------------------*/
 