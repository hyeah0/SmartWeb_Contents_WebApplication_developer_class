package com.book.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class UserDAO {

	// DB와 연동하는 객체.
	Connection con = null;
	
	// DB에 SQL문을 전송하는 객체
	PreparedStatement pstmt = null;
	
	// SQL문을 실행한 후에 결과 값을 가지고 있는 객체.
	ResultSet rs = null;
	
	// 쿼리문을 저장할 변수
	String sql = null;
	
	// AdminDAO 객체를 싱글턴 방식으로 만들어 보자.
	// 1단계 : 싱글턴 방식으로 객체를 만들기 위해서는 우선적으로
	//        기본생성자의 접근제어자를 public이 아닌 private
	//        으로 바꾸어 주어야 한다.
	//        즉, 외부에서 직접적으로 기본생성자를 호출하지
	//        못하게 하는 방법이다.
	
	// 2단계 : AdminDAO 객체를 정적(static) 멤버로 선언을 
	//        해 주어야 한다.
	private static UserDAO instance;
	
	private UserDAO() {  }  // 기본 생성자
	
	
	// 3단계 : 기본 생성자 대신에 싱글턴 객체를 return 해 주는
	//        getInstance() 라는 메서드를 만들어서 해당
	//        getInstance() 라는 메서드를 외부에서 접근할 수
	//        있도록 해 주면 됨.
	public static UserDAO getInstance() {
		
		if(instance == null) {
			instance = new UserDAO();
		}
		
		return instance;
	}
	
	
	// DB를 연동하는 작업을 진행하는 메서드.
	public void openConn() {
		
		try {
			// 1단계 : JNDI 서버 객체 생성
			Context ctx = new InitialContext();
			
			// 2단계 : lookup() 메서드를 이용하여 매칭되는
			//        커넥션을 찾는다.
			DataSource ds =
				(DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");
			
			// 3단계 : DataSource 객체를 이용하여
			//        커넥션을 하나 가져온다.
			con = ds.getConnection();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}  // openConn() 메서드 end
	
	
	// DB에 연결된 자원 종료하는 메서드.
	public void closeConn(ResultSet rs,
			PreparedStatement pstmt, Connection con) {
		
		try {
			if(rs != null) rs.close();
			
			if(pstmt != null) pstmt.close();
			
			if(con != null) con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}  // closeConn() 메서드 end
	
	// 회원 정보 리스트
		public List<UserDTO> getUserList(){
			List<UserDTO> list = new ArrayList<UserDTO>();
			
			try {
				openConn();
				
				sql="select * from member order by num desc";
				
				pstmt = con.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					UserDTO dto = new UserDTO();
					dto.setMem_num(rs.getInt("mem_num"));
					dto.setMem_id(rs.getString("mem_id"));
					dto.setMem_pwd(rs.getString("mem_pwd"));
					dto.setMem_name(rs.getString("mem_name"));
					dto.setMem_phone(rs.getString("mem_phone"));
					dto.setMem_mail(rs.getString("mem_mail"));
					dto.setMem_card_num(rs.getString("mem_card_num"));
					dto.setmem_card_pwd(rs.getInt("mem_card_pwd"));
					dto.setMem_mileage(rs.getInt("mem_mileage"));
					list.add(dto);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			return list;
		} // getUserList() 메서드 end
	
	// 해당 번호에 해당하는 회원 테이블 상세 내역 (비활성)
	public UserDTO getMemberContent(int no) {
		
		UserDTO dto = null;
		
		try {
			openConn();
			
			sql = "select * from member where mem_num = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new UserDTO();
				dto.setMem_num(rs.getInt("mem_num"));
				dto.setMem_id(rs.getString("mem_id"));
				dto.setMem_pwd(rs.getString("mem_pwd"));
				dto.setMem_name(rs.getString("mem_name"));
				dto.setMem_phone(rs.getString("mem_phone"));
				dto.setMem_mail(rs.getString("mem_mail"));
				dto.setMem_card_num(rs.getString("mem_card_num"));
				dto.setmem_card_pwd(rs.getInt("mem_card_pwd"));
				dto.setMem_mileage(rs.getInt("mem_mileage"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	} // getMemberContent() 메서드 end
	
	// 회원인지 여부를 확인하는 메서드.
	public int userCheck(String id, String pwd) {
		
		int result = 0;
		
		try {
			openConn();
			
			sql = "select * from member where mem_id = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(pwd.equals(rs.getString("mem_pwd"))) {
					// 회원인 경우
					result = 1;
				}else {
					// 회원 비밀번호가 틀린 경우
					result = -1;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	} // userCheck() 메서드 end
	
	// id에 해당하는 회원의 정보를 조회하는 메서드.
	public UserDTO getMember(String id, String pw) {
		
		UserDTO dto = null;
		
		try {
			openConn();
			
			sql = "select * from member where mem_id = ? and mem_pwd = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new UserDTO();
				dto.setMem_num(rs.getInt("mem_num"));
				dto.setMem_id(rs.getString("mem_id"));
				dto.setMem_pwd(rs.getString("mem_pwd"));
				dto.setMem_name(rs.getString("mem_name"));
				dto.setMem_phone(rs.getString("mem_phone"));
				dto.setMem_mail(rs.getString("mem_mail"));
				dto.setMem_card_num(rs.getString("mem_card_num"));
				dto.setmem_card_pwd(rs.getInt("mem_card_pwd"));
				dto.setMem_mileage(rs.getInt("mem_mileage"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
		
	} // getMember() 메서드 end
	
	// 회원가입 입력 메서드
	// member 테이블에 회원을 추가하는 메서드.
	public int getinsertUser(UserDTO dto) {
		
		int result = 0, count = 0;
		
		try {
			openConn();
			
			sql="select max(mem_num) from member";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1) + 1;
			}
			sql = "insert into member values(?,?,?,?,?,?,?,?,?,default)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, count);
			pstmt.setString(2, dto.getMem_id());
			pstmt.setString(3, dto.getMem_pwd());
			pstmt.setString(4, dto.getMem_name());
			pstmt.setString(5, dto.getMem_phone());
			pstmt.setString(6, dto.getMem_addr());
			pstmt.setString(7, dto.getMem_mail());
			pstmt.setString(8, dto.getMem_card_num());
			pstmt.setInt(9, dto.getmem_card_pwd());
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	} // getinsertUser() 메서드 end
	
	// 아이디 중복 체크
		// 회원 가입 시 중복아이디를 체크를 처리하는 메서드.
		public boolean checkMemberId(String id) {
			
			boolean x= false; // 오류 발생
			
			try {
				openConn();
				
				sql = "select * from member where mem_id = ?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					x = true;
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			return x;
		} // checkMemberId() 메서드 end
	
	// 아이디 찾기 메서드
	// DB에서 member 테이블에 해당하는 아이디를 이름과 연락처로 찾아내는 메서드
	public UserDTO findId(String name, String phone) {
		
		UserDTO dto = null;
		
		try {
			openConn();
			
			sql = "select mem_id from member where mem_name = ? and mem_phone = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new UserDTO();
				dto.setMem_id(rs.getString("mem_id"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	} // findId() 메서드 end
	
	// 비밀번호 찾기 메서드
	// DB에서 member 테이블에 해당하는 비밀번호를 ID,메일,연락처로 찾아내는 메서드 
	public UserDTO findPw(String id, String mail, String phone) {
		
		UserDTO dto = null;
		
		try {
			openConn();
			
			sql = "select mem_pwd, mem_name from member where mem_id = ? and mem_mail = ? and mem_phone = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, mail);
			pstmt.setString(3, phone);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new UserDTO();
				dto.setMem_name(rs.getString("mem_name"));
				dto.setMem_pwd(rs.getString("mem_pwd"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return dto;

	} // findPw() 메서드 end
	
}