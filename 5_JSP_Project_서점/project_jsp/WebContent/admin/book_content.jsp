<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_book</title>
<link rel="stylesheet" href="css/section.css">
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
				<c:set var="book" value="${bookdto }"></c:set>
				<c:set var="cgy" value="${cgydto }"></c:set>
				<table align="center" cellpadding="2" border="1" class="table text-center table-sm w-75">
					<tr>
						<th class="w-25">제목</th>
						<td>${book.getBook_name() }</td>
					</tr>
					<tr>
						<th>장르</th>
						<td>${cgy.getCgy_name() }</td>
					</tr>
					<tr>
						<th>작가</th>
						<td>${book.getBook_writer() }</td>
					</tr>
					<tr>
						<th>출판사</th>
						<td>${book.getBook_publisher() }</td>
					</tr>
					<tr>
						<th>발행일</th>
						<td>${book.getBook_date().substring(0,10) }</td>
					</tr>
					<tr>
						<th>갱신일</th>
						<td>${book.getBook_update() }</td>
					</tr>
					<tr>
						<th>페이지</th>
						<td>${book.getBook_page() }</td>
					</tr>
					<tr>
						<th>표지</th>
						<td><img alt=""
							src="<%=request.getContextPath() %>/book_cover/${book.getBook_img() }"
							width="200px"></td>
					</tr>
					<tr>
						<th>작가 소개</th>
						<td>${book.getBook_writer_cont() }</td>
					</tr>
					<tr>
						<th>목차</th>
						<td>${book.getBook_index() }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>${book.getBook_cont() }</td>
					</tr>
					<tr>
						<th>가격</th>
						<td><fmt:formatNumber value="${book.getBook_price() }" />원</td>
					</tr>
					<tr>
						<th>재고</th>
						<td><fmt:formatNumber value="${book.getBook_qty() }" />개</td>
					</tr>
					<tr>
						<th>판매량</th>
						<td><fmt:formatNumber value="${book.getBook_sales() }" />개</td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="button" class="btn btn-outline-secondary" 
							value="수정"
							onclick="location.href = '<%=request.getContextPath() %>/book_update.do?book_num=${book.getBook_num() }'">
							<input type="button" value="삭제" class="btn btn-outline-secondary" 
							onclick="if(confirm('정말로 삭제하시겠습니까?')){location.href = '<%=request.getContextPath() %>/book_delete.do?book_num=${book.getBook_num() }&&book_img=${book.getBook_img() }'}"></td>
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