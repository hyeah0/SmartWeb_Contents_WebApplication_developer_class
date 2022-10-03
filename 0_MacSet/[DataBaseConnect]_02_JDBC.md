## 윈도우, 맥 참고

### 윈도우

```
String dirver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:XE";
String user = "[유저명]";
String password = "[비밀번호]";
```

### 맥용(오라클)

```
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@[전자지갑이름]_high?TNS_ADMIN=[전자지갑경로]";
String user = "[유저명]";
String password = "[비밀번호]";
```

### 맥용(mysql)

```
String driver = "com.mysql.cj.jdbc.Driver";
String dbName = "[데이터베이스이름]";
String url = "jdbc:mysql://localhost:3306/ "+ dbName + "?serverTimezone=Asia/Seoul&charaterEncoding=UTF-8";
String user = "[유저명]";
String password = "[비밀번호]";
```
