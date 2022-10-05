```
package com.board1.model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
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
	public void openCon() {

		try {
			// 1단계 : JNDI 서버 객체 생성
			Context ctx = new InitialContext();
			// org.apache.catalina.Context ctx = (org.apache.catalina.Context) new InitialContext();

			// 2단계 : lookup() 메서드를 이용하여 매칭되는 커넥션을 찾는다.
			// ctx.lookup("톰캣 가상 디렉토리/jdbc/리소스이름");
			// ctx.lookup("java:comp/env/jdbc/myoracle");
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysqlTest");

			// 3단계 : DataSource 객체를 이용하여 커넥션 하나 가져온다.
			con = ds.getConnection();

			// 상단 3단계와 동일
			// Context initContext = new InitialContext();
			// Context envContext = (Context) initContext.lookup("java:/comp/env");
			// DataSource ds = (DataSource)envContext.lookup("jdbc/mysqlTest");
			// con = ds.getConnection();

		} catch (Exception e) {
			e.printStackTrace();
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
	 *
	 */
	public List<BoardDTO> getBoardList(){

		List<BoardDTO> list = new ArrayList<BoardDTO>();

		openCon();

		try {

			sql="select * from board order by board_no desc";
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


				list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return list;
	}


}
```
