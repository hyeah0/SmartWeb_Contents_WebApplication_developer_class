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
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_13@1.0/YESMyoungjo-Regular.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.form-main {
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
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
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
	height: 50px;
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

.submit {
	margin-right: 100px;
	width: 300px;
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

.reset {
	margin-top: 30px;
	width: 300px;
	height: 3.5rem;
	background: #f5f5f5;
	color: #111;
	border-radius: 40px;
	padding: 0 2.5rem;
}

.reset:hover {
	background-color: gray;
	box-shadow: 0px 15px 20px rgba(115, 67, 56, 0.4);
	color: #fff;
	transform: translateY(-7px);
}

.find_file {
	margin-left: 50px;
}

.input_addr {
	margin-left: 50px;
}

.last_btn {
	margin-left: 15px;
}

.side_me {
	width: 35%;
	background-color: #EAEAEA;
	height: 1200px;
	float: left;
	color: #fff;
}

.desx {
	width: 100%;
	margin-left: 500px;
}

.text_h1 {
	font-size: 40px;
	margin-top: 200px;
}

.logo {
	margin-left: 70px;
}

.back_button {
	border: none;
	font-size: 50px;
	color: white;
}

.fa-arrow-left:before {
	content: "\f060";
	color: #734338;
}

.side {
	margin-top: 100px;
	text-align: center;
	font-family: 'YESMyoungjo-Regular';
}

.h1_text {
	color: #734338;
}

.span_text {
	color: #a66b56;
}

.img {
	margin-left: 130px;
}

.desc {
	position: static;
}

#button {
	margin-top: 150px;
}

.img_no {
	margin-left: 70px;
	border: 1px solid #FFF;
	border-radius: 100%;
	height: 200px;
	width: 200PX;
}


</style>
<script type="text/javascript">


	function readURL(input) {
		console.log(input.files);
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#img-preview1").attr("src", e.target.result);
			};

			reader.readAsDataURL(input.files[0]);
		} else {
			$("#img-preview1").attr("src", noimage);
		}
	}
</script>
</head>
<body>
<c:set var="mypage" value="Mypage" />
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
			
				<h1 class="h1_text">
						<span class="span_text">프로필 사진
						</span> 
					추가</h1>
	
		</div>   	
	</div>
	<div class="form-main">
		<div class="desc">
		<form class="desx"  action="<%=request.getContextPath()%>/addr_imgmodify_ok.do" method="post" enctype="multipart/form-data">
			
				<input type="hidden" value="${member_num }" name="member_num">
						<div>
							<div>

						<c:if test="${dto.getMember_img() eq null}">
						
							  <img alt="이미지없음" style="margin-left:15px; border: 1px solid #FFF; border-radius: 100%; height: 100px;
width: 100PX;"  src="https://us.123rf.com/450wm/tuktukdesign/tuktukdesign1705/tuktukdesign170500037/77461543-%EB%82%A8%EC%9E%90-%EC%82%AC%EC%9A%A9%EC%9E%90-%EC%95%84%EC%9D%B4%EC%BD%98-%EC%82%AC%EB%9E%8C-%ED%94%84%EB%A1%9C%ED%95%84-%EC%95%84%EB%B0%94%ED%83%80-%EA%B8%80%EB%A6%AC%ED%94%84-%EB%B2%A1%ED%84%B0-%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8.jpg" />
						
						</c:if>
						<c:if test="${dto.getMember_img() ne null}">
						 <img alt="이미지없음" style="margin-left:15px; border: 1px solid #FFF; border-radius: 100%; height: 100px;
width: 100PX;" src="<%=request.getContextPath() %>/resources/res/img/${member_img}" />
						</c:if>

						<div>	
						
						  <input type="file" accept="image/*" onchange="readURL(this)" class="image_gallery"  name="file1"/>
						  </div>
						</div>
					  
							
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

</div>

</body>
</html>