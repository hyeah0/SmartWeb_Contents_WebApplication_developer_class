<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_list</title>
<link rel="stylesheet" href="css/section.css">
</head>
<body>
	<div class="wapper">
		<!--헤더시작-->
		<header align="center">
			<jsp:include page="/include/header.jsp" />
		</header>
		<!--네비게이션-->

		<nav></nav>
		<!--콘텐츠부분-->
		<section>
			<article>
				<table align="center" cellpadding="2" border="1" class="table text-center table-sm w-75">
					<thead>
					<tr>
						<th>회원 아이디</th>
						<th>회원 이름</th>
						<th>회원 번호</th>
						<th>마일리지</th>
					</tr>
					</thead>
					<c:set var="list" value="${memberList }"></c:set>
					<c:if test="${not empty list }">
						<c:forEach var="dto" items="${list }">
							<tr>
								<td>${dto.getMem_id() }</td>
								<td><a href='<%=request.getContextPath() %>/member_content.do?mem_num=${dto.getMem_num() }' class="btn btn-default">${dto.getMem_name() }</a></td>
								<td>${dto.getMem_phone() }</td>
								<td>${dto.getMem_mileage() }</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty list }">
						<tr>
							<td colspan="4" align="center">회원정보가 없습니다.</td>
						</tr>
					</c:if>
				</table>
			</article>
		</section>
		<!--사이드바-->
		<aside></aside>

		<!--풋터-->
		<footer> </footer>
	</div>
</body>
</html>