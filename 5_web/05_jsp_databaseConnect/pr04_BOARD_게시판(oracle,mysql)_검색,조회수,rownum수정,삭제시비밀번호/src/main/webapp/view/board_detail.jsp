<%@page import="com.board.model.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% BoardDTO detailContent = (BoardDTO)request.getAttribute("detailContent"); %>
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
			<h3>BOARD 게시판 글상세</h3>
		<hr>
		
		<table>
			<% if(detailContent != null){ %>
			<tr>
				<th colspan="2" class="dedail_th_top">작성일</th>
				<th class="dedail_th_top">수정일</th>
				<th>조회수</th>
			</tr>
			
			<!-- 수정 되었을때 
				if(detailContent.getBoard_update() == null){
					<th>작성일자</th>
					<td>%= detailContent.getBoard_date %></td>
				}else{
					<th>수정일자</th>
					<td>%= detailContent.getBoard_update %></td>
				}
			
			 -->
			<tr>
				<td colspan="2"> <%=detailContent.getBoard_date() %></td>
				<td> <%=detailContent.getBoard_update() %></td>
				<td> <%=detailContent.getBoard_hit() %> </td>
			</tr>
			<tr>
				<th>글제목</th>
				<td> <%=detailContent.getBoard_title() %></td>
				<th>작성자</th>
				<td> <%=detailContent.getBoard_writer() %></td>
			</tr>
			
			<tr>
				<th colspan="5">게시글</th>
			</tr>
			<tr>
				<td colspan="5">
					<%=detailContent.getBoard_cont() %>
				</td>
			</tr>
			<tr>
				<th colspan="3">비밀번호</th>
					<%if(detailContent.getBoard_pwd().length()!= 0){ 
						String str = "*";
						String hidePwd = str.repeat(detailContent.getBoard_pwd().length());
					%> 
						<td colspan="2"> <%=hidePwd %></td>
					<% } else{ %>
						<td> 비밀번호가 없습니다.</td>
					<% } %>
			</tr>
			<tr>
				<th colspan="5"></th>
			</tr>
			<tr>
				<td colspan="5">
					<button onclick="location.href='update.do?no=<%=detailContent.getBoard_no() %>'">수정</button>
					<button onclick="location.href='view/board_delete.jsp?no=<%=detailContent.getBoard_no() %>'">삭제</button>
					<button onclick="location.href='select.do'">목록</button>
				</td>
			</tr>
			<% }else{ %>
				<tr>
					<th colspan="5">게시글</th>
				</tr>
				<tr>
					<td colspan="5">
						자료가 없습니다.
					</td>
				</tr>
			<% } %>
		</table>
	</div>

</body>
</html>