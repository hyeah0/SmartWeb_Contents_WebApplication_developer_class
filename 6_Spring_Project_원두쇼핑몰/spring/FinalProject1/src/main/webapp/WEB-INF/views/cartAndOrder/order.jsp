<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      
      <title>CuppACoffee</title>
      <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/cartAndOrderCss/frame.css">
      <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/cartAndOrderCss/order.css">
      <script src="https://kit.fontawesome.com/4338ad17fa.js" crossorigin="anonymous"></script>
      <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
	  
</head>
<body>
  <%-- 해더 --%>
  <div class="head">
	  <jsp:include page="../layout/header.jsp" />
  </div>
  
  <div class="blank"></div>
  <div class="content_fade"></div>
  
  <!-- 컨텐츠 부분 -->
        <section class="content">
            <section class="order_wrap">
                <section class="order_top">
                    <!-- 홈 > 장바구니 > 주문서작성 > 결제완료 > 주문완료 -->
                    <section class="order_path">
                        <ul class="list order_path_list">
                            <li>
                                <a href="<%=request.getContextPath() %>" class="a order_path_a">홈</a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath() %>/bean_cart.do" class="a order_path_a">장바구니</a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath() %>/bean_order.do" class="a last order_path_a"><b>주문서작성</b></a>
                            </li>
                        </ul>
                    </section>
                </section>
                <!-- 장바구니 목록 컨텐츠 -->
                <section class="order_main cart_row_section">
                    
                    <%-- 왼쪽 --------------------------------------------------------------------------------------------------------------------%>
                    <div class="order_main_left">
                       <div class="order_main_left_in">
                           
                            <!-- 배송정보 -->
                            <div class="deliver_info">
                               
                                <!-- 상단 -->
                                <div class="deliver_info_top">
                                    <h3 class="point_text">배송정보</h3>
                                </div>
                                
                                <!-- 메인 -->
                                <!-- 배송 정보 입력 -->
                                <div>
                                     <table class="order_info_text">
                                     	  
                                     	  <c:set var="addrArr" value="${memberMap.get('addrArr') }"/>
                                          <input type="hidden" class="addr1" name="addr1" value="${addrArr[0] }" >
                                          <input type="hidden" class="addr2" name="addr2" value="${addrArr[1] }" >
                                          <input type="hidden" class="addr3" name="addr3" value="${addrArr[2] }" >
                                          <input type="hidden" class="addr4" name="addr4" value="${addrArr[3] }" >
                                          <input type="hidden" class="addr5" name="addr5" value="${addrArr[4] }" >
                                          
                                          <tbody>
                                         	
                                          	<!-- 배송지 선택 -->
                                              <tr class="rowspan">
                                                  <th rowspan="2">배송지</th>
                                                  <td>
                                                  	<div class="delivery_radio">
	                                        		<input type="radio" id="delivery_house" name="delivery_addr" class="addr_radio" checked> 
	                                        		<label for="delivery_house"> 집 </label>
	                                        		<input type="radio" id="delivery_company" name="delivery_addr" class="addr_radio"> 
	                                        		<label for="delivery_company"> 회사 </label>
	                                        		<input type="radio" id="delivery_etc" name="delivery_addr" class="addr_radio"> 
	                                        		<label for="delivery_etc"> 외 </label>
	                                        	</div>
                                                  </td>
                                              </tr>
                                              
                                              <%-- 주소 --%>
                                              <c:set var="addrlength" value="${fn:length(addrArr[0]) }" />
                                               
                                              <tr class="f_addr display_none">
                                         		<th></th>
                                          		<td>
                                            		<div class="btn_a">
								        				<button class="btn f_btn" onclick="location.href='<%=request.getContextPath()%>/member_mypage.do?num=${memberDto.getMember_num() }'">주소 등록하기</button>
								        				
								        			</div>
								        			<div class="btn_alert"> ** 주소를 등록해주세요.</div>
								        		<td>
                                           	 </tr>
                                           	
                                           	<tr class="rowspan t_addr">
                                              	<th></th>
                                              	<td>
                                              		<input class="input delivery_input selected_addr" value="${fn:substring(addrArr[0],0,6) }" readonly>
                                              	</td>
                                              </tr>
                                              <tr class="rowspan t_addr">
                                              	<th></th>
                                              	<td>
                                              		<input class="input delivery_input input_long selected_addr" value="${fn:substring(addrArr[0],6,addrlength)}" readonly>
                                              	</td>
                                              </tr>
                                             
                                              <!-- 받으시는분 -->
                                              <tr>
                                                  <th>받으시는 분</th>
                                                  <td>
                                                      <!-- member_name -->
                                                      <input class="input delivery_input" value="${memberDto.getMember_name() }">
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <th>휴대전화</th>
                                                  <td class="flex_row">
                                                      <input class="input delivery_input" value="${memberMap.get('phoneArr')[0] }">
                                                      <span class="span"> - </span>
                                                      <input class="input delivery_input" value="${memberMap.get('phoneArr')[1] }">
                                                      <span class="span"> - </span>
                                                      <input class="input delivery_input" value="${memberMap.get('phoneArr')[2] }">
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <th>이메일</th>
                                                  <td class="flex_row">
                                                      <input class="input delivery_input" value="${memberMap.get('emailArr')[0]}">
                                                      <span class="span">@</span>
                                                      <input class="input delivery_input" value="${memberMap.get('emailArr')[1]}">
                                                  </td>
                                              </tr>
                                          </tbody>
                                          <tbody class="hr">
                                              <tr>
                                                  <th rowspan="2">사용 포인트</th>
                                                  <td>
                                                      <input type="number" class="input delivery_input input_use_point"> 
                                                      <span>원 (총 사용 가능 포인트 : <span class="can_use_point">${memberDto.getMember_point() }</span>원)</span>
                                                  </td>
                                              </tr>
                                              <tr class="except_tr">
                                                  <td class="list">
                                                      <ul class="use_point_txt">
                                                          <li class="pointText">- 적립금은 최소 1,000원 이상일때 결제 가능합니다.</li>
                                                          <li>- 최대 사용금액은 제한이 없습니다.</li>
                                                          <li>- 적립금으로만 결제할 경우 결제 금액이 0으로 보여지는 것은 정상이며
                                                          <br>&nbsp;&nbsp;[결제하기] 버튼을 누르면 주문이 완료됩니다.
                                                          </li>
                                                      </ul>
                                                  </td>
                                              </tr>
                                          </tbody>
                                      </table>
                                      <div class="pay_btn_area">
                                          <button type="button" id="apibtn" class="btn pay_btn total_price_button">
                                              <h2 class="btn_text">결제하기</h2>
                                              <div>
                                                  <i class="fa-solid fa-arrow-right"></i>
                                              </div>
                                          </button>
                                      </div> 
                               </div>
                            </div>
                       </div>
                    </div>
                    
                    <%-- 오른쪽 -------------------------------------------------------------------------------------------------------------------%>
                    <div class="order_main_right">
                        <div class="order_main_right_in">
                           
                            <c:set var="cartList" value="${cartMap.get('cartList')}"/>
                            <c:set var="itemName" value="${cartMap.get('itemName')}"/>
                            <c:set var="quantity" value="${cartMap.get('quantity')}"/>
                            <c:set var="requestType" value="${cartMap.get('requestType')}"/>
                           
                            <%-- 바로주문인지, 장바구니 통해서 주문인지 확인 --%>
		                    <input type="hidden" class="reqtype" value="${requestType }">
		                    <c:if test="${requestType.equals('d') }">
		                   	    <input type="hidden" class="d_con" value="${cartList.getOrder_cnt() }">
			                    <input type="hidden" class="d_con" value="${cartList.getOrder_price() }">
			                    <input type="hidden" class="d_con" value="${cartList.getBeans_num() }">
			                    <input type="hidden" class="d_con" value="${cartList.getBeans_name() }">
			                    <input type="hidden" class="d_con" value="${cartList.getBeans_price() }">
			                    <input type="hidden" class="d_con" value="${cartList.getBeans_taste() }">
			                    <input type="hidden" class="d_con" value="${cartList.getCart_weight() }">
			                    <input type="hidden" class="d_con" value="${cartList.getCart_grind() }">
		                    </c:if>
                           
                            <!-- 주문 요약 -->
                            <div class="summary_order deliverInfo">
                              
                                <!-- 주문정보 -->
                                <input type="hidden" class="itemName" value="${itemName }">
                                <input type="hidden" class="quantity" value="${quantity }">
                                
                                <div class="detail_order_btn">
                                    <c:choose>
					             		<c:when test="${requestType.equals('d') }">
					             			<h3 class="point_text">주문 정보(1)</h3>
					             		</c:when>
					             		<c:otherwise>
					             			<h3 class="point_text">주문 정보(${fn:length(cartList) })</h3>
					             		</c:otherwise>
					             	</c:choose>
                                    <!-- 버튼 -->
                                    <button class="btn detail_btn" onclick="showDetail()">
                                        <i class="fa-solid fa-arrow-right"></i>
                                    </button>
                                </div>
                                
                                <!-- 주문 이미지 간략 & 버튼 -->
                                <div class="summary_order_img_btn">
                                
                                    <!-- 이미지 구역 -->
                                    <div class="summary_order_img">
                                        <div class="summary_order_img_in">
                                            
                                            <c:if test="${!empty cartList}">
                                            
                                            	<c:choose>
                                            	
                                            		<c:when test="${requestType.equals('d') }">
                                            			
                                            			<div class="row_img_area">
			                                                <div class="row_img">
			                                                    <a href="<%=request.getContextPath() %>/bean_content.do?num=${cartList.getBeans_num()}&no=${memberDto.getMember_num() }" class="img_a">
			                                                        <img src="${cartList.getBeans_img() }" alt="${cartList.getBeans_name() }" class="product_img_file">
			                                                    </a>
			                                                </div>
		                                            	</div>
		                                            	
                                            		</c:when>
                                            		
                                            		<c:otherwise>
                                            			
                                            			<c:forEach items="${cartList }" var="list">
                                            		
		                                            		 <div class="row_img_area">
				                                                <div class="row_img">
				                                                    <a href="<%=request.getContextPath() %>/bean_content.do?num=${list.getBeans_num()}&no=${memberDto.getMember_num() }" class="img_a">
				                                                        <img src="${list.getBeans_img() }" alt="${list.getBeans_name() }" class="product_img_file">
				                                                    </a>
				                                                </div>
				                                            </div>
                                            	
                                            			</c:forEach>
                                            		
                                            		</c:otherwise>
                                            	</c:choose>
                                            	
                                            	
                                            </c:if>
                                            
                                        </div>
                                    </div>
                                    
                                </div>
                                
                                <!-- 주문내역 -->
                                <div class="summary_order_price">
                                 
                                    <!-- 총 주문가격 -->
                                    <div class="total_price_txt_area">
                                        <div class="total total_price_txt">
                                            <h4 class="middle_text">상품가격</h4> 
                                            <div class="price_txt">
                                                <h3 class="middle_text">₩ <span class="total_price">10000</span></h3>
                                                <input type="hidden" class="total_price_hidden" name="total_price_hidden">
                                            </div>
                                        </div>
                                        <div class="total total_delivery">
                                            <h4 class="middle_text">전체배송비</h4> 
                                            <h4 class="middle_text h4_not"><span>무료배송</span></h4>
                                        </div>
                                        <div class="total use_point">
                                            <h5 class="middle_text">사용 포인트</h5> 
                                            <h5 class="middle_text h4_not">₩ <span class="total_use_point">0</span></h5>
                                        </div>
                                        <div class="hr_div hr_price"></div>
                                        <!-- 상품가격 + 배송비 -->
                                        <div class="total all_price">
                                            <h4 class="middle_text">총 주문금액</h4> 
                                            <div class="middle_text price_txt">
                                                <h3 class="point_text">
                                                	₩ <span class="all_total_price"></span>
                                                </h3>
                                            </div>
                                        </div>
                                        <div class="total all_t_point">
                                            <h5 class="sub_middle_text">적립 포인트</h5> 
                                            <div class="sub_middle_text price_txt">
                                                <h5 class="sub_middle_text">
                                                	₩ <span class="all_point"></span>
                                                </h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                           <!-- ----------------------------------- -->
						                             
                        </div>
                    </div>
                </section>
            </section>
        </section>
        
        <!-- 주문상세(슬라이더) -->
        <div class="slider">
             
             <div class="detail_order_btn">
             	<c:choose>
             		<c:when test="${requestType.equals('d') }">
             			<h3 class="point_text">주문 정보(1)</h3>
             		</c:when>
             		<c:otherwise>
             			<h3 class="point_text">주문 정보(${fn:length(cartList) })</h3>
             		</c:otherwise>
             	</c:choose>
                 
                 <button class="btn detail_btn" onclick="hideDetail()">
                     <i class="fa-solid fa-arrow-right"></i>
                 </button>
             </div>
             
             <div class="rows_area">
             	 <c:if test="${!empty cartList}">
             	 	
             	 	<c:choose>
                                            	
                      <c:when test="${requestType.equals('d') }">
                      	<div class="row_area">
                    
		                       <!-- 상품 이미지 -->
		                       <div class="row_img_area">
		                              <div class="row_img">
		                                  <a href="<%=request.getContextPath() %>/bean_content.do?num=${cartList.getBeans_num()}&no=${memberDto.getMember_num() }" class="img_a">
		                                      <img src="${cartList.getBeans_img() }" alt="${cartList.getBeans_name() }" class="product_img_file">
		                                  </a>
		                              </div>
		                          </div>
		                       
		                       <!-- 상품정보 -->
		                       <div class="row_cont_area">
		                           <div class="product_name">
		                               <h4 class="middle_text b_n">${cartList.getBeans_name() }</h3>
		                               <p class="sub_middle_text b_w">그람 : ${cartList.getCart_weight() } g</p>
		                               <p class="sub_middle_text">수량 : 
		                               	<span class="fin_row_cnt b_c">${cartList.getOrder_cnt() }</span>
		                               </p>
		                                <p class="sub_middle_text">
		                               	원두 갈기 :
		                               	<c:if test="${cartList.getCart_grind() == 0 }">
		                           	 		원두 그대로 주세요
		                               	</c:if>
		                               	<c:if test="${cartList.getCart_grind() == 1 }">
		                           	 		원두 갈아주세요
		                               	</c:if>
		                               </p>
		                               
		                               <input type="hidden" class="row_cart_num" value="${cartList.getCart_num() }">
		                               <input type="hidden" class="row_price" value="${cartList.getBeans_price() }">
		                           </div>
		                       </div>
		                       
		                       <!-- 상품 가격 -->
		                       <div class="row_price_area">
		                           <div class="price_txt row_price_txt">
		                               <h3 class="middle_text">
		                               	₩ <span class="row_total"><fmt:formatNumber value="${cartList.getOrder_price()}"/></span>
		                               </h3>
		                           </div>
		                       </div>
		                   </div>
                      	
             	 	  </c:when>
             	 	  
             	 	  <c:otherwise>
             	 	  	
             	 	  	<c:forEach items="${cartList }" var="list">
                      		
	                   		<div class="row_area">
	                    
			                       <!-- 상품 이미지 -->
			                       <div class="row_img_area">
			                              <div class="row_img">
			                                  <a href="<%=request.getContextPath() %>/bean_content.do?num=${list.getBeans_num()}&no=${memberDto.getMember_num() }" class="img_a">
			                                      <img src="${list.getBeans_img() }" alt="${list.getBeans_name() }" class="product_img_file">
			                                  </a>
			                              </div>
			                          </div>
			                       
			                       <!-- 상품정보 -->
			                       <div class="row_cont_area">
			                           <div class="product_name">
			                               <h4 class="middle_text b_n">${list.getBeans_name() }</h3>
			                               <p class="sub_middle_text b_w">그람 : ${list.getCart_weight() } g</p>
			                               <p class="sub_middle_text">수량 : 
			                               	<span class="fin_row_cnt b_c">${list.getOrder_cnt() }</span>
			                               </p>
			                                <p class="sub_middle_text">
			                               	원두 갈기 :
			                               	<c:if test="${list.getCart_grind() == 0 }">
			                           	 		원두 그대로 주세요
			                               	</c:if>
			                               	<c:if test="${list.getCart_grind() == 1 }">
			                           	 		원두 갈아주세요
			                               	</c:if>
			                               </p>
			                               
			                               <input type="hidden" class="row_cart_num" value="${list.getCart_num() }">
			                               <input type="hidden" class="row_price" value="${list.getBeans_price() }">
			                           </div>
			                       </div>
			                       
			                       <!-- 상품 가격 -->
			                       <div class="row_price_area">
			                           <div class="price_txt row_price_txt">
			                               <h3 class="middle_text">
			                               	₩ <span class="row_total"><fmt:formatNumber value="${list.getOrder_price()}"/></span>
			                               </h3>
			                           </div>
			                       </div>
			                   </div>
	                        
                      	</c:forEach>
             	 	  
             	 	  </c:otherwise>
             	 </c:choose>
                      
                  </c:if>
             </div>	
             <%-- rows_area 끝 --%>
             
             <div class="total_price_area1">
                 <div class="total_price_area2">
                    
                     <!-- 총 주문가격 -->
                     <div class="total_price_txt_area">
                         <div class="total total_price_txt">
                             <h4 class="middle_text">상품가격</h4> 
                             <div class="price_txt">
                                 <h3 class="middle_text">₩ <span class="total_price"></span></h3>
                             </div>
                         </div>
                         <div class="total total_delivery">
                             <h4 class="middle_text">전체배송비</h4> 
                             <h4 class="middle_text h4_not"><span>무료배송</span></h4>
                         </div>
                         <div class="total use_point">
                             <h5 class="middle_text">사용 포인트</h5> 
                             <h5 class="middle_text h4_not">₩ <span class="total_use_point">0</span></h5>
                         </div>
                         <div class="hr_div hr_price"></div>
                         <!-- 상품가격 + 배송비 -->
                         <div class="total all_price">
                             <h4 class="middle_text">총 주문금액</h4> 
                             <div class="price_txt">
                                 <h3 class="middle_text">₩ <span class="all_total_price"></span></h3>
                             </div>
                         </div>
                         <div class="total all_t_point">
                             <h5 class="sub_middle_text">적립 포인트</h5> 
                             <div class="price_txt">
                                 <h5 class="sub_middle_text">₩ <span class="all_point"></span></h5>
                             </div>
                         </div>
                     </div>
                     
                 </div>
             </div> 
             <%-- total_price_area1 끝 --%>
             
         </div> 
         <%-- 슬라이더 끝 --%>
        
        <!-- 주소(외) -->
      	<!-- <div class="modal_body "> -->
        <div class="modal_body display_none">
        
        	<div class="btn_a">
        		
        		<button class="btn modal_close" onclick="closeModal()">
        			<i class="fa-solid fa-x"></i>
        		</button>
        		
        		<button class="btn" onclick="location.href='<%=request.getContextPath()%>/member_mypage.do?num=${memberDto.getMember_num() }'">주소 등록하기</button>
        	</div>
        	
            <table class="modal_table">
            	<tr>
            		<th width="20%">순서</th>
            		<th width="60%">주소</th>
            		<th width="20%">선택</th>
            	</tr>
            	
            	 <%-- 주소 --%>
            	<c:forEach items="${ addrArr}" var="addrArr" begin="2" step="1">
           			<c:set var="addrlen" value="${fn:length(addrArr) }" />
           			<c:set var="row" value="${row+1}" />
           			
           			<tr class="t_border_top">
	            		<c:if test="${!addrArr.equals('-')}">
	            			<td rowspan="2">${row }</td>
	            			<td align="left">${fn:substring(addrArr,0,6) }</td>
	            			<td rowspan="2">
		            			<button class="t_select" onclick="selectAddr(${row}+2)">선택</button>
		            		</td>
	            		</c:if>
	            	</tr>
	            	<tr class="t_border_bottom">
	            		<c:if test="${!addrArr.equals('-')}">
		            		<td align="left">${fn:substring(addrArr,6,addrlen) }</td>
	            		</c:if>
	            	</tr>
	            	
            	</c:forEach>
            	
            </table>
        </div>
        
        <!-- 푸터 -->
        <jsp:include page="../layout/footer.jsp" />
        
        <script defer src="<%=request.getContextPath() %>/resources/js/cartAndOrderJs/order.js"></script>
        <script defer src="<%=request.getContextPath() %>/resources/js/cartAndOrderJs/kakaoapi.js"></script>
        

</body>
</html>