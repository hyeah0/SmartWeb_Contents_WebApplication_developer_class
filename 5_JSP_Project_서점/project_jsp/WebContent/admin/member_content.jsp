<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_content</title>
</head>
<body>
	<div class="wapper">
		<!--헤더시작-->
		<header align="center">
			<jsp:include page= "/include/header.jsp"/></a>
		</header>
		<!--네비게이션-->

		<nav></nav>
		<!--콘텐츠부분-->
		<section>
			<article>
				<c:set var="dto" value="${dto }"></c:set>
				<table align="center" cellpadding="2" border="1" class="table text-center table-sm w-75">
					<tr>
						<th>ID</th>
						<td>${dto.getMem_id() }</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${dto.getMem_name() }</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${dto.getMem_phone() }</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>${dto.getMem_addr() }</td>
					</tr>
					<tr>
						<th>메일</th>
						<td>${dto.getMem_mail() }</td>
					</tr>
					<tr>
						<th>마일리지</th>
						<td>${dto.getMem_mileage() }</td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="button" 
						onclick="location.href='<%=request.getContextPath() %>/member_order_list.do?mem_num=${dto.getMem_num() }'" value="주문 내역" class="btn btn-outline-secondary" >
						&nbsp;&nbsp;&nbsp;
						<input type="button" 
						onclick="location.href='<%=request.getContextPath() %>/board_list.do?mem_num=${dto.getMem_num() }'" value="게시글" class="btn btn-outline-secondary" >
						</td>
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