<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<h3>board 글쓰기</h3>
		<hr>
		<br>
		<form method="post" action="board_write_ok.do">
			<table class="formTable">
				<tr>
					<th>글 제목</th>
					<td> 
						<input name="input_title" class="form_title">
					</td>
					<th>작성자</th>
					<td> 
						<input name="input_writer">
					</td>
				</tr>
				<tr>
					<th colspan="4">게시글</th>
				</tr>
				<tr>
					<td colspan="4">
						<textarea  rows="10" cols="70" name="input_cont"></textarea>
					</td>
				</tr>
				<tr>
					<th>비밀번호 설정</th>
					<td colspan="3">
						<input type="password" name="input_pwd">
					</td>
				</tr>
				<tr class="table_tr_btn">
					<td colspan="4" >
						<input type="submit" value="글쓰기">
						<input type="reset" value="다시작성">
						<input type="button" value="목록" onclick="location.href='board_list.do'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>