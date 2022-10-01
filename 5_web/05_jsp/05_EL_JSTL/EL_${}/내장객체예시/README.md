## page < request < session < application

<p>pageContext >>> ex05페이지에서만 값 유효</p>
<p>request >>> forward로 넘어갈 경우에만 값 유효</p>
<p>session >>> 유효시간까지 값 유효</p>
<p>application >>> 애플리케이션 종료시까지 값 유효</p>

- [한 페이지에서만 실행시(Ex05)](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp/05_EL_JSTL/EL_%24%7B%7D/%EB%82%B4%EC%9E%A5%EA%B0%9D%EC%B2%B4%EC%98%88%EC%8B%9C/Ex05_pageCon_request_.jsp) : 전체 데이터를 확인 할 수 있다.

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp/05_EL_JSTL/EL_%24%7B%7D/%EB%82%B4%EC%9E%A5%EA%B0%9D%EC%B2%B4%EC%98%88%EC%8B%9C/img/01_page.png"  width="70%">

    - 단 하단 코드가 없을때,

    ```
    RequestDispatcher rd = request.getRequestDispatcher("Ex06.jsp");
    rd.forward(request, response);
    ```

- [forward로 Ex05에서 Ex06파일로 이동시](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp/05_EL_JSTL/EL_%24%7B%7D/%EB%82%B4%EC%9E%A5%EA%B0%9D%EC%B2%B4%EC%98%88%EC%8B%9C/Ex06.jsp) : pageContext.getAttribute == ${pageScope.Res} 값은 확인 할 수없다.
- forward로 페이지 이동시 실행되는 파일명을 url에서 확인이 어렵다. (이동전 파일명만 확인 가능)

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp/05_EL_JSTL/EL_%24%7B%7D/%EB%82%B4%EC%9E%A5%EA%B0%9D%EC%B2%B4%EC%98%88%EC%8B%9C/img/02_request.png"  width="70%">

    - Ex05 코드에서 하단 코드를 추가, Ex06 script code 가 없을때

    ```
    RequestDispatcher rd = request.getRequestDispatcher("Ex06.jsp");
    rd.forward(request, response);

    <script type="text/javascript">
    	location.href="Ex07.jsp"
    </script>
    ```

- [forward로 Ex05에서 Ex06파일로 이동 >> Ex06에서 Ex07로 이동](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp/05_EL_JSTL/EL_%24%7B%7D/%EB%82%B4%EC%9E%A5%EA%B0%9D%EC%B2%B4%EC%98%88%EC%8B%9C/Ex07.jsp) : pageContext.getAttribute == ${pageScope.Res} , request.getAttribute == ${requestScope.R} 값은 확인 할 수없다.

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp/05_EL_JSTL/EL_%24%7B%7D/%EB%82%B4%EC%9E%A5%EA%B0%9D%EC%B2%B4%EC%98%88%EC%8B%9C/img/03_location.png"  width="70%">

    - Ex05 코드에서 하단 코드를 추가했을때

    ```
    RequestDispatcher rd = request.getRequestDispatcher("Ex06.jsp");
    rd.forward(request, response);
    ```
