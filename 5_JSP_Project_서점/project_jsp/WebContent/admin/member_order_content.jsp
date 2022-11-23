<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_content</title>
<link rel="stylesheet" href="css/section.css">
</head>
<body>
	<div class="wapper">
		<!--헤더시작-->
		<header align="center">
			<jsp:include page="/include/header.jsp" /></a>
		</header>
		<!--네비게이션-->

		<nav></nav>
		<!--콘텐츠부분-->
		<section>
			<article>
				<c:set var="dto" value="${orderDTO }"></c:set>
				<input type="hidden" value="${dto.getOrder_num() }" name="order_num">
				<table align="center" cellpadding="2" border="1"
					class="table text-center table-sm w-75">
					<tr>
						<th>제목</th>
						<td>${dto.getBook_name() }</td>
					</tr>
					<tr>
						<th>주문날짜</th>
						<td>${dto.getOrder_date() }</td>
					</tr>
					<tr>
						<th>표지</th>
						<td><img alt=""
							src="<%=request.getContextPath() %>/book_cover/${dto.getBook_img() }"
							width="200px"></td>
					</tr>
					<tr>
						<th>가격</th>
						<td><fmt:formatNumber value="${dto.getBook_price() }" />원</td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="button" value="환불" class="btn btn-outline-secondary" 
							onclick="if(confirm('환불하시겠습니까?')){location.href = '<%=request.getContextPath() %>/member_order_delete.do?order_num=${dto.getOrder_num() }&book_price=${dto.getBook_price() }'}"></td>
					</tr>
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