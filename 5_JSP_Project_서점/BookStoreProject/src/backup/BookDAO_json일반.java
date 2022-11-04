package backup;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.json.JSONArray;
import org.json.JSONObject;

import com.book.controller.Action;
import com.book.controller.ActionForward;


public class BookDAO_json일반 {

 // 멤버변수
    Connection con = null;                      // 데이터 베이스와 연동하는 객체
    PreparedStatement pstmt = null;             // 데이터 베이스에 sql문을 전송하는 객체
    ResultSet rs = null;                        // sql문을 실행 후에 결과값을 가지고 있는 객체
    String sql = null;                          // 쿼리문을 저장할 변수
    
    // 객체 변수
    public static BookDAO_json일반 instance;             // 싱글턴 : 2단계
    
    // 생성자
    public BookDAO_json일반() {  }                       // 싱글턴 : 1단계
    
    /**
     * @see .객체 생성 메서드
     */
    public static BookDAO_json일반 getInstance() {   // 싱글턴 : 3단계
        
        if(instance == null) {
            instance = new BookDAO_json일반();
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
     * @see .book 리스트 가져오기
     */
    public List<BookDTO> getBooks(){
        List<BookDTO> bookList = new ArrayList<BookDTO>();
        
        try {
            openConn();
            
            sql = "select * from book order by book_num desc";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                BookDTO bookDto = new BookDTO();
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
                bookList.add(bookDto);
            }
            
        } catch (Exception e) { e.printStackTrace();
        } finally { closeConn(rs, pstmt, con);
        }
        return bookList;
    }
    
    /**
     * @see .book 리스트 가져오기(ajax json)
     */
    public JSONArray getBestBookList() {
       
        System.out.println("-----------------BookDAO : getBestBookList() 메서드 실행중-----------------");
        System.out.println("JSONArray객체 생성 전-----------------");
        JSONArray array = new JSONArray();  // [] Json 배열 생성
        System.out.println("JSONArray객체 생성 후-----------------");
     
        try {
            System.out.println("sql실행 예정-----------------");
            openConn();
            
            sql = "select o.book_num"
                + "     , o.order_month"
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
            System.out.println("sql실행 완료-----------------");
            
            // Json 형태로 변환
            // JSONObject obj {}, JSON 객체 생성
            // obj.put("key","value")
            while(rs.next()) {
                
                JSONObject obj = new JSONObject();  
                obj.put("book_num", rs.getInt("book_num"));     //Integer.toString        
                obj.put("order_month", rs.getInt("order_month"));
                obj.put("cgy_num", rs.getString("cgy_num"));
                obj.put("book_name", rs.getString("book_name"));
                obj.put("book_price", rs.getInt("book_price"));
                obj.put("book_qty", rs.getInt("book_qty"));
                obj.put("book_cont", rs.getString("book_cont"));
                obj.put("book_img", rs.getString("book_img"));
               
                array.put(obj);
                array.get(rs.getRow());
            }
           
            System.out.println("-----------------BookDAO : getBestBookList() 메서드 실행완료!-----------------");
                
        } catch (Exception e) { e.printStackTrace();
        } finally { closeConn(rs, pstmt, con);
        }
        
        return array;
    }
}
