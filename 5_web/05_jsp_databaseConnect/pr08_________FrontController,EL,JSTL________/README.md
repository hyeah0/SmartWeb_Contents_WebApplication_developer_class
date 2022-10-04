## FrontController 패턴

- 기능이 많아지면 servlet 갯수가 많아지고 길어지는 문제가 발생하기 때문에<br>
  모든 요청을 한곳에 받아오고, 하나의 컨트롤러로 다시 보내주는 패턴을 이용
- MVC 패턴의 메인으로 "모든 요청을 하나의 대표 컨트롤러가 처리하는 방식" 이다.<br>
  이것은 유지 보수성이 뛰어나고 수많은 컨트롤러 응답에 계속적으로 객체를 생성하지 않아<br> 자원 활용에도 좋다.

- 각각의 컨트롤러에서 클라이언트의 요청을 받는 것이 아니라 <br>
  FrontController 서블릿 하나로 클라이언트의 요청을 받는다.<br>
  FrontController 가 요청에 맞는 컨트롤러를 찾아서 호출한다.<br>
  입구가 하나이므로 공통적인 처리 기능 사용 가능하다.

- FrontController는 요청 객체를 처리할 수 있는 비지니스 로직을 가진 Controller 를 호출한다.<br>
  그 다음, FrontController는 Controller 의 비지니스 로직을 수행할 메서드를 호출한다.<br>
  이 때 비지니스 로직을 수행하는 메서드의 이름이 Controller 마다 다르다면,<br>
  FrontController 에서 일괄적으로 해당 메서드를 호출 할 수 없게 된다.<br>
- 따라서 이와 같은 문제점을 해결하기 위하여 Controller 는 Interface 로 선언하여<br>
  각 Controller의 비지니스 로직을 수행하는 메서드는 모두 동일한 이름의 메서드명을 갖게 된다.

## - 클라이언트의 요청을 받기 전에 web.xml 파일에 서블릿 매핑

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/img/08/01.png" width="70%">

```
  <!-- 서블릿 매핑(N:1) -->
   <servlet>
        <servlet-name>FrontController</servlet-name>
        <servlet-class>com.member.controller.FrontController</servlet-class>
   </servlet>

    <!-- 서블릿 클래스
   	<servlet-class>com.member.controller.FrontController</servlet-class>
                      --------------------
   		   - com.member.controller. >> 패키지 이름-->

  <servlet-mapping>
        <servlet-name>FrontController</servlet-name>
        <url-pattern>*.do</url-pattern>
  </servlet-mapping>

  <--
  <url-pattern>*.do</url-pattern>
  	      -----
  	      url이 **.do로 종료되면 FrontController 서블릿으로 이동
  -->
```

- FrontController는 servlet 파일에서
  1. 기본생성자
  2. @WebServlet(); 은 뺀다.
     - uri에 따라 다른 

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/img/08/02.png" width="70%">

```
package com.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

public class FrontController는 extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
```
