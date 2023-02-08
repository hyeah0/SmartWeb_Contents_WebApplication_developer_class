<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<style type="text/css">
.side{
 margin-top: 200px;
 margin-left: 400px;
}
.form-main{
 
 margin-top: 150px;
 width: 60%;
 margin-left: 400px;
}
.form-control {
    display: block;
    width: 50%;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #212529;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    border-radius: 0.375rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}

</style>

<script type="text/javascript">

var pw_passed = true;  // 추후 벨리데이션 처리시에 해당 인자값 확인을 위해

function fn_pw_check() {

    var pw = document.getElementById("exampleFormControlInput1").value; //비밀번호

    var pw2 = document.getElementById("exampleFormControlInput2").value; // 확인 비밀번호
   
    pw_passed = true;





    var pattern1 = /[0-9]/;

    var pattern2 = /[a-zA-Z]/;

    var pattern3 = /[~!@\#$%<>^&*]/;     // 원하는 특수문자 추가 제거

    var pw_msg = "";


    if(pw.length == 0) {

           alert("비밀번호를 입력해주세요");

           return false;
     } else {

            if( pw  !=  pw2) {

                  alert("비밀번호가 일치하지 않습니다.");

                  history.back();
             }

     }
   if(!pattern1.test(pw)||!pattern2.test(pw)||!pattern3.test(pw)||pw.length<8||pw.length>50){

        alert("영문+숫자+특수기호 8자리 이상으로 구성하여야 합니다.");

        return false;
    }          


    var SamePass_0 = 0; //동일문자 카운트

    var SamePass_1 = 0; //연속성(+) 카운드

    var SamePass_2 = 0; //연속성(-) 카운드

    for(var i=0; i < pw.length; i++) {

         var chr_pass_0;

         var chr_pass_1;

         var chr_pass_2;
         if(i >= 2) {

             chr_pass_0 = pw.charCodeAt(i-2);

             chr_pass_1 = pw.charCodeAt(i-1);

             chr_pass_2 = pw.charCodeAt(i);

              //동일문자 카운트

             if((chr_pass_0 == chr_pass_1) && (chr_pass_1 == chr_pass_2)) {

                SamePass_0++;
              } 
              else {
               SamePass_0 = 0;
               }
              //연속성(+) 카운드

             if(chr_pass_0 - chr_pass_1 == 1 && chr_pass_1 - chr_pass_2 == 1) {

                 SamePass_1++;
              }
              else {
               SamePass_1 = 0;
              }
      
              //연속성(-) 카운드
             if(chr_pass_0 - chr_pass_1 == -1 && chr_pass_1 - chr_pass_2 == -1) {
                 SamePass_2++;
              } 
              else {
               SamePass_2 = 0;

              }  

         }     
        if(SamePass_0 > 0) {

           alert("동일문자를 3자 이상 연속 입력할 수 없습니다.");

           pw_passed=false;
         }

        if(SamePass_1 > 0 || SamePass_2 > 0 ) {

           alert("영문, 숫자는 3자 이상 연속 입력할 수 없습니다.");

           pw_passed=false;          
         } 
         
         if(!pw_passed) {             
              return false;
              break;
        }
    }
    return true;
}
</script>

</head>
<body>
	<c:set var="dto" value="${pwd}" />
	<jsp:include page="../layout/header.jsp" />
	  <div class="side">
		<h1>비밀번호 수정</h1>
	</div>   
	
			<div class="form-main">
				<form action="<%=request.getContextPath()%>/pwd_modifyOk.do" method="post">
						 <input type="hidden" name="member_num" value="${dto.getMember_num() }">
								 
								 <label for="exampleFormControlInput1" class="form-label">새 비밀번호</label>	
								 
								<input type="password"  class="form-control" id="exampleFormControlInput1" name="member_pwd" placeholder="특수문자를 포함한 9자이상" style="width: 300px;"><br>
								 <!-- <input type="text" class="form-control" id="exampleFormControlInput1" name = "member_email" placeholder="coffee@email.com" style="width: 300px;"> -->
								<label for="exampleFormControlInput1" class="form-label">비밀번호 확인</label>	
							   	
							   <!-- 	<input type="password" id="txtPassword2" name="db_pwd2" /><br/> -->
								
								<input type="password"  class="form-control" id="exampleFormControlInput2" name="db_pwd2" placeholder="비밀번호 확인" style="width: 300px;"><br>
								
								<button type="submit" onclick="fn_pw_check()">수정</button>
				</form>
			</div>
	<jsp:include page="../layout/footer.jsp" />
</body>
</html>