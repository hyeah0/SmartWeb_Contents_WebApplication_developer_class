<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_reply_insert</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/section.css">
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
				<form action="<%=request.getContextPath()%>/board_reply_insert.do"
					method="post">
					<input type="hidden" value="${param.board_num }" name="board_num">
					<table align="center" cellpadding="2" border="1" class="table text-center table-sm w-75">
						<tr>
							<th>답변 내용</th>
							<td><textarea name="board_cont" cols="100" rows="30" class="form-control" ></textarea></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit" value="답변 완료" class="btn btn-outline-secondary" >
							<input type="reset" value="다시작성" class="btn btn-outline-secondary" ></td>
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