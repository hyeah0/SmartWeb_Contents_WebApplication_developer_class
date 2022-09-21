package com.khie.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/*
 * DAO(Data Access Object)
 * - 데이터 접근 객체 --> DB에 접속(연동)하는 객체  
 * - DAO란? 
 * 	- 데이터 베이스에 접속해서 데이터 추가, 수정, 삭제, 조회 등의 작업을 하는 클래스이다.
 *  - 일반적으로 JSP 또는 Servlet 에서 위의 작업들을 같이 사용할 수 있지만,
 *    유지보수, 코드의 모듈화 등을 위해서 DAO 클래스를 따로 만들어서 사용한다.
 */

public class DeptDAO {
	
	
	Connection con = null;					// 데이터 베이스와 연동하는 객체
	PreparedStatement pstmt = null;			// 데이터 베이스에 sql문을 전송하는 객체
	ResultSet rs = null;					// sql문을 실행 후에 결과값을 가지고 있는 객체
	String sql = null; 						// 쿼리문을 저장할 변수
	
	// 기본 생성자
	public DeptDAO() {
		// 윈도우용
		// String dirver = "oracle.jdbc.driver.OracleDriver";
		// String url = "jdbc:oracle:thin:@localhost:1521:XE";
		// String user = "web";
		// String password = "1234";
		
		// 맥용
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@system_high?TNS_ADMIN=/Users/hye/devDownload/oraclewallet/Wallet_system";
		String user = "admin";
		String password = "Asdfghjklzxc0";
		
		try {

			// 1단계 : 오라클 드라이버를 메모리로 로딩
			Class.forName(driver);
			
			// 2단계: 오라클 데이터베이스와 연결 작업 진행
			con = DriverManager.getConnection(url, user, password);
			System.out.println("2단계 : 데이터베이스 연결 성공!");

		}catch(Exception e) {
			System.out.println("2단계 : 데이터베이스 연결 실패!");
			e.printStackTrace();
		}
		
	} // 기본 생성자 종료
	
	// 메서드1 : selectList(); 
	// DEPT 테이블에서 부서목록 전체 리스트를 조회하는 메서드
	// DEPT 에서 자료 받아서 -> SelectServlet에서 사용
	public List<DeptDTO> selectList() {
		
		List<DeptDTO> list = new ArrayList<DeptDTO>(); //다형성
		
		try{
			
			// 3단계 : 데이터 베이스에 전송할 sql문을 작성
			sql = "select * "
				+ "  from dept"
				+ "  order by deptno desc";
			
			pstmt = con.prepareStatement(sql);
			// System.out.println("3단계 : 테이블 연결완료");
			
			// 4단계 : sql문을 데이터베이스에 전송 및 실행
			rs = pstmt.executeQuery();
			// System.out.println("5단계 : SQL문을 전송 및 실행");
			
			
			while(rs.next()) {
				// 데이터 베이스에 있는 정보를 가져올때, 데이터를 데이터베이스에 전송할때 사용
				DeptDTO dto = new DeptDTO();
				
				// DeptDTO deptno 변수에 데이터 베이스 deptno 컬럼 값을 저장
				dto.setDeptno(rs.getInt("deptno"));
				dto.setDname(rs.getString("dname"));
				dto.setLoc(rs.getString("loc"));
				
				// list 객체 배열에 저장
				list.add(dto);
			}
			
			
			// 6단계 : 연결괴어 있는 자원 종료하기
			rs.close();
			pstmt.close();
			con.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	
		return list;
		// list에는 dto 객체의 주소값이 들어있다.
	} // selectList() 메서드 종료
	
	// 메서드2 : insertDept(DeptDTO dto)
	// public int 메서드명(자료형 변수명)
	// --> 변수명과 insertServlet의 dao.insertDept(dto)의 dto와는 다른 변수명이지만 주소값은 같다.
	public int insertDept(DeptDTO dto){
	
		System.out.println("dao 주소 >>> " + dto);
		
		int result = 0;
		
		try {
			// 3단계 : 데이터베이스에 전송할 sql문 작성
			sql = "insert into dept values(?,?,?)";

			// 4단계 : sql문을 데이터베이스 전송객체에 저장 
			pstmt = con.prepareStatement(sql);
			
			// ?(플레이스 홀더)에 데이터 배정
			pstmt.setInt(1, dto.getDeptno());
			pstmt.setString(2, dto.getDname());
			pstmt.setString(3, dto.getLoc());
			
			// 5단계 : sql 문을 데이터베이스에 전송 및 실행
			result = pstmt.executeUpdate();
			
			// 6단계 : 연결되어 있던 자원 종료
			pstmt.close();
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;	// 성공시 1 / 실패시 0
		
	} // insertDept() 메서드 종료
	
	
	// 메서드 3 : updateDept(DeptDTO dto)
	public int updateDept(DeptDTO dto) {
		int result = 0;
		
		try {
			
			// 3단계 : 데이터베이스에 전송할 sql문 작성
			sql = "update dept "
				+ "   set dname = ?"
				+ "     , loc = ?"
				+ " where deptno = ?";
			
			// 4단계 : sql문을 데이터베이스 전송객체에 저장 및 
			//        ?(플레이스 홀더)에 데이터 배정
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getDname());
			pstmt.setString(2, dto.getLoc());
			pstmt.setInt(3, dto.getDeptno());
			
			
			// 5단계 : sql문을 데이터베이스에 전송 및 실행
			result = pstmt.executeUpdate();
			
			// 6단계 : 연결 자원 종료
			pstmt.close();
			con.close();
		
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
		
	}
	
	// 메서드 5 : deleteDept(DeptDTO dto)
	// 매개변수로 넘어온 부서번호에 해당하는 부서를 삭제
	public int deleteDept(int deptno) {
		int result = 0;
		
		try {
			
			// 3단계 : sql 작성
			sql = "delete from dept"
				+ " where deptno = ?";
			
			// 4단계 : sql문을 데이터베이스 전송객체에 저장 및 
			//        ?(플레이스 홀더)에 데이터 배정
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, deptno);
			
			// 5단계 : sql문을 데이터베이스에 전송 및 실행
			result = pstmt.executeUpdate();
			
			// 6단계 : 사용되었던 자원 종료
			pstmt.close();
			con.close();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}


// oracle -> app -> oracle -> product -> server -> jdbc -> lib -> ojdbc6 복사
// /Users/hye/devDownload/ojdbc11-full/ojdbc11.jar
// eclipse -> web-inf -> lib에 붙여넣기
