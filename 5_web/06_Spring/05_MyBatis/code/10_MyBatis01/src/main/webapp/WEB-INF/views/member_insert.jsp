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
		<hr width="50%" color="red">
			<h3>MEMBER10 회원등록 폼</h3>
		<hr width="50%" color="red">
		<br>
		<form method="post" action="<%=request.getContextPath()%>/member_insert_ok.do">
			<table border="1" cellspacing="0" width="450">
				<tr>
					<th>회원 아이디</th>
					<td>
						<input name="memid">
					</td>
				</tr>
				<tr>
					<th>회원 이름</th>
					<td>
						<input name="memname">
					</td>
				</tr>
				<tr>
					<th>회원 비밀번호</th>
					<td>
						<input name="pwd">
					</td>
				</tr>
				<tr>
					<th>회원 나이</th>
					<td>
						<input name="age">
					</td>
				</tr>
				<tr>
					<th>회원 마일리지</th>
					<td>
						<input name="mileage">
					</td>
				</tr>
				<tr>
					<th>회원 직업</th>
					<td>
						<input name="job">
					</td>
				</tr>
				<tr>
					<th>회원 주소</th>
					<td>
						<input name="addr">
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<!-- <input type="submit" value="등록" onclick="location.href='member_insert_ok.do'"> -->
						<input type="submit" value="등록">
						<input type="reset" value="취소">
					</th>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>