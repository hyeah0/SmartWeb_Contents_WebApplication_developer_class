## request 객체

<table border="1" cellspacing="0">
<tr>
    <th>주 요청</th>
    <th>메서드</th>
    <th>사용</th>
    <th>설명</th>
</tr>
<tr>
    <td rowspan="4">객체확인<br>attribute</td>
    <td>getAttributeNames()</td>
    <td>Enumeration attrs = request.getAttributeNames();</td>
    <td>페이지로 넘어온 전체 속성값(key,value) 를 확인
        <br>관련된 모든 속성의 이름을 읽어 들인다.
    </td>
</tr>
<tr>
    <td>자료형 변수명 = getAttribute("key")</td>
    <td>List&lt;String&gt; joblist = request.setAttribute("job");</td>
    <td>key 값의 value들을 가져온다. 
        <br>value의 자료형에 따라 변수 자료형 변경
    </td>
</tr>
<tr>
    <td>setAttribute("key",value)</td>
    <td>request.setAttribute("job", jobList);</td>
    <td>key에 value들을 저장한다.
    </td>
</tr>
<tr>
    <td>removeAttribute(key)</td>
    <td>request.removeAttribute("job");</td>
    <td>key값인 객체를 삭제한다.
    </td>
</tr>
<tr>
    <td rowspan="3">파라미터<br>paramete</td>
    <td>getParameterNames()</td>
    <td>request.getParameterNames();</td>
    <td>모든 파라미터의 이름 </td>
</tr>
<tr>
    <td><b>getParameter(String name)</b></td>
    <td>request.getParameter("pnum");</td>
    <td>지정한 이름을 가진 파라미터 중 첫 번째 파라미터 값을 구한다. 
    <br>존재하지 않을 경우 null 반환
    </td>
</tr>
<tr>
    <td><b>getParameterValues(String name)</b></td>
    <td>request.getParameterValues(String name);</td>
    <td>지정한 이름을 가진 파라미터의 모든 값을 String[]으로 구한다. </td>
</tr>
<tr>
    <td rowspan="2">요청<br>character</td> 
    <td><b>getCharacterEncoding()</b></td>
    <td>request.getCharacterEncoding()</td>
    <td>요청에서 사용된 인코딩을 구한다.</td>
</tr>
<tr>
    <td><b>setCharacterEncoding()</b></td>
    <td>request.setCharacterEncoding("utf-8")</td>
    <td>가로안 인코딩을 요청한다 .</td>
</tr>
<tr>
    <td>요청<br>경로</td>
    <td><b>getContextPath()</b></td>
    <td>request.getContextPath();</td>
    <td>String : 경로를 얻는다.(현재 프로젝트명)</td>
</tr>
<tr>
    <td>요청<br>method</td>
    <td>getMethod()</td>
    <td>request.getMethod();</td>
    <td>String : 요청 방식이 GET인지 POST인지 구한다.</td>
</tr>
<tr>
    <td>요청<br>전송위치</td>
    <td><b>getRequestDispatcher(path)</b></td>
    <td>RequestDispatcher rd = request.getRequestDispatcher("test.jsp")</td>
    <td>자료를 보낼 위치 지정
    </td>
</tr>
<tr>
    <td rowspan="2">요청<br>server</td>
    <td>getServerName()</td>
    <td>request.getServerName();</td>
    <td>String : 연결시 사용한 서버 이름</td>
</tr>
<tr>
    <td>getServerPort()</td>
    <td>request.getServerPort();</td>
    <td>int : 서버가 실행중인 서버이름</td>
</tr>
<tr>
    <td rowspan="2">요청<br>url</td>
    <td>getRequestURI()</td>
    <td>request.getRequestURI()</td>
    <td>String : HTTP 요청 URL에서 줄에 있는 쿼리 문자를 제외한 부분을 구한다.</td>
</tr>
<tr>
    <td>getQueryString()</td>
    <td>request.getQueryString()</td>
    <td>요청한 URL다음에 오는 쿼리 문자열을 구한다.</td>
