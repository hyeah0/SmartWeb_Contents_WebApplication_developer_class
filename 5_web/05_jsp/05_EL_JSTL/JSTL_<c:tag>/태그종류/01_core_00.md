## core tag

```
<c:태그명></c:태그명>

또는

<c:태그명/>

** jsp 파일 상단에 JSTL 언어 사용 선언 필요
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
```

<table border="1" cellspacing="0">
    <tr>
        <th> 변수 선언 </th>
        <td> set </td>
        <td> &lt;c:set var="변수명" value="값" &gt;&lt;/c:set&gt; </td>
    </tr>
    <tr>
        <th> 출력 </th>
        <td> out</td>
        <td> &lt;c:out value="출력하고 싶은 값"/&gt; 또는 
            <br> &lt;c:out value= ${변수명}/&gt;
        </td>
    </tr>
    <tr>
        <th> 변수 값 삭제 </th>
        <td> remove</td>
        <td>  &lt;c:remove var="변수명" /&gt; </td>
    </tr>
    <tr>
        <th> 조건 처리 </th>
        <td> if </td>
        <td> &lt;c:if test="조건식" var="변수명" /&gt; </td>
    </tr>
    <tr>
        <th> 조건 처리 </th>
        <td colspan="2"> choose</td>
    </tr>
    <tr>
        <td colspan="3">
            <pre>
                &lt;c:choose&gt; 
                    &lt;c:when test="조건식1"&gt; 
                        조건식1이 참인경우 실행 문장
                    &lt;/c:when&gt;
                    &lt;c:when test="조건식2"&gt; 
                        조건식2이 참인경우 실행 문장
                    &lt;/c:when&gt;
                    &lt;c:when test="조건식3"&gt; 
                        조건식3이 참인경우 실행 문장
                    &lt;/c:when&gt;
                    &lt;c:otherwise&gt;
                        상기 조건식 외의 실행 문장
                    &lt;/c:otherwise&gt; 
                &lt;/c:choose&gt;	
            </pre>
        </td>
    </tr>
    <tr>
        <th> 반복문 </th>
        <td colspan="2"> forEach</td>
    </tr>
    <tr>
        <td colspan="3">
            <pre>
                &lt;c:forEach begin="시작값" end="끝값" step="증감값" var="변수명"&gt; 
                    반복실행할 문장
                &lt;/c:forEach&gt; 
                또는
                &lt;c:forEach items="객체명" var="변수명"&gt;
            </pre>
        </td>
    </tr>
</table>

- [예시코드]()
