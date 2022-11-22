<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<c:set var="dto" value="${Modify }" />
		<hr width="50%" color="red">
			<h3>MEMBER10 ${dto.getMemname()}회원정보 수정 폼 페이지</h3>
		<hr width="50%" color="red">
		<br>
		<form method="post" action="<%=request.getContextPath()%>/member_modify_ok.do">
			<input type="hidden" name="num" value="${dto.getNum() }">
			<input type="hidden" name="db_pwd" value="${dto.getPwd() }">
			<table border="1" cellspacing="0" width="450">
				<tr>
					<th>회원 아이디</th>
					<td>
						${dto.getMemid() }
					</td>
				</tr>
				<tr>
					<th>회원 이름</th>
					<td>
						${dto.getMemname() }
					</td>
				</tr>
				<tr>
					<th>회원 비밀번호</th>
					<td>
						<input type="password" name="pwd" value="${dto.getPwd() }" readonly>
					</td>
				</tr>
				<tr>
					<th>회원 나이</th>
					<td>
						<input name="age" value="${dto.getAge() }">
					</td>
				</tr>
				<tr>
					<th>회원 마일리지</th>
					<td>
						<input name="mileage" value="${dto.getMileage() }">
					</td>
				</tr>
				<tr>
					<th>회원 직업</th>
					<td>
						<input name="job" value="${dto.getJob() }">
					</td>
				</tr>
				<tr>
					<th>회원 주소</th>
					<td>
						<input name="addr" value="${dto.getAddr() }">
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="submit" value="수정">
						<input type="reset" value="다시작성">
					</th>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>