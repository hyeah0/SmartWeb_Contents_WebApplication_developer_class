<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_category</title>
</head>
<body>
	<div class="wapper">
		<!--헤더시작-->
		<header align="center">
			<jsp:include page= "/include/header.jsp"/>
		</header>
		<!--네비게이션-->

		<nav></nav>
		<!--콘텐츠부분-->
		<section>
			<article>
				<form method="post"
					action="<%=request.getContextPath()%>/admin/category_insert.jsp">
					<table align="center" cellpadding="2" border="1" class="table text-center table-sm w-75">
						<thead>
						<tr>
							<th>장르 번호</th>
							<th>장르 이름</th>
							<th></th>
						</tr>
						</thead>
						<c:set var="list" value="${categoryList }"></c:set>
						<c:if test="${not empty list }">
							<c:forEach var="dto" items="${list }">
								<tr>
									<td>${dto.getCgy_num() }</td>
									<td>${dto.getCgy_name() }</td>
									<td><input type="button" value="수정" onclick="location.href = '<%=request.getContextPath() %>/category_update.do?cgy_num=${dto.getCgy_num() }'" class="btn btn-outline-secondary" ></td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty list }">
							<tr>
								<td colspan="3" align="center">카테고리가 없습니다.</td>
							</tr>
						</c:if>
						<tr>
							<td colspan="3" align="center"><input type="submit" value="카테고리 추가" class="btn btn-outline-secondary" ></td>
						</tr>
					</table>
				</form>
			</article>
		</section>
		<!--사이드바-->
		<aside></aside>

		<!--풋터-->
		<footer> </footer>
	</div>
</body>
</html>