## 오라클 이클립스 연결 예시 코드

### - 싱글턴

```
public class ConnectMysql {
	/*
	 DAO 객체를 싱글턴 방식으로 사용
	 ProductDAO 객체를 싱글턴 방식으로 생성하기
	 1단계 : private 기본생성자
	 		  기본생성자의 접근제어자를 public 이 아닌 private 으로 변경해야한다.
			  외부에서 직접적으로 기본생성자를 호출하지 못하게 하기 위함

	 2단계 : ProductDAO 객체를 정적(static) 멤버로 선언

	 3단계 : 기본 생성자 대신에 싱글턴 객체를 return 하는
	        getInstance() 메서드 생성
	        getInstance()를 통해 기본 생성자를 외부에서 접근할 수 있도록 해준다.
	*/

	// 멤버변수
	Connection con = null;						// 데이터 베이스와 연동하는 객체
	PreparedStatement pstmt = null;				// 데이터 베이스에 sql문을 전송하는 객체
	ResultSet rs = null;						// sql문을 실행 후에 결과값을 가지고 있는 객체
	String sql = null; 							// 쿼리문을 저장할 변수

	// 객체 변수
	private static ConnectMysql instance;				// 싱글턴 : 2단계

	// 생성자
	private ConnectMysql() {	}						// 싱글턴 : 1단계

	/**
	 * 싱글턴 객체 생성 메서드
	 * - Connect getInstance()
	 * - 자료형 메서드명()
	 */
	public static ConnectMysql getInstance() {	// 싱글턴 : 3단계

		if(instance == null) {
			instance = new ConnectMysql();
		}

		return instance;
	}

	/**
	 * DB연동 메서드
	 * - openCon()
	 */
	public void openCon() {

		// 맥용(mysql) 정리본
		String driver = "com.mysql.cj.jdbc.Driver";
		String dbName = "[데이터베이스이름]";
		String url = "jdbc:mysql://localhost:3306/ "+ dbName + "?serverTimezone=Asia/Seoul&charaterEncoding=UTF-8";
		String user = "[사용자명]";
		String password = "[비밀번호]";
		// 상세 하단 참고

		try {

			Class.forName(driver);
            System.out.println("1단계 : 드라이버 로딩 성공");

			con = DriverManager.getConnection(url, user, password);
            System.out.println("2단계 : 데이터베이스 연결 성공");

		}catch(ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("1단계 : 드라이버 로딩 실패");

		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("2단계 : 데이터베이스 연결 실패");
		}

		try {
    		// 3단계 : 데이터베이스에 sql
			String sql = "select * "
					   + " from board";
    		pstmt = con.prepareStatement(sql);
    		System.out.println("3단계 : 테이블 연결완료");

    		// 4단계 : 데이터베이스에 SQL문을 전송 및 실행
    		// ResultSet 은 select 문의결과를 저장하는 객체
    		rs = pstmt.executeQuery();
    		System.out.println("4단계 : SQL문을 전송 및 실행");

    		// 5단계 : 데이터 출력
    		System.out.println("5단계 : 데이터 출력");
    		while (rs.next()) {
    			int board_no = rs.getInt("board_no");
				String board_writer = rs.getString("board_writer");
				String board_title = rs.getString("board_title");
				String board_cont = rs.getString("board_cont");
				String board_pwd = rs.getString("board_pwd");
				int board_hit = rs.getInt("board_hit");
				String board_date = rs.getString("board_date");
				String board_update = rs.getString("board_update");
    			System.out.println(board_no);
    			System.out.println(board_writer);
    			System.out.println(board_title);
    			System.out.println(board_cont);
    			System.out.println(board_pwd);
    			System.out.println(board_hit);
    			System.out.println(board_date);
    			System.out.println(board_update);
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

	public static void main(String[] args) {

		ConnectMysql cs = ConnectMysql.getInstance();
		cs.openCon();
	}
}
```

### - 일반

- oracle 작성 부분에서 driver, url, user, password 수정만 하면 된다.
  [oracle](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/oracle/00_%EC%98%A4%EB%9D%BC%ED%81%B4%EC%9D%B4%ED%81%B4%EB%A6%BD%EC%8A%A4%EC%97%B0%EA%B2%B0%EC%98%88%EC%8B%9C.md)
