<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">

	header{
		margin-left: 330px;
	}

	#container{
		width: 70%;
		margin-left: 15%;
	}
	
	#con1{
		margin-left: 25%;
	}
	
	#img1{
		
		height: 30px;
		width: 30px;
	}
	
	#img_a{
		border: none;
		font-size: 18px;
		color: #000;
		background-color: #ECECEC;
		width: 55px;
		height: 30px;
		margin-left: 43%;
		border-radius: 5px;
	}
	
	#img_a:hover{
		background-color: #c3c3c3;
	}

	#pwd{
		width: 250px; 
		margin-top: 15px;
	}
	.zero{

	}
	.top{
	 margin-left: 350px;
	
	}
	.header__content {
    background-color: #a69b8d;
    -webkit-text-size-adjust: 100%;
    font: 100% sans-serif;
    --ikea-font: 'Noto IKEA', 'Noto Sans KR', 'Noto Sans', 'Roboto', 'Open Sans', system-ui, sans-serif !important;
    font-family: var(--ikea-font);
    font-size: .875rem;
    line-height: 1.571;
    visibility: visible;
    text-align: left;
    pointer-events: all;
    color: rgb(var(--colour-text-and-icon-5, 255, 255, 255));
    box-sizing: inherit;
    outline: none;
    margin: 0;
    display: flex;
    align-items: center;
    justify-content: space-around;
    padding: 80px 80px 50px 30px;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">

	// 글 공개 / 비공개 둘 중 하나 선택하여 비밀번호 창 잠구는 함수.
	$(function(){
		
		$("input:radio[name=show]").click(function(){
			
			if($("input[name=show]:checked").val() == "0"){
				$("#pwd").attr("disabled",true);
				// radio 버튼의 value 값이 0이라면 안보이게
	
			}else if($("input[name=show]:checked").val() == "1"){
	              $("#pwd").attr("disabled",false);
	              // radio 버튼의 value 값이 1이라면 비번 입력할 수 있게.
			};
		});
		
		$("#validationTextarea1").on('keydown keyup', function () {
		  	$(this).height(1).height( $(this).prop('scrollHeight')+12 );	
			});	
		
	});
	
	// textarea에서 입력한 글자 만큼 세주는 함수.	
	$(document).ready(function() {
	    $('#validationTextarea1').on('keyup', function() {
	        $('#cnt').html("("+$(this).val().length+" / 1000)");
	 
	        if($(this).val().length > 1000) {
	            $(this).val($(this).val().substring(0, 1000));
	            $('#cnt').html("(1000 / 1000)");
	        }
	    });
	});

	
</script>
<body>
<jsp:include page="../layout/header.jsp" />

	<c:set var="dto" value="${write }" />
	<div class="zero">
	<div id="container">
	
	  <br>
	 <c:set value="${w_write }" var="dto" />
	  <form method="post" class="was-validated" action="<%=request.getContextPath() %>/write_ok.do">
	  
	  <input type="hidden" value="${member_num }" name="member_num">
	  	
	  	<div class="top">
			<h2>Q&A문의등록<input type="submit" value="등록" id="img_a"></h2>
			<hr width="70%">
	 		<br>
	 		
		    <p>문의하신 내용은 고객센터에서 확인 후 영업일 기준 1~3일 이내에 답변 드리도록 하겠습니다.
			<br>* 운영 시간: 평일 (월 ~ 금) 10:00 ~ 18:00<br>
			* 파일 업로드 이용할 시 1:1문의를 이용해주세요.</p>
			
		</div>
	  <br>
	  <div id="con1">
	  
	
		
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">문의제목</label>
		  <input style="width: 700px; box-shadow:none !important;" class="form-control is-invalid" id="validationTextarea" placeholder="제목 입력" name="board_title" required>
		</div>
		
		<div class="mb-3">
		  <label for="exampleFormControlTextarea1" class="form-label">문의내용</label>
		  <textarea style="box-shadow:none !important; width: 700px; resize: none; overflow: hidden; min-height:250px;" class="form-control" id="validationTextarea1" rows="9" name="board_cont" required></textarea>
		  <span id="cnt">(0 / 1000)자 이내로 입력</span>
		</div>
		
		<div class="row g-3" style="width:50%;">
		  <div class="col">
		  	
		  
		</div>
		
		  </div>
		</div>
		</form>
		</div>
		
		<br>
		<br>
	  </div>
	 
	<jsp:include page="../layout/footer.jsp" />

</body>
</html>