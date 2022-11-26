<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/4338ad17fa.js" crossorigin="anonymous"></script>
</head>
<body>
	<div align="center">
		<hr width="50%" color="marmoon">
			<h3>BOARD 게시판 리스트</h3>
		<hr width="50%" color="marmoon">
		
		<br>
		
		<table border="1" cellspacing="0" width="600">
			<tr>
				<th>게시글 번호</th>
				<th>글 제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일자</th>
			</tr>
			
			<c:set var="list" value="${List }"/>
			<c:set var="paging" value="${Paging }"/>
			
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.getBoard_no() }</td>
						<td>
							<a href="<%=request.getContextPath() %>/board_cont.do?no=${dto.getBoard_no() }&page=${paging.getPage()}">${dto.getBoard_title() }</a>
						</td>
						<td>${dto.getBoard_writer() }</td>
						<td>${dto.getBoard_hit() }</td>
						<td>${dto.getBoard_date().substring(0,10) }</td>
					</tr>
				</c:forEach>
			</c:if>	
			
			<c:if test="${empty list }">
				<tr>
					<th colspan="2">
						게시글이 없습니다.
					</th>
				</tr>
			</c:if>		
			
			<tr>
				<th colspan="5">
					<input type="button" value="게시글 등록" onclick="location.href='<%=request.getContextPath() %>/board_write.do'">
				</th>
			</tr>
		</table>
		
		<br>
		<form method="post" action="<%=request.getContextPath() %>/board_search.do">
			<%-- <input type="hidden" name="page" value="${paging.getPage() }"> --%>
			<select name="field">
				<option value="writer">작성자</option>
				<option value="title">글제목</option>
				<option value="content">글내용</option>
			</select>
			<input name="keyword">
			<input type="submit" value="검색">
		</form>
		
		<br>
		<!-- 페이징 -->
		<c:if test="${paging.getPage() > paging.getBlock() }">
			<a href="board_list.do?page=1">
				 <i class="fa-solid fa-backward"></i>
			</a>
			<a href="board_list.do?page=${paging.getStartBlock() - 1}">
				 <i class="fa-solid fa-caret-left"></i>
			</a>
		</c:if>
		
		<c:forEach begin="${paging.getStartBlock() }" end="${paging.getEndBlock() }" var="i">
			<c:if test="${i == paging.getPage() }">
				<b><a href="board_list.do?page=${i }">[${i }]</a></b>
			</c:if>
			<c:if test="${i != paging.getPage() }">
				<a href="board_list.do?page=${i }">[${i }]</a>
			</c:if>
		</c:forEach>
		
		<c:if test="${paging.getEndBlock() < paging.getAllPage() }">
			<a href="board_list.do?page=${paging.getEndBlock()+1 }">
				<i class="fa-solid fa-caret-right"></i>
			</a>
			<a href="board_list.do?page=${paging.getAllPage() }">
				<i class="fa-solid fa-forward"></i>
			</a>
		</c:if>
	</div>
</body>
</html>