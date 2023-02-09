## 쿠키와 세션

### 쿠키(Cookie)
- 사용자가 웹 사이트를 방문때 웹 사이트에서 클라이언트의 컴퓨터에 저장해 놓는 작을 파일
- 웹 페이지를 사이의 공유 정보를 클라이 컴퓨터에 저장해 놓고 필요할 때 여러 웹 페이지들이 공유해서 사용할 수 있도록 매개 역할을 하는 방법이다.
- key과 value 로 이루어진 정보, 야스키 문자만 가능하다.
- 서버에서 생성 후 전송, 브라우저에 저장된다.
- 설정한 유효기간 이후에 자동 삭제 된다.
- 서버 요청시 domain, path가 일치하는 경우에만 자동 전송된다.
- [쿠키코드 예시](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/06_Spring/07_Cookie%26Session/%EC%BD%94%EB%93%9C%EC%98%88%EC%8B%9C/%EC%BF%A0%ED%82%A4.md)

### 쿠키의 특징
- 쿠키는 헤더에서 생성이 된다.
- 쿠키는 클라이언트 컴퓨터에 저장이 된다.
- 쿠키 관리는 웹브라우저가 한다.
- 쿠키의 크기는 4kb로 제한적이며, 300개 정도의 쿠키를 만들어서 사용할 수 있다.
- 쿠키는 보안이 취하다.

### 쿠키의 생성 방법
- 쿠키의 생성은 쿠키 클래스를 이용한다.
- 쿠키 속성 설정(setter)
- 쿠키의 전송(response 객체에 탑재 : addCookies())

### 관련 메서드 
- setMaxAge() : 쿠키의 유효기간을 설정하는 메서드 
- setPath() : 쿠키 사용을 위한 디렉토리를 설정하는 메서드(특정 경로명을 갖는 url로 전송하도록 설정)
- setValue() : 쿠키 값을 설정하는 메서드
- setVersion() : 쿠키의 버전을 설정하는 메서드
- getMaxAge() : 쿠키의 유효기간 정보를 얻어오는 메서드
- getName() : 쿠키의 이름을 얻어올 때 사용하는 메서드
- getPath() : 쿠키의 유효 디렉토리 정보를 얻어올 대 사용하는 메서드
- getVersion() : 쿠키의 버전을 얻어올 때 사용하는 메서드
- getCookies() : 쿠키의 데이터를 읽어올때 사용하는 메서드
                 웹 브라우저에 보낸 쿠키를 배열로 반환해 주는 메서드

#### 1. 쿠키 생성

```
Cookie cookie = new Cookie("name", "value") // 쿠키생성
cooke.setMaxAge(60*60*24);                  // 유효기간 설정(초) .. (60*60*24) >> 24시간
response.addCookie(cookie);                 // 응답에 쿠키추가
```

#### 2. 쿠키 삭제

```
Cookie cookie = new Cookie("name","");      // 변경할 쿠키이름과 값 작성
cookie.setMaxAge(0);                        // 유효기간 0으로 설정
response.addCookie(cookie);                 // 응답에 쿠키추가
```

#### 3. 쿠키 수정

```
Cookie cookie = new Cookie("name","");      // 변경할 쿠키이름
cookie.setValue("abc");                     // 값이 영어일때
cookie.setValue(URLEncoder.encode("김아무개"))// 값이 한글일때 url 인코딩처리
cookie.setDomain("www.dd.co.kr);            // 도메인 변경시
cookie.setPath("/경로");                     // 경로 변경
cookie.setMaxAge(60*60*24*7);               // 유효기간 변경
response.addCookie(cookie);                 // 응답에 쿠키추가
```

#### 4. 쿠키 읽기

```
// 쿠키가 여러개 일때
Cookie[] cookies = request.getCookies();

// 쿠키가 하나일때
Cookie aCookie = request.getACookie();

for(Cookie cookie:cookies){
    String name = cookie.getName();
    String value = cookie.getValue():
}

// 출력
System.out.printf("[cookie]name=%s, value=%s%n", name, value);
```

- [출력시 지정형식 참고](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/1_Java/day01_%EC%9E%90%EB%B0%94%EC%8B%9C%EC%9E%91%ED%95%98%EA%B8%B0.md)

### 세션(Session)

- 서로 관련된 요청, 응답을 하나로 묶은것(쿠키 이용)
- browser 마다 개별 저장소(session객체)를 서버에서 제공한다. (브라우저 요청 1 : 서버 응답 1)

#### 1. 세션 생성, 수정

```
HttpSession session = request.getSession();
session.setAttribute(String name, Object value);
```

- name ==> "name"

#### 2. 세션 삭제

```
session.invalidate();             // 세션 객체 제거
또는
session.setMaxInactiveInterval(0) // 지정 시간 후에 세션 종료

또는
session.removeAttribute("세션이름") // 특정 세션 제거
```

#### 3. 세션 읽기

```
session.getAttribut("세션이름")     // 특정 세션값 받기
```

## page < request < session < application

- 4가지 공통 사용 메서드
  | 메서드 | 설명|
  |----| ----|
  |setAttribute("name", value); | 지정된 name에 value 값 지정|
  | getAttribute("name") | 지정된 name의 value 값 반환|
  | removeAttribute("name") | 지정된 name 삭제 |

- ++
[참고](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/tree/main/5_web/05_jsp/05_EL_JSTL/EL_%24%7B%7D/%EB%82%B4%EC%9E%A5%EA%B0%9D%EC%B2%B4%EC%98%88%EC%8B%9C)
<p>pageContext >>> ex05페이지에서만 값 유효</p>
<p>request >>> forward로 넘어갈 경우에만 값 유효</p>
<p>session >>> 유효시간까지 값 유효</p>
<p>application >>> 애플리케이션 종료시까지 값 유효</p>
<hr>
