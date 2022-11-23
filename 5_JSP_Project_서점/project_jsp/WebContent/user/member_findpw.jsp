<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/userCss/user_FindPw.css"/>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
function pw_search(){

	var frm = document.pwfindscreen;

	if(frm.mem_id.value.length<3){
	   alert("아이디를 올바르게 입력해주세요");
	   return;
	}
	
	if(frm.mem_mail.value.length < 1){
		alert("이메일주소를 입력해주세요")
		return;
	}
	
	if (frm.mem_phone.value.length != 13) {
	   alert("핸드폰번호를 정확하게 입력해주세요");
	   return;
	}
		
	frm.method="post";
    frm.action="member_findpw_ok.do"; //넘어간화면
	frm.submit(); //등록이 될수 있는 조건이면, 정보를 보내겠다.
 }

// 휴대폰 (-) 자동입력 정규식
const phoneNumber = (target) => {
	target.value = target.value.replace(/[^0-9]/g, '').replace
	(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g,"");
}
</script>
</head>
<body id="particles-js2">
	<form name="pwfindscreen" class="box" method = "POST">
			<div class = "search-title">
				<h3>비밀번호 찾기</h3>
			</div>
		<section class = "form-search">
			<br>
			<div class = "find-id">
				<label>ID</label>
				<input type="text" name="mem_id" class = "btn-name" placeholder = "FineApple ID" autocomplete="off">
			</div>
			
		<div class = "find-email">
			<label>E-mail</label>
			<input type="email" name="mem_mail" class="bin-mail" placeholder="FineE-Mail" autocomplete="off">
			</div>
			
		 <div class = "find-phone">
				<label>Phone</label>
				<input type="tel" onKeyup = "addHypen(this);" name="mem_phone" class = "btn-phone" 
				 oninput="phoneNumber(this)" maxlength="13" placeholder = "휴대폰번호를 '-'없이 입력">
			</div> 
		<br><br>
	</section>
	<div class ="btnSearch">
		<input type="button" class="btn-11" name="enter" value="찾기"  onClick="pw_search()">
		<input type="button" class="btn-11" name="cancle" value="취소" onClick="history.back()">
 	</div>
 </form>
</body>
</html>