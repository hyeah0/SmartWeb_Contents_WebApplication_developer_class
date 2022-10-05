<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<div>
		<hr>
			<h3>board 테이블 메인 페이지</h3>
		<hr>
		<table>
			<tr>
				<th>글번호</th>
				<th>글제목</th>
				<th>조회수</th>
				<th>작성일자</th>
			</tr>

			<c:set var="list" value="${List }"/>
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<tr>
						<td> ${dto.getBoard_no() } </td>
						<td> 
							<a href="<%=request.getContextPath() %>/board_content.do?no=${dto.getBoard_no() }&page=${page}"> ${dto.getBoard_title() } </a>
						</td>
						<td> ${dto.getBoard_hit() } </td>
						<td> ${dto.getBoard_date().substring(0,10) } </td>
					</tr>
				</c:forEach>
			</c:if>
			
			<c:if test="${empty list }">
				<tr>
					<td colspan="4"><b>게시물이 없습니다.</b></td>
				</tr>
			</c:if>
			
			<tr class="table_tr_btn">
				<td colspan="4">
					<input type="button" value ="글쓰기" onclick="location.href='board_write.do'">
				</td>
			</tr>
		</table>
		<br>
		
		<!-- 페이지 처리 부트스트랩 -->
		<nav aria-label="Page navigation example">
		  <ul class="pagination">
		  	<c:if test="${page > block }">
				 <li class="page-item">
			    	<a class="page-link" href="board_list.do?page=1">First</a>
			    </li>
			    <li>
			    	<a class="page-link" href="board_list.do?page=${startBlock - 1}">Back</a>
		    	</li>
			</c:if>
		    <c:forEach begin="${startBlock }" end="${endBlock }" var="i">
				<c:if test="${i == page }">
					<!-- 현재페이지일 경우 진하게 -->
					<li class= "page-item active" aria-current="page"> 
						<a class="page-link" href="board_list.do?page=${i }">${i } </a>
					</li>
				</c:if>
				<c:if test="${i != page }">
					<li class= "page-item"> 
						<a class="page-link" href="board_list.do?page=${i }">${i } </a>
					</li>
				</c:if>
			</c:forEach>
		   	<c:if test="${endBlock < allPage }">
				<li class= "page-item">
					<a class="page-link" href="board_list.do?page=${endBlock + 1 }"> Next </a>
				</li>
				<li class= "page-item">
					<a class="page-link" href="board_list.do?page=${allPage } "> End </a>
				</li>
			</c:if>
		  </ul>
		</nav>
		
		<!-- 페이징 처리 -->
		<%-- <div class="page">
			<!-- 현재 페이지가 블럭보다 크면 -->
			<c:if test="${page > block }">
				<a href="board_list.do?page=1"> ◁◁︎︎︎ </a>
				<a href="board_list.do?page=${startBlock -1}">︎︎︎ ◁ </a>
			</c:if>
			<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
				<c:if test="${i == page }">
					<!-- 현재페이지일 경우 진하게 -->
					<b><a href="board_list.do?page=${i }">[${i }] </a></b>
				</c:if>
				<c:if test="${i != page }">
					<a href="board_list.do?page=${i }">[${i }] </a>
				</c:if>
			</c:forEach>
			<c:if test="${endBlock < allPage }">
				<a href="board_list.do?page=${endBlock + 1 }"> ▷ </a>
				<a href="board_list.do?page=${allPage } }"> ▷▷ </a>
			</c:if>
		</div> --%>
		
	</div>
</body>
</html>