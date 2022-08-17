package movie_login;

import java.sql.Connection;
import java.sql.DriverManager;


/*
 * 
 * 클래스명 : Movie_System 
 * Movie_System.getConnection();
 *
 */

public class Movie_System {


	public static Connection getConnection() {
	
			Connection conn = null;
		
		// 윈도우용 
			// String driver = "oracle.jdbc.driver.OracleDriver";	
			// String url = "jdbc:oracle:thin@localhost:1521:xe";
			// String user = "system";
			// String pwd = "1234";
		
		// 오라클 개인 주소값(맥)
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@SYSTEM_high?TNS_ADMIN=/Users/hye/oraclewallet/Wallet_system";
			String userid = "admin";
			String pwd = "Asdfghjklzxc0";
	
		// 오라클 드라이버 로딩 및 데이터 베이스 연결 
		try {
			/* 1단계 오라클 드라이버 로딩 */
			Class.forName(driver);
			
			/* 2단계 : 데이터베이스 연결 및 준비 */
 	        conn = DriverManager.getConnection(url, userid, pwd); 
 	        // System.out.println("오라클 로딩, 데이터베이스 연결 완료!");
 	        
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return conn;
			
			
		
	}
	

}
