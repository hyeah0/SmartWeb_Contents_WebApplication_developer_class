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
				<c:set var="dto" value="${boardDTO }"></c:set>
				<table align="center" cellpadding="2" border="1" class="table text-center table-sm w-75">
					<tr>
						<th>제목</th>
						<td>${dto.getBoard_title() }</td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td>${dto.getBoard_cgy_name() }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>${dto.getBoard_cont() }</td>
					</tr>
					<tr>
						<th>게시일</th>
						<td>${dto.getBoard_date() }</td>
					</tr>
					<tr>
						<th>갱신일</th>
						<td>${dto.getBoard_update() }</td>
					</tr>
					<tr>
					<td colspan="2" align="center"><input type="button" class="btn btn-outline-secondary" value="답변 수정"
					onclick="location.href = '<%=request.getContextPath() %>/board_reply_update.do?board_num=${dto.getBoard_num() }'">
					<input type="button" value="답변 작성" class="btn btn-outline-secondary" 
					onclick="location.href = '<%=request.getContextPath() %>/admin/board_reply_insert.jsp?board_num=${dto.getBoard_num() }'"></td>
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