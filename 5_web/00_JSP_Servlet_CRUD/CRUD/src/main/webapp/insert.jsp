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
		<hr width="50%" color="gray">
			<h3>DEPT 테이블 부서 추가 폼 페이지</h3>
		<hr width="50%" color="gray">
		<br><br>
		
		<form method="post" action="insertOk">
			<table border="1" cellspacing="0">
				<tr> 
					<td>부서 No.</td>
					<td><input type="text" name="deptNo"></td>
				</tr>
				<tr> 
					<td>부서 명</td>
					<td><input type="text" name="deptName"></td>
				</tr>
				<tr> 
					<td>부서 위치</td>
					<td><input type="text" name="deptLoc"></td>
				</tr>
				<tr> 
					<td colspan="2" align="center">
						<input type="submit" value="부서추가">
						<input type="reset" value="다시작성">
					</td>
				</tr>
				
			</table>
		
		
		</form>
	</div>
</body>
</html>