<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
 	<head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	    <meta http-equiv="Content-Script-Type" content="text/javascript" />
	    <meta http-equiv="Content-Style-Type" content="text/css" />
	    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	    <meta name="robots" content="noindex">
<%-- 	   	<link href="<%=request.getContextPath()%>/resources/css/style.css" rel="stylesheet" /> --%>
        
        
        <title>CuppACoffee</title>
        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/cartAndOrderCss/frame.css">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/cartAndOrderCss/cart.css">
        <script src="https://kit.fontawesome.com/4338ad17fa.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
        
    </head>
    <body class="body">
      
     	 <%-- 해더 --%>
		<div class="head">
       		<jsp:include page="../layout/header.jsp" />
        </div>
        
        <div class="blank"></div>
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
                                <a href="<%=request.getContextPath() %>/bean_cart.do" class="a last order_path_a"><b>장바구니</b></a>
                            </li>
                        </ul>
                    </section>
                </section>
                <!-- 장바구니 목록 컨텐츠 -->
                <section class="order_main cart_row_section">
                    <!-- 장바구니 담겨져있는 상품 row -->
                    <div class="order_main_left rows_area">
                    	
                            <c:choose>
	                    		<c:when test="${!empty cartList }">
	                    			<c:forEach items="${cartList }" var="list">
	                    				
	                    				<%-- 상품 재고가 있을 경우 시작 ---------------------------------------------------------------------%>
	                    				<c:if test="${list.getBeans_count() >= (list.getCart_cnt() * (list.getCart_weight()/100))  }">
	                    					
		                    				 <div class="row_area num_${list.getCart_num()}_row">
	                    						
	                    						<%-- 재고가 있을 경우에만 있음 --%>
	                    					 	<input type="hidden" class="row_cart_num num_${list.getCart_num()}_n" value="${list.getCart_num() }">
				                                
				                                <!-- 상품 이미지 -->
				                                <div class="row_img_area">
				                                    <div class="row_img">
				                                        <a href="<%=request.getContextPath() %>/bean_content.do?num=${list.getBeans_num()}&no=${memNum }" class="img_a">
				                                            <img src="${list.getBeans_img() }" alt="${list.getBeans_name() }" class="product_img_file cart_img_file">
				                                        </a>
				                                    </div>
				                                </div>
				                               
				                                <!-- 상품정보 -->
				                                <div class="row_cont_area">
				                                    <div class="product_name">
				                                        <h3 class="point_text cart_p_name">${list.getBeans_name() }</h3>
				                                        <h4 class="middle_text">${list.getBeans_taste() }</h4>
				                                         
				                                         <c:if test="${list.getCart_grind() eq 0 }">
				                                         	 <h5 class="sub_middle_text"> 
				                                         	 	<i class="fa-solid fa-check"></i>
				                                         	 	원두 그대로 주세요
				                                         	 </h5>
				                                         </c:if>
				                                         
				                                         <c:if test="${list.getCart_grind() eq 1 }">
				                                         	 <h5 class="sub_middle_text">
					                                         	 <i class="fa-solid fa-check"></i>
					                                         	 원두 갈아주세요
				                                         	 </h5>
				                                         </c:if>
				                                         
				                                         <!-- 재고 1000g 이하 부터 표시-->
				                                         <c:choose>
				                                         	<c:when test="${ list.getBeans_count()* 100 < 1000 }">
				                                         		<div class="c_beans_count">
							                                    	<h5 class="sub_middle_text">
								                                        재고 : [ <b class="num_${list.getCart_num()}_b_cnt">${ list.getBeans_count()* 100} </b> g ]
						                                         	</h5>
						                                    	</div>
				                                         	</c:when>
				                                         	<c:otherwise>
				                                         		<div class="c_beans_count j_num_${list.getCart_num()}_b_cnt display_none">
							                                    	<h5 class="sub_middle_text">
								                                        재고 : [ <b class="num_${list.getCart_num()}_b_cnt">${ list.getBeans_count()* 100} </b> g ]
						                                         	</h5>
						                                    	</div>
				                                         	</c:otherwise>
				                                         </c:choose>
				                                         
				                                        <input type="hidden" class="row_price num_${list.getCart_num()}_Rprice" value="${list.getBeans_price() }">
				                                        <%-- <input type="hidden" class="cart_p_grind" value="${list.getCart_grind() }"> --%>
				                                    </div>
				                                    
				                                    
				                                    
				                                    <div class="product_cnt_delete">
				                                        
			                                        	<div class="gram_cnt_btn_area">
					                                         
					                                         <!-- 원두 그람 수정 -->
					                                         <div class="gram_updown">
				                                                <div class="gram_input_area">
				                                                    <input type="number" class="input input_gram row_gram num_${list.getCart_num()}_gram }" max="400" value="${list.getCart_weight() }" name="cart_cnt" readonly> <label>g</label>
				                                                </div>
				                                                
				                                                <div class="btn_area">
				                                                
				                                                    <button type="button" class="btn gram_btn_up num_g_${list.getCart_num()}_Ubtn" onclick="gramUpCnt(${list.getCart_num()})">
				                                                    	<i class="fa-solid fa-caret-up"></i>
				                                                    </button>
				                                                    <button type="button" class="btn gram_btn_down num_g_${list.getCart_num()}_Dbtn" onclick="gramDownCnt(${list.getCart_num()})">
				                                                    	<i class="fa-solid fa-caret-down"></i>
				                                                    </button>
				                                                
				                                                </div>
				                                            </div>
					                                        
					                                        <!-- 원두 수량 수정 -->
					                                        <div class="cnt_updown">
					                                            <input type="number" min="1" max="20" class="input input_cnt num_${list.getCart_num()}_cnt" value="${list.getCart_cnt() }" name="cart_cnt" readonly>
					                                            <div class="btn_area">
					                                                
					                                                <button type="button" class="btn btn_up num_${list.getCart_num()}_Ubtn" onclick="upCnt(${list.getCart_num()})">
					                                                	<i class="fa-solid fa-caret-up"></i>
					                                                </button>
					                                                <button type="button" class="btn btn_down num_${list.getCart_num()}_Dbtn" onclick="downCnt(${list.getCart_num()})">
					                                                	<i class="fa-solid fa-caret-down"></i>
					                                                </button>
					                                            
					                                            </div>
					                                        </div>
				                                        </div>
				                                        
				                                        <!-- 삭제 & 찜 -->
				                                        <button type="button" class="btn btn_dh btn_delete" onclick="deleteRow(${list.getCart_num() })">
				                                            <i class="fa-solid fa-trash"> </i>
				                                        </button>
				                                        
				                                        <button type="button" class="btn btn_dh btn_coffee_heart" onclick="heartRowDB(${memNum}, ${list.getBeans_num() }, ${list.getCart_num()})">
				                                            <i class="fa-solid fa-heart heart_${list.getCoffee_heart()} num_${list.getCart_num()}_heart"></i>
				                                        </button>
				                                    </div>
				                                </div>
				                               
				                                <!-- 상품가격 -->
				                                <div class="row_price_area">
				                                    <div class="price_txt row_price_txt">
				                                        <h3 class="point_text product_price ">₩ <span class="row_total num_${list.getCart_num()}_Rtotal">0</span></h3>
				                                    </div>
				                                </div>
				                           
				                            </div>
			                            
			                             </c:if>
			                             <%-- 상품 재고가 있을 경우 끝 ----------------------------------------------------------------------%>
			                             
			                             <%-- 상품 재고가 없을 경우 시작 ---------------------------------------------------------------------%>
			                             <c:if test="${list.getBeans_count() < (list.getCart_cnt() * (list.getCart_weight()/100))  }">
			                             	
			                              	<div class="sold_out_row num_${list.getCart_num()}_row">
			                             		<div class="sold_out_txt">
			                             			<h3> 품&nbsp;&nbsp;절 </h3>
			                             			<p> [ <b>${ list.getBeans_count()* 100} g</b> ] 남았습니다. </p>
			                             			<c:if test="${list.getBeans_count()>0 }">
			                             				<button onclick="location.href='bean_cart_update.do?no=${list.getCart_num()}&cnt=1&weight=100'">다시 장바구니에 담기</button>
			                             			</c:if>
			                             		</div>
			                    				<div class="row_area sold_out">
					                                <!-- 상품 이미지 -->
					                                <div class="row_img_area">
					                                    <div class="row_img">
					                                        <a href="<%=request.getContextPath() %>/bean_content.do?num=${list.getBeans_num()}&no=${memNum}" class="img_a">
					                                            <img src="${list.getBeans_img() }" alt="${list.getBeans_name() }" class="product_img_file cart_img_file">
					                                        </a>
					                                    </div>
					                                </div>
					                               
					                                <!-- 상품정보 -->
					                                <div class="row_cont_area">
					                                    <div class="product_name">
					                                        <h3 class="point_text cart_p_name">${list.getBeans_name() }</h3>
					                                        <h4 class="middle_text">${list.getBeans_taste() }</h4>
					                                         
					                                         <c:if test="${list.getCart_grind() eq 0 }">
					                                         	 <h5 class="sub_middle_text"> 
					                                         	 	<i class="fa-solid fa-check"></i>
					                                         	 	원두 그대로 주세요
					                                         	 </h5>
					                                         </c:if>
					                                         
					                                         <c:if test="${list.getCart_grind() eq 1 }">
					                                         	 <h5 class="sub_middle_text">
						                                         	 <i class="fa-solid fa-check"></i>
						                                         	 원두 갈아주세요
					                                         	 </h5>
					                                         </c:if>
					                                         
					                                    </div>
					                                    <div class="product_cnt_delete">
					                                        
					                                        <div class="gram_cnt_btn_area">
						                                         
						                                         <!-- 원두 그람 수정 -->
						                                         <div class="gram_updown">
					                                                <div class="gram_input_area">
					                                                    <input type="number" class="input sold_out_input" value="${list.getCart_weight() }" name="cart_cnt" readonly> <label class="sold_out_input">g</label>
					                                                </div>
					                                                
					                                                <div class="btn_area">
					                                                
					                                                    <button type="button" class="btn gram_btn_up" disabled>
					                                                    	<i class="fa-solid fa-caret-up"></i>
					                                                    </button>
					                                                    <button type="button" class="btn gram_btn_down" disabled>
					                                                    	<i class="fa-solid fa-caret-down"></i>
					                                                    </button>
					                                                
					                                                </div>
					                                            </div>
						                                        
						                                        <!-- 원두 수량 수정 -->
						                                        <div class="cnt_updown">
						                                            <input type="number" class="input sold_out_input" value="${list.getCart_cnt() }" name="cart_cnt" readonly>
						                                            <div class="btn_area">
						                                                
						                                                <button type="button" class="btn btn_up" disabled>
						                                                	<i class="fa-solid fa-caret-up"></i>
						                                                </button>
						                                                <button type="button" class="btn btn_down" disabled>
						                                                	<i class="fa-solid fa-caret-down"></i>
						                                                </button>
						                                            
						                                            </div>
						                                        </div>
					                                        </div>
					                                        
					                                        <!-- 삭제 & 찜 -->
					                                        <button type="button" class="btn btn_dh btn_delete" onclick="deleteSoldOutRow(${list.getCart_num() })">
					                                            <i class="fa-solid fa-trash"> </i>
					                                        </button>
					                                        
					                                        <button type="button" class="btn btn_dh btn_coffee_heart" onclick="heartRowDB(${memNum}, ${list.getBeans_num() }, ${list.getCart_num()})">
					                                            <i class="fa-solid fa-heart heart_${list.getCoffee_heart()} num_${list.getCart_num()}_heart"></i>
					                                        </button>
					                                    </div>
					                                </div>
					                               
					                                <!-- 상품가격 -->
					                                <div class="row_price_area">
					                                    <div class="price_txt row_price_txt">
					                                        <h3 class="point_text product_price ">₩ <fmt:formatNumber value="${ list.getBeans_price() * list.getCart_cnt() * (list.getCart_weight()/100)}"/> </h3>
					                                    </div>
					                                </div>
					                           
					                            </div>
					                            
				                            </div>
			                             </c:if>	
			                           	 <%-- 상품 재고가 없을 경우 끝 ----------------------------------------------------------------------%>
			                            <div class="hr_div hr_content num_${list.getCart_num()}_hrdiv"></div>
	                    			
	                    			</c:forEach>
	                    		</c:when>
	                    		<c:otherwise>
	                    			<div class="row_area empty_cart">
	                    				<h3 class="point_text">담아둔 상품이 없습니다.</h3>
	                    			</div>
	                    		</c:otherwise>
	                    	</c:choose>
                          
                    </div>
                    
                    <!-- 총 금액 -->
                    <div class="order_main_right total_price_area1">
                        <div class="order_main_right_in total_price_area2">
                           
                            <!-- 총 주문가격 -->
                            <div class="total_price_txt_area">
                                
                                <h3 class="point_text">장바구니 내역</h3>
                                
                                <div class="total total_price_txt">
                                    <h4 class="middle_text">상품가격</h4> 
                                    <div>
                                        <h3 class="middle_text">₩ <span class="total_price">0</span></h3>
                                        <input type="hidden" class="total_price_hidden" name="total_price_hidden">
                                    </div>
                                </div>
                                
                                <div class="middle_text total total_delivery">
                                    <h4 class="middle_text ">전체배송비</h4> 
                                    <h4 class="middle_text h4_not "><span>무료배송</span></h4>
                                </div>
                              
                                <div class="hr_div hr_price"></div>
                                
                                <!-- 상품가격 + 배송비 -->
                                <div class="total all_price">
                                    <h4 class="middle_text">총 주문금액</h4> 
                                    <div class="price_txt">
                                        <h3 class="point_text">₩ <span class="all_total_price">0</span></h3>
                                    </div>
                                </div>
                                
                                <div class="sub_middle_text total all_t_point">
                                    <h5 class="sub_middle_text">적립 포인트</h5> 
                                    <div class="sub_middle_text price_txt">
                                        <h5>₩ <span class="all_point">0</span></h5>
                                        <input type="hidden" class="all_point_hidden" name="all_point_hidden">
                                    </div>
                                </div>
                            
                            </div>
                            <!-- 결제하기 버튼 구역 -->
                            <div class="total_price_button_area">
                               <c:if test="${!empty cartList  }">
                               		<button class="btn total_price_button order_btn">
	                                    <h2 class="btn_text total_price_button_in">주문하기</h2>
	                                    <div class="total_price_button_in">
	                                        <i class="fa-solid fa-arrow-right"></i>
	                                    </div>
	                                </button>
                               </c:if>
                            </div>
                        </div>
                    </div>
                    
                   <!--  </form> -->
                    
                </section>
                <div class="hr_div"></div>
                
                <!-- 추천제품 ----------------------------------------------------------------------------------->
                <section class="order_bottom recommend_products_section">
                    <h3 class="point_text">추천제품</h3>
                    <div class="recommend_products_section2">
                        <div id="slider" class="recommend_products">
                            
                            <!-- 추천상품 8가지 -->
                        	<c:if test="${! empty recProductList }">
                        		<c:forEach items="${recProductList }" var="recomend">
                        			<div class="recommend_product">
		                                <div class="recommend_product_area">
		                                    
		                                    <!-- 추천상품이미지 -->
		                                    <div class="recommend_img_area">   
		                                        <div class="recommend_img">
		                                            <a href="<%=request.getContextPath() %>/bean_content.do?num=${recomend.getBeans_num()}&no=${memNum}" class="img_a">
		                                            	<img src="${recomend.getBeans_img()}" alt="${recomend.getBeans_name()}" class="product_img_file">
		                                            </a>
		                                        </div>
		                                    </div>
		                                    
		                                    <!-- 추천상품가격 -->
		                                    <div class="recommend_product_cont">
		                                    	<h3 class="point_text product_rec_name">${recomend.getBeans_name()}</h3>
		                                        <h4 class="middle_text">${recomend.getBeans_taste()}</h4>
		                                        <h4 class="middle_text">₩ <fmt:formatNumber value="${recomend.getBeans_price()}" /></h3>
		                                    </div>
		                                    
		                                    <!-- 별점 -->
		                                    <div class="recommend_star">
		                                    <c:set var="star" value="${recomend.getAvg_star() }"/>
		                                    <c:forEach begin="1" end="${star }" step="1">
		                                     	<i class="fa-solid fa-star star"></i>
		                                    </c:forEach>
		                                    <c:forEach begin="1" end="${5-star }" step="1">
		                                     	<i class="fa-solid fa-star star_empty"></i>
		                                    </c:forEach>
		                                    </div>
		                                </div>
                           			 </div>
                        		</c:forEach>
                        	</c:if>
                        
                            
                            <!-- ------------------------------ -->
                        </div>
                        <!-- <div id="indicator">
                            <div id="indi_bar"></div>
                        </div> -->
                    </div>
                </section>
            </section>
        </section>
         <!-- 푸터 -->
        <jsp:include page="../layout/footer.jsp" />
        <script src="<%=request.getContextPath() %>/resources/js/cartAndOrderJs/cart.js"></script>
       
    </body>
</html>