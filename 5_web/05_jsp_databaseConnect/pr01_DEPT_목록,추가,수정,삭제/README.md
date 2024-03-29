# DEPT(부서) 테이블 전체 리스트확인, 추가, 수정, 삭제 하기

-  [index.jsp](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/src/main/webapp/index.jsp)
- [SelectServlet.java](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/src/main/java/controller/SelectServlet.md)
  -  [DeptDAO.java](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/src/main/java/model/DeptDAO.md)
  - [DeptDTO.java ](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/src/main/java/model/DeptDTO.md)
-  [select.jsp](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/src/main/webapp/select.jsp)
-  [insert.jsp](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/src/main/webapp/insert.jsp)
    - [InsertServlet.java](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/src/main/java/controller/InsertServlet.md)
-  [update.jsp](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/src/main/webapp/update.jsp)
    -  [UpdateServlet.java](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/src/main/java/controller/UpdateServlet.md)
-  [DeleteServlet.java](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/src/main/java/controller/DeleteServlet.md)

## 1. 버튼 클릭시 리스트 확인 페이지로 이동

- 파일명 : index.jsp
- 비지니스 로직 : 버튼 클릭시 페이지 이동(테이블 전체 리스트확인 할 수 있는 곳으로 이동)
- 중요

  <b> 1. request.getContextPath()</b>

  - 현재 프로젝트명을 문자열로 반환해 주는 메서드

    ```
    <a href="<%=request.getContextPath() %>/select">[전체 부서 목록]</a>

    ---> http://localhost:8282/05_Dept_databaseConnect/select
        ---------------------   ---------------------  -----
                            ㄴrequest.getContextPath() |
                                출력된 프로젝트명           |
                                                        ㄴ 서블릿설정 url
    ```

  <b> 2. request.setAttribute("key", value);</b>

  - 데이터를 key로 묶음(List 객체배열)

    ```
    request.setAttribute("List", deltList);
    ```

  <b> 3. RequestDispatcher rd = request.getRequestDispatcher("jsp파일명.jsp");</b>
  <b> 4. rd.forward(request, response);</b>

  - 사용자의 요청을 다른 서블릿이나, jsp로 전달한다.
  - RequestDispatcher 클래스 : 현재 request에 담긴 정보를 저장하고 있다가 그 다음페이지에도 해당 정보를 계속 볼수있게 저장하는 기능

    ```
    RequestDispatcher rd = request.getRequestDispatcher("select.jsp");
    rd.forward(request, response);
    ```

## 2. dept테이블 전체 데이터를 묶는다.

- 파일명 : SelectServlet.java
- 비지니스 로직 : index.jsp 페이지에서 요청해서 dept 테이블의 전체 부서 목록을 화면 출력
- 중요

  <b> 1. service() 메서드</b>

  - doGet(), doPost() 메서드는 service()메서드에서 실행 가능하다.
  - servlet life circle
    - init() -> service() -> doGet()/doPost() -> destroy() 순으로 메서드를 호출

- 순서

1. DB연결 작업 진행

   - DAO(Data Access Object) 객체 준비

     - 파일명 : DeptDAO.java
     - 데이터 접근 객체(데이터 연동해서 정보 가져오는 객체)
     - 오라클, 이클립스 연결
     - 각종 메서드들
       - 1. dept테이블 전체를 가져오는 메서드(select)
       - 2. dept테이블에 데이터를 추가하는 메서드(insert)
       - 3. dept테이블 데이터를 수정하는 메서드(update)
       - 4. dept테이블 데이터를 지우는 메서드(delete)

   - DTO(Data Transfer Object) 객체 준비

     - 파일명 : DeptDTO.java
     - DAO에서 데이터를 가져오면 저장하거나, DAO에서 데이터를 가져오기 위한 객체(자바빈)
     - DEPT 테이블과 동일한 자료형을 가진 Private 변수 생성 및 getter/setter 메서드 생성

2. DB에서 DEPT테이블의 전체 목록 조회
3. 2단계에서 받은 정보를 key와 value값으로 묶어서 뷰(html) 페이지로 넘겨준다.

   - 사용메서드 : <b>request.setAttribute("key", "value");</b>
   - request.setAttribute() : 데이터를 묶어서 넘김
   - key에 value를 묶어서 보낸다.

4. 데이터를 화면에 구현할 주소를 설정하고 페이지를 이동시킨다.
   1. 이동할 페이지 주소 설정
      - RequestDispatcher rd = request.getRequestDispatcher("select.jsp");
   2. 실제 페이지를 이동이 진행 되는 곳
      - rd.forward(request, response);

