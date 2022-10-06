```
package com.board.model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;


public class BoardDAO {

	/*  DAO 객체를 싱글턴 방식으로 사용 */

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
	public void openCon() {

		// 맥용
		// String driver = "oracle.jdbc.driver.OracleDriver";
		// String url = "jdbc:oracle:thin:@[전자지갑이름]_high?TNS_ADMIN=[전자지갑경로]";
		// String user = "[유저명]";
		// String password = "[비밀번호]";

		// 맥용(mysql) 정리본
		String driver = "com.mysql.cj.jdbc.Driver";
		String dbName = "[데이터베이스이름]";
		String url = "jdbc:mysql://localhost:3306/ "+ dbName + "?serverTimezone=Asia/Seoul&charaterEncoding=UTF-8";
		String user = "[유저명]";
		String password = "[비밀번호]";

		try {

			Class.forName(driver);
			System.out.println("* ----- 드라이버 로딩 성공! ----- *");

			con = DriverManager.getConnection(url, user, password);
			System.out.println("* ----- 데이터베이스 연결 성공! ----- *");

		}catch(ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("* ----- 드라이버 로딩 실패! ----- *");

		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("* ----- 데이터베이스 연결 실패! ----- *");
		}

	}

	/**
	 * 금일 메서드
	 */
	public String today() {
		String today="";

		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH+1);
		int date = cal.get(Calendar.DATE);

		today = year + "." + month + "." + date;
		return today;
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
	 * 게시판 전체 가져오는 메서드
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
				dto.setBoard_writer(rs.getString("board_writer"));
				dto.setBoard_title(rs.getString("board_title"));
				dto.setBoard_cont(rs.getString("board_cont"));
				dto.setBoard_pwd(rs.getString("board_pwd"));
				dto.setBoard_hit(rs.getInt("board_hit"));
				dto.setBoard_date(rs.getString("board_date"));
				dto.setBoard_update(rs.getString("board_update"));


				boardList.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return boardList;

	}

	/**
	 * 게시글 조회수 추가 메서드
	 */
	public void boardHit(int board_no) {

		try {

			openCon();

			sql = "update board set board_hit = board_hit+1"
				+ " where board_no = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_no);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			closeConn(rs, pstmt, con);
		}

	}

	/**
	 * 게시판에 데이터 추가 메서드
	 */
	public int insertBoard(BoardDTO dto) {
		int result = 0;
		int count = 0;

		try {

			openCon();

			// sql = "select max(border_no) from board";
			// == rownum ==> 글자순서
			//sql = "select max(rownum) as count from board";

			sql = "select max(board_no) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();


			if(rs.next()) {
				count = rs.getInt(1)+1;
			}

			//sql = "insert into board values(?,?,?,?,?, ?,?,?)";
			sql = "insert into board values(?,?,?,?,?,default, sysdate(), sysdate())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setString(2, dto.getBoard_writer());
			pstmt.setString(3, dto.getBoard_title());
			pstmt.setString(4, dto.getBoard_cont().trim());
			pstmt.setString(5, dto.getBoard_pwd());

			result = pstmt.executeUpdate();


		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return result;
	}

	/**
	 * 게시판 글 상세보기
	 */
	public BoardDTO getDetailContent(int board_no) {

		BoardDTO dto = new BoardDTO();

		try {

			openCon();

			sql = "select * from board where board_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_no);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				dto.setBoard_no(rs.getInt("board_no"));
				dto.setBoard_writer(rs.getString("board_writer"));
				dto.setBoard_title(rs.getString("board_title"));
				dto.setBoard_cont(rs.getString("board_cont"));
				dto.setBoard_pwd(rs.getString("board_pwd"));
				dto.setBoard_hit(rs.getInt("board_hit"));
				dto.setBoard_date(rs.getString("board_date"));
				dto.setBoard_update(rs.getString("board_update"));

				//System.out.println(dto.getBoard_no() + dto.getBoard_title());
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;

	}

	/**
	 * 게시글 수정 메서드
	 */
	public int updateBoard(BoardDTO dto) {

		int result = 0;

		try {

			openCon();

			// 업데이트 전 비밀번호가 같은 지 확인
			sql = "select * from board where board_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getBoard_no());
			rs = pstmt.executeQuery();

			if(rs.next()) {	//
				if(dto.getBoard_pwd().equals(rs.getString("board_pwd"))) {
					sql = "update board "
						+ "   set board_title = ?"
						+ "     , board_cont = ?"
						+ "     , board_update = sysdate()"
						+ " where board_no = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, dto.getBoard_title());
					pstmt.setString(2, dto.getBoard_cont().trim());
					pstmt.setInt(3, dto.getBoard_no());
					result = pstmt.executeUpdate();
				}
			}else {	// 비밀번호가 틀릭경우
				result = -1;
			}

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
	public int deleteBoard(int board_no, String board_pwd) {
		int result = 0;

		try {

			openCon();

			// 업데이트 전 비밀번호가 같은 지 확인
			sql = "select * from board where board_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_no);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				if(board_pwd.equals(rs.getString("board_pwd"))) {

					sql = "delete from board where board_no = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, board_no);

					result = pstmt.executeUpdate();

				}else {
					result = -1;
				}
			}


		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return result;
	}

	/**
	 * 게시글 삭제 시 글 번호 리셋 메서드
	 */
	public void updateSequence(int no) {

		try {
			openCon();

			sql = "update board "
				+ "  set board_no = board_no -1"
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
	 * board 테이블에서 게시물을 검색
	 */
	public List<BoardDTO> searchBoard(String field, String keyword){

		List<BoardDTO> list = new ArrayList<BoardDTO>();

		openCon();
		System.out.println(keyword);
		if(field.equals("title")) {
			try {

				sql = "select * "
					+ "  from board "
					+ " where board_title like ?"
					+ " order by board_no desc";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyword + "%");

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
			}catch (Exception e) {

				e.printStackTrace();

			}finally {
				closeConn(rs, pstmt, con);
			}

		}else if(field.equals("cont")) {
			try {

				sql = "select * "
					+ "  from board "
					+ " where board_cont like ?"
					+ " order by board_no desc";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyword + "%");

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
			}catch (Exception e) {

				e.printStackTrace();

			}finally {
				closeConn(rs, pstmt, con);
			}

		}else if(field.equals("title_cont")) {
			try {

				sql = "select * "
					+ "  from board "
					+ " where board_title like ?"
					+ "    or board_cont like ?"
					+ " order by board_no desc";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setString(2, "%" + keyword + "%");

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
			}catch (Exception e) {

				e.printStackTrace();

			}finally {
				closeConn(rs, pstmt, con);
			}

		}else {	// 작성자 검색

			try {

				sql = "select * "
					+ "  from board "
					+ " where board_writer like ?"
					+ " order by board_no desc";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyword + "%");

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
			}catch (Exception e) {

				e.printStackTrace();

			}finally {
				closeConn(rs, pstmt, con);
			}
		}

		return list;
	}



}
```
