<%@page import="com.khie.model.DeptDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	// request.getAttribute("key","value");
	// key는 setAttribute의 key값과 동일해야한다.
	// request.setAttribute("List", deltList); 
	// 에러 날 경우 import문 있는지 확인
	// <%@page import="com.khie.model.DeptDTO"%
	// %@page import="java.util.List"%
	
	List<DeptDTO> dept = (List<DeptDTO>) request.getAttribute("List");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<hr width="50%" color="red">
		<hr width="50%" color="red">
	
		<table border="1" cellspacing="0">
			<tr>
				<th> 부서 No. </th>
				<th> 부 서 명 </th>
				<th> 부서 위치 </th>
				<th> 부서 수정 </th>
				<th> 부서 삭제 </th>
			</tr>
		
			<!-- 자바코드 -->
			<% 
				if(dept.size() != 0 ){				// dept 에 데이터가 있다면,
				 	
				  for(int i=0; i<dept.size(); i++){ // 데이터 수만큼 반복해서 출력	
					  DeptDTO dto = dept.get(i);	// dept 주소값 가져옴 
			%>		
			
			<!-- html 코드 -->  	
				<tr>
					<td> <%=dto.getDeptno() %> </td>
					<td> <%=dto.getDname() %> </td>
					<td> <%=dto.getLoc() %> </td>
					<td>
						<!--
								onclick="location.href='[이동할jsp파일명].jsp?[변수명]=<;%=dto.[get가져올값변수명()] %>'"
								onclick="location.href='update.jsp?deptno=<;%=dto.getDeptno() %>'"
								ㄴ 클릭시 위치는 update.jsp 파일로 이동하고 , 변수명 deptno 값은 dto객체의 deptno이다.
								? : get방식으로 자료를 넘기는 방식(method = "get")
								상세내역 볼때 자주 사용(제품번호로 넘기기) 
								부서번호가 30인 부서수정 버튼을 눌렀을 경우 하단과 같이 url 확인이 가능하다.
								http://localhost:8282/05_Dept_databaseConnect/update.jsp?deptno=30
						  -->
						<input type="button" value="부서수정" onclick="location.href='update.jsp?deptno=<%=dto.getDeptno() %>'">
					</td>
					<td> 
						<input type="button" value="부서삭제" onclick="location.href='delete?deptno=<%=dto.getDeptno() %>'">
					</td>
				</tr>	
				
			<!-- 자바코드 -->  
			<%		  
				  } // for 문 끝
				 	
				}else{	//데이터가 없다면
			%>	
			
			<!-- html 코드 --> 	
				<tr>
					<td colspan="5" align="center">
						<h3>검색된 데이터가 없습니다.</h3>
					</td>		
				</tr>
			
			<!-- 자바코드 -->  
			<%		
				}
			%>
			
			<!-- html 코드 --> 
			<tr>
				<td colspan="5" align="right">
					<input type="button" value="부서추가" onclick="location.href='insert.jsp'">
				</td>
			</tr>
		
		</table>
	
	</div>
	
</body>
</html>