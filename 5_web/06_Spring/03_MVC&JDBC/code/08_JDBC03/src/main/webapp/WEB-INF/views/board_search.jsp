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
			
			<c:set var="boardList" value="${searchList }"/>
			<c:if test="${!empty searchList }">
				<c:forEach items="${searchList }" var="searchList">
					<tr>
						<th>${searchList.getBoard_no() }</th>
						<th>
							<a href="<%=request.getContextPath() %>/board_cont.do?board_no=${searchList.getBoard_no()}">${searchList.getBoard_title() }</a>
						</th>
						<th>${searchList.getBoard_hit() }</th>
						<th>${searchList.getBoard_date() }</th>
					</tr>
				</c:forEach>
			</c:if>
			
			<c:if test="${empty searchList }">
				<tr>
					<th colspan="4"> 데이터가 없습니다.</th>
				</tr>
			</c:if>
			
			<tr>
				<th colspan="4" align="right">
					<input type="button" value="메인" onclick="location.href='<%=request.getContextPath()%>/board_list.do'">
					<input type="button" value="등록" onclick="location.href='<%=request.getContextPath() %>/board_write.do'">
				</th>
			</tr>
		</table>
	</div>
</body>
</html>