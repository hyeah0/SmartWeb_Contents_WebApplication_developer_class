package error;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.BookDAO;

public class MainBookListBestAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        System.out.println("----------------- MainBookListBestAction 클래스 -----------------");
        BookDAO dao = BookDAO.getInstance();
        
        Connection con = null;                      // 데이터 베이스와 연동하는 객체
        PreparedStatement pstmt = null;             // 데이터 베이스에 sql문을 전송하는 객체
        ResultSet rs = null;                        // sql문을 실행 후에 결과값을 가지고 있는 객체
        String sql = null;                          // 쿼리문을 저장할 변수
        
        dao.openConn();
        JSONArray array = new JSONArray();  // [] Json 배열 생성
       
        try {
            System.out.println("sql실행 예정-----------------");
            
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
           
        } catch (Exception e) { e.printStackTrace();
        } finally { dao.closeConn(rs, pstmt, con);
        }
       
        
        System.out.println("bestBook json list : " + array.toString() );
        System.out.println("----------------- ajax에 값 넘겨줌 -----------------");
      
        
        /* ajax를 호출한 곳에 bestBook값을 넘겨줌 */
        PrintWriter out = response.getWriter();
        out.println(array.toString());
        
        return null;
    }

}