</tr>
<tr>
    <td>요청<br>protocol</td>
    <td>getProtocol()</td>
    <td>request.getProtocol()</td>
    <td>해당 프로토콜을 얻는다.</td>
</tr>
<tr>
    <td rowspan="4">요청 해더<br>header</td>
    <td>getHeaderNames()</td>
    <td>request.getHeaderNames();</td>
    <td>요청과 관련된 모든 해더의 이름을 구한다.</td>
</tr>
<tr>
    <td>getHeader(name)</td>
    <td>request.getHeader(name);</td>
    <td>이름이 name인 해더의 값을 String/String[]으로 구한다.</td>
</tr>
<tr>
    <td>getIntHeader(name)</td>
    <td>request.getIntHeader(name);</td>
    <td>이름이 name인 헤더의 값을 int형으로 구한다.</td>
</tr>
<tr>
    <td>getDateHeader(name)</td>
    <td>request.getDateHeader(name);</td>
    <td>이름이 name인 헤더의 값을 long형으로 구한다.</td>
</tr>

<tr>
    <td rowspan="3">요청<br>remote</td>
    <td>getRemoteHost()</td>
    <td>request.getRemoteHost()</td>
    <td>요청한 호스트의 완전한 이름을 구한다.</td>
</tr>
<tr>
    <td>getRemoteAddr()</td>
    <td>request.getRemoteAddr()</td>
    <td>요청한 호스트의 네트워크 주소(ip)를 구한다.</td>
</tr>
<tr>
    <td>getRemoteUser()</td>
    <td>request.getRemoteUser()</td>
    <td>요청한 사용자의 이름이 존재할 경우 구한다.</td>
</tr>
<tr>
    <td>요청<br>cookies</td>
    <td>getCookies()</td>
    <td>request.getCookies();</td>
    <td>요청과 관련된 모든 쿠키를 구한다.</td>
</tr>
<tr>
    <td rowspan="2">요청<br>session</td>
    <td>getSession()</td>
    <td>request.getSession()</td>
    <td>요청과 관련된 세션 객체를 구한다. 
        <br>만약 존재하지 않으면 새로 생성한다.
    </td>
</tr>
<tr>
    <td>getSession(flag)</td>
    <td>request.getSession(flag)</td>
    <td>요청과 관련된 세션 객체를 구한다. 
        <br>만약 세션이 존재하지 않고 flag가 true이면 
        <br>새로운 세션 객체를 생성한다.
    </td>
</tr>

</table>

<table>
    <tr colspan="2">요청 관련 정보<tr>
<tr> <td>요청 방식</td> <td>&lt;%= request.getMethod() %&gt;</td></tr>
<tr> <td>요청 URI</td> <td>&lt;%= request.getRequestURI() %&gt;</td></tr>
<tr> <td>요청 프로토콜</td> <td>&lt;%= request.getProtocol() %&gt;</td></tr>
<tr> <td>서블릿 경로</td> <td>&lt;%= request.getServletPath() %&gt;</td></tr>
<tr> <td>요청 쿼리 스트링</td> <td>&lt;%= request.getQueryString() %&gt;</td></tr>
<tr> <td>서버 이름</td> <td>&lt;%= request.getServerName() %&gt;</td></tr>
<tr> <td>서버 포트</td> <td>&lt;%= request.getServerPort() %&gt;</td></tr>
<tr> <td>클라이언트 접속 주소</td> <td>&lt;%= request.getRemoteAddr() %&gt;</td></tr>
<tr> <td>클라이언트 접속 호스트</td> <td>&lt;%= request.getRemoteHost() %&gt;</td></tr>
<tr> <td>인증 스키마</td> <td>&lt;%= request.getAuthType() %&gt;</td></tr>
<tr> <td>로케일</td> <td>&lt;%= request.getLocale() %&gt;</td></tr>
<tr> <td>사용하는 브라우저</td> <td>&lt;%= request.getHeader(“User-Agent”) %&gt;</td></tr>
</table>

[출처 : 밤톨넷](http://bamtol.net/v5/bbs/board.php?bo_table=pp_server&wr_id=9)
