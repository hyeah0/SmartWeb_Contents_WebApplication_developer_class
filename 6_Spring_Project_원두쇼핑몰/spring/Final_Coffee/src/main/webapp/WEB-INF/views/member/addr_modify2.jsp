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
	<script src="https://kit.fontawesome.com/4338ad17fa.js" crossorigin="anonymous"></script>
<style type="text/css">
@font-face {
    font-family: 'YESMyoungjo-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_13@1.0/YESMyoungjo-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}



.form-main{

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
 #button {
  eight: 3.5rem;
    background: #734338;
    color: #fff;
    border-radius: 40px;
    padding: 0 2.5rem;
  }

 #button:hover {
  background-color: #fff;
  box-shadow: 0px 15px 20px rgba(115, 67, 56, 0.4);
  color: #734338;
  transform: translateY(-7px);
}


input {
			width: 20%;
			height:50px;
			padding: 10px 40px;
			margin: 5px 0;
			box-sizing: border-box;
			border: solid 2px #483D8B;
			font-family: 'YESMyoungjo-Regular';
			border-radius: 10px;
			font-size: 14px;
			background-image: url("/examples/images/img_search_icon.png");
			background-position: 5px 4px;
			background-repeat: no-repeat;
			margin-right: 100px;
		}
 .submit{
 	margin-right:100px;
 	width:300px;
 	 height: 3.5rem;
    background: #734338;
    color: #fff;
    border-radius: 40px;
    padding: 0 2.5rem;
 }
 
  .submit:hover {
  background-color: #fff;
  box-shadow: 0px 15px 20px rgba(115, 67, 56, 0.4);
  color: #734338;
  transform: translateY(-7px);
}
 .reset{
 	margin-top:30px;
	 width:300px;
	 height: 3.5rem;
    background: #f5f5f5;
    color: #111;
    border-radius: 40px;
    padding: 0 2.5rem;
 }
.reset:hover{

	background-color: gray;
  box-shadow: 0px 15px 20px rgba(115, 67, 56, 0.4);
  color: #fff;
  transform: translateY(-7px);
}
.find_addr{
	margin-left: 50px;
}
.input_addr{
	margin-left: 50px;
}
.last_btn{
	margin-left: 15px;
}
.side_me{
 width: 35%;
 background-color: #EAEAEA;	
 height: 1200px;	
 float: left;
 color: #fff;

}
.desx{
	width:100%;
	margin-left: 500px;
	
	
}
.text_h1{
	font-size: 40px;
	margin-top: 200px;
}
.logo{
	margin-left:  70px;
}
.back_button{
	border: none;
	font-size: 50px;
	color: white;
}
.fa-arrow-left:before {
    content: "\f060";
    color: #734338;
}
.side{
	margin-top: 100px;
	text-align:center;
	 font-family: 'YESMyoungjo-Regular';
}
.h1_text{
	
	color: #734338;
}
.span_text{
	color: #a66b56;
}
.img{ 
	margin-left: 130px;
	
}
.desc{
position: static;
}
#button{
margin-top: 150px;
}
</style>
</head>
<body>
<c:set var="mypage" value="Mypage"></c:set>
<div class="cont">
	<div class="side_me">
		<div class="side_inside">
			<div class="back_button">
				<a href="member_mypage.do?num=${member_num}">
					<i class="fa-solid fa-arrow-left">
					</i>
				</a>			
			</div>
		</div>
		
		<div class="img">
			<img class="logo" src="<%=request.getContextPath()%>/resources/images/cuppa_logo.png" alt="cupofcoffee" width="300">
		</div>
		
		<div class="side">
			<c:if test="${dto.getMember_addr2() ne null }" >
				<h1>새로운 주소 수정</h1>
			</c:if>
			<c:if test="${dto.getMember_addr2() eq null }" >
				<h1 class="h1_text">
						<span class="span_text">새로운
						</span> 
					주소 추가</h1>
			</c:if>
		</div>   	
	</div>
	<div class="form-main">
		<div class="desc">
		<form class="desx" action="<%=request.getContextPath()%>/addr_modify_ok2.do" method="post">
				
				<input type="hidden" value="${member_num }" name="member_num">
					<div class="find_addr">
				<input type="button" onclick="sample6_execDaumPostcode()" id="button" value="우편번호 찾기"><br>
					</div>
				<br><br>
						<div class="input_addr">
							<div>
								<label class="input_label">우편번호</label>
							</div>
							<input type="text" id="sample6_postcode" name="member_addr2" placeholder="우편번호" readonly><br>
							<br>
							<div>
								<label class="input_label">도로명주소</label>
							</div>
							<input type="text" id="sample6_address" name="member_addr2" placeholder="주소" readonly><br>
							<br>
							<div>
								
							</div>
							<input type="text" id="sample6_extraAddress"  name="member_addr2" placeholder="참고항목" readonly><br>
							<br>
							<div>
								<label class="input_label">상세주소</label>
							</div>
							<input type="text" id="sample6_detailAddress"  name="member_addr2" placeholder="상세주소">
						</div>
				<br>
					<div class="last_btn">
							<div>
								<button type="submit" class="submit" >저장</button>
							<div >
								<button type="reset" class="reset">뒤로가기</button>
							</div>
						</div>
					</div>
				
		</form>
	</div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</div>

</body>
</html>