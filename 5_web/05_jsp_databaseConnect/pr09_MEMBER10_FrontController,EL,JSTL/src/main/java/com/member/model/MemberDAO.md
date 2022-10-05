```
package com.member.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDAO {

		// 멤버변수
		Connection con = null;						// 데이터 베이스와 연동하는 객체
		PreparedStatement pstmt = null;				// 데이터 베이스에 sql문을 전송하는 객체
		ResultSet rs = null;						// sql문을 실행 후에 결과값을 가지고 있는 객체
		String sql = null; 							// 쿼리문을 저장할 변수

		// 객체 변수
		private static MemberDAO instance;				// 싱글턴 : 2단계

		// 생성자
		private MemberDAO() {	}						// 싱글턴 : 1단계

		/**
		 * 싱글턴 객체 생성 메서드
		 * - MemberDAO getInstance()
		 * - 자료형 메서드명()
		 */
		public static MemberDAO getInstance() {	// 싱글턴 : 3단계

			if(instance == null) {
				instance = new MemberDAO();
			}

			return instance;
		}

		/**
		 * DB연동 메서드
		 * - openCon()
		 */
		public void openCon() {

			try {
				// dbcp 방법 ----------------------------------------------------------------------------------------------
				// 1단계 : JNDI 서버 객체 생성
				Context ctx = new InitialContext();

				// 2단계 : lookup() 메서드를 이용하여 매칭되는 커넥션을 찾는다.
				DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/myoracle");

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
		 * 전체 테이블 조회 메서드
		 */
		public List<MemberDTO> getMemberList(){
			List<MemberDTO> list = new ArrayList<MemberDTO>();

			try {
				openCon(); // 커넥션 풀 방식으로 db와 연동 진행

				sql = "select * "
					+ "  from member10 "
					+ " order by num desc";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();

				while(rs.next()) {
					MemberDTO dto = new MemberDTO();
					dto.setNum(rs.getInt("num"));
					dto.setMemid(rs.getString("memid"));
					dto.setMemname(rs.getString("memname"));
					dto.setPwd(rs.getString("pwd"));
					dto.setAge(rs.getInt("age"));
					dto.setMileage(rs.getInt("mileage"));
					dto.setJob(rs.getString("job"));
					dto.setAddr(rs.getString("addr"));
					dto.setRegdate(rs.getString("regdate"));
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
		 * 회원 상세 조회 메서드
		 */
		public MemberDTO getMemberListDetail(int num) {

			MemberDTO dto = null;

			try {

				openCon();

				sql = "select * from member10 where num =?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();

				if(rs.next()) {
					dto = new MemberDTO();
					dto.setNum(rs.getInt("num"));
					dto.setMemid(rs.getString("memid"));
					dto.setMemname(rs.getString("memname"));
					dto.setPwd(rs.getString("pwd"));
					dto.setAge(rs.getInt("age"));
					dto.setMileage(rs.getInt("mileage"));
					dto.setJob(rs.getString("job"));
					dto.setAddr(rs.getString("addr"));
					dto.setRegdate(rs.getString("regdate"));

					System.out.println("getMemberListDetail 메서드 실행 >>> " + dto.getNum() + ", " + dto.getMemid()+ ", name : " + dto.getMemname() + ", pwd : " + dto.getPwd());
				}

			} catch (Exception e) {
				e.printStackTrace();

			} finally {
				closeConn(rs, pstmt, con);
			}

			return dto;
		}



		/**
		 * 데이터 추가 메서드
		 */
		public int insertMember(MemberDTO dto) {

			int result = 0;
			int count = 0;

			openCon();

			// 회원 번호
			try {
				sql = "select max(num) from member10";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();

				if(rs.next()) {
					count = rs.getInt(1)+1;
				}

			} catch (SQLException e1) {
				e1.printStackTrace();
			}


			try {

				sql = "insert into member10 values(?,?,?,?,?,?,?,?,sysdate)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, count);
				pstmt.setString(2, dto.getMemid());
				pstmt.setString(3, dto.getMemname());
				pstmt.setString(4, dto.getPwd());
				pstmt.setInt(5, dto.getAge());
				pstmt.setInt(6, dto.getMileage());
				pstmt.setString(7, dto.getJob());
				pstmt.setString(8, dto.getAddr());
				result = pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();

			} finally {
				closeConn(rs, pstmt, con);
			}

			return result;

		}

		/**
		 * 회원 수정 메서드
		 */
		public int updateMember(MemberDTO dto) {

			int result = 0;

			try {

				openCon();

				sql = "update member10"
					+ "   set memname = ?"
					+ "     , pwd = ?"
					+ "		, age = ?"
					+ "     , mileage = ?"
					+ "     , job = ?"
					+ "		, addr = ?"
					+ " where num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getMemname());
				pstmt.setString(2, dto.getPwd());
				pstmt.setInt(3, dto.getAge());
				pstmt.setInt(4, dto.getMileage());
				pstmt.setString(5, dto.getJob());
				pstmt.setString(6, dto.getAddr());
				pstmt.setInt(7, dto.getNum());
				result = pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();

			} finally {
				closeConn(rs, pstmt, con);

			}

			return result;
		}

		/**
		 * 회원 삭제 메서드
		 */
		public int deleteMember(int num, String input_pwd) {

			int result = 0;

			try {

				openCon();

				sql ="select num, pwd from member10 where num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();

				if(rs.next()) {
					System.out.println("deletMember 메서드 실행 >>> num : " + rs.getInt("num") + ", pwd : " + rs.getString("pwd") );

					if(input_pwd.equals(rs.getString("pwd"))){
						sql = "delete from member10 where num = ?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, num);
						result = pstmt.executeUpdate();
						// System.out.println("deletMember 메서드 실행 >>> 삭제 완료");

					}else { 			// 비밀번호가 틀린경우
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
		 * 회원 번호 재 작업 메서드
		 */
		public void updateSequence(int num) {

			try {

				openCon();

				sql = "update member10 "
					+ "   set num = num -1 "
					+ " where num > ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();


			} catch (Exception e) {
				e.printStackTrace();

			} finally {
				closeConn(rs, pstmt, con);
			}

		}

}
```
