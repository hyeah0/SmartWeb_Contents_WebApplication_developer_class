## JSTL(JSP standard Tag Library)

- JSP 페이지에서 스크립트릿(<%%>)과 HTML 코드가 뒤섞여 코드가 알아보기가 쉽지 않은 단점이 있다. (가독성이 낮아짐)

- JSP 페이지에서i 스크립트릿에 들어가는 자바 코드 중에 html 태그 처럼 사용할 수 있도록 <br>
  표준으로 만들어 정의한 것이 JSTL 라이브러리이다.
  1. 논리적 판단 (if, switch case)
  2. 반복처리 (for,while)
  3. 포맷처리
- JSTL 을 사용하기 위해서는 라이브러리 파일이 필요하다

  - jst1.jar
  - standard.jar
  - [다운 방법](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp/05_EL_JSTL/JSTL_%3Cc:tag%3E/01_%EB%9D%BC%EC%9D%B4%EB%B8%8C%EB%9F%AC%EB%A6%AC%EB%8B%A4%EC%9A%B4.md)

- 지시어(디렉티브) 중 <% taglib %> 선언으로 사용가능
  - [지시어(디렉티브) 참고](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp/02_01_jsp%EC%A7%80%EC%8B%9C%EC%96%B4%3C%25%40%25%3E.md)

# taglib 선언 방식

```
** JSTL 언어 사용 선언
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

** 포멧팅 사용 선언
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
```

- prefix 속성 값은 추후 태그 사용시 태그 앞에 붙을 문자이다.
- 통용적으로 core 는 c, fmt는 fmt를 사용한다.

# taglib 태그 예시

```
<c:catch> </c:catch>
```

    - c: 란?
        - taglib 선언시 prefix 속성값 설정한 값으로 들어간다.
        - 만약 prefix ="f" 할경우 <f:태그명> 으로 사용하면 된다.
