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
		<hr width="50%" color="marmoon">
			<h3>BOARD 비밀번호 확인</h3>
		<hr width="50%" color="marmoon">
		
		<br>
		<form method="post" action="<%=request.getContextPath() %>/board_ck_pwd_ok.do">
		    <input type="hidden" name="no" value="${board_no }">
			<input type="hidden" name="page" value="${page }">
			
			<label for="pwd">비밀번호 입력</label>
			<input type="pwd" id="pwd" name="input_pwd">
			<div>
				<input type="submit" value="입력">
			</div>
		</form>
	</div>
</body>
</html>