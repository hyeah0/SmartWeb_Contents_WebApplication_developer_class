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
			<h3>BOARD 게시글 수정</h3>
		<hr width="50%" color="marmoon">
		
		<br>
		<form method="post" action="<%=request.getContextPath()%>/board_update_ok.do?page=${page }">
			<input type="hidden" name="board_no" value="${cont.getBoard_no() }">
			<input type="hidden" name="board_pwd" value="${cont.getBoard_pwd() }">
			<table border="1" cellspacing="0" width="350">
				<tr>
					<th>작성자</th>
					<td>
						${cont.getBoard_writer() }
					</td>
				</tr>
				<tr>
					<th>글 제목</th>
					<td>
						<input name="board_title" value="${cont.getBoard_title() }">
					</td>
				</tr>
				<tr>
					<th>글 내용</th>
					<td>
						<textarea rows="7" cols="25" name="board_cont" >${cont.getBoard_cont() }</textarea>
					</td>
				</tr>
				<tr>
					<th>글 비밀번호</th>
					<td>
						<input type="password" name="input_pwd">
					</td>
				</tr>
				<tr>
				 	<th colspan="2">
				 		<input type="submit" value="수정"> 
				 		<input type="reset" value="취소"> 
				 		<input type="button" value="목록" onclick="location.href='<%=request.getContextPath() %>/board_list.do?page=${page }'"> 
				 	</th>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>