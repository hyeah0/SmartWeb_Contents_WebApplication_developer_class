<%@page import="com.member.model.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	List<MemberDTO> memberList = (List<MemberDTO>) request.getAttribute("member"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
    
	hr{
		width : 50%;
		color : "gray";
	}
	
	table{
		width : 500px;
		text-align: center;
	}
	table tr:nth-child(1) {
		background-color: lightblue;
	}
	
	a{
		text-decoration: none;
		color: "black";
	}
}

</style>
</head>
<body>
	<div align="center">
		<hr>
			<h3>MEMBER10 테이블 메인 페이지</h3>
		<hr>
		
		<table border="1" cellspacing="0" class="table" >
		
			<tr>
				<th> 회원 No. </th>
				<th> 회원 아이디 </th>
				<th> 회원명 </th>
				<th> 회원가입일 </th>
			</tr>
		
		<!-- java -->
		<%
			if(memberList.size() != 0 ){ // 데이터가 있다면
				for(int i=0; i<memberList.size(); i++){
					MemberDTO dto = memberList.get(i);	
					/* = 오른쪽 값을 왼쪽에 저장한다. */
				
		%>
		
		<!-- html -->
			<tr>
				<td> <%=dto.getNum() %> </td>
				<td> <%=dto.getMemid() %> </td>
				<td> 
					<a href="<%=request.getContextPath() %>/content.do?num=<%=dto.getNum() %>">
						<%=dto.getMemname() %> 
					</a>
				</td>
				<td> <%=dto.getRegdate().substring(0,10) %> </td>	
				<!-- substring(시작글자, 종료글자) : 년월일까지  -->
			</tr>
		
		<!-- java -->
			<% 
				}
			} else{
				
			
			%>
		
		<!-- html -->
			<tr>
				<td colspan="4" align="center">
					<h3>회원 목록이 없습니다...</h3>
				</td>
			</tr>
		
		<!-- java -->
			<% } %>
		
		<!-- html -->
			<tr>
				<td colspan="4" align="right">
					<input type="button" value="회원등록" onclick="location.href='view/member_join.jsp'">
				</td>
			</tr>
		
		</table>
		
		
	</div>

</body>
</html>