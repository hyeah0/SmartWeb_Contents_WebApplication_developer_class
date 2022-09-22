<%@page import="com.member.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDTO cont = (MemberDTO)request.getAttribute("content");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<hr>
			<h3>MEMBER10 테이블 회원 상세 정보</h3>
		<hr>	
		
		<table border="1" cellspacing="0" width="400">
			
			<!-- java -->
			<%
				if(cont != null){ // 데이터가있다면,
			%>
			
			<!-- html -->
					<tr>
						<th>회원 No.</th>
						<td> <%=cont.getMemname() %></td>
					</tr>
					<tr>
						<th>회원 이름</th>
						<td> <%=cont.getMemname() %></td>
					</tr>
					<tr>
						<th>회원 비밀번호</th>
						<td>
						<!-- java -->
							 <%
							    if(cont.getPwd().length()!=0){
							    	String tmp = "*";
							    	String hidePwd = tmp.repeat(cont.getPwd().length());
							    	/* for(int i=1; i<=cont.getPwd().length(); i++){ */
							 %>
							 		<%= hidePwd %>
							 <% 		
							    }
							 %>
						</td>
					</tr>
					<tr>
						<th> 회원 나이 </th>
						<td> <%=cont.getAge() %></td>
					</tr>
					<tr>
						<th> 회원 마일리지 </th>
						<td> <%=cont.getMileage() %></td>
					</tr>
					<tr>
						<th> 회원 직업 </th>
						<td> <%=cont.getJob() %></td>
					</tr>
					<tr>
						<th> 회원 주소 </th>
						<td> <%=cont.getAddr() %></td>
					</tr>
					
			<!-- java -->
			<%
				}else{ 	//데이터가 없다면,
				
			%>
			
			<!-- html  -->
					<tr>
						<td colspan="2" align="center">
							<h3>검색된 회원의 정보가 없습니다.</h3>
						</td>
					</tr>
			<%
				}
			%>
			
			<!-- html -->
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="회원수정" onclick="location.href='update.do?num=<%=cont.getNum() %>'">
					<input type="button" value="회원삭제" onclick="if(confirm('정말로 탈퇴하시겠습니까?')){
																	location.href='delete.do?num=<%=cont.getNum() %>'
																}else{ return;} ">
					<input type="button" value="회원목록" onclick="location.href='select.do'">
				</td>
			</tr>
					
		
		</table>
		
	</div>
</body>
</html>

<!-- 
String str = "abc";
String repeated = str.repeat(3);

repeated.equals("abcabcabc"); -->