## response 객체

<table border="1" cellspacing="0">
<tr>
    <th>주 요청</th>
    <th>메서드</th>
    <th>사용</th>
    <th>설명</th>
</tr>
<tr>
    <td rowspan="8">기본 객체 헤더 및 
    <br>응답의 컨텐트 타입 설정과 관련된 메소드</td>
    <td>addCookie(Cookie)</td>
    <td>response.addCookie(Cookie)</td>
    <td>응답에 지정한 쿠키를 저장한다.</td>
</tr>
<tr>
    <td>containsHeader(header)</td> 
    <td>response.containsHeader(header)</td>
    <td>이름이 header인 헤더를 포함하고 있는지 검사한다.</td>
</tr>
<tr>
    <td>setHeader(name,value)</td> 
    <td>response.setHeader(name,value)</td>
    <td>이름이 name인 헤더의 값을 value로 지정한다.</td>
</tr>
<tr>
    <td>setIntHeader(name,value)</td> 
    <td>response.setIntHeader(name,value)</td>
    <td>이름이 name인 헤더의 값을 int형 값인 value로 지정한다.</td>
</tr>
    <td>setDateHeader(name,date)</td> 
    <td>response.setDateHeader(name,date)</td>
    <td>이름이 name인 헤더의 값을 long형 값이 date로 지정한다.</td>
</tr>
<tr>
    <td>addHeader(name,value)</td> 
    <td>response.addHeader(name,value)</td>
    <td>이름이 name이고 값이 String형 value인 헤더를 추가한다.</td>
</tr>
<tr>
    <td>addIntHeader(name,value)</td> 
    <td>response.addIntHeader(name,value)</td>
    <td>이름이 name이고 값이 Int형 value인 헤더를 추가한다.</td>
</tr>
<tr>
    <td>addDateHeader(name,value)</td> 
    <td>response.addDateHeader(name,value)</td>
    <td>이름이 name이고 값이 long형 date인 헤더를 추가한다.</td>
</tr>
<tr>
    <td rowspan="2">기본 객체가 응답 내용 형식을 지정하는 메소드</td>
    <td>setContentType(String)</td>
    <td>response.setContentType(String)</td>
    <td>MIME 타입을 지정하며, 추가적으로 글자의 인코딩 타입을 지정할수 있다.</td>
</tr>
<tr>
    <td>getCharacterEncoding()</td>
    <td>response.getCharacterEncoding("text/html; charset=UTF-8")</td>
    <td>응답하는 내용의 캐릭터 인코딩 형태를 구한다.</td>
</tr>
<tr>
    <td rowspan="3">URL 재작성과 관련된 
    <br>response 객체의 메소드</td>
    <td>encodeRedirectURL(url)</td>
    <td>response.encodeRedirectURL(url)</td>
    <td>세션 정보를 포함하기 위해 sendRedirect()메소드에서 사용할 URL을 인코딩한다.</td>
</tr>
<tr>
    <td>encodeURL(name)</td>
    <td>response.encodeURL(name)</td>
    <td>세션 정보를 포함하고 있는 링크에서 사용할 URL을 인코딩한다.</td>
</tr>
<tr>
    <td>sendRedirect(url)</td>
    <td>response.sendRedirect(url)</td>
    <td>지정한 리다이렉트 URL을 사용하여 브라우저에 리다이렉트 응답을 보낸다.</td>
</tr>
</table>

[출처 : 밤톨넷](http://bamtol.net/v5/bbs/board.php?bo_table=pp_server&wr_id=9)
