<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
		<form method="post" action="<%=request.getContextPath()%>/member_login_check.do">
			<h3>임시 로그인 창</h3>
			<p>아이디 :
				<input name="member_id">
			</p>
			
			<p>비밀번호 :
				<input type="password" name="member_pwd">
			</p>
			
			<br>
			<br>
			
			<input type="submit" value="로그인">
			<input type="reset" value="다시작성">
		</form>
	</div>

</body>
</html>