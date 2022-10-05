<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="css/frame.css" rel="stylesheet">
	<style type="text/css">
		.main_a{
			margin-top: 50px;
		}
	</style>
</head>
<!-- 
	사원 전체 목록 버튼 클릭시 emp 테이블에 잇는 사원 전체 목록을 화면에 출력 
	화면 출력 내용 : 사원번호, 이름, 부서번호, 입사일자
-->
<body>
	<div>
		<hr>
			<h3>EMP 테이블 메인 페이지</h3>
		<hr>
		
		<div class="main_a">
			<a href="<%=request.getContextPath() %>/select.do">[사원 전체 목록]</a>
		</div>
	</div>
</body>
</html>