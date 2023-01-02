<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<style type="text/css">

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
	
</style>
</head>
<body>
<jsp:include page="../layout/Admin_header2.jsp"  />
	<div class="empty1">
	
		<c:set var="i" value="${cont }" />
		<c:set var="num" value="${num }" />
		<c:set var="avg" value="${avg }" />
		<div class="table_box">
			<h2><b>원두 상세 정보</b></h2>
			
			<div class="table_con1">
				<table class="table">
					<tr>
						<th>원두 번호</th>
						<th>원두 이름</th>
						<th>주문량</th>
						<th>원두 가격</th>
						<th>원두 재고</th>
					</tr>
					<tr>				
						<td>${i.getBeans_num() }</td>
						<td>${i.getBeans_name() }</td>
						<td>${num }</td>
						<td><fmt:formatNumber value="${i.getBeans_price() }" />원</td>
						<td>${i.getBeans_count() }</td>
					</tr>
				</table>
			</div>
				
			<div class="table_con2">
				
				<div>				
					<div class="box3">
					<c:if test="${i.getBeans_add_image() eq null }">
						<img class="img_box1" src="${i.getBeans_img() }" width="300">									
					</c:if>
					
					<c:if test="${i.getBeans_add_image() ne null }">
						<img class="img_box1" src="<%=request.getContextPath() %>/resources/res/img/${i.getBeans_add_image() }" width="300">														
					</c:if>
					</div>
					
					<table class="table_1">
						<tr class="tr_1">
							<th style="width: 20%;">원두 번호</th>
							<td class="td_1">${i.getBeans_num() }</td>
							<th>원두 이름</th>
							<td class="td_1">${i.getBeans_name() }</td>						
						</tr>					
						<tr class="tr_1">
							<th>원두 맛</th>
							<td class="td_1">${i.getBeans_taste() }</td>
							<th>원두 가격</th>
							<td class="td_1"><fmt:formatNumber value="${i.getBeans_price() }" /></td>
						</tr>		
						<tr class="tr_1">
							<th>원두 평점 평균</th>
							<td class="td_1">
							<c:if test="${avg eq null }">
								0점
							</c:if>
							<c:if test="${avg ne null }">
								${avg } 점							
							</c:if>
							</td>
							<th>원두 재고</th>
							<td class="td_1">${i.getBeans_count() } 개</td>
						</tr>									
						<tr class="tr_1">
							<th>원두소개</th>
							<td class="td_1" colspan="4" style="padding: 30px 30px 30px 50px;">${i.getBeans_intro() }</td>
						</tr>
					</table>		
				</div>	
			</div>
			
			<div class="btn_box">
				<button class="f_btn" onclick="location.href='admin_beans_modify.do?no=${i.getBeans_num()}'">수정</button>
			</div>


			
		</div>
	
	</div>	<%-- empty 끝 --%>
</body>
</html>