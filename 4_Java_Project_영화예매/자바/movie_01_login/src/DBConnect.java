package movie_01_login;

import java.sql.Connection;
import java.sql.DriverManager;


/*
 * 
 * 클래스명 : DBConnect 
 * DBConnect.getConnection();
 *
 */

public class DBConnect {


	public static Connection getConnection() {
	
			Connection con = null;
		
		// 윈도우용 
			// String driver = "oracle.jdbc.driver.OracleDriver";	
			// String url = "jdbc:oracle:thin@localhost:1521:xe";
			// String user = "사용자이름";
			// String pwd = "비밀번호";
		
		// 오라클 개인 주소값(맥)
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@전자지갑이름_high?TNS_ADMIN=전자지갑경로\";
			String user = "사용자이름";
		    String pwd = "비밀번호";
	
		// 오라클 드라이버 로딩 및 데이터 베이스 연결 
		try {
			/* 1단계 오라클 드라이버 로딩 */
			Class.forName(driver);
			
			/* 2단계 : 데이터베이스 연결 및 준비 */
 	        con = DriverManager.getConnection(url, user, pwd); 
 	        // System.out.println("오라클 로딩, 데이터베이스 연결 완료!");
 	        
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return con;
			
			
		
	}
	

}

