<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	.empty{
		background-color: #D9CEC1;
		height: 1500px;
		padding: 150px 0px 0px 23%;
	}
	
	.empty2{
		height: 90%;
		width: 70%;
		background-color: #fff;
		border-radius: 25px;
		box-shadow: #A69B8D 0px 3px 5px;
		padding-top: 5%;
	}

	.title_box{
	}
	
	.img_box{
		margin-top: 3%;
	}
	
	.cont_box{
		margin-top: 3%;
	}
	.big_text{
		font-size: 30px;
		font-weight: bold;
	}
	
	.mid_text{
		font-size: 17px;
		font-weight: bold;
	}
	
	.sm_text{
		font-size: 16px;
	}

	.ti_text{
		font-size: 20px;
	}
	
	.box2{
		margin-top: 2%;
	}
	
	.text1{
		font-size: 18px;
	}
	
	.text2{
		font-size: 20px;
	}
	
	.btn_box{
		margin-top: 2%;
		margin-left: 30%;
	}
	
	.rly_btn{
		border: 1px solid gray;
		border-radius: 7px;
		padding: 20px;
	}
</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp" />
		
		<div class="empty">
		<c:set var="i" value="${result }" />	
		
			<div class="empty2">
				
				<div class="title_box" align="center">
					<b class="sm_text">내 커피 타이틀</b><br>
					<span class="big_text">${i.getTest_full_name() }</span>
				</div>
				
				<div class="img_box" align="center">
					<img alt="" src="${i.getTest_img() }" width="300px">
				</div>
				
				<div class="cont_box" align="center">
					<span class="mid_text">${i.getTest_info()}</span>
				</div>
				<br>
				<hr width="60%" style="margin-left: 20%;">
				<br>
				
				<div>
					<div align="center">
						<span class="ti_text"><b>이런 커피가 잘맞아요!</b></span>
					</div>
					<div align="center" class="box2">
						<span class="text1">${i.getTest_match_coffee() }</span>
					</div>
				</div>
			
				<br>
				<hr width="60%" style="margin-left: 20%;">
				<br>
				
				<div align="center">
					<span class="ti_text"><b>내 커피 메이트</b></span>
				</div>					

				<div class="img_box" align="center">
					<img alt="" src="${i.getTest_match_img() }" width="200px">
				</div>
				
				<div class="cont_box" align="center">
					<span class="mid_text">${i.getMatch_coffee() }</span>
				</div>				
				
				<div align="center">
					<span class="text2"><b>${i.getTest_mate() }</b></span>
				</div>
				
			</div>
		
			<div class="btn_box">
				<button class="rly_btn" onclick="location.href='bean_test.do?turn=1'"><b>다시 테스트하기</b></button>	
			</div>
		
		</div> <%-- empty 끝 --%>
		
	<jsp:include page="../layout/footer.jsp" />	
</body>
</html>