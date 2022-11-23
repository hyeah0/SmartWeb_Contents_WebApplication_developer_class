<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_book</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/section.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
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
				<form method="post"
					action="<%=request.getContextPath()%>/book_insert.do">
					<table align="center" cellpadding="2" border="1" class="table text-center table-sm w-75">
						<thead>
							<tr>
								<th>책 이름</th>
								<th>작가</th>
								<th>발행일</th>
								<th>출판사</th>
							</tr>
						</thead>
						<c:set var="list" value="${bookList }"></c:set>
						<c:if test="${not empty list }">
							<c:forEach var="dto" items="${list }">
								<tr>
									<td><a class="btn btn-default"
										href="<%=request.getContextPath()%>/book_content.do?book_num=${dto.getBook_num() }">${dto.getBook_name() }</a></td>
									<td>${dto.getBook_writer() }</td>
									<td>${dto.getBook_date().substring(0,10) }</td>
									<td>${dto.getBook_publisher() }</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty list }">
							<tr>
								<td colspan="4" align="center">책이 없습니다.</td>
							</tr>
						</c:if>
						<tr>
							<td colspan="4" align="center"><input type="submit"
								value="책 추가" class="btn btn-outline-secondary" ></td>
						</tr>
					</table>
				</form>


				<hr>
				<c:set var="page" value="${page }"></c:set>



			</article>
		</section>
		<!--사이드바-->
		<aside></aside>

		<!--풋터-->
		<footer>
			<c:set var="researchText" value="${searchText }"></c:set>
			<c:set var="research_tag" value="${search_tag }"></c:set>
			<form method="post"
				action="<%=request.getContextPath()%>/book_search.do?page=move">
				<input type="hidden" value="${researchText }" name="searchText">
				<input type="hidden" value="${research_tag }" name="search_tag">
				<ul class="pagination justify-content-center">
					<c:if test="${page.isPrev() }">
						<li class="page-item"><button type="submit" class="page-link"
								value="${page.getStartPage()-1 }" name="pageNum">Previous</button></li>
					</c:if>
					<c:forEach var="i" begin="${page.getStartPage() }"
						end="${page.getEndPage() }">
						<c:choose>
							<c:when test="${page.getPageNum() == i}">
								<li class="page-item active" aria-current="page"><a
									class="page-link" href="#"><c:out value="${i}" /></a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><button type="submit"
										class="page-link" value="${i }" name="pageNum">
										<c:out value="${i }"></c:out>
									</button></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${page.isNext()}">
						<li class="page-item"><button type="submit" class="page-link"
								value="${page.getEndPage()+1 }" name="pageNum">Next</button></li>
					</c:if>
				</ul>
			</form>
			<form method="post"
				action="<%=request.getContextPath()%>/book_search.do">
				<div class="row g-3 d-fex justify-content-end">
					&nbsp;&nbsp;&nbsp;
					<div class="col-auto">
						<select name="search_tag">
							<option value="title+content">제목+내용</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select>
					</div>
					<div class="col-auto">
						<input type="text" class="form-control" name="searchText">
					</div>
					<div class="col-auto">
						<button type="submit" class="btn btn-primary mb-3">검색</button>
					</div>
				</div>
			</form>
		</footer>
	</div>
</body>
</html>