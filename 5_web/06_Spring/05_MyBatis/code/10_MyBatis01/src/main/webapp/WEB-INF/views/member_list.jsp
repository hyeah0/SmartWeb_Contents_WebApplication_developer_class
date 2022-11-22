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
		<hr width="50%" color="marmoon">
			<h3>MEMBER10 테이블 전체 회원 목록 페이지</h3>
		<hr width="50%" color="marmoon">
		<br>
		
		<table border="1" cellspacing="0" width="400"> 
			<tr>
				<th>회원 번호</th>
				<th>회원 이름</th>
				<th>회원 직업</th>
				<th>회원 가입일</th>
			</tr>
			
			<c:set var="list" value="${List }"/>
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.getNum() }</td>
						<td>
							<a href="<%=request.getContextPath()%>/member_content.do?num=${dto.getNum()}"> 
								${dto.getMemname() }
							</a>
						</td>
						<td>${dto.getJob() }</td>
						<td>${dto.getRegdate().substring(0,10) }</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty list }">
				<tr>
					<th colspan="4">
						전체 회원 목록이 없습니다.
					</th>
				</tr>
			</c:if>
			
			<tr>
				<th colspan="4" align="center">
					<input type="button" value="회원등록" onclick="location.href='member_insert.do'">
				</th>
			</tr>
		</table>
		
		<br>
		<form method="post" action="<%=request.getContextPath() %>/member_search.do">
			<select name="field">
				<option value="memid">아이디</option>
				<option value="memname">이름</option>
				<option value="job">직업</option>
			</select>
			<input name="keyword">
			<input type="submit" value="검색">
		</form>
	</div>
</body>
</html>