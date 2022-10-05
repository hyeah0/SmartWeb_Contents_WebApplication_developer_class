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
		<hr width="50%" color ="red">
			<h3>member10 테이블 전체 회원 리스트</h3>
		<hr width="50%" color ="red">
		<br>
		<table border="1" cellspacing="0" width="400">
			<tr>
				<th>회 원 번 호</th>
				<th>회 원 아 이 디</th>
				<th>회 원 명</th>
				<th>회 원 가 입 일</th>
			</tr>
			<tr>
				<%-- <c:set var="list" value="${key이름 }"/> --%>
				<c:set var="list" value="${List }"/>
				<%-- list 가 비어있지 않다면 --%>
				<c:if test="${!empty list}">	 		
					<%-- for 문 반복 --%>
					<c:forEach items="${list }" var="dto">	
						
						<tr>	
							<td> ${dto.getNum()} </td>
							<td> ${dto.getMemid()} </td>
							<td> 
								 <a href="<%=request.getContextPath() %>/content.do?num=${dto.getNum()}">
								 	${dto.getMemname()} 
								 </a>
							</td>
							<td> ${dto.getRegdate().substring(0,10)} </td>
						</tr>
					
					</c:forEach>
				</c:if>
				
				<%--  list 가 비어있다면 --%>
				<c:if test="${empty list}">					
					
					<tr>
						<td colspan="4" align="center">
							<b>전체 회원 리스트가 없습니다.</b>
						</td>
					</tr>
				
				</c:if>
				
				<tr>
					<td colspan="4" align="center">
						<input type="button" value="회원등록" onclick="location.href='insert.do'">
					</td>
				</tr>
		</table>
	</div>
</body>
</html>