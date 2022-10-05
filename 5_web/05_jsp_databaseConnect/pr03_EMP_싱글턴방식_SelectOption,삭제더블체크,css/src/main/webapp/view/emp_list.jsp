<%@page import="model.EmpDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% List<EmpDTO> empMember = (List<EmpDTO>) request.getAttribute("empMember"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="css/frame.css" rel="stylesheet">
</head>
<!-- 
	사원 전체 목록 버튼 클릭시 emp 테이블에 잇는 사원 전체 목록을 화면에 출력 
	화면 출력 내용 : 사원번호, 이름, 부서번호, 입사일자
-->
<body>
	<div>
		<hr>
			<h3>EMP 사원 목록</h3>
		<hr>
		
		<table>
			<tr>
				<th>사 원 번 호</th>
				<th>사 원 이 름</th>
				<th>부 서 번 호</th>
				<th>입 사 일 자</th>
			</tr>
			
			<% 
				if(empMember.size() != 0){
					for(int i=0; i<empMember.size(); i++){
						EmpDTO dto = empMember.get(i);
			%>
						<tr>
							<td><%=dto.getEmpno() %> </td>
							<td>
								<a href="<%=request.getContextPath()%>/content.do?no=<%=dto.getEmpno()%>">
									<%=dto.getEname() %>
								</a>  
							</td>
							<td><%=dto.getDeptno() %> </td>
							<td><%=dto.getHiredate() %> </td> 
						</tr>
			<% 		}	
				}else{
			%>		
						<tr>
							<td colspan="4">사원이 없습니다.</td>
						</tr>
			<% } %>
			
			<tr>
				<td colspan="4">
					<input type="button" value="사원등록" onclick="location.href='insert.do'" class="btn">
				</td>
			</tr>
		</table>
	</div>

</body>
</html>