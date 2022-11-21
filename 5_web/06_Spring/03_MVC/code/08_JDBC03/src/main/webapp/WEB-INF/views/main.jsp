<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<div align="center">
		<hr width="50%" color="blue">
			<h3>Board 테이블 게시판 메인 페이지</h3>
		<hr width="50%" color="blue">
		<br>
		<a href="<%=request.getContextPath() %>/board_list.do">[게시글 전체 목록]</a>
	</div>
</body>
</html>
