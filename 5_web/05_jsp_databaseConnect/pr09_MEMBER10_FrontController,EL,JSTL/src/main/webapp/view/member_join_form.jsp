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
		<hr width="50%" color ="marmoon">
			<h3>member10 테이블 회원 등록 폼 페이지</h3>
		<hr width="50%" color ="marmoon">
		<br>
		<form method="post" action="<%=request.getContextPath()%>/insert_ok.do">
			<table border="1" cellspacing="0" width="400">
				<tr>
					<th>회원 아이디</th>
					<td>
						<input name="mem_id">
					</td>
				</tr>
				<tr>
					<th>회원 이름</th>
					<td>
						<input name="mem_name">
					</td>
				</tr>
				<tr>
					<th>회원 비밀번호</th>
					<td>
						<input type="password" name="mem_pwd">
					</td>
				</tr>
				<tr>
					<th>회원 나이</th>
					<td>
						<input name="mem_age">
					</td>
				</tr>
				<tr>
					<th>회원 마일리지</th>
					<td>
						<input name="mem_mileage">
					</td>
				</tr>
				<tr>
					<th>회원 직업</th>
					<td>
						<input name="mem_job">
					</td>
				</tr>
				<tr>
					<th>회원 주소</th>
					<td>
						<input name="mem_addr">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="회원등록">
						<input type="reset" value="다시작성">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>