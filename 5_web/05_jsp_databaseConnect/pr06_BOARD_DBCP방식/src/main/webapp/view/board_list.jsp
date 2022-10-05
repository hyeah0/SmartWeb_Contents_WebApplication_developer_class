<%@page import="com.board1.model.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% List<BoardDTO> list = (List<BoardDTO>)request.getAttribute("list"); %>
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
			<h3></h3>
		<hr>
		<tr>
			<th>글번호</th>
			<th>글제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성일자</th>
		</tr>
		<% if(list.size()!=0){ 
				for(int i=0; i<list.size(); i++){
					BoardDTO boardDTO = list.get(i);
				
			%>
					<tr>
						<td><%=boardDTO.getBoard_no() %></td>
						<td>
							<a href="<%=request.getContextPath() %>/board_content.do?no=<%=boardDTO.getBoard_no() %>">
								<%=boardDTO.getBoard_title() %>
							</a>
						</td>
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
					<button value="write" onclick="location.href='view/board_write.jsp'">글쓰기</button>
				</td>
			</tr>
		</table>
	</div>
	
</body>
</html>