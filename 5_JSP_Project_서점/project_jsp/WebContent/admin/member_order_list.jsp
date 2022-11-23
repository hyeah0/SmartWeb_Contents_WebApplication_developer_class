<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>order_list</title>
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
				<table align="center" cellpadding="2" border="1"
					class="table text-center table-sm w-75">
					<thead>
						<tr>
							<th>제목</th>
							<th>날짜</th>
							<th>가격</th>
							<th>수량</th>
						</tr>
					</thead>
					<c:set var="list" value="${orderList }"></c:set>
					<c:if test="${not empty list }">
						<c:forEach var="dto" items="${list }">
							<tr>
								<td><a class="btn btn-default"
									href="<%=request.getContextPath()%>/member_order_content.do?order_num=${dto.getOrder_num() }">${dto.getBook_name() }</td>
								<td>${dto.getOrder_date() }</td>
								<td><fmt:formatNumber value="${dto.getBook_price() }"></fmt:formatNumber>원(권당)</td>
								<td>${dto.getOrder_qty() }</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty list }">
						<tr>
							<td colspan="3" align="center">주문내역이 없습니다.</td>
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