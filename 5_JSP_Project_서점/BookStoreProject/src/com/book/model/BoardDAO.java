package com.book.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {

 // 멤버변수
    Connection con = null;                      // 데이터 베이스와 연동하는 객체
    PreparedStatement pstmt = null;             // 데이터 베이스에 sql문을 전송하는 객체
    ResultSet rs = null;                        // sql문을 실행 후에 결과값을 가지고 있는 객체
    String sql = null;                          // 쿼리문을 저장할 변수
    
    // 객체 변수
    public static BoardDAO instance;             // 싱글턴 : 2단계
    
    // 생성자
    public BoardDAO() {  }                       // 싱글턴 : 1단계
    
    /**
     * @see .객체 생성 메서드
     */
    public static BoardDAO getInstance() {   // 싱글턴 : 3단계
        
        if(instance == null) {
            instance = new BoardDAO();
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
     * @see .게시글 고유 번호 구하기
     */
    public int getBoardNum() {
        
        int result = 0;
        
        try {
            
            openConn();
            
            sql="select max(board_num) from board";
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
       String board = "'"+ boardDto.getBoard_num() + "', '"+  boardDto.getBoard_title()+ "', '" + boardDto.getBoard_cont() + "', " +  boardDto.getBoard_date() + ", '' , "+  boardDto.getMem_num() + ", '" + boardDto.getBoard_cgy_num() + "', '" +  boardDto.getBoard_image() + "'";
       System.out.println(board);
       
       int result = 0;
       
       try {
           
           openConn();
           
           sql = "insert into board (board_num, board_title, board_cont, board_date, board_update, mem_num, board_cgy_num, board_image ) values (?, ?, ?, sysdate, '', ?, ?, ?)";
           pstmt = con.prepareStatement(sql);
           pstmt.setInt(1, boardDto.getBoard_num());
           pstmt.setString(2, boardDto.getBoard_title());
           pstmt.setString(3, boardDto.getBoard_cont());
           pstmt.setInt(4, boardDto.getMem_num());
           pstmt.setString(5, boardDto.getBoard_cgy_num());
           pstmt.setString(6, boardDto.getBoard_image());
           
           result = pstmt.executeUpdate();
           
           System.out.println("등록 결과 : " + result);
           System.out.println("--------- boardDao : insertBoard() 메서드 실행완료.. ");
       } catch (Exception e) { e.printStackTrace();
       } finally { closeConn(rs, pstmt, con);
       }
       
       return result;
   }
   
   /**
    * @see .문의글 수정
    */
   public int updateBoard(BoardDTO boardDto) {
       int result = 0;
       
       try {
           openConn();
           
           sql = "update board "
               + "   set board_title = ? "
               + "     , board_cont = ?"
               + "     , board_update = sysdate"
               + "     , board_image = ?"
               + " where board_num = ? and mem_num = ?";
           pstmt = con.prepareStatement(sql);
           pstmt.setString(1, boardDto.getBoard_title());
           pstmt.setString(2, boardDto.getBoard_cont());
           pstmt.setString(3, boardDto.getBoard_image());
           pstmt.setInt(4, boardDto.getBoard_num());
           pstmt.setInt(5, boardDto.getMem_num());
           
           result = pstmt.executeUpdate();
           
           System.out.println("수정 결과 : " + result);
           System.out.println("--------- boardDao : updateBoard() 메서드 실행완료.. ");
       } catch (Exception e) { e.printStackTrace();
       } finally { closeConn(rs, pstmt, con);
       }
       
       return result;
   }
   
   /**
    * @see. 특정 사용자 게시물 전체 보기
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
               boardDto.setBoard_num(rs.getInt("board_num"));
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
   
   /**
    * @see. 특정 사용자 특정 게시물 상세 보기
    */
   public BoardDTO getBoard(int mem_num, String board_num){
       
       BoardDTO boardDto = null;
       

       try {
           
           openConn();
           
           sql = "select b.*, bc.board_cgy_name "
               + "  from board b"
               + "  join board_category bc"
               + "    on b.board_cgy_num = bc.board_cgy_num "
               + "  where mem_num = ? and board_num = ?"
               + "  order by b.board_num desc";
           pstmt = con.prepareStatement(sql);
           pstmt.setInt(1, mem_num);
           pstmt.setString(2, board_num);
           rs = pstmt.executeQuery();
           
           if(rs.next()) {
               boardDto = new BoardDTO();
               boardDto.setBoard_num(rs.getInt("board_num"));
               boardDto.setBoard_title(rs.getString("board_title"));
               boardDto.setBoard_cont(rs.getString("board_cont"));
               boardDto.setBoard_date(rs.getString("board_date"));
               boardDto.setBoard_update(rs.getString("board_update"));
               boardDto.setBoard_cgy_num(rs.getString("board_cgy_num"));
               boardDto.setBoard_cgy_name(rs.getString("board_cgy_name"));
               boardDto.setBoard_image(rs.getString("board_image"));
           }
        
        } catch (Exception e) { e.printStackTrace();
        } finally { closeConn(rs, pstmt, con);
        }
       
       
       return boardDto;
   }
   
   /**
    * @see .게시판 삭제
    */
   public int deleteBoard(int mem_num, String board_num) {
       int result = 0;
       
       try{
           openConn();
           
           sql = "delete from board where mem_num = ? and board_num = ?";
           pstmt = con.prepareStatement(sql);
           pstmt.setInt(1, mem_num);
           pstmt.setString(2, board_num);
           result = pstmt.executeUpdate();
           
       } catch (Exception e) { e.printStackTrace();
       } finally { closeConn(rs, pstmt, con);
       }
       
       return result;
   }
}
