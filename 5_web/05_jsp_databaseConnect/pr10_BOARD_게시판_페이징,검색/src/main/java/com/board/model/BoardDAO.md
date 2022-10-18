```
package com.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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

	// 객체 변수
	private static BoardDAO instance;				// 싱글턴 : 2단계

	// 생성자
	private BoardDAO() {	}						// 싱글턴 : 1단계

	/**
	 * 싱글턴 객체 생성 메서드
	 * - BoardDAO getInstance()
	 * - 자료형 메서드명()
	 */
	public static BoardDAO getInstance() {	// 싱글턴 : 3단계

		if(instance == null) {
			instance = new BoardDAO();
		}

		return instance;
	}

	/**
	 * DB연동 메서드
	 * - openCon()
	 */
	public void openConn() {

		try {
			// dbcp 방법 ----------------------------------------------------------------------------------------------
			// 1단계 : JNDI 서버 객체 생성
			Context ctx = new InitialContext();

			// 2단계 : lookup() 메서드를 이용하여 매칭되는 커넥션을 찾는다.
			// 오라클
			 DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/myoracle");
			// mysql
			// DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysqlTest");

			// 3단계 : DataSource 객체를 이용하여 커넥션 하나 가져온다.
			con = ds.getConnection();


		} catch (Exception e) {

			e.printStackTrace();
			System.out.println("* ----- 데이터베이스 연결 실패! ----- *");
		}

	}


	/**
	 * DB연결 종료 메서드
	 * - closeConn(ResultSet rs, PreparedStatement pstmt, Connection con)
	 */
	public void closeConn(ResultSet rs, PreparedStatement pstmt, Connection con) {

		try{

			// ResultSet rs 종료
			if(rs != null) { rs.close(); }

			// PreparedStatement pstmt 종료
			if(pstmt != null) { pstmt.close(); }

			// Connection con 종료
			if(con != null) { con.close(); }

		}catch(Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * Board 테이블 전체 게시물 수 확인
	 */
	public int getBoardCount() {
		int totalRecord = 0;

		try {

			openConn();

			sql = "select count(*) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				totalRecord = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			closeConn(rs, pstmt, con);
		}

		return totalRecord;
	}

	/**
	 * 현재 페이지에 해당하는 게시물들을 가져오는 메서드
	 */
	public List<BoardDTO> getBoardList(int page, int rowsize){

		List<BoardDTO> list = new ArrayList<BoardDTO>();

		// 포스트 시작 번호
		// 포스트 끝 	번호
		int startNo = (page * rowsize) - (rowsize - 1);
		int endNo = (page * rowsize);

		try {

			openConn();

			// 게시물 번호 기준 내림차순 rnum
			// startNo <= rnum <= endNo
			sql = "select * "
				+ "  from ( select row_number() over(order by board_no desc) as rnum"
				+ "              , b.*"
				+ "          from board b)"
				+ " where rnum >= ? and rnum <= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, endNo);
			rs = pstmt.executeQuery();

			while(rs.next()) {

				BoardDTO dto = new BoardDTO();
				dto.setBoard_no(rs.getInt("board_no"));
				dto.setBoard_writer(rs.getString("board_writer"));
				dto.setBoard_title(rs.getString("board_title"));
				dto.setBoard_cont(rs.getString("board_cont"));
				dto.setBoard_pwd(rs.getString("board_pwd"));
				dto.setBoard_hit(rs.getInt("board_hit"));
				dto.setBoard_date(rs.getString("board_date"));
				dto.setBoard_update(rs.getString("board_update"));
				list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			closeConn(rs, pstmt, con);
		}

		return list;
	}


	/**
	 * 게시글 상세 메서드
	 */
	public BoardDTO getBoardContent(int no) {

		BoardDTO dto = null;

		try {

			openConn();

			sql = "select * from board where board_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				dto = new BoardDTO();
				dto.setBoard_no(rs.getInt("board_no"));
				dto.setBoard_writer(rs.getString("board_writer"));
				dto.setBoard_title(rs.getString("board_title"));
				dto.setBoard_cont(rs.getString("board_cont"));
				dto.setBoard_pwd(rs.getString("board_pwd"));
				dto.setBoard_hit(rs.getInt("board_hit"));
				dto.setBoard_date(rs.getString("board_date"));
				dto.setBoard_update(rs.getString("board_update"));

				System.out.println("상세보기 메서드 board_no >>> " + dto.getBoard_no());
				System.out.println("상세보기 메서드 board_hit >>> " + dto.getBoard_hit());
			}


		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			closeConn(rs, pstmt, con);
		}

		return dto;
	}


	/**
	 * 게시글 저장 메서드
	 */
	public int insertBoard(BoardDTO dto) {

		int result = 0;
		int board_no = 0;
		int board_hit = 0;

		try {

			openConn();

			// board_no
			sql = "select max(board_no) as maxNum from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				board_no = rs.getInt("maxNum") + 1 ;
			}

			// 데이터 입력
			sql = "insert into board values (?,?,?,?,?,?,sysdate,'')";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_no);
			pstmt.setString(2, dto.getBoard_writer());
			pstmt.setString(3, dto.getBoard_title());
			pstmt.setString(4, dto.getBoard_cont());
			pstmt.setString(5, dto.getBoard_pwd());
			pstmt.setInt(6, board_hit);

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			closeConn(rs, pstmt, con);

		}

		return result;
	}

	/**
	 * 게시글 수정 메서드(update)
	 */
	public int updateBoard(BoardDTO dto) {

		int result = 0;

		try {

			System.out.println("------------- updateBoard 메서드 -------------");
			openConn();

			sql = "update board "
				+ "   set board_title = ?"
				+ "     , board_cont = ?"
				+ "     , board_update = sysdate"
				+ " where board_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getBoard_title());
			pstmt.setString(2, dto.getBoard_cont());
			pstmt.setInt(3, dto.getBoard_no());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			closeConn(rs, pstmt, con);
		}


		return result;
	}

	/**
	 * 게시글 삭제 메서드
	 */
	public int deleteBoard(int no) {

		int result = 0;

		try {

			System.out.println("------------- deleteBoard 메서드 -------------");
			openConn();

			sql = "delete from board where board_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			closeConn(rs, pstmt, con);
		}

		return result;
	}




	/**
	 * 조회수 증가
	 */
	public void getBoardHit(int no) {

		try {
			openConn();

			sql ="update board set board_hit = board_hit+1 "
				+" where board_no = ?";
			pstmt =con.prepareStatement(sql);
			pstmt.setInt(1, no);
			int result = pstmt.executeUpdate();
			System.out.println("getBoardHit메서드 sql 결과 >>> "+result);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
	}

	/**
	 * 데이터 삭제시 게시글 번호 수정
	 */
	public void updateBoardNo(int no) {

		try {
			openConn();

			sql = "update board set board_no = board_no-1 "
				+ " where board_no > ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			closeConn(rs, pstmt, con);
		}

	}

	/**
	 * 비밀번호 확인 메서드
	 */
	public BoardDTO checkPwd(int no) {

		BoardDTO dto = null;

		try {
			System.out.println("------------- checkPwd 메서드 -------------");

			openConn();
			sql = "select board_no, board_writer, board_pwd from board where board_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				dto = new BoardDTO();
				dto.setBoard_no(rs.getInt("board_no"));
				dto.setBoard_writer(rs.getString("board_writer"));
				dto.setBoard_pwd(rs.getString("board_pwd"));
				System.out.println("checkPwd 메서드 실행 완료 >>> board_no : " + dto.getBoard_no() + ", board_pwd : " + dto.getBoard_pwd());
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			closeConn(rs, pstmt, con);
		}

		return dto;
	}

	/**
	 * 검색어에 해당하는 게시물의 수
	 */
	public int searchListCount(String field, String keyword) {

		int count = 0;

		System.out.println("------------- DAO searchListCount메서드 -------------");

		try {
			openConn();

			if(field.equals("search_title")) {

				sql = "select count(*) from board"
						+ "  where board_title like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyword + "%");

			}else if(field.equals("search_cont")) {

				sql = "select count(*) from board"
						+ "  where board_cont like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyword + "%");

			}else if(field.equals("search_title_cont")) {

				sql = "select count(*) from board"
						+ "  where board_title like ?"
						+ "     or board_cont like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setString(2, "%" + keyword + "%");

			}else if(field.equals("search_writer")) {

				sql = "select count(*) from board"
						+ "  where board_writer like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyword + "%");
			}

			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(SQLException e) { e.printStackTrace();
		}finally { closeConn(rs, pstmt, con); }

		return count;
	}


	/**
	 * 검색한 내용으로 페이징 처리
	 */
	public List<BoardDTO> searchBoardList(String field, String keyword, int page, int rowsize){

		List<BoardDTO> list = new ArrayList<BoardDTO>();

		// 페이지 시작번호
		int startNo = (page * rowsize)-(rowsize-1);

		// 페이지 종료번호
		int endNo = (page * rowsize);

		openConn();

		System.out.println("------------- DAO searchBoardList메서드 -------------");

			try {

				if(field.equals("search_title")) {
						sql = "select *"
							+ "  from (select row_number() over(order by board_no desc) as rnum"
							+ "				, b.*"
							+ "          from board b"
							+ "         where board_title like ?)"
							+ " where rnum >= ? and rnum <= ?";

						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, "%" + keyword + "%");
						pstmt.setInt(2, startNo);
						pstmt.setInt(3, endNo);

				}else if(field.equals("search_cont")) {

						sql = "select *"
							+ "  from (select row_number() over(order by board_no desc) as rnum"
							+ "				, b.*"
							+ "          from board b"
							+ "         where board_cont like ?)"
							+ " where rnum >= ? and rnum <= ?";

						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, "%" + keyword + "%");
						pstmt.setInt(2, startNo);
						pstmt.setInt(3, endNo);

				}else if(field.equals("search_title_cont")) {

						sql = "select *"
							+ "  from (select row_number() over(order by board_no desc) as rnum"
							+ "				, b.*"
							+ "          from board b"
							+ "         where board_title like ?"
							+ "            or board_cont like ?)"
							+ " where rnum >= ? and rnum <= ?";

						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, "%" + keyword + "%");
						pstmt.setString(2, "%" + keyword + "%");
						pstmt.setInt(3, startNo);
						pstmt.setInt(4, endNo);

				}else if(field.equals("search_writer")) {

						sql = "select *"
							+ "  from (select row_number() over(order by board_no desc) as rnum"
							+ "				, b.*"
							+ "          from board b"
							+ "         where board_writer like ?)"
							+ " where rnum >= ? and rnum <= ?";

						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, "%" + keyword + "%");
						pstmt.setInt(2, startNo);
						pstmt.setInt(3, endNo);
				}

				rs = pstmt.executeQuery();

				while(rs.next()) {
					BoardDTO dto = new BoardDTO();
					dto.setBoard_no(rs.getInt("board_no"));
					dto.setBoard_writer(rs.getString("board_writer"));
					dto.setBoard_title(rs.getString("board_title"));
					dto.setBoard_cont(rs.getString("board_cont"));
					dto.setBoard_pwd(rs.getString("board_pwd"));
					dto.setBoard_hit(rs.getInt("board_hit"));
					dto.setBoard_date(rs.getString("board_date"));
					dto.setBoard_update(rs.getString("board_update"));
					list.add(dto);
				}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			closeConn(rs, pstmt, con);
		}

		return list;
	}
}
```
