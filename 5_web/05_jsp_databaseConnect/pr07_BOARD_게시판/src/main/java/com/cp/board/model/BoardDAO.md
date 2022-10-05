```
package com.cp.board.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {

	// 멤버변수
	Connection con = null;						// 데이터 베이스와 연동하는 객체
	PreparedStatement pstmt = null;				// 데이터 베이스에 sql문을 전송하는 객체
	ResultSet rs = null;						// sql문을 실행 후에 결과값을 가지고 있는 객체
	String sql = null; 							// 쿼리문을 저장할 변수
	private static BoardDAO instance;

	public BoardDAO() {	}

	public static BoardDAO getInstance() {
		if(instance == null) {
			instance = new BoardDAO();
		}
		return instance;
	}

	// db연동
	public void openCon() {
		try {
			// 1단계 : JNDI 서버객체 생성
			Context ctx = new InitialContext();

			// 2단계 : lookup() 메서드 이용, 매칭되는 커넥션 찾기
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysqlTest");

			// 3단계 : datasource  객체를 이용하여 커넥션을 가져온다.
			con = ds.getConnection();

		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void closeCon(ResultSet rs, PreparedStatement pstmt, Connection con) {
		try {

			if(rs != null) { rs.close();}

			if(pstmt != null) {	pstmt.close(); }

			if(con != null) { con.close(); }

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	* 오늘 날짜 메서드
	*/
	public String getToday() {
//		Date nowDate = new Date(0);
//
//		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
//		String today = simpleDateFormat.format(nowDate);
//		System.out.println(curDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));

		LocalDate curDate = LocalDate.now();
		String today = curDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));

		return today;
	}

	/**
	 * 전체 자료 메서드
	 */
	public List<BoardDTO> getBoard() {

		List<BoardDTO> boardList = new ArrayList<BoardDTO>();

		try {
			openCon();

			sql = "select * from board order by board_no desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()) {

				BoardDTO dto = new BoardDTO();
				dto.setBoard_no(rs.getInt("board_no"));
				dto.setBoard_title(rs.getString("board_title"));
				dto.setBoard_wirter(rs.getString("board_writer"));
				dto.setBoard_date(rs.getString("board_date"));
				dto.setBoard_hit(rs.getInt("board_hit"));

				boardList.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeCon(rs, pstmt, con);
		}


		return boardList;

	}

	/**
	 * 자료 상세 메서드 실행전 조회수 +1 메서드
	 */
	public void addHit(int board_no) {

		try {
			openCon();

			sql = "select * from board where board_no =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_no);
			rs = pstmt.executeQuery();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	/**
	 * 자료 상세 메서드
	 */
	public BoardDTO getBoardDetail(int board_no) {

		BoardDTO dto = new BoardDTO();
		int result = 0;

		try {
			openCon();

			sql = "select * from board where board_no =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_no);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				dto.setBoard_no(rs.getInt("board_no"));
				dto.setBoard_title(rs.getString("board_title"));
				dto.setBoard_wirter(rs.getString("board_writer"));
				dto.setBoard_date(rs.getString("board_date"));
				dto.setBoard_update(rs.getString("board_update"));
				dto.setBoard_cont(rs.getString("board_cont").trim());
				dto.setBoard_pwd(rs.getString("board_pwd"));
				//System.out.println("dto객체에 값 저장 완료!");
				//System.out.println(dto.getBoard_no() + ":" + dto.getBoard_wirter());
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeCon(rs, pstmt, con);
		}

		return dto;
	}

	/**
	 * 자료 업데이트 메서드
	 */
	public int updateBoard(int board_no, String board_title, String board_cont) {

		int result = 0;

		try {

			openCon();

			String today = getToday();
			sql = "select board_date from board where board_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_no);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				String board_date = rs.getString("board_date");
				if(!today.equals(board_date)) {
					sql = "update board"
						+ "   set board_update = ?"
						+ " where board_no = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, today);
					pstmt.setInt(2, board_no);
					pstmt.executeUpdate();
				}
			}

			sql = "update board "
			    + "   set board_title = ?"
			    + "     , board_cont = ?"
			    + " where board_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board_title);
			pstmt.setString(2, board_cont);
			pstmt.setInt(3, board_no);
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeCon(rs, pstmt, con);
		}

		return result;
	}

	/**
	 * 자료 삭제 메서드
	 */
	public int deleteBoard(int board_no) {
		int result = 0;

		try {
			openCon();

			sql = "delete from board where board_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_no);
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeCon(rs, pstmt, con);
		}

		return result;
	}
}
```
