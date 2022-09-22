<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	hr{
		width : 50%;
		color : "gray";
	}

</style>
</head>
<body>
	<div align="center">
		<hr>
			<h3>MEMBER10 테이블 메인 페이지</h3>
		<hr>
		
		<a href="<%= request.getContextPath() %>/select.do">[전체 회원 목록]</a>
	</div>
</body>
</html>