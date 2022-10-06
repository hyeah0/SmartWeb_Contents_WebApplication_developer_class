<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body> 
	<div>
		<hr>
			<h3>board ${dto.getBoard_writer() } 님 게시물 수정하기</h3>
		<hr>
		<c:set var="dto" value="${content }"/>
		<form method="post" action="<%=request.getContextPath() %>/board_update_ok.do?no=${dto.getBoard_no() }&page=${currentpage}&type=${requesttype}">
			<input type="hidden" name="uri_no" value = <%=request.getParameter("no") %>>
			<input type="hidden" name="uri_el_no" value = ${param.no} >
			<table class="formTable">
				<tr>
					<th>작성일</th>
					<td>${dto.getBoard_date().substring(0,10) } </td>
				</tr>
				<tr>
					<th>글 제목</th>
					<td> 
						<input name="input_title" class="form_title" value="${dto.getBoard_title() }">
					</td>
					<th>작성자</th>
					<td> 
						${dto.getBoard_writer() }
					</td>
				</tr>
				<tr>
					<th colspan="4">게시글</th>
				</tr>
				<tr>
					<td colspan="4">
						<textarea  rows="10" cols="70" name="input_cont">${dto.getBoard_cont() }</textarea>
					</td>
				</tr>
				<tr class="table_tr_btn">
					<td colspan="4" >
						<input type="submit" value="수정">
						<input type="reset" value="다시작성">
						<input type="button" value="목록" onclick="location.href='board_list.do'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>