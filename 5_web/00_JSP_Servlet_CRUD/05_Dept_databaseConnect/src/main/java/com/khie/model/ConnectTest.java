package com.khie.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ConnectTest {

	
	Connection con = null;					// 데이터 베이스와 연동하는 객체
	PreparedStatement pstmt = null;			// 데이터 베이스에 sql문을 전송하는 객체
	ResultSet rs = null;					// sql문을 실행 후에 결과값을 가지고 있는 객체
	String sql = null; 						// 쿼리문을 저장할 변수
	
	public ConnectTest() {

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
			System.out.println("2차 : 데이터베이스 연결 성공!");

		}catch(Exception e) {
			System.out.println("2차 : 데이터베이스 연결 실패!");
			e.printStackTrace();
		}
		
		
		
		try {
    		// 3단계 : 데이터베이스에 sql
			String sql = "select * "
					   + "  from dept"
					   + "  order by deptno desc";
    		pstmt = con.prepareStatement(sql);
    		System.out.println("3단계 : 테이블 연결완료");

    		// 4단계 : 데이터베이스에 SQL문을 전송 및 실행
    		// ResultSet 은 select 문의결과를 저장하는 객체
    		rs = pstmt.executeQuery();
    		System.out.println("4단계 : SQL문을 전송 및 실행");

    		// 5단계 : 데이터 출력
    		System.out.println("5단계 : 데이터 출력");
    		while (rs.next()) {
    			int deptno = rs.getInt("deptno");
    			String dname = rs.getString("dname");
    			String loc = rs.getString("loc");
    			System.out.println(deptno + "\t" + dname + "\t" + loc);
    		}

    		// 6단계 : 연결 객체 종료
    		rs.close();
    		pstmt.close();
    		con.close();
    		System.out.println("6단계 : 객체종료");

    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    }
	
	
	public static void main(String[] args) {
		ConnectTest ct = new ConnectTest();
	}

}
