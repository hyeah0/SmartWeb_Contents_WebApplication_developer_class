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
		<hr width="50%" color="blue">
			<h3>Board 테이블 ${boardCont.getBoard_writer() } 님 게시판 상세</h3>
		<hr width="50%" color="blue">
		<br>
		<table border="1" cellspacing="0" width="800">
			<c:if test="${!empty boardCont }">
				<tr>
					<th>작성자</th>
					<td>${boardCont.getBoard_writer() }</td>
					<th>조회수</th>
					<td>${boardCont.getBoard_hit() }</td>
				</tr>
				<tr>
					<c:if test="${!empty boardCont.getBoard_update() }">
						<th>작성일</th>
						<td>${boardCont.getBoard_date() }</td>
						<th>수정일</th>
						<td>${boardCont.getBoard_update() }</td>
					</c:if>
					<c:if test="${empty boardCont.getBoard_update() }">
						<th>작성일</th>
						<td colspan="3">${boardCont.getBoard_date() }</td>
					</c:if>
				</tr>
				<tr>
					<th>글 제목</th>
					<td colspan="3">${boardCont.getBoard_title() }</td>
				</tr>
				<tr>
					<th>글 내용</th>
					<td colspan="3">
						<textarea rows="20" cols="50" readonly>${boardCont.getBoard_cont() }</textarea>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td colspan="3">
					<c:if test="${!empty boardCont.getBoard_pwd() }">
						<c:forEach begin="1" end="${boardCont.getBoard_pwd().length() }" >
							*
						</c:forEach>
					</c:if>
					</td>
					<%-- <td colspan="2">${boardCont.getBoard_pwd() }</td> --%>
				</tr>
			</c:if>
			<c:if test="${empty boardCont }">
				<tr>
					<th colspan="4">데이터가 없습니다.</th>
				</tr>
			</c:if>
			<tr>
				<th colspan="4">
					<input type="button" value="수정" onclick="location.href='<%=request.getContextPath()%>/board_update.do?board_no=${boardCont.getBoard_no() }'">
					<input type="button" value="삭제" onclick="if(confirm('정말 삭제하시겠습니까?')){location.href='board_delete.do?board_no=${boardCont.getBoard_no() }'} else{ return;}">
					<input type="button" value="메인" onclick="location.href='<%=request.getContextPath()%>/board_list.do'">
				</th>
			</tr>
		</table>
	</div>
</body>
</html>