## Spring - DB연결

### 1. 라이브러리 다운 (spring-jdbc & commons-dbcp)

<p>위치 : 프로젝트 >> target >> <b>pom.xml</b></p>
<div>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_jdbc_dbconnect/1.springjdbc1.png" width="45%">
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_jdbc_dbconnect/1.springjdbc2.png" width="45%">
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_jdbc_dbconnect/1.springjdbc3.png" width="45%">
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_jdbc_dbconnect/1.springjdbc4.png" width="45%">
</div>
<p>1. <a href="https://mvnrepository.com/">스프링라이브러리코드</a> <<- 클릭해서 spring-jdbc 검색한다.</p>
<p>2. 버전은 아무거나 클릭 </p>
<p>3. 코드를 복사한다음 프로젝트 pom.xml 파일에 붙여 넣는다. 
<br><b>이때 version 부분은 spring-webmvc 버전과 동일하게 넣는다.</b>
<br><code>${org.springframework-version}</code>
</p>
<br>

<div>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_jdbc_dbconnect/2.DBCP1.png" width="45%">
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_jdbc_dbconnect/2.DBCP2.png" width="45%">
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_jdbc_dbconnect/2.DBCP3.png" width="45%">
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_jdbc_dbconnect/2.DBCP4.png" width="45%">
</div>
<p>1. <a href="https://mvnrepository.com/">스프링라이브러리코드</a> <<- 클릭해서 commons-dbcp 검색한다. </p>
<p>2. 1.4 클릭</p>
<p>3. 코드를 복사한다음 프로젝트 pom.xml 파일에 붙여 넣는다. </p>
<br>

### 프로젝트에 필요한 라이브러리는 총 4개

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_jdbc_dbconnect/2.springNeedLibrary.png" width="70%">
<ul>
    <li>spring-jdbc : db</li>
    <li>commons-dbcp : db</li>
    <li>lombok : @data 애노테이션(자동 getter, setter) </li>
    <li>cglib</li>
</ul>
<br>

### 2. DataSource 정보 작성

- [외부에서 연결하는 방법]()
- [root-context.xml 파일에서 연결]()

### 3. Controller 클래스가 속해있는 패키지를 자동으로 빈으로 등록해주는 태그작성

<p>위치 : 프로젝트 >> src >> main >> webapp >> WEB-INF >> Spring >> appServlet >> <b>Servlet-context</b></p>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_jdbc_dbconnect/4.autoBean.png" width="70%">

### 4. 한글 인코딩, url 주소값 끝에 .do 로 오는 건 모두 한글처리

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_jdbc_dbconnect/5.mapping.png" width="70%">

```
<!-- 1. 한글 인코딩 필더  -->
<filter>
    <filter-name>encodingFilter</filter-name>
    <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>

    <!-- (작업 요청에 대한 한글처리) -->
    <init-param>
        <param-name>encoding</param-name>
        <param-value>UTF-8</param-value>
    </init-param>

    <!-- (작업 응답에 대한 한글처리) -->
    <init-param>
        <param-name>forceEncoding</param-name>
        <param-value>true</param-value>
    </init-param>
</filter>

<!-- .do 뒤에 오는건 모든 한글 처리 -->
<filter-mapping>
    <filter-name>encodingFilter</filter-name>
    <url-pattern>*.do</url-pattern>
</filter-mapping>
```
