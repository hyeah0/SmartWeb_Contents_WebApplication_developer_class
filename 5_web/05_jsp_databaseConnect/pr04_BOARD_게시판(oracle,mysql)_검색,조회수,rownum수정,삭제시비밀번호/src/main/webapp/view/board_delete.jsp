<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% int board_no = Integer.valueOf(request.getParameter("no")); %>
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
			<h3>BOARD 게시판 글 삭제 폼 페이지</h3>
		<hr>
		
		<br>
		
		<form method="post" action="<%= request.getContextPath()%>/delete_ok.do?no=<%=board_no %>">
			<input type="hidden" name="board_no" value="<%=board_no %>">
			<table>
				<tr>
					<th>삭제할 비밀번호</th>
					<td><input type="password" name="pwd"> </td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit">글 삭제</button>
						<button type="reset">다시 작성</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
		
</body>
</html>