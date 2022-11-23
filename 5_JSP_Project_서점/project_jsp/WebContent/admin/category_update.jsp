<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>category_update</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/section.css">
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
				<form action="<%=request.getContextPath()%>/category_update_ok.do"
					method="post">
					<table align="center" cellpadding="2" border="1" class="table text-center table-sm w-75">
						<c:set var="dto" value="${dto }"></c:set>
						<tr>
							<th>카테고리 넘버</th>
							<td><input type="text" name="cgy_num_update" value="${dto.getCgy_num() }" class="form-control" >
							<input type="hidden" name="cgy_num" value="${dto.getCgy_num() }"></td>
						</tr>
						<tr>
							<th>장르 이름</th>
							<td><input type="text" name="cgy_name_update" value="${dto.getCgy_name() }" class="form-control" ></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit" value="수정" class="btn btn-outline-secondary" >
							<input type="reset" value="다시작성" class="btn btn-outline-secondary" >
							<input type="button" value="삭제" onclick="if(confirm('정말로 삭제하시겠습니까?')){
								location.href = '<%=request.getContextPath() %>/category_delete.do?cgy_num=${dto.getCgy_num() }'
							}" class="btn btn-outline-secondary" ></td>
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