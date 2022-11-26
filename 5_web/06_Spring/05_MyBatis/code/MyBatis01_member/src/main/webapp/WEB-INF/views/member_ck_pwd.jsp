<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<hr width="50%" color="red">
			<h3>MEMBER10 테이블 회원 비밀번호 확인</h3>
		<hr width="50%" color="red">
		<br>
		<form method="post" action="<%=request.getContextPath() %>/member_cking_pwd.do">
			<input type="hidden" name="num" value="${num }" >
			<div>
				<label for="input_pwd">비밀번호 입력</label>
				<input type="password" id="input_pwd" name="input_pwd">
			</div>
			<input type="submit" value="확인">
			<input type="button" onclick="location.href='<%=request.getContextPath() %>/member_content.do?num=${num}'" value="목록으로 돌아가기" />
		</form>
		
	</div>
</body>
</html>