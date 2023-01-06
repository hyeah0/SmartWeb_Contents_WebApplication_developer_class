## 쿠키를 통해 아이디 기억하기

- 로그인시 아이디기억하기 체크시 쿠키에 저장
<h3>쿠키 저장전</h3>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/06_Spring/07_Cookie%26Session/img/cookie02.png" width="80%">

<h3>쿠키 저장 후</h3>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/06_Spring/07_Cookie%26Session/img/cookie03.png" width="80%">

- ++
<h3>아이디 비밀번호가 다를경우 메서지</h3>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/06_Spring/07_Cookie%26Session/img/cookie01.png" width="80%">

<hr>

## &lt;c:url/&gt;

<h3>&lt;c:url/&gt;사용이유</h3>
- `<c:url value='/login/login'/>`

- [사용코드\_login_includeHeader](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/06_Spring/07_Cookie%26Session/code/jsp/login_includeHeader.jsp)

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
    - [사용코드\_login_index](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/06_Spring/07_Cookie%26Session/code/jsp/login_index.jsp)

- jsessionid로 사용자를 구분한다.

<hr>

## jsp에서 세션값 확인하기 (sessionScope.sessionname)

<h3>sessionScope.sessionname명</h3>
- 로그인 유무에 따라 로그인/ 로그아웃 표시

```
<c:set var="LoginOutLink" value="${sessionScope.id==null ? '/login/login' : '/login/logout' }"/>
<c:set var="LoginOut" value="${sessionScope.id==null ? 'Login' : 'Logout' }"/>
```

```
[참고]
|| == or
&& == and
조건 || 조건 ? 조건이 true 일때 실행문 : 조건이 false 일때 실행문
```

- [사용코드\_login_includeHeader](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/06_Spring/07_Cookie%26Session/code/jsp/login_includeHeader.jsp)
