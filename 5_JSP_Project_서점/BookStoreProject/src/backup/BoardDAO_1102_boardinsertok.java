package backup;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO_1102_boardinsertok {

 // 멤버변수
    Connection con = null;                      // 데이터 베이스와 연동하는 객체
    PreparedStatement pstmt = null;             // 데이터 베이스에 sql문을 전송하는 객체
    ResultSet rs = null;                        // sql문을 실행 후에 결과값을 가지고 있는 객체
    String sql = null;                          // 쿼리문을 저장할 변수
    
    // 객체 변수
    public static BoardDAO_1102_boardinsertok instance;             // 싱글턴 : 2단계
    
    // 생성자
    public BoardDAO_1102_boardinsertok() {  }                       // 싱글턴 : 1단계
    
    /**
     * @see .객체 생성 메서드
     */
    public static BoardDAO_1102_boardinsertok getInstance() {   // 싱글턴 : 3단계
        
        if(instance == null) {
            instance = new BoardDAO_1102_boardinsertok();
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
     * @see .게시글 갯수 구하기
     */
    public int getDBCount() {
        
        int result = 0;
        
        try {
            
            openConn();
            
            sql= "select count(*) from board";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                result = rs.getInt(1);
            }
            
        } catch (Exception e) { e.printStackTrace();
        } finally { closeConn(rs, pstmt, con);
        }
        
        
        return result;
    }
    
    
    /**
     * @see .문의글 추가
     */
   public int insertBoard(BoardDTO boardDto) {
       System.out.println("--------- boardDao : insertBoard() 메서드 실행중.. ");
       System.out.println("board_num : " + boardDto.getBoard_num());
       System.out.println("mem_num : " + boardDto.getMem_num());
       String board = "'"+ boardDto.getBoard_num() + "', '"+  boardDto.getBoard_title()+ "', '" + boardDto.getBoard_cont() + "', " +  java.sql.Date.valueOf(boardDto.getBoard_date()) + ", '' , "+  boardDto.getMem_num() + ", '" + boardDto.getBoard_cgy_num() + "', '" +  boardDto.getBoard_image() + "'";
       System.out.println(board);
       
       int result = 0;
       
       try {
           
           openConn();
           
           sql = "insert into board (board_num, board_title, board_cont, board_date, board_update, mem_num, board_cgy_num, board_image ) values (?, ?, ?, ?, '', ?, ?, ?)";
           pstmt = con.prepareStatement(sql);
           pstmt.setString(1, boardDto.getBoard_num());
           pstmt.setString(2, boardDto.getBoard_title());
           pstmt.setString(3, boardDto.getBoard_cont());
           pstmt.setDate(4, java.sql.Date.valueOf(boardDto.getBoard_date()));
           pstmt.setInt(5, boardDto.getMem_num());
           pstmt.setString(6, boardDto.getBoard_cgy_num());
           pstmt.setString(7, boardDto.getBoard_image());
           
           result = pstmt.executeUpdate();
           
           System.out.println("업데이트 결과 : " + result);
           System.out.println("--------- boardDao : insertBoard() 메서드 실행완료.. ");
       } catch (Exception e) { e.printStackTrace();
       } finally { closeConn(rs, pstmt, con);
       }
       
       return result;
   }
   
   /**
    * @see. 특정 사용자 게시물 보기
    */
   public List<BoardDTO> getBoard(int mem_num){
       
       List<BoardDTO> boardList = new ArrayList<BoardDTO>();
       
       try {
           
           openConn();
           
           sql = "select b.*, bc.board_cgy_name "
               + "  from board b"
               + "  join board_category bc"
               + "    on b.board_cgy_num = bc.board_cgy_num "
               + "  where mem_num = ?"
               + "  order by b.board_num desc";
           pstmt = con.prepareStatement(sql);
           pstmt.setInt(1, mem_num);
           rs = pstmt.executeQuery();
           
           while(rs.next()) {
               BoardDTO boardDto = new BoardDTO();
               boardDto.setRow(rs.getRow());
               boardDto.setBoard_num(rs.getString("board_num"));
               boardDto.setBoard_title(rs.getString("board_title"));
               boardDto.setBoard_cont(rs.getString("board_cont"));
               boardDto.setBoard_date(rs.getString("board_date"));
               boardDto.setBoard_update(rs.getString("board_update"));
               boardDto.setBoard_cgy_num(rs.getString("board_cgy_num"));
               boardDto.setBoard_cgy_name(rs.getString("board_cgy_name"));
               boardDto.setBoard_image(rs.getString("board_image"));
               
               boardList.add(boardDto);
           }
        
        } catch (Exception e) { e.printStackTrace();
        } finally { closeConn(rs, pstmt, con);
        }
       
       return boardList;
   }
   
}
