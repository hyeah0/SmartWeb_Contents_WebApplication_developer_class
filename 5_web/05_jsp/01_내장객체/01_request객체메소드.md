JSP 기본 내장객체 모음
void removeAttribute(key) 키값이 key인 객체를 삭제한다.
Enumeration getAttributeNames() 관련된 모든 속성의 이름을 읽어 들인다.

request 객체에서 제공하는 파라미터와 관련된 메소드
getParameterNames() 모든 파라미터의 이름을 구한다.
getParameter(String name) 지정한 이름을 가진 파라미터 중 첫 번째 파라미터 값을 구한다.
getParameterValues(String name) 지정한 이름을 가진 파라미터의 모든 값을 String[]으로 구한다.

요청 해더 및 기타 요청 관련 메소드
getHeaderNames() 요청과 관련된 모든 해더의 이름을 구한다.
getHeader(name) 이름이 name인 해더의 값을 String으로 구한다.
getHeader(name) 이름이 name인 모든 헤더의 값을 String[]으로 구한다.
getIntHeader(name) 이름이 name인 헤더의 값을 int형으로 구한다.
getDateHeader(name) 이름이 name인 헤더의 값을 long형으로 구한다.
getCookies() 요청과 관련된 모든 쿠키를 구한다.
getMethod() 요청 방식이 GET인지 POST인지 구한다.
getRequestURI() HTTP 요청 URL에서 줄에 있는쿼리 문자를 제외한 부분을 구한다.
getQueryString() 요청한 URL다음에 오는 쿼리 문자열을 구한다.
getSession(flag) 요청과 관련된 세션 객체를 구한다. 만약 세션이 존재하지 않고 flag가 true이면 새로운 세션 객체를 생성한다.
getRequestDispatcher(path) 지정한 로컬 URL에 대한 요청 Dispatcher를 구한다.
getRemoteHost() 요청한 호스트의 완전한 이름을 구한다.
getRemoteAddr() 요청한 호스트의 네트워크 주소를 구한다.
getRemoteUser() 요청한 사용자의 이름이 존재할 경우 구한다.
getSession() 요청과 관련된 세션 객체를 구한다. 만약 존재하지 않으면 새로 생성한다.
getCharacterEncoding() 요청에서 사용된 인코딩을 구한다.
setCharacterEncoding(env) 요청에서 사용된 인코딩을 env로 지정한다.

요청 관련 정보
요청 방식: <%= request.getMethod() %>
요청 URI: <%= request.getRequestURI() %>
요청 프로토콜: <%= request.getProtocol() %>
서블릿 경로: <%= request.getServletPath() %>
요청 쿼리 스트링: <%= request.getQueryString() %>
서버 이름: <%= request.getServerName() %>
서버 포트: <%= request.getServerPort() %>
클라이언트 접속 주소: <%= request.getRemoteAddr() %>
클라이언트 접속 호스트: <%= request.getRemoteHost() %>
인증 스키마: <%= request.getAuthType() %>
로케일: <%= request.getLocale() %>
사용하는 브라우저: <%= request.getHeader(“User-Agent”) %>

response 기본 객체 헤더 및 응답의 컨텐트 타입 설정과 관련된 메소드
addCookie(Cookie) 응답에 지정한 쿠키를 저장한다.
containsHeader(header) 이름이 header인 헤더를 포함하고 있는지 검사한다.
setHeader(name,value) 이름이 name인 헤더의 값을 value로 지정한다.
setIntHeader(name,value) 이름이 name인 헤더의 값을 int형 값인 value로 지정한다.
setDateHeader(name,date) 이름이 name인 헤더의 값을 long형 값이 date로 지정한다.
addHeader(name,value) 이름이 name이고 값이 String형 value인 헤더를 추가한다.
addIntHeader(name,value) 이름이 name이고 값이 Int형 value인 헤더를 추가한다.
addDateHeader(name,value) 이름이 name이고 값이 long형 date인 헤더를 추가한다.

<%
response.setHeader(“Pragma”,”no-cache”);
if(request.getProtocol().equals(“HTTP/1.1”)) {
response.setHeader(“Cache-Control”,”no-cache”);
}
%>

response 기본 객체가 응답 내용 형식을 지정하는 메소드
setContentType(String) MIME 타입을 지정하며, 추가적으로 글자의 인코딩 타입을 지정할수 있다.
getCharacterEncoding() 응답하는 내용의 캐릭터 인코딩 형태를 구한다.

URL 재작성과 관련된 response 객체의 메소드
encodeRedirectURL(url) 세션 정보를 포함하기 위해 sendRedirect()메소드에서 사용할 URL을 인코딩한다.
encodeURL(name) 세션 정보를 포함하고 있는 링크에서 사용할 URL을 인코딩한다.
sendRedirect(url) 지정한 리다이렉트 URL을 사용하여 브라우저에 리다이렉트 응답을 보낸다.

<%
String val = request.getParameter(“val”);
if (val == null || val.equals(“”)) {
response.sendRedirect(“http://localhost:8080/”);
} else if (val.equals(“a”)) {
response.sendRedirect(“http://localhost:8080/requestMethod.jsp”);
} else {
%> <html> <head></head> <body> 잘못된 파라미터를 입력하셨습니다. <p> 파라미터 “val”의 값은 없거나 “a”이어야 합니다. </body> </html> <%
}
%>

[출처 : 밤톨넷](http://bamtol.net/v5/bbs/board.php?bo_table=pp_server&wr_id=9)
