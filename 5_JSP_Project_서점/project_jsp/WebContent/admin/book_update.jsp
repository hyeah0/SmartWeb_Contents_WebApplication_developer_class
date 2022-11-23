<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>book update</title>
<link rel="stylesheet" href="css/section.css">
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
				<form action="<%=request.getContextPath()%>/book_update_ok.do"
					method="post" enctype="multipart/form-data">
					<table align="center" cellpadding="2" border="1" class="table text-center table-sm w-75">
						<c:set var="dto" value="${bookDTO }"></c:set>
						<c:set var="list" value="${categoryList }"></c:set>
						<tr>
							<th>책 이름</th>
							<td><input type="text" name="book_name" class="form-control" 
								value="${dto.getBook_name() }"><input type="hidden"
								name="book_num" value="${dto.getBook_num() }"></td>
						</tr>
						<tr>
							<th>책 장르</th>
							<td><select name="cgy_num" class="form-control" >
									<c:forEach var="item" items="${list }">
										<option value="${item.getCgy_num() }"
											<c:if test="${item.getCgy_num() eq dto.getCgy_num() }">selected</c:if>>[${item.getCgy_num() }]
											${item.getCgy_name() }</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<th>책 작가</th>
							<td><input type="text" name="book_writer" class="form-control" 
								value="${dto.getBook_writer() }"></td>
						</tr>
						<tr>
							<th>출판사</th>
							<td><input type="text" name="book_publisher" class="form-control" 
								value="${dto.getBook_publisher() }"></td>
						</tr>
						<tr>
							<th>출판일</th>
							<td><input type="date" name="book_date" class="form-control" 
								value="${dto.getBook_date().substring(0,10) }"></td>
						</tr>
						<tr>
							<th>표지</th>
							<td><input type="file" name="book_img" class="form-control" > <input
								type="hidden" name="book_old_img" value="${dto.getBook_img() }"></td>
						</tr>
						<tr>
							<th>페이지</th>
							<td><input type="number" name="book_page" min="0" class="form-control" 
								value="${dto.getBook_page() }"></td>
						</tr>
						<tr>
							<th>작가 소개</th>
							<td><textarea cols="50" rows="4" name="book_writer_cont" class="form-control">${dto.getBook_writer_cont() }</textarea></td>
						</tr>
						<tr>
							<th>목차</th>
							<td><textarea cols="50" rows="4" name="book_index" class="form-control">${dto.getBook_index() }</textarea></td>
						</tr>
						<tr>
							<th>책 내용</th>
							<td><textarea cols="50" rows="10" name="book_cont" class="form-control">${dto.getBook_cont() }</textarea></td>
						</tr>
						<tr>
							<th>책 가격</th>
							<td><input type="number" name="book_price" min="0" class="form-control" 
								value="${dto.getBook_price() }"></td>
						</tr>
						<tr>
							<th>책 재고</th>
							<td><input type="number" name="book_qty" min="0" class="form-control" 
								value="${dto.getBook_qty() }"></td>
						</tr>
						<tr>
							<th>판매량</th>
							<td><input type="number" name="book_sales" min="0" class="form-control" 
								value="${dto.getBook_sales() }"></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit" class="btn btn-outline-secondary"  
								value="수정"> <input type="reset" value="다시작성" class="btn btn-outline-secondary" ></td>
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