<%@page import="com.member.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDTO dto_update = (MemberDTO) request.getAttribute("modify");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<hr color ="skyblue">
			<h3>MEMBER10 회원 수정 페이지</h3>
		<hr color ="skyblue">
		
		<form method="post" action="<%=request.getContextPath() %>/update_ok.do"> 
			<!-- 
				회원 번호와 같은 기본키는 고객이 수정할 수 없게 숨겨서 다른페이지로 넘긴다.
				name = dto_update.getNum()  
			-->
			<input type="hidden" name="num" value="<%=dto_update.getNum() %>">	
					
			<table border="1" cellspacing="0" class="table" >
				<tr>
					<th> 회원 아이디 </th>
					<td> 
						<input type="text" name="mem_id" 
					 	 		value="<%=dto_update.getMemid() %>"
					 	 		readonly> 
					 </td>
				</tr>
				
				<tr>
					<th> 회원 이름 </th>
					<td> 
						<input type="text" name="mem_name"
								value="<%=dto_update.getMemname() %>"
					 	 		readonly> 
					</td>
				</tr>
				<tr>
					<th> 회원 비밀번호 </th>
					<td> <input type="password" name="mem_pwd"
								value=""> 
					</td>
				</tr>
				
				<tr>
					<th> 회원 나이 </th>
					<td> <input type="number" name="mem_age"
								value="<%=dto_update.getAge() %>"> 
					</td>
				</tr>
				
				<tr>
					<th> 회원 마일리지 </th>
					<td> <input type="number" name="mem_mil"
								value="<%=dto_update.getMileage() %>"> 
					</td>
				</tr>
				
				<tr>
					<th> 회원 직업 </th>
					<td> <input type="text" name="mem_job"
							value="<%=dto_update.getJob() %>"> 
					</td>
				</tr>
				
				<tr>
					<th> 회원 주소 </th>
					<td> <input type="text" name="mem_addr"
								value="<%=dto_update.getAddr() %>"> 
					</td>
				</tr>
				
				<tr>
					<th colspan="2"> 
						<input type="submit" value="회원수정">
						<input type="reset" value="다시작성"> 
					</th>
				</tr>
			
			</table>
		</form>
	</div>
</body>
</html>