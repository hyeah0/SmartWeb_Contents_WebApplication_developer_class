<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>book insert</title>
<link rel="stylesheet" href="css/section.css">
</head>
<body>
	<div class="wapper">
		<!--헤더시작-->
		<header align="center">
			<jsp:include page="/include/header.jsp" /></a>
		</header>
		<!--네비게이션-->

		<nav></nav>
		<!--콘텐츠부분-->
		<section>
			<article>
				<form action="<%=request.getContextPath()%>/book_insert_ok.do"
					method="post" enctype="multipart/form-data">
					<table align="center" cellpadding="2" border="1" class="table text-center table-sm w-75">
						<c:set var="list" value="${categoryList }"></c:set>
						<tr>
							<th>책 이름</th>
							<td><input type="text" name="book_name" class="form-control" ></td>
						</tr>
						<tr>
							<th>책 장르</th>
							<td><select name="cgy_num" class="form-control" >
									<c:forEach var="item" items="${list }">
										<option value="${item.getCgy_num() }">[${item.getCgy_num() }]
											${item.getCgy_name() }</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<th>책 작가</th>
							<td><input class="form-control"  type="text" name="book_writer"></td>
						</tr>
						<tr>
							<th>출판사</th>
							<td><input class="form-control"  type="text" name="book_publisher"></td>
						</tr>
						<tr>
							<th>출판일</th>
							<td><input class="form-control"  type="date" name="book_date"></td>
						</tr>
						<tr>
							<th>표지</th>
							<td><input class="form-control"  type="file" name="book_img"></td>
						</tr>
						<tr>
							<th>페이지</th>
							<td><input class="form-control"  type="number" name="book_page" min="0" value="0"></td>
						</tr>
						<tr>
							<th>작가 소개</th>
							<td><textarea class="form-control"  cols="50" rows="4" name="book_writer_cont"></textarea></td>
						</tr>
						<tr>
							<th>목차</th>
							<td><textarea class="form-control" cols="50" rows="4" name="book_index"></textarea></td>
						</tr>
						<tr>
							<th>책 내용</th>
							<td><textarea class="form-control" cols="50" rows="10" name="book_cont"></textarea></td>
						</tr>
						<tr>
							<th>책 가격</th>
							<td><input type="number" name="book_price" min="0" value="0" class="form-control" ></td>
						</tr>
						<tr>
							<th>책 재고</th>
							<td><input type="number" name="book_qty" min="0" value="0" class="form-control" ></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit" class="btn btn-outline-secondary" 
								value="추가"> <input type="reset" value="다시작성" class="btn btn-outline-secondary" ></td>
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