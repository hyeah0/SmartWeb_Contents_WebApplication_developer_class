<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/userCss/user_FindId.css"/>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">

function fnSubmit() {
	var frm = document.idfindscreen;
	
	if(frm.me_name.value.length < 1){
		alert("이름을 입력해주세요.");
		return;
	}
	
	if (frm.me_tel.value.length != 13) {
	   alert("핸드폰번호를 입력해주세요");
	   return;
	}
	frm.method="post";
	frm.action="member_findId_ok.do"; //넘어간화면
	frm.submit(); //등록이 될수 있는 조건이면, 정보를 보내겠다.
}
//휴대폰 (-) 자동입력 정규식
const phoneNumber = (target) => {
	target.value = target.value.replace(/[^0-9]/g, '').replace
	(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g,"");
}
</script>
</head>
<body>
	<form name="idfindscreen" class="box" method="post">
		<div class="search-title">
			<h3>휴대폰 본인확인</h3>
		</div>
	  <section class="form-search">
	  		<br>
	  		<div class="find-name">
	  			<label>이름</label>
	  			<input type="text" id="me_name" name="me_name" class="btn-name" placeholder="등록한이름">
	  		</div>
	  		<div class="find-phone">
	  			<label>번호</label>
	  			<input type="tel" onkeyup="addHypen(this)" id="me_tel" name="me_tel" class="btn-phone" 
	  			 oninput="phoneNumber(this)" maxlength="13" placeholder="휴대폰번호를 입력하세요.">
	  		</div>
	  		<br>
	  		<br>
	  </section>
	  <div class="btnSearch">
	  		<input type="button" class="btn-11" name="enter" value="찾기" onclick="fnSubmit()">
	  		<input type="button" class="btn-11" name="cancle" value="취소" onclick="history.back()">
	  </div>	
	</form>
</body>
</html>