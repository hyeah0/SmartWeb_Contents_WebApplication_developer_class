package error;

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


public class BookDAO_mainpickJson {

 // 멤버변수
    Connection con = null;                      // 데이터 베이스와 연동하는 객체
    PreparedStatement pstmt = null;             // 데이터 베이스에 sql문을 전송하는 객체
    ResultSet rs = null;                        // sql문을 실행 후에 결과값을 가지고 있는 객체
    String sql = null;                          // 쿼리문을 저장할 변수
    
    // 객체 변수
    public static BookDAO_mainpickJson instance;             // 싱글턴 : 2단계
    
    // 생성자
    public BookDAO_mainpickJson() {  }                       // 싱글턴 : 1단계
    
    /**
     * @see .객체 생성 메서드
     */
    public static BookDAO_mainpickJson getInstance() {   // 싱글턴 : 3단계
        
        if(instance == null) {
            instance = new BookDAO_mainpickJson();
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
                + "         where sysdate - order_date <30"
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
     * @see .종로서적 pick 버튼에 따라 값 가져오기
     */
    public String getPickBooks(String requestType) {
        
        System.out.println("-------------BookDAO : getPickBooks() 메서드 실행중..");
        
     // book_sales(누적판매순) / book_cheap(낮은가격순) / book_recent(최신 등록순)
        String requestSearch = "";
        if(requestType.equals("book_sales")) {
            requestSearch = "book_sales desc";
        }else if(requestType.equals("book_cheap")) {
            requestSearch = "book_price";        //asc
        }else{
            requestSearch = "book_date desc";    //desc
        }
        System.out.println("requestSearch : " + requestSearch);
       
      // 결과값 가져오기
        String pickList = "";
        int tmp = 0;
        
        
        try {
            
            openConn();
            
            sql = "select rownum"
                + "     , b.*"
                + "     , b.cgy_num as cgy_num1"
                + "  from (select *"
                + "          from book"
                + "         order by "+ requestSearch +") b";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                pickList += "{"
                         +  "book_num : " + rs.getInt("book_num") + ","
                         +  "cgy_num1 : " + rs.getString("cgy_num1") + ","
                         +  "book_name : " + rs.getString("book_name") + ","
                         +  "book_price : " + rs.getInt("book_price") + ","
                         +  "book_qty : " + rs.getInt("book_qty") + ","
                         +  "book_cont : " + rs.getString("book_cont") + ","
                         +  "book_img : " + rs.getString("book_img") + "}";
                pickList += ",";
            }
            
            // 마지막 쉼표 삭제
            pickList = pickList.substring(0,pickList.length()-1);
            System.out.println(pickList);
            
            System.out.println("-------------BookDAO : getPickBooks() 메서드 실행완료..");
        } catch (Exception e) { e.printStackTrace();
        } finally { closeConn(rs, pstmt, con);
        }
        
        return pickList;
        
    }
}
