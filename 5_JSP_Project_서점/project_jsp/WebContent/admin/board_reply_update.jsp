<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reply update</title>
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
				<c:set var="dto" value="${replyDTO }"></c:set>
				<form
					action="<%=request.getContextPath()%>/board_reply_update_ok.do"
					method="post">
					<input type="hidden" name="board_num" value="${param.board_num }">
					<table align="center" cellpadding="2" border="1" class="table text-center table-sm w-75">

						<c:if test="${empty dto }">
							<tr colspan="2">
								<td>수정할 내용이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${not empty dto }">
							<tr>
								<th>답변 내용</th>
								<td><textarea name="board_cont" cols="100" rows="30" class="form-control" ><c:out
											value="${dto.getReply_cont() }"></c:out></textarea></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><input type="submit"
									value="수정" class="btn btn-outline-secondary"> <input type="reset" value="다시작성" class="btn btn-outline-secondary"></td>
							</tr>
						</c:if>
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