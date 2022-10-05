<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	th{
		width: 100px;
	}
</style>
</head>
<body>
	<div align="center">
		<hr width="50%" color ="pink">
			<h3>member10 테이블 회원 수정 폼 페이지</h3>
		<hr width="50%" color ="pink">
		<br>
		<form method="post" action="<%=request.getContextPath() %>/update_ok.do">
				
				<c:set var="dto" value="${Update }"></c:set>
				<input type="hidden" name= "num" value="${dto.getNum() }">
				<input type="hidden" name= "db_pwd" value="${dto.getPwd() }">
			
			<table border="1" cellspacing ="0" width="500px">
				<c:if test = "${!empty dto }" >
				<tr>
					<th>회원 아이디</th>
					<td> ${dto.getMemid() } </td>
				</tr>
				<tr>
					<th>회원 이름</th>
					<td> 
						<input name="memname" value="${dto.getMemname() } ">  
					</td>
				</tr>
				<tr>
					<th>회원 비밀번호 확인</th>
					<td> 
						<input type="password" name="input_pwd">
					</td>
				</tr>
				<tr>
					<th>수정 비밀번호</th>
					<td> 
						<input type="password" name="change_pwd">
					</td>
				</tr>
				<tr>
					<th>회원 나이</th>
					<td> <input name="age" value="${dto.getAge() }">  </td>
				</tr>
				<tr>
					<th>회원 마일리지</th>
					<td> <input name="mileage" value="${dto.getMileage() }"> </td>
				</tr>
				<tr>
					<th>회원 직업</th>
					<td> <input name="job" value="${dto.getJob() }"> </td>
				</tr>
				<tr>
					<th>회원 주소</th>
					<td> <input name="addr" value="${dto.getAddr() }"> </td>
				</tr>
			</c:if>
			<c:if test="${empty dto }">
				<tr>
					<td>
						<b>일치하는 회원 정보가 없습니다.</b>
					</td>
				</tr>
			</c:if>
				<tr>
					<td colspan="2">
						<input type="submit" value="회원 수정">
						<input type="reset" value="다시 작성">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>