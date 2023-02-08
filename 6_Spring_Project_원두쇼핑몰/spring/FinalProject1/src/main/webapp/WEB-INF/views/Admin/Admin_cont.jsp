<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"
integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
crossorigin="anonymous"></script>
<link href="<%=request.getContextPath()%>/resources/css/admin_member_cont.css" rel="stylesheet" />
<script src="https://kit.fontawesome.com/8cabb9ab88.js" crossorigin="anonymous"></script>
</head>
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
<body>
	<jsp:include page="../layout/Admin_header2.jsp"  />
	<c:set var="dto" value="${member_cont }" />
	<c:set var="dto2" value="${member_test }" />
	<c:set var="member_order" value="${member_order }" />
		<div class="contanior">
		<div class="top">
		<h1 class="h11">회원 상세보기</h1>
		<hr class="line" style="height: 10px;">
		</div>
			<div class="warp">
				<div class="content">
					<div>
							<div class="navi">
								 <c:if test="${dto.getMember_img() eq null}">
				  	   <img alt="이미지없음" id="img-preview1" class="img_no" src="https://us.123rf.com/450wm/tuktukdesign/tuktukdesign1705/tuktukdesign170500037/77461543-%EB%82%A8%EC%9E%90-%EC%82%AC%EC%9A%A9%EC%9E%90-%EC%95%84%EC%9D%B4%EC%BD%98-%EC%82%AC%EB%9E%8C-%ED%94%84%EB%A1%9C%ED%95%84-%EC%95%84%EB%B0%94%ED%83%80-%EA%B8%80%EB%A6%AC%ED%94%84-%EB%B2%A1%ED%84%B0-%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8.jpg" />
				     </c:if>
				     
				     <c:if test="${dto.getMember_img() ne null }">
					     <img alt="이미지없음" id="img-preview1" class="img_no" src="<%=request.getContextPath() %>/resources/res/img/${dto.getMember_img()}" />	     
				     </c:if>
				     
						<div class="you">
							  <span class=tr-span>ID</span>&nbsp;&nbsp;&nbsp;
									 <span class="td-span">${dto.getMember_id() }</span>
								<br><br>
									 <span class=tr12-span>이름</span>&nbsp;&nbsp;&nbsp;
									 <span class="td1-span">${dto.getMember_name() }</span>
							</div>
						<br><br><br>
							<c:if test="${dto.getTest_num() !=0 }">
								<div>
							 <span class="date13"><i class="fa-sharp fa-solid fa-mug-saucer"></i>커피파</span>&nbsp;&nbsp;&nbsp;
							<span class="date14">${dto2.getTest_name() }</span>
								</div>
							</c:if>	
							<c:if test="${dto.getTest_num() ==0 }">
								<div>
							 <span class="date13"><i class="fa-sharp fa-solid fa-mug-saucer"></i>커피파</span>&nbsp;&nbsp;&nbsp;
							<span class="date14">테스트 미진행</span>
								</div>
							</c:if>	
							<br><br>
						<div>	
						
						 <!--  <input type="file" accept="image/*" onchange="readURL(this)" class="image_gallery"  name="file1"/> -->
						  </div>
						  
								<div class="user_name">
							   			<span class=tr-span><i class="fa-sharp fa-solid fa-coins"></i>포인트</span>&nbsp;&nbsp;&nbsp;
										<span class="td-span"><input type="text" class="point" value="${dto.getMember_point() }" readonly>P</span>
								
										 <span class="date1">${dto.getMember_date().substring(0,10) }</span>
									 <span class="date"><i class="fa-regular fa-calendar-days"></i>가입일</span>&nbsp;&nbsp;&nbsp;
								
								
									 	<br><br><br>
							 	</div>
							 	
							 		<div class="user_name">
				
							 		<span class="phone-span"><i class="fa-solid fa-phone"></i>휴대폰</span>&nbsp;&nbsp;&nbsp;
									 <span class="td1-span">${dto.getMember_phone() }</span>
							 		
							 			<span class="date12"><input type="text" class="email" value="${dto.getMember_email() }" readonly></span>
							   			<span class="date"><i class="fa-solid fa-envelope"></i>이메일</span>&nbsp;&nbsp;&nbsp;				 	
									 	<br><br><br>
							 	</div>
							 	
							 	 	
							   		
							 		<div class="user_name">		
							 
								
							   			<span class=tr-span><i class="fa-solid fa-map-location-dot"></i>주소</span>&nbsp;&nbsp;&nbsp;
										<span class="td-span">${dto.getMember_addr() }</span>
										
										
								
							 	</div>
							 	<br>
								<div class="user_name">		
						
							 	<c:if test="${dto.getMember_addr2() ne '주소를 넣어주세요' }">
								
							   			<span class=addr-span><i class="fa-solid fa-map-location-dot"></i>주소2</span>&nbsp;&nbsp;&nbsp;
										<span class="td-span">${dto.getMember_addr2() }</span>
								</c:if>
								
								<c:if test="${dto.getMember_addr2() == '주소를 넣어주세요' }">
								
								</c:if>
							 				
							 	
							</div>
							
							
							<br>
								 		<div class="user_name">		
							 	<c:if test="${dto.getMember_addr3() ne '주소를 넣어주세요' }">
								
							   			<span class=tr-span><i class="fa-solid fa-map-location-dot"></i>주소3</span>&nbsp;&nbsp;&nbsp;
										<span class="td-span">${dto.getMember_addr3() }</span>
								</c:if>
								
								<c:if test="${dto.getMember_addr3() == '주소를 넣어주세요' }">
								
								</c:if>
							 	</div>
							 	<br>
								<div class="user_name">		
							 	<c:if test="${dto.getMember_addr4() ne '주소를 넣어주세요' }">
								
							   			<span class=addr-span><i class="fa-solid fa-map-location-dot"></i>주소4</span>&nbsp;&nbsp;&nbsp;
										<span class="td-span">${dto.getMember_addr4() }</span>
								</c:if>
								
								<c:if test="${dto.getMember_addr4() == '주소를 넣어주세요' }">
								
								</c:if>
							 				
							 	
							</div>
						
							<br>
								 		<div class="user_name">		
							 	<c:if test="${dto.getMember_addr5() ne '주소를 넣어주세요' }">
								
							   			<span class=tr-span><i class="fa-solid fa-map-location-dot"></i>주소5</span>&nbsp;&nbsp;&nbsp;
										<span class="td-span">${dto.getMember_addr2() }</span>
								</c:if>
								
								<c:if test="${dto.getMember_addr5() == '주소를 넣어주세요' }">
								
								</c:if>
							 				
							 	
							</div>		 			
							  </div>
						<div style="margin-top:150px; width:75%; height:400px; overflow:auto; margin-left: 200px;">
							<table class="table table-striped table-hover">
					                <thead>
					                    <tr>
											<th>주문번호</th>
					                        <th>원두이름</th>
											<th>원두가격</th>
											 <th width="200px">주문일</th>
					                    </tr>
					                </thead>
					                <tbody>
					                	<c:if test="${!empty member_order }">
										<c:forEach items="${member_order}" var="dto1">
					                    <tr>
					                        <td>${dto1.getOrder_num() }</td> 
					                       <td>${dto1.getBeans_name() }</td>
											<td>${dto1.getBeans_price() }</td>
					                        <td width="200px">${dto1.getOrder_date().substring(0,10) }</td>
					                    
									    </tr>  	
								 		   </c:forEach>
										</c:if>	
											<c:if test="${empty member_order }">
									                     	<td colspan="5" align="center">			                          
										                  </td>
					
										</c:if>
						        	</tbody>
					            </table>
					            </div>
											</div>
										  
										
									</div>
							</div>
				</div>
</body>
</html>