<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>나의 커피 취향 찾기</title>
	 <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/cartAndOrderCss/order.css">
	<link  rel="stylesheet"  href="<%=request.getContextPath() %>/resources/css/testCss/testCss.css">
	<script src="https://kit.fontawesome.com/4338ad17fa.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
	<div class="wrap">
		<input type="hidden" class="now_turn" value="${turn }">
       <section class="cancel_area">
       
       		<c:if test="${turn>1 }">
       			<button class="backBtn" onclick='history.back()'>
                	<i class="fa-solid fa-chevron-left"></i>	
            	</button>
       		</c:if>
       		
       		<button class="CancelBtn" onclick="location.href='<%=request.getContextPath()%>'">
                <i class="fa-solid fa-xmark"></i>
            </button>
            
       </section>
       
       <section class="top_area">
       		<c:choose>
       			<c:when test="${turn==1 }"><h1>커피를 어떻게 내려드세요?</h1></c:when>
       			<c:when test="${turn==2 }"><h1>어떤 커피를 즐기세요?</h1></c:when>
       			<c:when test="${turn==3 }"><h1>디카페인도 준비되어 있어요<br>어떻게 추천해드릴까요?</h1></c:when>
       			<c:when test="${turn==4 }"><h1>어느 스타일로 즐기고 싶으세요?</h1></c:when>
       			<c:when test="${turn==5 }"><h1>어떤 맛으로 즐기고 싶으세요?</h1></c:when>
       			<c:otherwise><h1>이제 마지막이에요.<br>원두를 갈아드릴까요?</h1></c:otherwise>
       		</c:choose>
            
       </section>
       
       <section class="test_area">
       
            <div class="test_rows">
            
                <c:set var="count" value="0"/>
		                
                <c:forEach items="${testList }" >
                	
                	<c:choose>
                	
                		<%-- 이미지 path 가 있을 경우 --%>
						<c:when test="${!empty testList.get(count).get('test_type_img') }">
							
							<div class="row">
		                		<div class="row_in unclicked"> 
			                    	<a class="a a_hover" onclick="onclickA(${testList.get(count).get('test_type_num') })">
			                    		${testList.get(count).get("test_type_img") } 
			                    		<h3 class="test_txt">${testList.get(count).get("test_type_name") }</h3>
			                    	</a>
		                    	</div>
		                	</div>
		                	
						</c:when>
						
						<%-- 테스트 info 있을 경우(테이블 컬럼 3개) --%>
						<c:when test="${!empty testList.get(count).get('test_type_info') }">
							
							<div class="row">
		                		<div class="row_in unclicked">
			                    	<a class="a a_hover" onclick="onclickA(${testList.get(count).get('test_type_num') })">
			                    		<h3 class="test_txt">${testList.get(count).get("test_type_name") }</h3>
			                    		<p>${testList.get(count).get("test_type_info") }</p>
			                    	</a>
		                    	</div>
		                	</div>
							
						</c:when>
						
						<%-- 테스트 테이블 컬럼 2개 --%>
						<c:otherwise>
							
							<div class="row">
		                		<div class="row_in unclicked">
			                    	<a class="a a_hover" onclick="onclickA(${testList.get(count).get('test_type_num') })">
			                    		<h3 class="test_txt">${testList.get(count).get("test_type_name") }</h3>
			                    	</a>
		                    	</div>
		                	</div>
		                	
						</c:otherwise>
						
						
						
					</c:choose>
					
					<c:set var="count" value="${count+1}"/>
					
                </c:forEach>
                
                
                
            </div>
       </section> 
    </div>
    
     <script src="<%=request.getContextPath() %>/resources/js/cartAndOrderJs/coffeeTestJs.js"></script>
</body>
</html>