<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<hr width="50%" color="marmoon">
			<h3>BOARD 게시판 상세</h3>
		<hr width="50%" color="marmoon">
		
		<br>
		<form method="post" action="<%=request.getContextPath()%>/board_write_ok.do">
			<table border="1" cellspacing="0" width="350">
				<tr>
					<th>작성자</th>
					<td>
						<input name="board_writer">
					</td>
				</tr>
				<tr>
					<th>글 제목</th>
					<td>
						<input name="board_title">
					</td>
				</tr>
				<tr>
					<th>글 내용</th>
					<td>
						<textarea rows="7" cols="25" name="board_cont"></textarea>
					</td>
				</tr>
				<tr>
					<th>글 비밀번호</th>
					<td>
						<input type="password" name="board_pwd">
					</td>
				</tr>
				<tr>
				 	<th colspan="2">
				 		<input type="submit" value="작성"> 
				 		<input type="reset" value="취소"> 
				 		<input type="button" value="목록" onclick="location.href='<%=request.getContextPath() %>/board_list.do'"> 
				 	</th>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>