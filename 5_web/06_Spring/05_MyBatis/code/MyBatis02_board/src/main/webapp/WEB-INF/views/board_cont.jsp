<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<hr width="50%" color="marmoon">
			<h3>BOARD 게시판 상세</h3>
		<hr width="50%" color="marmoon">
		
		<br>
		<table border="1" cellspacing="0" width="600">
		<c:set var="cont" value="${cont }"/>
			<tr>
				<c:if test="${empty cont.getBoard_update()}">
					<th>작성일</th> 
					<td>${cont.getBoard_date() }</td>
					<th>조회수</th>
					<td>${cont.getBoard_hit() }</td>
				</c:if>
				<c:if test="${!empty cont.getBoard_update()}">
					<th>작성일 / 수정일</th>
					<td>${cont.getBoard_date() } / ${cont.getBoard_update() } </td>
					<th>조회수</th>
					<td>${cont.getBoard_hit() }</td>
				</c:if>
			</tr>
			<tr>
				<th>작성자</th>
				<td colspan="3">${cont.getBoard_writer() }</td>
			</tr>
			<tr>
				<th>글 제목</th>
				<td colspan="3">${cont.getBoard_title() }</td>
			</tr>
			<tr>
				<th>글 내용</th>
				<td colspan="3">
					<textarea rows="7" cols="25" readonly>${cont.getBoard_cont() }</textarea>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td colspan="3">
					<c:if test="${!empty cont.getBoard_pwd() }">
						<c:forEach begin="1" end="${cont.getBoard_pwd().length() }">
							*
						</c:forEach> 
					</c:if>
				</td>
			</tr>
			<tr>
				<th colspan="4">
					<input type="button" value="수정" onclick="location.href='<%=request.getContextPath() %>/board_update.do?no=${cont.getBoard_no() }&page=${page}'">
					<input type="button" value="삭제" onclick="if(confirm('정말 삭제하시겠습니까? ')){
					                                         location.href='<%=request.getContextPath() %>/board_delete.do?no=${cont.getBoard_no() }&page=${page}'
					                                         }else{ return; }">
					<input type="button" value="비밀번호 확인 후 삭제" onclick="location.href='<%=request.getContextPath() %>/board_ck_pwd.do?no=${cont.getBoard_no() }&page=${page}'">
					<input type="button" value="목록" onclick="location.href='<%=request.getContextPath() %>/board_list.do?page=${page}'">
				</th>
			</tr>
		</table>
	</div>
</body>
</html>