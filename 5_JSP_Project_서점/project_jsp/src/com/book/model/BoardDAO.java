package com.book.model;

import java.sql.Connection;
import java.sql.Date;
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
	Connection con = null; // 데이터 베이스와 연동하는 객체
	PreparedStatement pstmt = null; // 데이터 베이스에 sql문을 전송하는 객체
	ResultSet rs = null; // sql문을 실행 후에 결과값을 가지고 있는 객체
	String sql = null; // 쿼리문을 저장할 변수

	// 객체 변수
	public static BoardDAO instance; // 싱글턴 : 2단계

	// 생성자
	public BoardDAO() {
	} // 싱글턴 : 1단계

	/**
	 * @see .객체 생성 메서드
	 */
	public static BoardDAO getInstance() { // 싱글턴 : 3단계

		if (instance == null) {
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

		try {
			// ResultSet rs 종료
			if (rs != null) {
				rs.close();
			}
			// PreparedStatement pstmt 종료
			if (pstmt != null) {
				pstmt.close();
			}
			// Connection con 종료
			if (con != null) {
				con.close();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see .게시글 카테고리
	 */
	public List<BoardDTO> getCgy() {
		List<BoardDTO> cgyList = new ArrayList<BoardDTO>();

		try {
			openConn();
			sql = "select * from board_category order by board_cgy_num";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setBoard_cgy_num(rs.getString("board_cgy_num"));
				dto.setBoard_cgy_name(rs.getString("board_cgy_name"));
				cgyList.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return cgyList;
	}

	/**
	 * @see .게시글 갯수 구하기 - 전체
	 */
	public int getDBCount(int mem_num) {

		int result = 0;

		try {

			openConn();

			sql = "select count(*) from board where mem_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mem_num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return result;
	}

	/**
	 * @see .게시글 갯수 구하기 - 특정 게시글만
	 */
	public int getDBCount(int mem_num, String board_cgy_num) {

		int result = 0;

		try {

			openConn();

			sql = "select count(*) from board where mem_num = ? and board_cgy_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mem_num);
			pstmt.setString(2, board_cgy_num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
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

			sql = "select max(board_num) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return result;
	}

	/**
	 * @see .문의글 추가
	 */
	public int insertBoard(BoardDTO boardDto) {

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
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
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

			sql = "update board " + "   set board_title = ? " + "     , board_cont = ?"
					+ "     , board_update = sysdate" + "     , board_image = ?"
					+ " where board_num = ? and mem_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, boardDto.getBoard_title());
			pstmt.setString(2, boardDto.getBoard_cont());
			pstmt.setString(3, boardDto.getBoard_image());
			pstmt.setInt(4, boardDto.getBoard_num());
			pstmt.setInt(5, boardDto.getMem_num());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return result;
	}

	/**
	 * @see. 특정 사용자 게시물 전체 리스트 보기
	 */
	public List<BoardDTO> getBoard(int mem_num, int page, int rowsize) {

		List<BoardDTO> boardList = new ArrayList<BoardDTO>();

		try {

			openConn();

			// 포스트 시작, 끝 번호
			int startNo = (page * rowsize) - (rowsize - 1);
			int endNo = (page * rowsize);

			sql = "with boardList as (" + " select ROW_NUMBER() over(order by b.board_num desc) as row_num"
					+ "     , b.*, bc.board_cgy_name , br.reply_num " + "  from board b" + "  left join board_reply br"
					+ "    on b.board_num = br.board_num" + "  join board_category bc"
					+ "    on b.board_cgy_num = bc.board_cgy_num " + "  where mem_num = ?" + " ) "
					+ " select * from boardList where row_num >= ? and row_num <= ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mem_num);
			pstmt.setInt(2, startNo);
			pstmt.setInt(3, endNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardDTO boardDto = new BoardDTO();
				boardDto.setRow(rs.getInt("row_num"));
				boardDto.setBoard_num(rs.getInt("board_num"));
				boardDto.setBoard_title(rs.getString("board_title"));
				boardDto.setBoard_cont(rs.getString("board_cont"));
				boardDto.setBoard_date(rs.getString("board_date"));
				boardDto.setBoard_update(rs.getString("board_update"));
				boardDto.setBoard_cgy_num(rs.getString("board_cgy_num"));
				boardDto.setBoard_cgy_name(rs.getString("board_cgy_name"));
				boardDto.setBoard_image(rs.getString("board_image"));
				boardDto.setReply_num(rs.getInt("reply_num"));

				boardList.add(boardDto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return boardList;
	}

	/**
	 * @see. 특정 사용자 특정 게시물 카테고리의 리스트 보기
	 */
	public List<BoardDTO> getBoard(int mem_num, String board_cgy_num, int page, int rowsize) {

		List<BoardDTO> boardList = new ArrayList<BoardDTO>();

		try {

			openConn();

			// 포스트 시작, 끝 번호
			int startNo = (page * rowsize) - (rowsize - 1);
			int endNo = (page * rowsize);

			sql = "with boardList as (" + " select ROW_NUMBER() over(order by b.board_num desc) as row_num"
					+ "     , b.*, bc.board_cgy_name, br.reply_num " + "  from board b" + "  left join board_reply br"
					+ "    on b.board_num = br.board_num" + "  join board_category bc"
					+ "    on b.board_cgy_num = bc.board_cgy_num " + " where mem_num = ?" + "   and b.board_cgy_num = ?"
					+ " ) " + " select * from boardList where row_num >= ? and row_num <= ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mem_num);
			pstmt.setString(2, board_cgy_num);
			pstmt.setInt(3, startNo);
			pstmt.setInt(4, endNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardDTO boardDto = new BoardDTO();

				boardDto.setRow(rs.getInt("row_num"));
				boardDto.setBoard_num(rs.getInt("board_num"));
				boardDto.setBoard_title(rs.getString("board_title"));
				boardDto.setBoard_cont(rs.getString("board_cont"));
				boardDto.setBoard_date(rs.getString("board_date"));
				boardDto.setBoard_update(rs.getString("board_update"));
				boardDto.setBoard_cgy_num(rs.getString("board_cgy_num"));
				boardDto.setBoard_cgy_name(rs.getString("board_cgy_name"));
				boardDto.setBoard_image(rs.getString("board_image"));
				boardDto.setReply_num(rs.getInt("reply_num"));

				boardList.add(boardDto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return boardList;
	}

	/**
	 * @see. 특정 사용자 특정 게시물 상세 보기
	 */
	public BoardDTO getBoard(int mem_num, String board_num) {

		BoardDTO boardDto = null;

		try {

			openConn();

			sql = "select b.*, bc.board_cgy_name " + "  from board b" + "  join board_category bc"
					+ "    on b.board_cgy_num = bc.board_cgy_num " + "  where mem_num = ? and board_num = ?"
					+ "  order by b.board_num desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mem_num);
			pstmt.setString(2, board_num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
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

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return boardDto;
	}

	/**
	 * @see .게시판 삭제
	 */
	public int deleteBoard(int mem_num, String board_num) {
		int result = 0;

		try {
			openConn();

			sql = "delete from board where mem_num = ? and board_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mem_num);
			pstmt.setString(2, board_num);
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return result;
	}

	/**
	 * @see .답변 보기
	 */
	public BoardReplyDTO getBoardReply(int reply_num) {
		BoardReplyDTO boardReplyDto = null;

		try {
			openConn();

			sql = "select b.board_num" + "     , b.board_title" + "     , b.board_date" + "     , b.board_update"
					+ "     , b.board_cgy_num" + "     , bc.board_cgy_name" + "     , br.reply_num"
					+ "     , br.reply_cont" + "     , br.reply_date" + "     , br.reply_update" + "  from board b"
					+ "  join board_reply br " + "    on b.board_num = br.board_num" + "  join board_category bc"
					+ "    on b.board_cgy_num = bc.board_cgy_num" + " where br.reply_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, reply_num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				boardReplyDto = new BoardReplyDTO();
				boardReplyDto.setBoard_num(rs.getInt("board_num"));
				boardReplyDto.setBoard_title(rs.getString("board_title"));
				boardReplyDto.setBoard_date(rs.getString("board_date"));
				boardReplyDto.setBoard_update(rs.getString("board_update"));
				boardReplyDto.setBoard_cgy_num(rs.getString("board_cgy_num"));
				boardReplyDto.setBoard_cgy_name(rs.getString("board_cgy_name"));
				boardReplyDto.setReply_num(rs.getInt("reply_num"));
				boardReplyDto.setReply_cont(rs.getString("reply_cont").replace("\r\n", "<br>"));
				boardReplyDto.setReply_date(rs.getString("reply_date"));
				boardReplyDto.setReply_update(rs.getString("reply_update"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return boardReplyDto;
	}

	public List<BoardDTO> getBoard(int mem_num) {

		List<BoardDTO> boardList = new ArrayList<BoardDTO>();

		try {

			openConn();

			sql = "select * from board b left join board_category c on b.board_cgy_num = c.board_cgy_num "
					+ "where b.mem_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mem_num);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardDTO boardDto = new BoardDTO();
				boardDto.setBoard_num(rs.getInt("board_num"));
				boardDto.setBoard_title(rs.getString("board_title"));
				boardDto.setBoard_cont(rs.getString("board_cont"));
				boardDto.setBoard_date(rs.getString("board_date"));
				boardDto.setBoard_update(rs.getString("board_update"));
				boardDto.setBoard_cgy_num(rs.getString("board_cgy_num"));
				boardDto.setBoard_cgy_name(rs.getString("board_cgy_name"));
				boardDto.setBoard_image(rs.getString("board_image"));
				boardDto.setMem_num(rs.getInt("mem_num"));
				boardList.add(boardDto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return boardList;
	}
	
	public BoardDTO getBoard(int mem_num, int board_num) {

		BoardDTO boardDto = null;
		try {

			openConn();

			sql = "select * from board b left join board_category c "
					+ "on b.board_cgy_num = c.board_cgy_num "
					+ "where b.mem_num = ? and b.board_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mem_num);
			pstmt.setInt(2, board_num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				boardDto = new BoardDTO();
				boardDto.setBoard_num(rs.getInt("board_num"));
				boardDto.setBoard_title(rs.getString("board_title"));
				boardDto.setBoard_cont(rs.getString("board_cont"));
				boardDto.setBoard_date(rs.getString("board_date"));
				boardDto.setBoard_update(rs.getString("board_update"));
				boardDto.setBoard_cgy_num(rs.getString("board_cgy_num"));
				boardDto.setBoard_cgy_name(rs.getString("board_cgy_name"));
				boardDto.setBoard_image(rs.getString("board_image"));
				boardDto.setMem_num(rs.getInt("mem_num"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return boardDto;
	}

	public int insertBoard(String board_cont, int board_num) {
		int result = 0;
		
		try {
			openConn();
			sql = "insert into board_reply values ("
					+ "(select count(*)+1 from board_reply),"
					+ "? , sysdate, '' , ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board_cont);
			pstmt.setInt(2, board_num);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}
	
	public BoardReplyDTO getBoardReplyUpdate(int board_num) {
		BoardReplyDTO boardReplyDto = null;
		
		try {
			openConn();
			sql = "select * from board_reply where board_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				boardReplyDto = new BoardReplyDTO();
				boardReplyDto.setBoard_num(rs.getInt("board_num"));
				boardReplyDto.setReply_num(rs.getInt("reply_num"));
				boardReplyDto.setReply_cont(rs.getString("reply_cont"));
				boardReplyDto.setReply_date(rs.getString("reply_date"));
				boardReplyDto.setReply_update(rs.getString("reply_update"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return boardReplyDto;
	}
	
	public int BoardReplyUpdate(int board_num, String board_cont) {
		int result = 0;
		try {
			openConn();
			sql = "update board_reply set reply_update = sysdate , reply_cont = ? where board_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board_cont);
			pstmt.setInt(2, board_num);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
	}
}
