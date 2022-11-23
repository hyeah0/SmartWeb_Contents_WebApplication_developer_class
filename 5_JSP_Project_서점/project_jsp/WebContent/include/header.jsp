<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>
	<c:set var="id" value="${admin_id }"></c:set>
	<c:if test="${not empty id}">
		<h1>관리자</h1>
		<br>
		<a class="btn btn-default" href="<%=request.getContextPath()%>/category_list.do">카테고리 목록</a>
		&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
		<a class="btn btn-default" href="<%=request.getContextPath()%>/book_list.do">책 목록</a>
		&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
		<a class="btn btn-default" href="<%=request.getContextPath()%>/member_list.do">회원 목록</a>
		&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
		<a class="btn btn-primary" href="<%=request.getContextPath()%>/admin_logout.do">로그아웃</a>
	</c:if>
	<c:if test="${empty id }">
		<script type="text/javascript">
			alert('로그인이 필요합니다.');
			location.href = "main.do";
		</script>
	</c:if>
</body>
</html>