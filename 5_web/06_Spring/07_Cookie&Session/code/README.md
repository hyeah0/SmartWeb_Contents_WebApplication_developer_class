## 쿠키를 통해 아이디 기억하기

- 로그인시 아이디기억하기 체크시 쿠키에 저장
<h3>쿠키 저장전</h3>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/06_Spring/07_Cookie%26Session/img/cookie02.png" width="80%">

<h3>쿠키 저장 후</h3>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/06_Spring/07_Cookie%26Session/img/cookie03.png" width="80%">

- ++
<h3>아이디 비밀번호가 다를경우 메서지</h3>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/06_Spring/07_Cookie%26Session/img/cookie01.png" width="80%">

<h3>&lt;c:url/&gt;사용이유</h3>
- `<c:url value='/login/login'/>`
- 쿠키가 허용되지 않는 홈페이지에서 url에 jessionid를 넣기위해
    - c:url을 사용하지 않고 `<form action='<%=request.getContextPath()%>/login/login'/>>` 사용할 경우 jessionid가 계속 변한다.

- 쿠키가 허용된 홈페이지에서는 c:url을 통해 url에 jsessionid를 넣어주고, 세션에서 쿠키에 jsessionid를 저장한다.
- 자동으로 생성되는 세션이 필요없는 jsp 페이지는 상단에<br>
  `<%@ page session="false" %>`을 작성하면 세션이 생성되지 않는다(세션값이 따로 없을경우)

  - `<%@ page session="false" %>`
    - 세션이 이미 있으면 유지
    - 세션이 없을경우 따로 생성하지 않는다.
    - default 값은 session = "ture"
    - 주로 홈페이지, 로그인페이지에 사용
    - [사용코드]()

- jsessionid로 사용자를 구분한다.