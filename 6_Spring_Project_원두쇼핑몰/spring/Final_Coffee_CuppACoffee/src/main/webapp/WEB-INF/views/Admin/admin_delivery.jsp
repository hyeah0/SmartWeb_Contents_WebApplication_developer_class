<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>배송관리</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/cartAndOrderCss/frame.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/cartAndOrderCss/adminDelivery.css">
	 <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/cartAndOrderCss/page.css">
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
		<section class="header">
			<jsp:include page="../layout/Admin_header2.jsp"  />
		</section>
		
		<section class="wrap">
			<div class="blank"></div>
			<section class="main">
				<section class="main_in">
					<div class="m_header">
						<h2>배송 관리</h2>
					</div>
					
					 <!-- 배달 현황 요약 -->
	                <div class="m_summary">
	                    <div class="m_summary_in">
	                    
	                    	<c:set var="delivery" value="${summaryDeliveryMap }"/>
	                    	<c:set var="paging" value="${pageMap }"/> 
			          		<c:choose>
			          		  	<c:when test="${!empty paging.type_num  }">
			          		  		<c:set var="uri_type" value="&type=${paging.type_num }"/>	
			          		  	</c:when>
			          		  	<c:otherwise>
			          		  		<c:set var="uri_type" value=""/>
			          		  	</c:otherwise>
			          		</c:choose>
	                    	
	                        <div class="m_s_delivery m_s_delivery_ok">
	                            <h3 class="point_text">배송완료</h3>
	                            <h4 class="cnt_txt">
	                            	<a href="<%=request.getContextPath() %>/admin_orderlist.do?type=2" class="a">${delivery.deliveryOk }</a>
	                            </h4>
	                        </div>
	                        <div class="hr_div"></div>
	                        <div class="m_s_delivery m_s_delivery_ing">
	                            <h3 class="point_text">배송중</h3>
	                            <h4 class="cnt_txt">
	                            	<a href="<%=request.getContextPath() %>/admin_orderlist.do?type=1" class="a delivery_ing_a">${delivery.deliveryIng }</a>
	                            </h4>
	                        </div>
	                        <div class="hr_div"></div>
	                        <div class="m_s_delivery m_s_delivery_before">
	                            <h3 class="point_text">배송대기</h3>
	                            <h4 class="cnt_txt">
	                            	<a href="<%=request.getContextPath() %>/admin_orderlist.do?type=0" class="a delivery_before_a">${delivery.deliveryBefore }</a>
	                            </h4>
	                        </div>
	                        <div class="hr_div"></div>
	                        <div class="m_s_delivery m_s_delivery_before">
	                            <h3 class="point_text">주문취소</h3>
	                            <h4 class="cnt_txt">
	                            	<a href="<%=request.getContextPath() %>/admin_orderlist.do?type=3" class="a">${delivery.cancelOrder }</a>
	                            </h4>
	                        </div>
	                        
	                    </div>
	                </div>
	                
	                <div class="m_sub_header">
	                	<p><b>배송 관리</b></p>
	                	<div class="m_h_btn_area">
								
							<c:if test="${! empty paging.type_num }">
								<div>
									<button class="btn c_delivery_btn btn_hover" onclick="location.href='admin_orderlist.do'">전체 주문건 보기</button>
								</div>
							</c:if>
							
							<c:if test="${paging.type_num ==0 || empty paging.type_num }">
								<div>
									<button class="btn c_delivery_btn c_all_btn btn_hover" onclick="allDeliveryIng()">전체 배송처리 하기</button>
								</div>
							</c:if>
							
						</div>
	                	
	                </div>
	                <hr id="hr1" width="95%">
					
					
					<div class="m_content">
						
						<!-- 전체주문건보기, 전체 배송처리하기 버튼 구역 + 어떤 페이지인지 -->
						<div class="m_head">
							<div class="m_h_content">
								<c:choose>
									<c:when test="${! empty paging.type_num }">
										<p>  
											<c:choose>
												<c:when test="${paging.type_num==2 }"><b>배송완료 </b> 주문 : <b>${delivery.deliveryOk }</b> 건</c:when>
												<c:when test="${paging.type_num==1 }"><b>배송중 </b> 주문 : <b>${delivery.deliveryIng }</b> 건</c:when>
												<c:when test="${paging.type_num==0 }"><b>배송대기 </b> 주문 : <b class="delivery_before_txt">${delivery.deliveryBefore }</b> 건</c:when>
												<c:otherwise><b>주문취소</b> 주문건 : <b>${delivery.cancelOrder }</b> 건</c:otherwise>
											</c:choose>
										</p>
									</c:when>
									<c:otherwise>
										<p>  
											총 주문 : <b> ${paging.totalRecord } </b> 건
										</p>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						
	                    <table class="m_content_t">
	                        <colgroup>
	                            <col style="width: 20%">
	                            <col style="width: 30%">
	                            <col style="width: 20%">
	                            <col style="width: 30%">
	                        </colgroup>
	                        <thead>
	                            <tr>
	                                <th>주문번호</th>
	                                <th>상품명</th>
	                                <th>배달현황</th>
	                                <th>특이사항</th>
	                            </tr>
	                        </thead>
	                        <tbody>
								<c:if test="${empty orderListAdmin }">
									<tr>
										<th colspan="4">해당하는 주문건이 없습니다.</th>
									</tr>
								</c:if>
	                            <c:forEach items="${orderListAdmin }" var="list" >
		                            
		                            <tr class="order_row_tr">
		                                <td>${list.getOrder_num() }</td>
		                                <td>${list.getBeans_name() }</td>
		                                <td>
		                                	 <!-- 0: 배송대기, 1: 배송중, 2: 배송완료, 3:주문취소, 4:교환, 5:반품&환불 -->
		                                	<c:if test="${list.getType_num() == 0 }">
		                                    	<button class="btn c_delivery_btn btn_hover c_delivery_before js_delivery_btn_b" value="${list.getOrder_num() }">${list.getType_name() }</button>
		                                	</c:if>
		                                	
		                                	<c:if test="${list.getType_num() == 1 }">
		                                    	<button class="btn c_delivery_btn cur_none c_delivery_ing" disabled>${list.getType_name() }</button>
		                                	</c:if>
		                                	
		                                   	<c:if test="${list.getType_num() > 1 }">
		                                    	<button class="btn c_delivery_btn cur_none js_delivery_btn_o" disabled>${list.getType_name() }</button>
		                                	</c:if>
		                                   
		                                </td>
		                                <td>-</td>
		                            </tr>
		                            
								</c:forEach>	
	
	                        </tbody>
	                    </table>
                	
                	</div>
                	
               		 <!-- 페이지 ---------------------------------------------------------------------------->
        
			         <div class="m_page">
			              <div class="m_page_in">
			          		
			                  <!-- back -->
			                  <c:if test="${paging.page > 1 }">
			                   <div class="m_page_area back_div">
			                   	
			                        <a href="<%=request.getContextPath() %>/admin_orderlist.do?page=1${uri_type }" class="a">
			                            <i class="fa-solid fa-angles-left"></i>
			                        </a>
			                    
			                        <a href="<%=request.getContextPath() %>/admin_orderlist.do?page=${paging.page-1 }${uri_type }" class="a">
			                            <i class="fa-solid fa-angle-left"></i>
			                        </a> 
			                   
			                   </div>
			                  </c:if>   
			                  
			                  <!-- page number -->
			                  <div class="m_page_area num_div">
			                   	<c:forEach begin="${paging.startBlock }" end="${paging.endBlock }" var="i">
			                       
			                       <!-- 현재 페이지일때 --> 
			                        <c:if test="${i == paging.page }">
										<a href="<%=request.getContextPath() %>/admin_orderlist.do?page=${i }${uri_type }" class="a active_a">${i }</a>
									</c:if>
									
									<c:if test="${i != paging.page }">
										<a href="<%=request.getContextPath() %>/admin_orderlist.do?page=${i }${uri_type }" class="a">${i }</a>
									</c:if>
			
			                	</c:forEach>
			                  </div>
			                  
			                  <!-- forward -->
			                  <c:if test="${paging.page < paging.allPage }">
			                   	<div class="m_page_area forward_div">
			                   
			                       	<a href="<%=request.getContextPath() %>/admin_orderlist.do?page=${paging.page +1 }${uri_type }" class="a">
			                           	<i class="fa-solid fa-angle-right"></i>
			                       	</a>  
			                       
			                       	<a href="<%=request.getContextPath() %>/admin_orderlist.do?page=${paging.allPage }${uri_type }" class="a">
			                           	<i class="fa-solid fa-angles-right"></i>
			                       	</a>
			                       
			                   	</div>
			                  </c:if>
			              </div>
			          </div>
			          <%-- m_page 끝 ----------------------------------------------------------------------%>
                		
				</section>
				<%-- main_in 끝 ----------------------------%>
			</section>
			<%-- main 끝 -----------------------------------%>
		</section>
		<%-- wrap 끝 ---------------------------------------%>
		
		<script src="<%=request.getContextPath() %>/resources/js/cartAndOrderJs/adminDelivery.js"></script>
</body>
</html>