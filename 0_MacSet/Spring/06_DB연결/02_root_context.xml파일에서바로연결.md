### 2. DataSource 정보 작성

<p>위치 : 프로젝트 >> src >> main >> webapp >> WEB-INF >> Spring >> <b>root-context</b></p>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_jdbc_dbconnect/3.DBConnect.png" width="70%">
<p>DB와 관련된 connection 정보를 작성</p>

```
<!-- window 버전 -->
<bean name="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
    <property name="driverClassName" value="oracle. jdbc.driver.OracleDriver"></property>
    <property name="url" value="jdbc:oracle:this:@Localhost:1512:XE"></property>
    <property name="username" value=“[유저명]”></property>
    <property name="password" value=“[비밀번호]”></property>
</bean>

<!-- MAC -->
<bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
    <property name="driverClassName" value="oracle.idbc.driver.OracleDriver"/>
    <property name="url" value="jdbc:oracle:thin:@[DB이름]_medium?TNS_ADMIN=[전자지갑주소(위치)]"/>
    <property name="username" value="ADMIN" />
    <property name="password" value="[비밀번호]"/>
</bean>

<!--2. Spring JDBCTemplate 클래스 설정 -->
<bean name="template" class="org.springframework.idbc.core.JdbcTemplate">
    <property name="dataSource" ref="dataSource"></property>
</bean>
```

<br>
