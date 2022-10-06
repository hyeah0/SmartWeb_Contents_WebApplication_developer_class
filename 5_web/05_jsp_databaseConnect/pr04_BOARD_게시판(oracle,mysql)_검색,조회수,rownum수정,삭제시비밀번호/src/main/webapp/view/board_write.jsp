<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<h3>BOARD 게시판 글쓰기 폼페이지</h3>
		<hr>
		
		<br><br>
		
		<form method="post" action="<%=request.getContextPath() %>/insert.do">
			<table>
				<tr>
					<th>작성자</th>
					<td> <input type="text" name="board_writer" > </td>
				</tr>
				<tr>
					<th>글제목</th>
					<td> <input type="text" name="board_title" > </td>
				</tr>
				<tr>
					<th>글내용</th>
					<td>
						<textarea id="board_cont" name="board_cont" rows="5" cols="33">
						</textarea> 
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td> <input type="password" name="board_pwd" > </td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit">글쓰기</button>
						<button type="reset">다시작성</button>
					</td>
				</tr>
			</table>		
		</form>
	</div>
</body>
</html>