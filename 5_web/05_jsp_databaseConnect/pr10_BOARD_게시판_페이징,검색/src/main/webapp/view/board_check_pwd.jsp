<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<c:set var="dto" value="${content }"/>
	<div>
		<hr>
			<h3>board 게시물 설정 비밀번호 입력해 주세요.</h3>
		<hr>
		<form method="post" action="board_ck_pwd.do?no=${no }&page=${currentpage }&type=${requesttype }">
			<input type="hidden" name="db_pwd" value="${dto.getBoard_pwd() }"> 
			
			<lable for="pwd"> 비밀번호 입력
			<input type="password" id="pwd" name="input_pwd">
			<input type="submit" value="확인">
		</form>
	</div>
</body>
</html>