## 3. 2번 순서에서 묶인 데이터를 화면에 구현한다.

- 파일명 : select.jsp
- 중요

  <b> 1. request.getAttribute("key")</b>

  - sql로 추출한 데이터를 request.setAttribute 묶은 데이터를 리스트 배열 객체로 받는다.
  - 반환 object 타입이라 형변환 필요

  ```
  List<DeptDTO> dept = (List<DeptDTO>) request.getAttribute("List");
  ```

  <b> 2. dept.size() / dept.get(index) </b>

  - dept.size() : list객체의 크기
  - dept.get(index) : list의 인덱스 주소값 가져온다.

  <b> 3. onclick="location.href='[이동할jsp파일명].jsp?[변수명]=<%=dto.[get가져올값변수명()] %>'"</b>

  - 클릭시 이동할 jsp 파일로 이동하고 이동할때 primaryKey값을 가져간다.
  - 가져올 변수는 primaryKey
  - primarykey를 가지고 데이터를 수정하거나, 삭제할때 사용

  ```
  <input type="button" value="부서수정" onclick="location.href='update.jsp?deptno=<%=dto.getDeptno() %>'">
  ```

  <b> 4. onclick="location.href='[이동할jsp파일명].jsp'"</b>

  - 클릭시 이동할 jsp 파일로 이동

  ```
  <input type="button" value="부서추가" onclick="location.href='insert.jsp'">
  ```

## 4. 데이터추가, 데이터수정 해당하는 버튼을 클릭할때 바뀌는 화면을 만든다. <br>(어떤 데이터를 추가,수정 할건지 작성하는 form)

- 추가파일명 : insert.jsp
- 수정파일명 : update.jsp

- 중요 :

  <b> 1. &lt;form method="post" action="[submit버튼이 눌렸을때 실행되어야할 servlet이름]"> </b>

  <b> 2. &lt;input type="text" name="변수명"&gt; </b>

  - name 속성값은 변수명이다.

  <b> 3. &lt;input type="text" name="변수명" value=<%=[url에있는 변수명] %> readonly &gt; </b>

  - url에서 받아온 primary key(기본키)를 그대로 사용한다.
  - 사용자가 primary key(기본키)를 변경하지 못하게 readonly를 작성한다.

## 5. 데이터추가, 데이터수정할 데이터를 입력하고 submit시 실행할 servlet

- 추가 실행할 servlet : InsertServlet.java
- 수정 실행할 servlet : UpdateServlet.java

- 중요

  <b>1. 한글 인코딩 처리</b>

  ```
  request.setCharacterEncoding("utf-8");
  response.setContentType("text/html; charset=UTF-8");
  ```

  <b>2. request.getParameter("name값") 입력값 변수에 저장 -> DTO 객체에 값 저장</b>

  - int 값일 경우 자료형 변경 필요
  - 앞 뒤 공백 제거 .trim()메서드
  - name값이란?
  - &lt;input name="변수명"&gt;
  - input 태그 name 속성값에 지정했던 값

  ```
  int deptNo = Integer.valueOf(request.getParameter("deptNo").trim());
  DeptDTO dto = new DeptDTO();
  dto.setDeptno(deptNo);
  ```

  <b>3. DB에 DTO 객체 전송 </b>

  - 데이터베이스 연결하는 dao 객체 생성
  - dao객체에 dto 객체를 매개변수로 받는 인자메서드 생성 후 int 변수에 저장

    - int 변수인 이유는 실행 될 경우 1로 값이 나오는 <br>
      pstmt.executeUpdate(); 메서드를 사용하기 때문

    ```
    DeptDAO dao = new DeptDAO();
    int res = dao.insertDept(dto);
    ```

  <b>4. out.println("&lt;script&gt;"); </b>

  - DB에 데이터 전송이 되었다면 실행될 자바 스크립트 작성은 out.println("") 가로안에 작성한다.

  ```
  - 하단과 같이 작성시 화면을 꾸미는 태그는 잘 실행 되어도
    script는 잘 실행 되지 않는다.

  scriptTag = "<html>"
            + "	 	<head></head>"
            + "	 	<body>"
            + "        <h2> 스크립트는 안됨 </h2>"
            + "			<script>"
            + "           alert('부서추가 성공!')"
            + "			  location.href='select'"
            + "			</script>"
            + "	 	</body>"
            + "	</html>";
    		System.out.println(scriptTag);
  		out.println(scriptTag);

  - 따라서 상단과 같이 작성보다 하단과 같이 작성해야한다.
  out.println("<script>");
  out.println("alert('부서추가 성공')");
  out.println("location.href='select'");
  out.println("</script>");
  ```
