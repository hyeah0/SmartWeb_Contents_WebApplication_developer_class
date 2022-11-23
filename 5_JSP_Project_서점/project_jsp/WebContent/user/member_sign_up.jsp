<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//1. 한글처리 
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>JOIN</TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style>
	k:hover {
	 text-decoration: none;
	 color: #9354ED
	}

	tr {
	 border: 0px solid none;
	}

	#main-title {
	 color: black;
	 font-size: 65px;
	 font-weight: bold;
	}

	#sub-title {
	 color: black;
	 font-size: 12pt;
	}

	.moveNumber{
		text-align: center;
		width: 40px;
	}
	
</style>
</head>
<body>

 <form name="joinscreen" method="post" action="member_user_insert_ok.do" onsubmit="return enter()">

  <font face="Yang Rounded">
   <table width="900px" height="500px" align="center" style="background-color: #F6F6F6">
    <tr>
     <td>
      <table width="650px" align="center" border="0" style="color: black; font-size: 38px; margin-top: 5%">
       <tr>
        <td>
         <table width="550px" align="center" border="0" style="color: black; font-size: 20px;">
          <tr>
           <td>
            <table width="750px" align="center" border=0; style="background-color: white">
             <tr>
              <td align="center"><img src="" height="30px"></td>
              <td>&nbsp;회원가입</td>
              <td><div id="sub-title">| 정확한 정보를 입력해주세요.</div></td>
              <td width="300px"></td>
             </tr>
            </table>
           </td>
          </tr>
         </table>
        </td>
       </tr>

       <tr>
        <td>
         <table align="center" style="margin-top: -2%;">
          <tr>
           <td>
            <table align="center" border=0 style="background-color: none; border-color: black; 
            font-size: 15px; border-style: solid" width="450" height="350">
             
             <tr style="border: 1">
	              <br>
	              <td style="text-align: center; border: 1" id="title">ID</td>
	              <td style="color: red; font-size: 11px;">
	              	<input type="text" name="id" class="input_id">
	              	<input type="button" value="중복확인" onclick="openIdChk()">
	               	<input type="hidden" name="idDuplication" value="idUncheck" >
	              </td>
           	 </tr>
             <tr>
              	<td style="text-align: center;">FW</td>
              	<td><input type="password" id="pwd" name="pwd" value=""  title= "비밀번호 입력">
              	    <div class="feedback"></div>
                </td>
             </tr>
             
             <tr>
               <td style="text-align: center;">FW 확인</td>
               <td><input type="password" id="pwd1" name="pwd1" value="" title="비밀번호 재확인 입력">
              	   <div><font id="pwd_feedback" size="2"></font></div>
               </td>
             </tr>
            
             <tr>
              	<td style="text-align: center;">이름</td>
              	<td style="color: red; font-size: 11px;">
              		<input type="text" name="name" value=""> (공백없이 한글만 입력가능)
               	</td>
             </tr>
            
	         <tr>
	             <td style="text-align: center;">e-mail</td>
	             <td><input type="text" id="email" name="email" style="width: 80px" placeholder="hongildong"> @ 
	             	 <input type="text" id="e_domain" name="e_domain" value="" style="width: 80px">
	                 <select id="domain" id="domain" name="domain">
		             <option value="1">직접입력</option>
		             <option value="naver.com">naver.com</option>
		             <option value="hanmail.net">hanmail.net</option>
		             <option value="nate.com">nate.com</option>
		             <option value="yahoo.com">yahoo.com</option>
		             <option value="gmail.com">gmail.com</option></select>
	            </td>
	         </tr>
            
             <tr>
	             <td style="text-align: center;">연락처</td>
	             <td><select name="phone" id="phn1">
	               <option value="010" selected="selected">010</option>
	               <option value="011">011</option>
	               <option value="016">016</option>
	               <option value="017">017</option>
	             </select> - <input type="text" name="phone1" id="phn2" value="" style="width: 70px" maxlength="4"> - 
	             <input type="text" name="phone2" id="phn3" value="" style="width: 70px" maxlength="4"></td>
             </tr>
            
             <tr>
				<th id="title">주소</th>
				<td><input type="text" id="addrNo" name="addr" placeholder="주소입력"
				 aria-lable="주소입력" class="int" maxlength="20"></td>
			 </tr>
 
             <tr>
				<th id="title">카드번호</th>
				<td>
				  <input type="text" id="cradNum" name="cardNum" class="moveNumber" 
				   onkeyup="inputMoveNumber(this);" maxlength="4"/> - 
				  <input type="text" id="cradNum" name="cardNum1" class="moveNumber"
				   onkeyup="inputMoveNumber(this);" maxlength="4"/> - 
				  <input type="text" id="cradNum" name="cardNum2" class="moveNumber" 
				   onkeyup="inputMoveNumber(this);" maxlength="4"/> - 
				  <input type="text" id="cradNum" name="cardNum3" class="moveNumber" maxlength="4" /> 
				</td>
			 </tr>
			 
			 <tr>
				<th id="title">Card FW</th>
				<td><input type="password" id="cradPwd" name="cardPwd" class="moveNumber"
				     onkeyup="inputPW (this)" maxlength="4"/></td>
			 </tr>
			 
            </table>
           </td>
          </tr>
         </table>
       </td>
       </tr>
       <tr>
        <td>
         <table align="center" style="background-color: none;">
          <tr>
           <td>
	          <input type="submit" value="  가입  "
	           style="cursor: pointer; background-color: white; border: solid 2px black; color: black; 
	           font-weight: bold;"> 
	          
	           <input type="button" value="  취소  " 
	           style="cursor: pointer; background-color: white; border: solid 2px black; color: black; 
	           font-weight: bold;" onClick="cancle()">
            </td>
          </tr>
         </table>
        </td>
       </tr>
      </table>
     </td>
    </tr>
   </table>
  </font>
 </form>
 <script type="text/javascript">
 // 비밀번호 재확인 이벤트
 $('#pwd1').keyup(function() {
		let pass1 = document.getElementById('pwd').value;
		let pass2 = document.getElementById('pwd1').value;
		
		if(pass1 != "" || pass2 != ""){
			if(pass1 == pass2){
				$("#pwd_feedback").html('비밀번호가 일치합니다.');
				$("#pwd_feedback").attr('color','#2fb380');
				$("#pwd1").addClass("is-valid");
				$("#pwd1").removeClass("is-invalid");
			}else{
				$("#pwd_feedback").html('비밀번호가 일치하지 않습니다.');
				$("#pwd_feedback").attr('color','#dc3545');
				$("#pwd1").addClass("is-valid");
				$("#pwd1").removeClass("is-invalid");
			}
		}
	});
	
 	// 카드번호 관련 이벤트
	function inputMoveNumber(num) {
		if(isFinite(num.value)==false){
			alert('카드번호는 숫자만 입력할수 있습니다.');
			num.value="";
			return false;
		}
		
		max=num.getAttribute("maxlength");
		
		if(num.value.length>=max){
			num.nextElementSibling.focus();
		}
	}
	
	function inputPW(num1) {
		if(isFinite(num1.value)==false){
			alert('카드비밀번호는 숫자만 입력할수 있습니다.');
			num1.value="";
			return false;
		}
	}
	
	// 등록 버튼	
	 function enter() {  

	  	var frm = document.joinscreen;

	  	if(!frm.id.value) {
	   		alert("아이디를 입력해주세요");
	   		return false;
	  	}
	  	
		if(frm.idDuplication.value != "idCheck") {
		   	alert("중복확인을 눌러주세요");
		  	return false;
	  	}
		
	  	if(!frm.pwd.value) {
		   	alert("비밀번호를 입력해주세요");
		   	return false;
	  	}
	 	
	  	if(frm.pwd1.value != frm.pwd.value) {
		   	alert("비밀번호를 동일하게 입력하세요.");
		   	return false;
	 	}
	  	
	  	if(!frm.name.value) {
		   	alert("이름을 입력해주세요");
		   	return false;
	 	}
	  	
	  	if(frm.email.value.length ==0 || frm.e_domain.value.length == "") {
	 	   alert("이메일을 입력해주세요");
	 	   return false;
	   	}
	  	
	  	if(frm.phone1.value.length<2 || frm.phone1.value.length>4) {
		   alert("핸드폰번호를 정확하게 입력해주세요");
		   return false;
	  	}
	  	
	  	if(frm.phone2.value.length == 0 || frm.phone2.value.length == "") {
		   alert("핸드폰번호를 정확하게 입력해주세요");
		   return false;
	  	}
	  	
	  	if(!frm.addr.value){
	  		alert("주소를 입력해주세요.");
	  		return false;
	  	}
	  	if(frm.cardNum.value <4 || frm.cardNum1.value<4 || frm.cardNum2.value<4 || frm.cardNum3.value<4 ){
	  		alert("카드번호를 입력해주세요.");
	  		return false;
	  	}
	  	
	  	if(!frm.cardPwd.value){
	  		alert("카드비밀번호를 입력해주세요.");
	  		return false;
	  	} 
	 }
	
	//이메일 직접 입력인 경우와 자동 선택을 구분
	$('#domain').change(function(){
		$("#domain option:selected").each(function(){
			if($(this).val()== '1'){ //직접입력일 경우
				$("#e_domain").val(''); 
				$("#e_domain").attr("readonly",false); //활성화
			}else{ //직접입력이 아닐경우
				$("#e_domain").val($(this).text()); //선택값 입력 
				$("#e_domain").attr("readonly", true);
			}
		})
	});
	
    // 취소 버튼 클릭시 첫화면 이동
    function cancle() {
		location.href="member_login.do";
	}
    
 	// 아이디 중복체크 화면open
	function openIdChk(){
	
		window.name = "parentForm";
		window.open("user/member_IdCheckForm.jsp",
				"chkForm", "width=500, height=300, resizable = no, scrollbars = no");	
	}

	// 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
	// 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
	// 다시 중복체크를 하도록 한다.
	function inputIdChk(){
		document.userInfo.idDuplication.value ="idUncheck";
	}

</script>
</body>
</html>