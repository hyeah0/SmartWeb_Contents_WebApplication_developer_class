<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* url로 넘어온 정보를 deptno 변수에 저장 */
	int deptno = Integer.valueOf(request.getParameter("deptno"));  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<hr width="50%" color="gray">
			<h3>DEPT 테이블 부서 추가 수정 폼 페이지</h3>
		<hr width="50%" color="gray">
		<br><br>
		
		<form method="post" action="updateOk">
			<table border="1" cellspacing="0">
				<tr> 
					<td>부서 No.</td>
					<td><input type="text" name="deptNo" value=<%=deptno %> readonly ></td>
				</tr>
				<tr> 
					<td>부 서 명</td>
					<td><input type="text" name="reName"></td>
				</tr>
				<tr> 
					<td>부서 위치</td>
					<td><input type="text" name="reLoc"></td>
				</tr>
				<tr> 
					<td colspan="2" align="center">
						<input type="submit" value="부서수정">
						<input type="reset" value="다시작성">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>