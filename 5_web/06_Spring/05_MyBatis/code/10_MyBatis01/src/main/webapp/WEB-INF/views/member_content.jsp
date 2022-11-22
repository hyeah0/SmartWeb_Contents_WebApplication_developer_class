<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<hr width="50%" color="marmoon">
			<h3>MEMBER10 테이블 전체 회원 목록 페이지</h3>
		<hr width="50%" color="marmoon">
		<br>
		<c:set var="dto" value="${Cont }"/>
		<table border="1" cellspacing="0" width="800">
			<tr>
				<th>회원 번호</th>
				<td>${dto.getNum() }</td>
			</tr>
			<tr>
				<th>회원 아이디</th>
				<td>${dto.getMemid() }</td>
			</tr>
			<tr>
				<th>회원 이름</th>
				<td>${dto.getMemname() }</td>
			</tr>
			<tr>
				<th>회원 비밀번호</th>
				<td>
					<c:if test="${!empty dto.getPwd() }">
						<c:forEach begin="1" end="${dto.getPwd().length() }">
							*
						</c:forEach>
					</c:if>
				</td>
			</tr>
			<tr>
				<th>회원 나이</th>
				<td>${dto.getAge() }</td>
			</tr>
			<tr>
				<th>회원 마일리지</th>
				<td>${dto.getMileage() }</td>
			</tr>
			<tr>
				<th>회원 직업</th>
				<td>${dto.getJob() }</td>
			</tr>
			<tr>
				<th>회원 주소</th>
				<td>${dto.getAddr() }</td>
			</tr>
			<tr>
				<th>회원 등록일</th>
				<td>${dto.getRegdate().substring(0,10) }</td>
			</tr>
			<c:if test="${empty dto }">
				<tr>
					<td colspan="2" align="center">
						회원의 상세 정보가 없습니다.
					</td>
				</tr>
			</c:if>
			
			<tr>
				<th colspan="2">
					<input type="button" value="회원수정" onclick="location.href='member_modify.do?num=${dto.getNum() }'">
					<input type="button" value="회원삭제" onclick="if(confirm('정말로 회원을 삭제 하시겠습니까?')){location.href='member_delete.do?num=${dto.getNum() }'} else{ return; }">
					<input type="button" value="비밀번호 확인 후 회원삭제" onclick="if(confirm('정말로 회원을 삭제 하시겠습니까?')){location.href='member_ck_pwd.do?num=${dto.getNum() }'} else{ return; }">
					<input type="button" value="전체회원" onclick="location.href='member_list.do'">
				</th>
			</tr>
		</table>
	</div>
</body>
</html>