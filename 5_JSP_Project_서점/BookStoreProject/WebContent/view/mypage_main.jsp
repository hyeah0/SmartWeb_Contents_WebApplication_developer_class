<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>종로서적 마이페이지</title>
    <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="source/img/logo_title.jpeg">
    <script src="https://kit.fontawesome.com/4338ad17fa.js" crossorigin="anonymous"></script> 
    <link rel="stylesheet" href="css/frame.css">
    <link rel="stylesheet" href="css/mypageCss/mypageLayout.css">   
    <link rel="stylesheet" href="css/mypageCss/mypageSug.css">
    <link rel="stylesheet" href="css/mypageCss/mypageCouMile.css">
    <link rel="stylesheet" href="css/mypageCss/mypageOrderBook.css">
</head>
<body>

	<jsp:include page="/include/main_top.jsp"/>

	<div id="center" class="mypageCenter">
       <div class="container-top"></div>
	   <div class="myPageCenterContainer">
	       <c:set var="memberList" value="${memberList }"/>
	       
	       <!-- 멤버프로필사진, 추천책 -->
	       <section id="section-mem_sug">
	       	
	       		<!-- 멤버프로필 -->
	           <section id="section-member">
	               <div class="member_head">
	                   <a>
	                       <p>
	                           <i class="fa-solid fa-house"> my</i>
	                       </p>
	                   </a>
	               </div>
	               <div class="member_photo_div">
	                   <a class="member_photo">
	                       <img>
	                   </a>
	                   <h3>${memberList.getMem_name() }</h3>
	               </div>
	           </section>
	           
	           <!-- 추천 -->
	           <section id="section-suggestion">
	               <div class="sug_head">
	                   <h3> ${memberList.getMem_name() } 님께 추천해 드려요</h3>
	               </div>
	               <div class="sug_area">
	               		<c:set var="bookList" value="${bookList }"/>
	               		<c:if test="${!empty bookList }">
	               			<c:forEach items="${bookList }" var="bookList" end="3">
	               				<div class="sug_div" style="background-image: url('<%=request.getContextPath() %>/source/img/book/${bookList.getBook_img() }');">
			                       <a class="sug_a" href="<%=request.getContextPath() %>/book_detail.do?book_num=${bookList.getBook_num() }">
			                           <div class="sug_img_p">
			                               <img class="sub_img" src="<%=request.getContextPath() %>/source/img/book/${bookList.getBook_img() }">
			                           </div>
	                           			<h3>${bookList.getBook_name() }</h3>
	                       		  	</a>
	                   			</div>
	               			</c:forEach>
	               		</c:if>
	                  
	               </div>
	           </section>
	       </section>

			<!-- nav, content -->
			<jsp:include page="/include/mypage/mypage_main_nav.jsp"/>

				<!-- content -->
				<section id="section-cont">
				
					  <!-- 마이페이지 메인 콘텐츠 내용 1 : 쿠폰, 마일리지 주문 -->
	                  <section class="cont-coupon_mileage">
	                      <div class="mypage-cont coupon_mileage_div">
	                          
	                          <!-- 쿠폰 -->
	                          <div class="coupon_mileage_each">
	                              <a class="coupon_mileage_a">
	                                  <h3 class="coupon_mileage_h3">쿠폰</h3>
	                                  <div class="coupon_mileage_cnt">
	                                      <p>2</p>
	                                  </div>
	                              </a>
	                          </div>
	                          
	                          <!-- 마일리지 -->
	                          <div class="coupon_mileage_each">
	                              <a class="coupon_mileage_a">
	                                  <h3 class="coupon_mileage_h3">마일리지</h3>
	                                  <div class="coupon_mileage_cnt">
	                                      <p>
	                                         <fmt:formatNumber value="${memberList.getMem_mileage() }"/> 
	                                      </p>
	                                  </div>
	                              </a>
	                          </div>
	                          
	                      </div>     
	                  </section>
	                       
	                <!-- 마이페이지 메인 콘텐츠 내용 2 : 주문 -->
                    <section class="cont-recent_order">
                        <div class="mypage-cont recent_order_div">
                            
                            <!-- 상단 : 더보기 버튼 -->
                            <div class="mypage-cont_toptext recent_order_txt">
                                <h3>최근 주문</h3>
                                <button onclick="location.href='mypage_order.do'">더보기</button>
                            </div>
                            
                            <!-- 주문내용 -->
                            <c:set var="orderList" value="${orderList }"/>
                            
                            <table class="mypage_table order_table">
                                <tbody>
                                
                                	
                                	<c:if test="${empty orderList }">
                                		<tr class="mypage_table_tr">
	                                		<td>
	                                			일주일간 주문건이 없습니다.
	                                		</td>
                                		</tr>
                                	</c:if>
                                    <c:if test="${!empty orderList }">
                                    	<c:forEach items="${orderList }" var="orderList" >
	                                    	
	                                    	<tr class="mypage_table_tr">
		                                    	<!-- 일자 -->
		                                        <td class="order_tbody_date">
		                                            <a href="#">${orderList.getOrder_date() }</a>
		                                        </td>
		                                        
		                                        <!-- 이미지 -->
		                                        <td class="order_tbody_img">
		                                            <a>
		                                                <img src="<%=request.getContextPath() %>/source/img/book/${orderList.getBook_img() }">
		                                            </a>
		                                        </td>
		                                        
		                                        <!-- 책이름 -->
		                                        <td class="order_tbody_bname">${orderList.getBook_name() }</td>
		                                        
		                                        <!-- 수량 -->
		                                        <td class="order_tbody_cnt">${orderList.getTotal_order_qty() }</td>
		                                        
		                                        <!-- 금액 -->
		                                        <td class="order_tbody_price">
		                                        	<fmt:formatNumber value="${orderList.getTotal_order_price() }"/>
		                                        </td>
	                                      </tr>
                                        </c:forEach>
                                    </c:if>
      								
                                </tbody>
                            </table>
                        </div>
                    </section>
         
         		</section> 
         		<!-- content 끝 -->
            <jsp:include page="/include/mypage/mypage_bottom.jsp"/>
        <jsp:include page="/include/main_bottom.jsp"/>
</body>
</html>