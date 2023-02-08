<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<body>
<script>
	function CheckEmail(str){                                                 
     var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
     if(!reg_email.test(str)) {                            

          return false;         

     }                            

     else {                       

          return true;         

     }                            

}                                



로그인 버튼을 클릭했을 때 실행되는 함수                                 

function GoToEnroll()                

{                                          

	var obEmail  = document.getElementById("exampleFormControlInput1");

	if (!obEmail.value) {             

		alert("이메일을 입력하세요!");

		obEmail.focus();	

		return;

	}               

	else   {          

		if(!CheckEmail(obEmail.value))	{

			alert("이메일 형식이 잘못되었습니다");

			obEmail.focus();

			return;

		}                

	}                      

}                           
</script>
<jsp:include page="../layout/header.jsp" />

   <div class="side">
		<h1>이메일 수정</h1>
	</div>          
		<div class="form-main">
	         <form action="<%=request.getContextPath() %>/Email_Modify_ok.do" method="post">
			<input type="hidden" value="${member_num } " name="member_num">
			 <label for="exampleFormControlInput1" class="form-label">수정할 이메일</label>
 			 <input type="text" class="form-control" id="exampleFormControlInput1" name = "member_email" placeholder="coffee@email.com" style="width: 300px;">
			<!-- <input type="text" id = "email" name = "member_email" placeholder="coffee@email.com"> -->
			<br><br>
		<button type="submit" OnClick = "javascript:GoToEnroll()">이메일수정</button>	
			</form>
		</div>
		<jsp:include page="../layout/footer.jsp" />
</body>
</html>