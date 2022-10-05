<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<div>
		<c:set var="dto" value="${content }"/>
		<c:set var="page" value="${nowpage }"/>
		<hr>
			<h3>board ${dto.getBoard_writer() } 님 게시물 상세 보기</h3>
		<hr>
		<br>
			<table class="contentTable">
				<input type="hidden" name="db_pwd" value="${dto.getBoard_pwd() }" >
				<tr>
					<c:if test="${empty dto.getBoard_update()}">	
						<th>작성일</th>
						<td> 
							${dto.getBoard_date().substring(0,10) }
						</td>
					</c:if>
					
					<c:if test="${!empty dto.getBoard_update()}">
						<th>작성일 / 수정일</th>
						<td> 
							${dto.getBoard_date().substring(0,10) } / ${dto.getBoard_update().substring(0,10) }
						</td>
					</c:if>
					
					<th>조회수</th>
					<td>
						${dto.getBoard_hit() }
					</td>
				</tr>
				
				<tr>
					<th>글 제목</th>
					<td> 
						${dto.getBoard_title() }
					</td>
					<th>작성자</th>
					<td> 
						${dto.getBoard_writer() }
					</td>
				</tr>
				<tr>
					<th colspan="4">게시글</th>
				</tr>
				<tr>
					<td colspan="4">
						<textarea  rows="10" cols="70" name="input_cont" readonly>${dto.getBoard_cont() }</textarea>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td colspan="3">
						<c:if test="${dto.getBoard_pwd().length() != 0 }">
							<c:forEach begin="1" end="${dto.getBoard_pwd().length() }" var="i">
								*
							</c:forEach>
						</c:if>
					</td>
				</tr>
				
				<c:if test="${empty dto }">
					<tr>
						<td colspan="4">게시물이 없습니다.</td>
					</tr>
				</c:if>
				
				<tr class="table_tr_btn">
					<td colspan="4" >
						<input type="button" value="수정" onclick="location.href='board_update.do?no=${dto.getBoard_no() }'&page=${page}">
						<input type="button" value="삭제" onclick="location.href='board_delete.do?no=${dto.getBoard_no() }'&page=${page}'">
						<input type="button" value="목록" onclick="location.href='board_list.do'">
					</td>
				</tr>
			</table>
	</div>
</body>
</html>