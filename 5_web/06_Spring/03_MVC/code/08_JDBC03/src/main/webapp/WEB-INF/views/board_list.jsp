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
			<h3>Board 테이블 게시판 메인 페이지</h3>
		<hr width="50%" color="blue">
		<br>
		<table border="1" cellspacing="0" width="800">
			<tr>
				<th>게시글 번호</th>
				<th>게시글 제목</th>
				<th>게시글 조회수</th>
				<th>게시글 작성일</th>
			</tr>
			
			<c:set var="boardList" value="${boardList }"/>
			<c:if test="${!empty boardList }">
				<c:forEach items="${boardList }" var="boardList">
					<tr>
						<th>${boardList.getBoard_no() }</th>
						<th>
							<a href="<%=request.getContextPath() %>/board_cont.do?board_no=${boardList.getBoard_no()}">${boardList.getBoard_title() }</a>
						</th>
						<th>${boardList.getBoard_hit() }</th>
						<th>${boardList.getBoard_date() }</th>
					</tr>
				</c:forEach>
			</c:if>
			
			<c:if test="${empty boardList }">
				<tr>
					<th colspan="4"> 데이터가 없습니다.</th>
				</tr>
			</c:if>
			
			<tr>
				<th colspan="4" align="right">
					<input type="button" value="등록" onclick="location.href='<%=request.getContextPath() %>/board_write.do'">
				</th>
			</tr>
		</table>
		
		<br>
		<form method="post" action="<%=request.getContextPath() %>/board_search.do">
			<select name="field">
				<option value="board_writer">작성자</option>
				<option value="board_title">제목</option>
				<option value="board_cont">내용</option>
			</select>
			<input name="keyword">
			<input type="submit" value="검색">
		</form>
	</div>
</body>
</html>