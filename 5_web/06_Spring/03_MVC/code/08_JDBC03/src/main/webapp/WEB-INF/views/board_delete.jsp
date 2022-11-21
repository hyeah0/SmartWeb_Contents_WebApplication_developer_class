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
		<hr width="50%" color="blue">
			<h3>Board 테이블 게시글 삭제 폼 페이지</h3>
		<hr width="50%" color="blue">
		<br>
		<form method="post" action="<%=request.getContextPath() %>/board_delete_ok.do">
			<c:set var="dto" value="${dto }"/>
			<input type="hidden" name="board_no" value="${dto.getBoard_no() }">
			<input type="hidden" name="DB_pwd" value="${dto.getBoard_pwd() }">
 			<table boarder="1" cellspacing="0" width="350">
				<tr>
					<th>삭제할 글 비밀번호</th>
					<td>
						<input type="password" name="input_pwd">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="글 삭제">
						<input type="reset" value="다시작성">
					</td>
				</tr>
			</table>
		</form>
		
		
	</div>
</body>
</html>