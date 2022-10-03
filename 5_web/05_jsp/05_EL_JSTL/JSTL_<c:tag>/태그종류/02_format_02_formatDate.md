## <fmt:formatDate 속성 = "" > 태그의 속성들

<table border="1" cellspaicng="0">
<tr>
    <td colspan="3">
        &lt;c:set var="now" value="<%=new Date() %>"/&gt;
    </td>
</tr>
<tr>
    <th> value </th>
    <td> &lt;fmt:formatNumber value = "${now}" /&gt; </td>
    <td> 출력될 값 지정 </td>
</tr>
<tr>
    <th> type </th>
    <td> &lt;fmt:formatNumber value = "${now}"
        <br> type = "date/time/both" /&gt;</td>
    <td> 출력될 타입 지정
        <br> date : 날짜 지정
        <br> time : 시간 지정
        <br> both : 날짜/시간 모두 지정 
    </td>
</tr>
<tr>
    <th> dateStyle </th>
    <td> &lt;fmt:formatNumber value = "${now}" 
        <br> dateStyle = "full/long/medium/short"&gt;</td>
    <td> 날짜의 출력 양식을 지정 </td>
</tr>
<tr>
    <th> timeStyle </th>
    <td> &lt;fmt:formatNumber value = "${now}" 
        <br> timeStyle = "full/long/medium/short"/&gt; </td>
    <td> 시간 출력 형식을 지정하는 속성 </td>
</tr>
<tr>
    <th> pattern </th>
    <td>  &lt;fmt:formatNumber value = "${now}" 
        <br> pattern="yyyy-MM-dd hh:mm:ss"/&gt;</td>
    <td> 날짜가 출력될 양식을 지정한다.</td>
</tr>
<tr>
    <th> timeZone </th>
    <td> &lt;fmt:formatDate value="${now}"      
        <br> timeZone="Europe/Paris"/&gt; </td>
    <td> 특정 나라 시간대로 시간을 설정하는 속성 
        <br> type을 지정하지 않으면 일자만 나온다.
    </td>
</tr>
</table>
- ** timeZone 설정시 두가지 방법으로 설정 가능하다. 하단 예시 참고
1. formatDate 태그 에서 속성 timeZone 을 사용
2. timeZone 태그에서 속성 value="위치" 사용

## 예시 코드

<div>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp/05_EL_JSTL/JSTL_%3Cc:tag%3E/img/tag/02_format_date1.png" width="45%">
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp/05_EL_JSTL/JSTL_%3Cc:tag%3E/img/tag/02_format_date2.png" width="45%">

</div>

```
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL 언어 사용 선언 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 포멧팅 사용 선언  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>formatDate 예제</title>
</head>
<body>
	 <%--
		<fmt:formatDate 속성=""> 의 속성
		- value : 포맷팅 될 날짜를 지정하는 속성
	 	- type : 포맷할 타입 지정
	 		- date : 날짜 지정
	 		- time : 시간 지정
	 		- both : 날짜/시간 모두 지정
	 	- dateStyle : 날짜의 출력 양식을 지정하는 속성
	 				  값에는 full, long, medium, short 등을 지정 할 수 있다.
	 	- timeStyle : 시간 출력 형식을 지정하는 속성
	 	- pattern : 직접 출력 형식을 지정하는 속성
	 	- timeZone : 특정 나라 시간대로 시간을 설정하는 속성
	  --%>

	  <h2>formatDate 예제</h2>

	  <h3>formatDate 속성 type='date'</h3>
	  <p> <c:set var="now" value="<%=new Date() %>"/> </p>
	  <p> full   : <fmt:formatDate value="${now }" type="date" dateStyle="full" /> </p>
	  <p> long   : <fmt:formatDate value="${now }" type="date" dateStyle="long" /> </p>
	  <p> medium : <fmt:formatDate value="${now }" type="date" dateStyle="medium" /> </p>
	  <p> short  : <fmt:formatDate value="${now }" type="date" dateStyle="short" /> </p>

	  <hr>

	  <h3>formatDate 속성 type='time'</h3>
	  <p> full   : <fmt:formatDate value="${now }" type="time" timeStyle="full" /> </p>
	  <p> long   : <fmt:formatDate value="${now }" type="time" timeStyle="long" /> </p>
	  <p> medium : <fmt:formatDate value="${now }" type="time" timeStyle="medium" /> </p>
	  <p> short  : <fmt:formatDate value="${now }" type="time" timeStyle="short" /> </p>

	  <hr>

	  <h3>formatDate 속성 type='both'</h3>
	  <p> full   : <fmt:formatDate value="${now }" type="both" dateStyle="full" timeStyle="full" /> </p>
	  <p> long   : <fmt:formatDate value="${now }" type="both" dateStyle="long" timeStyle="long" /> </p>
	  <p> medium : <fmt:formatDate value="${now }" type="both" dateStyle="medium" timeStyle="medium" /> </p>
	  <p> short  : <fmt:formatDate value="${now }" type="both" dateStyle="short" timeStyle="short" /> </p>

	  <hr>

	  <h3>formatDate 속성 pattern</h3>
	  <p> <fmt:formatDate value="${now }" pattern="yyyy-MM-dd hh:mm:ss" /> </p>
	  <%--  에러남 : <fmt:formatNumber value="<%=new Date() %>" pattern="yyyy-MM-dd hh:mm:ss"/> --%>


	  <hr>

	  <h3>fmt:timeZone</h3>
	  <p>한국 현재 시간</p>
	  <p> <fmt:formatDate value="${now }" type="both" dateStyle="full" timeStyle="full" /> </p>

	  <p>미국 LA 현재 시간</p>
	  <fmt:timeZone value="America/LA">
	  <p> <fmt:formatDate value="${now }" type="both" dateStyle="full" timeStyle="full" /> </p>
	  </fmt:timeZone>
	  <p> <fmt:formatDate value="${now}" type="both" timeZone="America/LA"/> </p>

	  <p>파리 현재 시간</p>
	  <p> <fmt:formatDate value="${now}" type="both" timeZone="Europe/Paris"/> </p>

</body>
</html>
```
