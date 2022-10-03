## 커넥션 풀(Connection Pool) 연결 방법

0. Was(Web Application Server_tomcat)에 connection 객체 공간 (풀(pool)) 생성한다
1. JNDI 서버 객체 생성(Context 객체 생성)
2. lookup() 메서드를 이용하여 매칭되는 커넥션을 찾는다.
3. DataSource.getConnection() 메서드를 이용하여 커넥션 확보한다.

## 0. Was(Web Application Server_tomcat)에 connection 객체 공간 (풀(pool)) 생성

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/connection_pool/01_connectionPool.png" width="70%">

```
<Resource
    name            = jdbc/리소스를 등록할 이름 지정
    auth            = DBCP를 관리할 관리자 지정(보통 Container 또는 Application)
    type            = 리소스 타입 지정
                      커넥션 풀을 사용할 수 있도록 해주는 객체 반환 타입을 의미한다.
    url             = 접속할 DB서버의 url을 지
    driverCLassName = DB작업을 로딩할 드라이버
                      JDBC 방식에서 class.forName() 의 인자값을 의미한다.
    username        = DB서버에 로그인 할 계정
    password        = DB서버에 로그인할 계정의 비밀번호를 지정
    maxActive       = 생성할 Connection 갯수를 지정(기본 20개)
                      동시에 최대로 데이터베이스에 연결할 수 잇는 Connection 수이다.
    maxIdle         = 커넥션 풀에 여분으로 남겨질 최대 Connection 갯수이다.
                      즉 커넥션 풀을 유지하기 위한 최대 대기 커넥션 숫자이다.
    maxWait         = 사용 가능한 커넥션이 없을 때 커넥션 회수(반납)을 기다리는 시간(ms)
                      (1000ms = 1s)
/>
```

## oracle window

```
<Resource
    name="jdbc/myoracle"
    auth="container"
    type="javax.sql.DataSource"
    url="jdbc:oracle:thid:@Localhost:1521:XE"
    driverCLassName="jdbc.oracle.driver.OracleDriver"
    username = "[유저명]"
    password = "[비밀번호]"
    maxActive="20"
    maxIdle="10"
/>
```

## oracle mac

```
<Resource
    name = "jdbc/myoracle"
    auth = "container"
    type = "javax.sql.DataSource"
    url = "jdbc:oracle:thin:@[전자지갑이름]_high?TNS_ADMIN=[전자지갑경로]"
    driverCLassName = "jdbc.oracle.driver.OracleDriver"
    username = "[유저명]"
    password = "[비밀번호]"
    maxActive = "20"
    maxIdle = "10"
/>
```

## mysql mac

```
<Resource
    name = "jdbc/mysql"
    auth = "Container"
    type = "javax.sql.DataSource"
    url = "jdbc:mysql://localhost:3306/[데이터베이스이름]?serverTimezone=Asia/Seoul"
    driverCLassName = "com.mysql.cj.jdbc.Driver"
    username = "[유저명]"
    password = "[비밀번호]"
    maxActive = "20"
    maxIdle = "10"
/>
```

## 1~3 예시 코드

<table>
	<tr>
		<th>
			Context	
		</th>
		<th>
			InitialContext	
		</th>
	</tr>
	<tr>
		<td width="40%" height="100px">
			<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/connection_pool/02_context.png" width="100%">
		</td>
		<td width="60%">
			<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/connection_pool/03_initalcontext.png" width="100%">
		</td>
	</tr>
</table>

```
public void openCon() {

		try {
			// 1단계 : JNDI 서버 객체 생성
			Context ctx = new InitialContext();

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
```
