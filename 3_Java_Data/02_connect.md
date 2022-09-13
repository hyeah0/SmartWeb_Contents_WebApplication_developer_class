## 자바 연결 ~ sql 데이터 출력까지

```
public class D01_Select {

    public static void main(String[] args) {

    	// -- 오라클 데이터 베이스 연결 객체 -------------------------
    	Connection con = null;

    	// -- SQL문을 데이터베이스에 전송하는 객체 --------------------
    	PreparedStatement pstmt = null;

    	// -- SQL문을 실행한 후의 결과값 가지고 있는 객체 --------------
    	ResultSet rs = null;

        // String driver = "oracle.jdbc.driver.OracleDriver";

        // 윈도우용 ---------------------------------------------
    	// String url = "jdbc:oracle:thin:@localhost:1521:xe";
    	// String userid = "사용자이름";
    	// String pwd = "비밀번호";

        // 맥 -------------------------------------------------
    	String url = "jdbc:oracle:thin:@전자지갑이름_high?TNS_ADMIN=전자지갑경로";
        String userid = "사용자이름";
        String pwd = "비밀번호";

    	// 1~2 오라클 드라이버 로딩 + 데이터베이스 연결 및 준비
    	try {
    		// 1단계 : 오라클 드라이버 로딩
    		// - 동적 로딩 : 프로그램 실행시에 오라클 드라이버를 로딩한다는 의미
    		Class.forName(driver);
    		System.out.println("1단계 : 오라클 드라이버 로딩");

    		// 2단계 : 데이터베이스 연결 및 준비
    		System.out.println("2단계 : 데이터베이스 연결 준비");
    		con = DriverManager.getConnection(url, userid, pwd);
    		if (con != null) {
    			System.out.println("2단계 : 오라클 데이터베이스와 연결");
    		}

    	} catch (Exception e) {
    		// catch(ClassNotFoundException e){ // 1단계 에러
    		e.printStackTrace();
    	}

    	// 3~6 sql 실행
    	try {
    		// 3단계 : 데이터베이스에 sql
    		String sql = "select * from dept";
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

}
```

## 3, 4단계 데이터 베이스에 SQL문을 전송 및 실행 단계

- 데이터 베이스에 SQL문을 전송 및 실행시 <b>executeQuery</b> 또는 <b>excuteupdate</b>를 사용한다.

- executeQuery : 객체값을 반환 하여 select 구문 수행시 사용
- excuteupdate : 수행결과를 int 로 반환하여 update, insert, delete 등의 쿼리를 수행시 사용

### 1. executeQuery

```
String sql = "select \* from dept";
pstmt = con.prepareStatement(sql);

// 4단계 : 데이터베이스에 SQL문을 전송 및 실행
// ResultSet 은 select 문의결과를 저장하는 객체
rs = pstmt.executeQuery();

// 5단계 : 데이터 출력
while (rs.next()) {
	int deptno = rs.getInt("deptno");
	String dname = rs.getString("dname");
	String loc = rs.getString("loc");
	System.out.println(deptno + "\t" + dname + "\t" + loc);
}
```

### 2. executeQuery

- 하단 3가지 경우에 자주 사용
  - insert
  - update
  - delete

[sql문 참고](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/2_Data/extra02_sql%20%EC%A0%95%EB%A6%AC.md)

#### - 1. insert

```
// 3단계
String sql = "insert into student values(?,?,?,?,?,?,sysdate)";

pstmt = conn.prepareStatement(sql);

// 4단계
pstmt.setString(1, hakbun);
pstmt.setString(2, name);
pstmt.setString(3, major);
pstmt.setInt(4, Integer.parseInt(age));
pstmt.setString(5, phone);
pstmt.setString(6, addr);

int result = pstmt.executeUpdate();
if(result>0) {
	System.out.println("데이터 입력 성공");
}else {
	System.out.println("데이터 입력 실패");
}
```

#### - 2. update

```
// 3단계 sql문 작성
String sql = "update student "
		+ "      set major = ?"
		+ "         , age = ?"
		+ "         , phone = ?"
		+ "         , addr =?"
		+ "     where hakbun = ?";

pstmt = conn.prepareStatement(sql);

// 4단계
pstmt.setString(1, major);
pstmt.setInt(2, Integer.parseInt(age));
pstmt.setString(3, phone);
pstmt.setString(4, addr);
pstmt.setString(5, hakbun);

int result = pstmt.executeUpdate();
if(result > 0) {
	System.out.println("데이터 업데이트 성공");
}else {
	System.out.println("데이터 업데이트 실패");
}
```

#### - 3. delete

```
// 3단계 sql문 작성
String sql = "delete from Student"
		+ "         where hakbun = ?";

// sql 전송
pstmt = conn.prepareStatement(sql);

// 4단계
pstmt.setString(1,hakbun);

int res = pstmt.executeUpdate();
if(res>0) {
	System.out.println("데이터 삭제 성공!");
}else {
	System.out.println("데이터 삭제 실패!");
}
```
