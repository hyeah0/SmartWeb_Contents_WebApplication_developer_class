<%@page import="com.board.model.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% BoardDTO detailContent = (BoardDTO)request.getAttribute("detailContent"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/frame.css" rel="stylesheet">
</head>
<body>
	<div>
		<hr>
			<h3>BOARD 게시판 글 상세 수정 폼 페이지</h3>
		<hr>
		
		<br><br>
		
		<form method="post" action="<%=request.getContextPath() %>/update_ok.do?no=<%=detailContent.getBoard_no() %>">
			<input type="hidden" name="board_no" value="<%=detailContent.getBoard_no() %>"> 
			<table>
				<tr>
					<th>글제목</th>
					<td> <input type="text" name ="title" value="<%=detailContent.getBoard_title()  %>"></td>
					<th>작성자</th>
					<td> <input type="text" name ="writer" value="<%=detailContent.getBoard_writer()  %>" readonly> </td>
				</tr>
				
				<tr>
					<th colspan="5">게시글</th>
				</tr>
				<tr>
					<td colspan="5">
						<textarea rows="7" cols="25" name="content">
							<%=detailContent.getBoard_cont() %>
						</textarea>
					</td>
				</tr>
				<tr>
					<th colspan="3">비밀번호</th>
					<td> <input type="password" name="pwd">  </td>
				</tr>
				<tr>
					<th colspan="5"></th>
				</tr>
				<tr>
					<td colspan="5">
						<button type="submit">글 수정</button>
						<button type="reset">다시작성</button>
					</td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>