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
			<h3>member10 테이블 회원 상세 리스트</h3>
		<hr width="50%" color ="pink">
		<br>
		<table border="1" cellspacing ="0" width="500px">
			<c:set var="dto" value="${DList }"></c:set>
			<c:if test = "${!empty dto }" >
			<tr>
				<th>회원 번호</th>
				<td> ${dto.getNum()} </td>
			</tr>
			<tr>
				<th>회원 아이디</th>
				<td> ${dto.getMemid() } </td>
			</tr>
			<tr>
				<th>회원 이름</th>
				<td> ${dto.getMemname() } </td>
			</tr>
			<tr>
				<th>회원 비밀번호</th>
				<td> 
					<c:if test="${dto.getPwd().length()!=0}">
						<c:forEach begin="1" end ="${dto.getPwd().length()}">
							*
						</c:forEach>
					</c:if>
				</td>
			</tr>
			<tr>
				<th>회원 나이</th>
				<td> ${dto.getAge() } </td>
			</tr>
			<tr>
				<th>회원 마일리지</th>
				<td> <fmt:formatNumber value="${dto.getMileage() }"/>  </td>
			</tr>
			<tr>
				<th>회원 직업</th>
				<td> ${dto.getJob() } </td>
			</tr>
			<tr>
				<th>회원 주소</th>
				<td> ${dto.getAddr() } </td>
			</tr>
			<tr>
				<th>회원 등록일</th>
				<td> ${dto.getRegdate() } </td>
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
					<input type="button" value="회원 수정" onclick="location.href='update.do?num=${dto.getNum()}'">
					<input type="button" value="회원 삭제" onclick="if(confirm('정말로 삭제하시겠습니까?')){
																	location.href='delete.do?num=${dto.getNum()}'
																}else{ return;} " class="btn">
					<input type="button" value="회원 목록" onclick="location.href='select.do'">
				</td>
			</tr>
		</table>
	</div>
</body>
</html>