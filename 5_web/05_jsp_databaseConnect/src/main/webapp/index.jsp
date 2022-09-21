<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서(DEPT) 테이블</title>
</head>
<body>

	<div align="center">
		<hr width="50%" color="blue">
			<h3>DEPT 테이블 메인 페이지</h3>
		<hr width="50%" color="blue">
		<br><br>
		
		<a href="<%=request.getContextPath() %>/select">[전체 부서 목록]</a>
		
		<% 
			System.out.println(request.getContextPath());
			/* ==> /05_Dept_databaseConnect  */
		%>
		<!-- 클릭시 전체 부서 목록을 보여줌(DEPT 테이블) -->
		<!-- 
			request.getContextPath()
			- 현재 프로젝트명을 문자열로 반환해 주는 메서드
			- http://localhost:8282/05_Dept_databaseConnect/select
			- --------------------  ---------------------- --------
			   ㄴ 
			                         ㄴ 현재 프로젝트명
			                                                 ㄴ form에서 엑션명
			                                                 ㄴ 1:1 연결시 servlet이름
			<%-- <a href="<%=request.getContextPath() %>/select">  /select ==> servlet이름 --%>                                               
		 -->	
	
	</div>



</body>
</html>