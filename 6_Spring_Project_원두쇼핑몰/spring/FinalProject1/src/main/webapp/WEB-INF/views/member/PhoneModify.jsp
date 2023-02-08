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
</head>
<script type="text/javascript">

$(function(){

	$(".form-control").on('submit', function(e){
  	// 숫자만 입력받기
    var trans_num = $(this).val().replace(/-/gi,'');
		var k = e.keyCode;
				
		if(trans_num.length >= 11 && ((k >= 48 && k <=126) || (k >= 12592 && k <= 12687 || k==32 || k==229 || (k>=45032 && k<=55203)) ))
		{
			e.preventDefault();
		}
  }).on('blur', function(){
  if($(this).val() == '') return;
				
        var trans_num = $(this).val().replace(/-/gi,'');
        if(trans_num != null && trans_num != '')
        {
            if(trans_num.length==11 || trans_num.length==10) 
            {   
                var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
                if(regExp_ctn.test(trans_num))
                {
                    trans_num = trans_num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");                  
                    $(this).val(trans_num);
                }
                else
                {
                    alert("유효하지 않은 전화번호 입니다.");
                    $(this).val("");
                    $(this).focus();
                }
            }
            else 
            {
                alert("유효하지 않은 전화번호 입니다.");
                $(this).val("");
                $(this).focus();
            }
        }
  });  
});
</script>

<body>

<jsp:include page="../layout/header.jsp" />



<form action="<%=request.getContextPath()%>/phone_modify_ok.do">
<input type="hidden" value="${member_num }" name="member_num">
	<div class="side">
	<h1>새로운 연락처 정보</h1>
	</div>
	<div class="form-main">
		<div>
  <div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">수정 전화번호</label>
  <input type="text" class="form-control" id="exampleFormControlInput1" name="member_phone" placeholder="-빼고입력해주세요" style="width: 300px;">
</div>

		
		</div>
	
	<br>
<button type="submit">수정하기</button>
</div>
</form>

<jsp:include page="../layout/footer.jsp" />

</body>
</html>