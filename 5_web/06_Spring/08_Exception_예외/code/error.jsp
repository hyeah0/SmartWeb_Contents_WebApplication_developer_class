<%@ page contentType="text/html;charset=utf-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>error.jsp</title>
</head>
<body>
	<h1>예외가 발생했습니다.</h1>
	
	<%-- isErrorPage="ture" 작성 할 경우 --%>
	발생한 예외 : ${pageContext.exception}<br>
	예외 메시지 : ${pageContext.exception.message}<br>
	
	<ol>
		<c:forEach items="${pageContext.exception.stackTrace}" var="i">
			<li>${i.toString()}</li>
		</c:forEach>
	</ol>
	
	<%-- isErrorPage="ture" 작성 안할 경우 model에서 받아온값
		발생한 예외 : ${ex}<br>
		예외 메시지 : ${ex.message}<br>
		<ol>
			<c:forEach items="${ex.stackTrace}" var="i">
				<li>${i.toString()}</li>
			</c:forEach>
		</ol>
	--%>
	
	
</body>
</html>
