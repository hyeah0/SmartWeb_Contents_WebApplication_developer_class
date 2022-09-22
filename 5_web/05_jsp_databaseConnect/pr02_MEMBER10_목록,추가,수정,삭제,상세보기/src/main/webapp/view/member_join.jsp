<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
    
	hr{
		width : 50%;
	}
}
	
</style>
</head>
<body>
	<div align="center">
		<hr color ="skyblue">
			<h3>MEMBER10 회원 등록 페이지</h3>
		<hr color ="skyblue">
		
		<!-- <form method="post" action="insert.do"> -->
		<form method="post" action="<%=request.getContextPath() %>/insert.do"> 
			<table border="1" cellspacing="0" class="table" >
			
				<tr>
					<th> 회원 아이디 </th>
					<td> <input type="text" name="mem_id"> </td>
				</tr>
				
				<tr>
					<th> 회원 이름 </th>
					<td> <input type="text" name="mem_name"> </td>
				</tr>
				<tr>
					<th> 회원 비밀번호 </th>
					<td> <input type="password" name="mem_pwd"> </td>
				</tr>
				
				<tr>
					<th> 회원 나이 </th>
					<td> <input type="number" name="mem_age"> </td>
				</tr>
				
				<tr>
					<th> 회원 마일리지 </th>
					<td> <input type="number" name="mem_mil"> </td>
				</tr>
				
				<tr>
					<th> 회원 직업 </th>
					<td> <input type="text" name="mem_job"> </td>
				</tr>
				
				<tr>
					<th> 회원 주소 </th>
					<td> <input type="text" name="mem_addr"> </td>
				</tr>
				
				<tr>
					<th colspan="2"> 
						<input type="submit" value="회원등록">
						<input type="reset" value="다시작성"> 
					</th>
				</tr>
			
			</table>
		</form>
	</div>
</body>
</html>