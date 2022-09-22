## JSP 내장 객체

- 객체를 생성하지 않고 사용할 수 있는 객체를 말한다.
- 내장 객체는 JSP 페이지 내에서 제공하는 특수한 레퍼런스 타입의 변수이다.
- JSP 페이지에서 사용하는 특수한 레퍼런스 타입의 변수가 아무런 선언과 객체 생성없이<br>
  사용할 수 있는 이유는 JSP가 Servlet 으로 변환 될때 JSP 컨테이너(톰캣)가 자동적으로<br>
  제공을 해주고 있기 때문이다.

## JSP 내장 객체의 종류

| 내장 객체    | 리턴 타입(Return Type)                 | 설명                                                                                                                                                              |
| ------------ | -------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| request      | javax.servlet.http.HttpServletRequest  | 웹 브라우저의 요청 정보를 저장하고 있는 객체                                                                                                                      |
| response     | javax.servlet.http.HttpServletResponse |  웹 브라우저의 요청에 대한 응답 정보를 저장하고 있는 객체                                                                                                         |
| out          | javax.servlet.jsp.jsp.jspWriter        | JSP 페이지에 출력할 내용을 가지고 있는 출력 스트림 객체                                                                                                           |
| session      | javax.servlet.http.HttpSession         | 하나의 웹 브라우저의 정보를 유지하기 위한 세션 정보를 저장하고 있는 객체<br> 예시) 로그인을 한번했을때 유지하고 있는 기간 또는 시간 <br>(은행 로그인시 3분 유지)  |
| application  | javax.servlet.ServletContext           | 웹 어플리케이션 Context의 정보를 저장하고 있는 객체                                                                                                               |
| pageContext  | javax.servlet.jsp.PageContext          | JSP 페이지에 대한 정보를 저장하고 있는 객체                                                                                                                       |
| page         | java.lang.Object                       | JSP 페이지를 구현한  자바 클래스 객체                                                                                                                             |
| config       | javax.servlet.ServletConfig            | JSP 페이지에 대한 설정 정보를 저장하고 있는 객체                                                                                                                  |
| exception    | java.lang.Throwable                    | JSP 페이지서 예외가 발생한 경우에 사용되는 객체                                                                                                                   |
