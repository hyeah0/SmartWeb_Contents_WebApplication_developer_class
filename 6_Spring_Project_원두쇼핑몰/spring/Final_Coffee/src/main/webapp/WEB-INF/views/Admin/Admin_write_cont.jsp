<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style type="text/css">
@font-face {
    font-family: 'YESMyoungjo-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_13@1.0/YESMyoungjo-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
	.empty1{
		margin-left: 23%;
	}

	.table_box{
		margin-top: 3%;
	}
	
	.table_con1{
		margin-top: 5%;
	}
	
	.table{
		width: 95%;
	}
	
	.table_1{
	  width: 73%;
	  border: 1px solid #e9e9e9;
	  border-collapse: collapse;	
	  height: 300px;
	}
	
	.tr_1{
	  border: 1px solid #d5d5d5;
	  padding: 10px;	
	  text-align: center;
	}
	.td_1{
	  border: 1px solid #d5d5d5;
	  padding: 10px;	
	  text-align: left;		
	}
	
	.img_box1{
		border: 1px solid #d5d5d5;
	}

	.box3{
		float: left;
	}

	.f_btn{
		float: right;
		border-radius: 10px;
		border: none;
		font-size: 17px;
		background-color: #D9CEC1;
		width: 60px;
		height: 35px;
	}
	.f_btn:hover{
		background-color: #C2B19C;
	
	}
	.btn_box{
		margin-right: 7%;
		margin-top: 1%;
	}
	.write_list1{
	margin-top: 50px;
	margin-left: 150px;
	}
	.write_img2{
	width: 400px;
	height:200px;
	}
	.write_click_img21{
	width: 400px;
	height:200px;
	}
	.writer2_img{
	width: 50px;
	height: 50px;
	}
button {
  margin: 20px;
}
.custom-btn {
  width: 130px;
  height: 40px;
  color: #fff;
  border-radius: 5px;
  padding: 10px 25px;
  font-family: 'Lato', sans-serif;
  font-weight: 500;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  outline: none;
}
.btn-3 {
  background:#d9cec1;
  width: 130px;
  height: 40px;
  line-height: 42px;
  padding: 0;
  border: none;
  margin-left: 1200px;
}
.btn-3 span {
  position: relative;
  display: block;
  width: 100%;
  height: 100%;
}
.btn-3:before,
.btn-3:after {
  position: absolute;
  content: "";
  right: 0;
  top: 0;
   background:#a66b56;
  transition: all 0.3s ease;
}
.btn-3:before {
  height: 0%;
  width: 2px;
}
.btn-3:after {
  width: 0%;
  height: 2px;
}
.btn-3:hover{
   background: transparent;
  box-shadow: none;
}
.btn-3:hover:before {
  height: 100%;
}
.btn-3:hover:after {
  width: 100%;
}
.btn-3 span:hover{
   color: #a66b56;
}
.btn-3 span:before,
.btn-3 span:after {
  position: absolute;
  content: "";
  left: 0;
  bottom: 0;
   background: #a66b56;
  transition: all 0.3s ease;
}
.btn-3 span:before {
  width: 2px;
  height: 0%;
}
.btn-3 span:after {
  width: 0%;
  height: 2px;
}
.btn-3 span:hover:before {
  height: 100%;
}
.btn-3 span:hover:after {
  width: 100%;
}

.button_span{
color: white;
}
.line{
width: 1500px;
color:#734338;
}
.span1{
color: #a66b56;
}
.h11{
color: #734338;
}
.title{
font-size: 20px;
color: #734338;
}
.title1{
margin-left:500px;
font-size: 20px;
color: #734338;
}
.title3{
margin-top: 100px;
font-size: 20px;
color: #734338;
}
.write_starbox{
margin-top: 50px;
}
.write_contbox{
margin-top: 50px;

}
.write_cont{
margin-top: 50px;
font-size: 19px;
}
.text_cont{
	width: 1200px;
	resize: none;
	border: none;
}
.answer_span{
font-size: 18px;
color: #a66b56;
 font-family: 'YESMyoungjo-Regular';
}
</style>
</head>
<body>
<jsp:include page="../layout/Admin_header2.jsp"  />
<c:set value="${write_cont }" var="dto" />
<c:set value="${beans_cont }" var="dto1" />
<c:set value="${goback }" var="dto2" />

	<div class="empty1">
	

		<div class="table_box">
		
		<h2 class="h11"><span class="span1">후기글</span> 상세정보</h2>
		<button class="custom-btn btn-3" onclick="if(confirm('정말 삭제 하시겠습니까?')){location.href='Admin_write_delete.do?num=${dto.getWrite_num()}'}else{return;}"><span class=button_span>❌삭제하기</span></button>
			<hr class="line" style="height: 10px;">
				
			<div class="table_con1">
				<table class="table">
					<tr>
						<th>원두 번호</th>
						<th>원두 이름</th>
						<th>주문량</th><!-- 주문내역 확인.. -->
						<th>원두 가격</th>
						<th>원두 재고</th>
					</tr>
					<tr>				
						<td>${dto.getBeans_num() }</td>
						<td>${dto.getBeans_name() }</td>
						<td>0</td>
						<td><fmt:formatNumber value="${dto.getBeans_price() }" />원</td>
						 <td>${dto1.getBeans_count() }</td> 
					</tr>
				</table>
			</div>
				
		
					
					<div class="write_list1">
					<span class="title">작성자 </span>&nbsp;&nbsp;&nbsp;
				<c:if test="${dto2.getMember_img() ne null }">
					<img class="writer2_img" alt=""src="<%=request.getContextPath() %>/resources/res/img/${dto2.getMember_img()}">
				</c:if>
				
				<c:if test="${dto2.getMember_img() eq null }">
					<img class="writer2_img" alt="" src="https://cdn-icons-png.flaticon.com/128/5079/5079583.png">
				</c:if>
					&nbsp;&nbsp;&nbsp;
					<span class="answer_span">${dto.getMember_id() }</span>
					<span class="title1">작성일자</span>&nbsp;&nbsp;&nbsp;
					<span class="answer_span">${dto.getWrite_date().substring(0,10) }</span>
					<br>	
					<div class="write_starbox">
					
					<c:if test="${dto1.getWrite_img() ne null }">
						<div class="write_click_img2">
						<span class="title3">첨부사진</span>
							<div class="write_click_img21">
							<img class="write_img2" alt="" src="<%=request.getContextPath() %>/resources/res/img/${dto.getWrite_img()}">
							</div>
						</div>							
					</c:if>
					<c:if test="${dto1.getWrite_img() eq null }">
									
					</c:if>
					
					<div class="write_contbox">
					<span class="title3">후기글</span>
						<div class="write_cont">
						<textarea rows="8" class="text_cont" readonly>${dto.getWrite_cont() }</textarea>
							
						</div>						
					</div>
					
				
						<div align="right" class="write_singobox">

							

						</div>
				</div>
						
				</div>	
			</div>
			
			<div class="btn_box">
			
			</div>
			
		</div>
		<%-- empty 끝 --%>

</body>
</html>