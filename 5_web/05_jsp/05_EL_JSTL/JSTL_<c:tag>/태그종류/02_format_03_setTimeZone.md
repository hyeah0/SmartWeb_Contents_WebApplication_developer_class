## fmt:timeZone / fmt:setTimeZone

<table border="1" cellspaicng="0">
<tr>
    <td colspan="3" align="center">
       <b> &lt;c:set var="now" value="<%=new Date() %>"/&gt;</b>
    </td>
</tr>
<tr>
    <th> timeZone </th>
    <td> &lt;fmt:timeZone value = "America/LA" &gt;
        <br>&lt;/fmt:timeZone &gt;
    </td>
    <td> 지정한 국가의 시간을 지정하는 태그
        <br>태그를 열고 닫는 영역에만 적용 된다. </td>
</tr>
<tr>
    <th> setTimeZone </th>
    <td> &lt;fmt:setTimeZone value = "Australia/Brisbane" /&gt;</td>
    <td> 지정한 국가의 시간을 지정하는 태그 </td>
</tr>
</table>

## 예시 코드

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp/05_EL_JSTL/JSTL_%3Cc:tag%3E/img/tag/02_format_TimeZone.png" width="70%">

```
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<p> <c:set var="now" value="<%=new Date() %>"/> </p>

	<h3>fmt:timeZone</h3>
	<p>미국 LA 현재 날짜, 시간</p>
	<fmt:timeZone value="America/LA">
		<fmt:formatDate value="${now }" type="both" dateStyle="full" timeStyle="full" /> <br>
	</fmt:timeZone>
	<hr>

	<h3>fmt:timeZone 태그 밖 날짜, 시간</h3>
	<p>현재 위치 날짜, 시간</p>
	<fmt:formatDate value="${now}" type="both" dateStyle="full"/>
	<hr>

	<h3>fmt:setTimeZone 설정 이후 날짜, 시간</h3>
	<p>브리즈번 현재 날짜, 시간</p>
	<fmt:setTimeZone value="Australia/Brisbane"/>
	<fmt:formatDate value="${now}" type="both" dateStyle="full"/>
</body>
</html>
```

- [타임존 참고](https://code2care.org/pages/java-timezone-list-utc-gmt-offset)
