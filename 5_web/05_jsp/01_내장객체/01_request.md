## request 객체

<table border="1" cellspacing="0">
<tr>
    <th>주 요청</th>
    <th>메서드</th>
    <th>사용</th>
    <th>설명</th>
</tr>
<tr>
    <td rowspan="4">객체확인
        <br>attribute
    </td>
    <td>getAttributeNames()</td>
    <td>Enumeration attrs = request.getAttributeNames();</td>
    <td>페이지로 넘어온 전체 속성값(key,value) 를 확인
        <br>관련된 모든 속성의 이름을 읽어 들인다.
    </td>
</tr>
<tr>
    <!-- <td>객체확인
        <br>attribute
    </td> -->
    <td>자료형 변수명 = getAttribute("key")</td>
    <td>List&lt;String&gt; joblist = request.setAttribute("job");</td>
    <td>key 값의 value들을 가져온다. 
        <br>value의 자료형에 따라 변수 자료형 변경
    </td>
</tr>
<tr>
    <!-- <td>객체확인
        <br>attribute
    </td> -->
    <td>setAttribute("key",value)</td>
    <td>request.setAttribute("job", jobList);</td>
    <td>key에 value들을 저장한다.
    </td>
</tr>
<tr>
    <!-- <td>객체확인
        <br>attribute
    </td> -->
    <td>removeAttribute(key)</td>
    <td>request.removeAttribute("job");</td>
    <td>key값인 객체를 삭제한다.
    </td>
</tr>
<tr>
    <td rowspan="3">파라미터
        <br>paramete
    </td>
    <td>getParameterNames()</td>
    <td>request.getParameterNames();</td>
    <td>모든 파라미터의 이름 </td>
</tr>
<tr>
    <!-- <td rowspan="3">파라미터
        <br>paramete
    </td> -->
    <td>getParameter(String name)</td>
    <td>request.getParameter("pnum");</td>
    <td>지정한 이름을 가진 파라미터 중 첫 번째 파라미터 값을 구한다. </td>
</tr>
<tr>
    <!-- <td rowspan="3">파라미터
        <br>paramete
    </td> -->
    <td>getParameterValues(String name)</td>
    <td>request.getParameterValues(String name);</td>
    <td>지정한 이름을 가진 파라미터의 모든 값을 String[]으로 구한다. </td>
</tr>
<tr>
    <td rowspan="16">요청 해더 및 
        <br>기타 요청 관련 메소드
    </td>
    <td>getHeaderNames()</td>
    <td>request.getHeaderNames();</td>
    <td>요청과 관련된 모든 해더의 이름을 구한다.</td>
</tr>
<tr>
    <!-- <td>요청 해더 및 <br>기타 요청 관련 메소드 </td> -->
    <td>getHeader(name)</td>
    <td>request.getHeader(name);</td>
    <td>이름이 name인 해더의 값을 String/String[]으로 구한다.</td>
</tr>
<tr>
    <!-- <td>요청 해더 및 <br>기타 요청 관련 메소드 </td> -->
    <td>getIntHeader(name)</td>
    <td>request.getIntHeader(name);</td>
    <td>이름이 name인 헤더의 값을 int형으로 구한다.</td>
</tr>
<tr>
    <!-- <td>요청 해더 및 <br>기타 요청 관련 메소드 </td> -->
    <td>getDateHeader(name)</td>
    <td>request.getDateHeader(name);</td>
    <td>이름이 name인 헤더의 값을 long형으로 구한다.</td>
</tr>
<tr>
    <!-- <td>요청 해더 및 <br>기타 요청 관련 메소드 </td> -->
    <td>getCookies()</td>
    <td>request.getCookies();</td>
    <td>요청과 관련된 모든 쿠키를 구한다.</td>
</tr>
<tr>
    <!-- <td>요청 해더 및 <br>기타 요청 관련 메소드 </td> -->
    <td>getMethod()</td>
    <td>request.getMethod();</td>
    <td>요청 방식이 GET인지 POST인지 구한다.</td>
</tr>
<tr>
    <!-- <td>요청 해더 및 <br>기타 요청 관련 메소드 </td> -->
    <td>getRequestURI()</td>
    <td>request.getRequestURI()</td>
    <td>HTTP 요청 URL에서 줄에 있는 쿼리 문자를 제외한 부분을 구한다.</td>
</tr>
<tr>
    <!-- <td>요청 해더 및 <br>기타 요청 관련 메소드 </td> -->
    <td>getQueryString()</td>
    <td>request.getQueryString()</td>
    <td>요청한 URL다음에 오는 쿼리 문자열을 구한다.</td>
</tr>
<tr>
    <!-- <td>요청 해더 및 <br>기타 요청 관련 메소드 </td> -->
    <td>getSession(flag)</td>
    <td>request.getSession(flag)</td>
    <td>요청과 관련된 세션 객체를 구한다. 
        <br>만약 세션이 존재하지 않고 flag가 true이면 
        <br>새로운 세션 객체를 생성한다.
    </td>
</tr>
<tr>
    <!-- <td>요청 해더 및 <br>기타 요청 관련 메소드 </td> -->
    <td>getRequestDispatcher(path)</td>
    <td>RequestDispatcher rd = request.getRequestDispatcher("test.jsp")</td>
    <td>지정한 로컬 URL에 대한 요청 Dispatcher를 구한다.
    <br>자료를 보낼 위치 지정
    </td>
</tr>
<tr>
    <!-- <td>요청 해더 및 <br>기타 요청 관련 메소드 </td> -->
    <td>getRemoteHost()</td>
    <td>request.getRemoteHost()</td>
    <td>요청한 호스트의 완전한 이름을 구한다.</td>
</tr>
<tr>
    <!-- <td>요청 해더 및 <br>기타 요청 관련 메소드 </td> -->
    <td>getRemoteAddr()</td>
    <td>request.getRemoteAddr()</td>
    <td>요청한 호스트의 네트워크 주소를 구한다.</td>
</tr>
<tr>
    <!-- <td>요청 해더 및 <br>기타 요청 관련 메소드 </td> -->
    <td>getRemoteUser()</td>
    <td>request.getRemoteUser()</td>
    <td>요청한 사용자의 이름이 존재할 경우 구한다.</td>
</tr>
<tr>
    <!-- <td>요청 해더 및 <br>기타 요청 관련 메소드 </td> -->
    <td>getSession()</td>
    <td>request.getSession()</td>
    <td>요청과 관련된 세션 객체를 구한다. 
        <br>만약 존재하지 않으면 새로 생성한다.
    </td>
</tr>
<tr>
    <!-- <td>요청 해더 및 <br>기타 요청 관련 메소드 </td> -->
    <td>getCharacterEncoding()</td>
    <td>request.getCharacterEncoding()</td>
    <td>요청에서 사용된 인코딩을 구한다.</td>
</tr>
<tr>
    <!-- <td>요청 해더 및 <br>기타 요청 관련 메소드 </td> -->
    <td>setCharacterEncoding(env)</td>
    <td>request.setCharacterEncoding(env)</td>
    <td>요청에서 사용된 인코딩을 env로 지정한다.</td>
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
