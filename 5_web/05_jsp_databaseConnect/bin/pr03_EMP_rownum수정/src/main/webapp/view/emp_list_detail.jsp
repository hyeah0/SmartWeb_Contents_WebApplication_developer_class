<%@page import="model.EmpDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% EmpDTO dto = (EmpDTO) request.getAttribute("memberDList"); %>
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
			<h3>EMP 사원 상세</h3>
		<hr>
		<table>
			<%	if(dto != null){ %>
				<tr>
					<th>사원번호</th>
					<td>
						<%=dto.getEmpno() %>
					</td>
				</tr>
				<tr>
					<th>사원명 </th>
					<td>
						<%=dto.getEname() %>
					</td>
				</tr>
				<tr>
					<th>담당업무</th>
					<td>
						<%=dto.getJob() %>
					</td>
				</tr>
				<tr>
					<th>담당매니저</th>
					<td>
						<%=dto.getMgr() %>
					</td>
				</tr>
				<tr>
					<th>입사일</th>
					<td>
						<%=dto.getHiredate() %>
					</td>
				</tr>
				<tr>
					<th>급여</th>
					<td>
						<%=dto.getSal() %>
					</td>
				</tr>
				<tr>
					<th>보너스</th>
					<td>
						<%=dto.getComm() %>
					</td>
				</tr>
				<tr>
					<th>부서</th>
					<td>
						<%=dto.getDeptNameNo() %>
					</td>
				</tr>
			<% }else{ %>
				<tr>
					<td colspan="2">해당하는 사원의 상세 정보가 없습니다.</td>
				</tr>
			<% }%>
				<tr>
				<td colspan="2" align="center">
					<input type="button" value="사원수정" onclick="location.href='update.do?no=<%=dto.getEmpno() %>'" class="btn">
					<input type="button" value="사원삭제" onclick="if(confirm('정말로 삭제하시겠습니까?')){
																	location.href='delete.do?no=<%=dto.getEmpno() %>'
																}else{ return;} " class="btn">
					<input type="button" value="사원목록" onclick="location.href='select.do'" class="btn">
				</td>
			</tr>
		</table>
	</div>
</body>
</html>