# 쿠키와 세션

## - 쿠키(Cookie)

- 사용자가 웹 사이트를 방문때 웹 사이트에서 클라이언트의 컴퓨터에 저장해 놓는 작을 파일
- 웹 페이지를 사이의 공유 정보를 클라이 컴퓨터에 저장해 놓고 필요할 때 여러 웹 페이지들이 공유해서 사용할 수 있도록 매개 역할을 하는 방법이다.
- key과 value 로 이루어진 정보, 야스키 문자만 가능하다.
- 서버에서 생성 후 전송, 브라우저에 저장된다.
- 설정한 유효기간 이후에 자동 삭제 된다.
- 서버 요청시 domain, path가 일치하는 경우에만 자동 전송된다.
- [쿠키코드 예시](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/06_Spring/07_Cookie%26Session/%EC%BD%94%EB%93%9C%EC%98%88%EC%8B%9C/%EC%BF%A0%ED%82%A4.md)

### - 쿠키의 특징

- 쿠키는 헤더에서 생성이 된다.
- 쿠키는 클라이언트 컴퓨터에 저장이 된다.
- 쿠키 관리는 웹브라우저가 한다.
- 쿠키의 크기는 4kb로 제한적이며, 300개 정도의 쿠키를 만들어서 사용할 수 있다.
- 쿠키는 보안이 취하다.

### - 쿠키의 생성 방법

- 쿠키의 생성은 쿠키 클래스를 이용한다.
- 쿠키 속성 설정(setter)
- 쿠키의 전송(response 객체에 탑재 : addCookies())

### - 쿠키 관련 메서드

<table>
  <tr><th>메서드</th><th>설명</th></tr>
  <tr><td> setMaxAge() </td><td>쿠키의 유효기간을 설정 </td></tr>
  <tr><td> setPath()   </td><td>쿠키 사용을 위한 디렉토리를 설정(특정 경로명을 갖는 url로 전송하도록 설정) </td></tr>
  <tr><td> setValue()  </td><td>쿠키 값을 설정                                                             </td></tr>
  <tr><td> setVersion()</td><td>쿠키의 버전을 설정                                                          </td></tr>
  <tr><td> getMaxAge() </td><td>쿠키의 유효기간 정보를 얻어올 때 사용                                                </td></tr>
  <tr><td> getName()   </td><td>쿠키의 이름을 얻어올 때 사용                                               </td></tr>
  <tr><td> getPath()   </td><td>쿠키의 유효 디렉토리 정보를 얻어올 대 사용                                 </td></tr>
  <tr><td> getVersion()</td><td>쿠키의 버전을 얻어올 때 사용                                               </td></tr>
  <tr><td> getCookies()</td><td>쿠키의 데이터를 읽어올때 사용 <br> 웹 브라우저에 보낸 쿠키를 배열로 반환</td></tr>
</table>

#### 1. 쿠키 생성

```
Cookie cookie = new Cookie("name", "value") // 쿠키생성
cooke.setMaxAge(60*60*24);                  // 유효기간 설정(초) .. (60*60*24) >> 24시간
response.addCookie(cookie);                 // 응답에 쿠키추가
```

#### 2. 쿠키 삭제

```
Cookie cookie = new Cookie("name","");      // 변경할 쿠키이름과 값(공란) 작성
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

## - 세션(Session)

- 서로 관련된 요청, 응답을 하나로 묶은것(쿠키 이용)
- browser 마다 개별 저장소(session객체)를 서버에서 제공한다. (브라우저 요청 1 : 서버 응답 1)

### - 세션 특징

- 세션은 서버에서만 접근이 가능하다.
- 세션은 서버의 ⭐️메모리⭐️에 저장된다.
- 서버에 부하를 줄 수 있다.
- 쿠키의 기본 용량이 4kb, 300개로 제한적인 반면에 세션은 제한이 없다.
- 브라우저 당 한개의 세션이 생성 된다.
- 로그인 상태 유지 기능이나 쇼핑몰의 장바구니 담기 기능 등에 주로 사용된다.

### 세션 관련 메서드

<table>
  <tr><th>메서드</th><th>설명</th></tr>
  <tr><td> setAttribute() </td><td>세션의 속성을 설정하는 메서드<br>
                                  형식) session.setAttribute("key", "value");<br>
                                  session.setAttribute("id", "hong");</td></tr>
    <tr><td> getAttribute() </td><td>세션에서 데이터를 얻어올때 (세션의 속성을 사용할때) 이용하는 메서드<br>
                                  형식) String id = (String)session.getAttribute("id");</td></tr>
    <tr><td> getAttributeNames() </td><td>세션에 저장되어 있는 모든 데이터의 이름을 얻어올때 사용하는 메서드</td></tr>
    <tr><td> removeAttribute() </td><td>세션의 특정 데이터를 제거하는 메서드<br>
                                  형식) session.removeAttribute()</td></tr>
    <tr><td> invalidate() </td><td>세션의 모든 데이터를 삭제하는 메서드</td></tr>
    <tr><td> getId() </td><td>자동 생성된 세션의 아이디를 얻어올때 사용하는 메서드</td></tr>
    <tr><td> isNew() </td><td>세션이 최초 생성되었는지 여부를 알고 싶은 경우 사용되는 메서드</td></tr>
    <tr><td> getMaxInactiveInterval() </td><td>세션의 유효기간을 얻어올때 사용하는 메서드</td></tr>
</table>

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
