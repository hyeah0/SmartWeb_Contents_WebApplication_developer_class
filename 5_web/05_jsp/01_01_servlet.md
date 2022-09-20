## servlet

```
package 패키지명;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/액션명") // jsp form tag 액션속성 액션명 <form method="get" action="Test">
public class 액션명 extends HttpServlet {
	// 멤버변수
    private static final long serialVersionUID = 1L;

    // 생성자
    public 액션명() {
        super();
    }

    // 메서드
    // form method="get", "post" 에 따라 해당하는 메서드에 작성
    // 요청객체와 응답객체가 있다.
	// form 태그 method 따로 작성 안하면 get방식으로 자동설정
	// form 태그 method 에서 get 이면 doGet에서 실행 : 사용자가 작성한 값이 url주소값에 모두 나온다.
	// form 태그 method 에서 post 이면 doPost에서 실행 : 사용자가 작성한 값이 url주소값에 나오지 않는다.

    // get 메서드
    // form 태그에 method="get" 이라고 적힌경우나, method 속성이 안 적혀진 경우 이 메서드에서 처리
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// response.getWriter().append("Served at: ").append(request.getContextPath());

		// 응답시 한글 작성시 깨지는 현상 방지
        request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

        // 홈페이지에서 name 속성값을 넣는다.
        // getParameter 함수는 string으로 값을 받는다.
        String userId = request.getParameter("userId");

        // 홈페이지에서 입력받은 값을 다시 홈페이지에 출력한다.
        // 1. PrintWriter 객체 생성
        PrintWriter out = response.getWriter();

        // 2. 홈페이지에 출력할 html 작성
		String html = "<html>"
					+ "	<head></head>"
					+ "	<body>"
					+ " <p> + name + </p>
					+ "	</body>"
					+ "</html>";
		out.println(html);
	}

    // post 메서드
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//doGet(request, response);
	}

}
```

### HttpServletRequest request

- request 매개변수
  - 사용자(클라이언트)의 요청에 대한 정보를 처리
  - 클라이언트로부터 Servlet 으로 요청이 들어오게 되면 요청 파라미터라는 것이 오는데,
    분석은 request.getParameter() 라는 메서드를 이용하여 파악을 한다.

### HttpServletResponse response

- response 매개변수
  - 사용자의 요청정보에 대한 처리 결과를 클라이언트에 응답하여 처리
  - 요청을 파악했다면 클라이언트로 내보낼 응답을 작성해야한다.
  - 대부분의 웹 프로그래밍은 응답을 텍스트롤 작성하며,<br>
    이 텍스트는 대부분 HTML 페이지 모양을 하고 있게 된다.
  - 여기서 응답은 텍스트를 기록해야하는데, <br>
    이 때 스트림이라는 개념을 이용하여 기록하게 된다. (스트림은 데이터의 흐름이다.) <br>
    Servelet 에서는 클라이언트 쪽으로 보내는 데이터의 흐름을 <br>
    건드려야 할 필요가 있게 된다.<br>
  - response 인자를 활용하면 응답과 관련된 많은 작업을 할 수 있다.<br>
    응답 스트림에 텍스트를 기록하는 것도 가능 <br>
    이 작업을 하기 위해서는 response.getWriter() 메서드를 사용하면 된다.<br>
  - 해당 메서드를 이용하여 응답으로 내보낼 출력 스트림을 얻어낸 후에<br>
    출력 스트림에 텍스트를 기록하면 된다.

## 응답시 한글 작성시 깨지는 현상 방지

- 메서드 안에 입력

```
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
```

## getParameter()

- form에서 name 속성값을 string으로 값을 받는다.

```
String userId = request.getParameter("userId");
```

// 속성값 화면에 출력

## response.getWriter()

PrintWriter out = response.getWriter();
