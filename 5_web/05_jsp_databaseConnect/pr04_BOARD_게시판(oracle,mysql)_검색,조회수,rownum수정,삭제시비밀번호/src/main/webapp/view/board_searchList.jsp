<%@page import="com.board.model.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% List<BoardDTO> searchList = (List<BoardDTO>) request.getAttribute("searchList");  %>
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
			<h3>BOARD 테이블 리스트</h3>
		<hr>
		
		<br>
		
		<table>
			<tr>
				<th>글번호</th>
				<th>글제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일자</th>
			</tr>
			<% if(searchList.size()!=0){ 
				for(int i=0; i<searchList.size(); i++){
					BoardDTO boardDTO = searchList.get(i);
				
			%>
					<tr>
						<td><%=boardDTO.getBoard_no() %></td>
						<td><%=boardDTO.getBoard_title() %></td>
						<td><%=boardDTO.getBoard_writer() %></td>
						<td><%=boardDTO.getBoard_hit() %></td>
						<td><%=boardDTO.getBoard_date() %></td>
					</tr>
					
			<% 		}
				} else{ %>
				<tr>
					<td colspan="5">게시글이 없습니다.</td>
				</tr>
			<% } %>
			
			<tr>
				<td colspan="5">
					<button value="write" onclick="location.href='select.do'">전체 게시물</button>
				</td>
			</tr>
		</table>
		
	</div>

</body>
</html>