<%@page import="model.DeptDTO"%>
<%@page import="model.EmpDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//담당업무 리스트
	List<String> jobList = (List<String>) request.getAttribute("job");

	// 관리자 리스트
	List<EmpDTO> mgrList = (List<EmpDTO>) request.getAttribute("mgr");
	
	// 부서테이블 전체 리스트
	List<DeptDTO> deptList = (List<DeptDTO>) request.getAttribute("dept");
	
	// 사원 상세 정보 리스트
	EmpDTO dto = (EmpDTO) request.getAttribute("memberDList");
%>
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
			<h3>EMP 사원 수정</h3>
		<hr>
		<form method="post" action="<%=request.getContextPath() %>/update_ok.do">
			<table>
				<tr>
					<th>사원번호</th>
					<td>
						<input type="text" name = "empno" value="<%=dto.getEmpno() %>" readonly>
					</td>
				</tr>
				<tr>
					<th>사원명 </th>
					<td>
						<input type="text" name = "ename" value="<%=dto.getEname() %>">
					</td>
				</tr>
				<tr>
					<th>담당업무</th>
					<td>
						<select name="job">
							<% if(jobList.size() == 0){ %>
									<option value="">:::담당 업무 없음:::</option>
							<% }else{
									for(int i=0; i<jobList.size(); i++){
										String str = jobList.get(i);
										
										if(str.equals(dto.getJob())){		%>			
									<option value="<%=str %>" selected>
												   <%=str %>
									</option>
							<%			}else{ 								%>
										<option value="<%=str %>">
												   <%=str %>
										</option>
							<% 			} 
									}
								}
							%>
						</select>
					</td>
				</tr>
				<tr>
					<th>담당매니저</th>
					<td>
						<select name="mgr">
							<% if(mgrList.size() == 0){ %>
									<option value="">:::관리자 없음:::</option>
							<% }else{
									for(int i=0; i<mgrList.size(); i++){
										EmpDTO empDto = mgrList.get(i);
										if(empDto.getEmpno() == dto.getMgr()){		
							%>			
										<option value="<%=empDto.getEmpno() %>"selected>
											<%=empDto.getEname() %> [<%=empDto.getEmpno() %>]
										</option>
							<%			}else{ 								
							%>
										<option value="<%=empDto.getEmpno() %>">
										<%=empDto.getEname() %> [<%=empDto.getEmpno() %>]
										</option>
							
							<% 			} 
									}
								}
							%>
							
						</select>
					</td>
				</tr>
				<tr>
					<th>급여</th>
					<td>
						<input type="number" name = "sal" value="<%=dto.getSal() %>">
					</td>
				</tr>
				<tr>
					<th>보너스</th>
					<td>
						<input type="number" name = "comm" value="<%=dto.getComm() %>">
					</td>
				</tr>
				<tr>
					<th>부서</th>
					<td>
						<select name="dept">
							<% if(deptList.size() == 0){ %>
									<option value="">:::부서 없음:::</option>
							<% }else{
									for(int i=0; i<deptList.size(); i++){
										DeptDTO deptDto = deptList.get(i);
										if(deptDto.getDeptno()== dto.getDeptno()){		
							%>			
										<option value="<%=deptDto.getDeptno() %>"	selected>
											<%=deptDto.getDname() %> [<%=deptDto.getDeptno() %>]
										</option>
							<%			}else{ 								
							%>
										<option value="<%=deptDto.getDeptno() %>">
											<%=deptDto.getDname() %> [<%=deptDto.getDeptno() %>]
										</option>
							
							<% 			} 
									}
								}
							%>
							
						</select>
					</td>
				</tr>
				<tr>
				<td colspan="2">
					<input type="submit" value="사원수정" class="btn">
					<input type="reset" value="다시작성" class="btn">
				</td>
		</form>
	</div>
</body>
</html>