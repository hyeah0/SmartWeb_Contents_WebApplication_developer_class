<%@page import="com.board.model.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% List<BoardDTO> boardList = (List<BoardDTO>) request.getAttribute("boardList"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/frame.css" rel="stylesheet">
</head>
<!-- 글번호, 글제목, 작성자, 조회수, 작성일자 -->
<body>
	<div>
		<hr>
			<h3>BOARD 테이블 리스트</h3>
		<hr>
		
		<br><br>
		
		<table>
			<tr>
				<th>글번호</th>
				<th>글제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일자</th>
			</tr>
			<% if(boardList.size()!=0){ 
				for(int i=0; i<boardList.size(); i++){
					BoardDTO boardDTO = boardList.get(i);
				
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
		
		<br><br>
		<hr>
		<br><br>
		
		<!-- 검색관련 요청 태그  -->
		<form method="post" action="<%=request.getContextPath() %>/search.do">
			<select name="find_field">
				<!-- String find_field = "title" ...  -->
				<option value="title">제목</option>
				<option value="cont">내용</option>
				<option value="title_cont">제목+내용</option>
				<option value="writer">작성자></option>
			</select>
			
			<input type="text" name="find_keyword">
			<button type="submit">검색</button>
		</form>
		
		
	</div>
</body>
</html>