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
		<hr width="50%" color="blue">
			<h3>Board 테이블 게시판 수정</h3>
		<hr width="50%" color="blue">
		<br>
		<form method="post" action="<%=request.getContextPath() %>/board_update_ok.do">
			<input type="hidden" name="board_no" value="${boardCont.getBoard_no()}">
			<input type="hidden" name="DB_pwd" value="${boardCont.getBoard_pwd()}">
			<table border="1" cellspacing="0" width="800">
				<tr>
					<th>작성자</th>
					<td>${boardCont.getBoard_writer() }</td>
					<th>조회수</th>
					<td>${boardCont.getBoard_hit() }</td>
				</tr>
				<tr>
					<c:if test="${!empty boardCont.getBoard_update() }">
						<th>작성일</th>
						<td>${boardCont.getBoard_date() }</td>
						<th>수정일</th>
						<td>${boardCont.getBoard_update() }</td>
					</c:if>
					<c:if test="${empty boardCont.getBoard_update() }">
						<th>작성일</th>
						<td colspan="3">${boardCont.getBoard_date() }</td>
					</c:if>
				</tr>
				<tr>
					<th>글 제목</th>
					<td colspan="3">
						<input name="board_title" value="${boardCont.getBoard_title() }">
					</td>
				</tr>
				<tr>
					<th>글 내용</th>
					<td colspan="3">
						<textarea rows="20" cols="50" name="board_cont">${boardCont.getBoard_cont() }</textarea>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td colspan="3">
						<input type="password" name="input_pwd">
					</td>
				</tr>
				<tr>
					<th colspan="4">
						<input type="submit" value="수정">
						<input type="reset" value="다시작성">
						<input type="button" value="메인" onclick="location.href='<%=request.getContextPath()%>/board_list.do'">
					</th>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>