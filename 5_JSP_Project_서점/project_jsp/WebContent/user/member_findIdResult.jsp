<%@page import="com.book.model.UserDAO"%>
<%@page import="com.book.model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/userCss/user_FindIdResult.css"/>
</head>
<body>
	<c:set var="dto" value="${Cont }" />
	<form name="idsearch" class="box" method="post">
	<c:if test="${!empty dto }">
		<div class="found-success">
			<h4>회원님의 아이디는</h4>
			<div class="found-id">${dto.getMem_id() }</div>
			<h4> 입니다.</h4>
		</div>
		<div class="found-login">
			<input type="button" id="btnLogin" class="btn-11" value="로그인" onclick="location.href='member_login.do'"/> 
		</div>
	</c:if>
	<c:if test="${empty dto }">
		<div class="container">
		<div class="found-fail">
			<h3> 등록된 정보가 없습니다.</h3>
		</div>	
		<div class="found-login">
			<input type="button" id="btnback" class="btn-11" value="다시찾기" onclick="history.back()"/>
			<input type="button" id="btnjoin" class="btn-11" value="회원가입" onclick="location.href='member_sign.do'"/>
		</div>
		</div>
		<div class = "adcontainer">
			<a href="#" ></a>
		</div>
	</c:if>
	</form>
</body>
</html>