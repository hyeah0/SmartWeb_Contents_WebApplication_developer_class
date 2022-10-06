<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/4338ad17fa.js" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<div>
		<hr>
			<h3>board 테이블 게시물 검색 리스트 페이지</h3>
		<hr>
		<!------- 검색 기능 처리 -------------------------------------------------->
		<form class="search_form" method="post" action="<%=request.getContextPath() %>/board_search.do">
			<select class="search_field" name="search_field">
				<option value="search_title">제목</option>
				<option value="search_cont">내용</option>
				<option value="search_title_cont">제목+내용</option>
				<option value="search_writer">작성자</option>
			</select>
			<input class="search_keyword" name="search_keyword">
			<button type="submit" class="search_btn">
				<i class="fa-solid fa-magnifying-glass"></i>
			</button>
		</form>
		
		<!------- 게시글 리스트 --------------------------------------------------->
		<table>
			<tr>
				<th>글번호</th>
				<th>글제목</th>
				<th>조회수</th>
				<th>작성일자</th>
			</tr>

			<c:set var="list" value="${searchList }"/>
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<tr>
						<td> ${dto.getBoard_no() } </td>
						<td> 
							<a href="<%=request.getContextPath() %>/board_content.do?no=${dto.getBoard_no() }&page=${page}&type=1"> ${dto.getBoard_title() } </a>
						</td>
						<td> ${dto.getBoard_hit() } </td>
						<td> ${dto.getBoard_date().substring(0,10) } </td>
					</tr>
				</c:forEach>
			</c:if>

			<c:if test="${empty list }">
				<tr>
					<td colspan="4"><b>검색된 게시물이 없습니다.</b></td>
				</tr>
			</c:if>
			
			<tr class="table_tr_btn">
				<td colspan="4">
					<input type="button" value ="전체목록보기" onclick="location.href='board_list.do'">
				</td>
			</tr>
		</table>
		<br>
		
		<!------- 검색 페이지 처리 부트스트랩 -------------------------------------------->
		<nav aria-label="Page navigation example">
		  <ul class="pagination">
		  	
		  	<!-- first & back  -->
		  	<c:if test="${page > block }">
				 <li class="page-item">
			    	<a class="page-link" href="board_search.do?page=1&search_field=${searchField }&search_keyword=${searchKeyword }">First</a>
			    </li>
			    <li>
			    	<a class="page-link" href="board_search.do?page=${page - 1}&search_field=${searchField }&search_keyword=${searchKeyword }">Back</a>
		    	</li>
			</c:if>
		   
		   <!-- page  -->
		    <c:forEach begin="${startBlock }" end="${endBlock }" var="i">
			
				<c:if test="${i == page }">
					<!-- 현재페이지일 경우 진하게 -->
					<li class= "page-item active" aria-current="page"> 
						<a class="page-link" href="board_search.do?page=${i }&search_field=${searchField }&search_keyword=${searchKeyword }">${i } </a>
					</li>
				</c:if>
				<c:if test="${i != page }">
					<li class= "page-item"> 
						<a class="page-link" href="board_search.do?page=${i }&search_field=${searchField }&search_keyword=${searchKeyword }">${i } </a>
					</li>
				</c:if>
				</c:forEach>
		   	
		   	<!-- next & end  -->
		   	<c:if test="${endBlock < allPage }">
				<li class= "page-item">
					<a class="page-link" href="board_search.do?page=${page + 1 }&search_field=${searchField }&search_keyword=${searchKeyword }"> Next </a>
				</li>
				<li class= "page-item">
					<a class="page-link" href="board_search.do?page=${allPage }&search_field=${searchField }&search_keyword=${searchKeyword }"> End </a>
				</li>
			</c:if>
			
		  </ul>
		</nav>
	</div>
</body>
</html>