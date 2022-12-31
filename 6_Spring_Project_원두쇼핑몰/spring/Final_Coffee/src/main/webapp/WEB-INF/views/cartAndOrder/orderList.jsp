<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
		
	<title>CuppACoffee</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/cartAndOrderCss/frame.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/cartAndOrderCss/orderOk.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/cartAndOrderCss/orderList.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/cartAndOrderCss/page.css">
    <script src="https://kit.fontawesome.com/4338ad17fa.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
	
	 <%-- 해더 --%>
	 <div class="head">
      	<jsp:include page="../layout/header.jsp" />
     </div>
  	
  	 <div class="blank"></div>
	 
	 <!-- 컨텐츠 부분 -->
     <section class="content">
         <section class="order_wrap">
             <!-- 주문 완료 목록 -->
             <section class="order_main"> 
                 <div class="order_main_in">
                 
                     <!-- head -->
                     <div class="m_header">
                         <h3>주문내역</h3>
                     </div>
                     
                     <!-- 배달 현황 요약 -->
	                <div class="m_summary">
	                	
	                    <div class="m_summary_in">
	                    
	                        <c:set var="delivery" value="${summaryDeliveryMap }"/>
	                        <c:set var="paging" value="${pageMap }"/> 
	                        
	                        <c:choose>
	                        	<c:when test="${empty paging.page }">
	                       		 	<c:set var="uri_page" value=""/>
	                        	</c:when>
	                        	<c:otherwise>
	                       		 	<c:set var="uri_page" value="&page=${paging.page }"/>
	                        	</c:otherwise>
	                        </c:choose>
	                        
	                        <c:choose>
	                        	<c:when test="${empty paging.type_num }">
	                       		 	<c:set var="uri_type" value=""/>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<c:set var="uri_type" value="&type=${paging.type_num }"/>
	                        	</c:otherwise>
	                        </c:choose>
	                        
	                        <c:choose>
	                        	<c:when test="${empty paging.startEnd }">
	                        		<c:set var="uri_startEnd" value=""/>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<c:set var="uri_startEnd" value="&startEnd=${paging.startEnd }"/>
	                        	</c:otherwise>
	                        </c:choose>
	                        
	                        
	                        <input type="hidden" class="rows" value="${paging.totalRecord}">
	                        
	                        <div class="m_s_delivery m_s_delivery_ok">
	                            <h3 class="point_text">배송완료</h3>
	                            <h4 class="cnt_txt">
	                            	<a href="<%=request.getContextPath() %>/order_list.do?page=1&type=2${uri_startEnd}" class="a delivery_ok_a">${delivery.deliveryOk }</a>
	                            </h4>
	                        </div>
	                        <div class="hr_div"></div>
	                        <div class="m_s_delivery m_s_delivery_ing">
	                            <h3 class="point_text">배송중</h3>
	                            <h4 class="cnt_txt">
	                            	<a href="<%=request.getContextPath() %>/order_list.do?page=1&type=1${uri_startEnd}" class="a delivery_ing_a">${delivery.deliveryIng }</a>
	                            </h4>
	                        </div>
	                        <div class="hr_div"></div>
	                        <div class="m_s_delivery m_s_delivery_before">
	                            <h3 class="point_text">배송대기</h3>
	                            <h4 class="cnt_txt">
	                            	<a href="<%=request.getContextPath() %>/order_list.do?page=1&type=0${uri_startEnd}" class="a delivery_before_a">${delivery.deliveryBefore }</a>
	                            </h4>
	                        </div>
	                        <div class="hr_div"></div>
	                        <div class="m_s_delivery m_s_delivery_before">
	                            <h3 class="point_text">주문취소</h3>
	                            <h4 class="cnt_txt">
	                            	<a href="<%=request.getContextPath() %>/order_list.do?page=1&type=3${uri_startEnd}" class="a">${delivery.cancelOrder }</a>
	                            </h4>
	                        </div>
	                        
	                    </div>
	                    
	                    <div>
	                		<p class="explain_txt">* 가입일 부터 금일까지의 배송 현황</p>
	                	</div>
	                </div>
                     
                     
                     <!-- search -->
                     <div class="m_search">
                         <table class="m_table">
                             <colgroup>
                                 <col style="width: 20%">
                                 <col style="width: 70%">
                                 <col style="width: 10%">
                             </colgroup>
                             <tr>	
                             	<td>
                             		<div class="s_date">
                                    	 <button class="btn etc_btn sub_middle_text" onclick="location.href='order_list.do'">전체보기</button>
                                     </div>
                             	</td>
                                 <td class="search_date">
                                     <div class="s_date">
                                     	 
                                     	  <c:set var="now" value="<%=new java.util.Date()%>" />
        								  <c:set var="nowFormat"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>
                                     	
                                     	 <c:if test="${empty paging.startEnd }">
                                     	 	 <input type="date" class="start_date" value="${nowFormat }">
	                                         <span>-</span> 
	                                         <input type="date" class="end_date" value="${nowFormat }">
                                     	 </c:if>
                                     	 
                                     	 <c:if test="${!empty paging.startEnd }">
                                     	 	 <input type="date" class="start_date" value="${paging.start.substring(0,10) }">
	                                         <span>-</span> 
	                                         <input type="date" class="end_date" value="${paging.end.substring(0,10) }">
                                     	 </c:if>
                                       
                                     </div>
                                 </td>
                                 <td class="search_btn">
                               		<div class="s_date">
                                    	 <button class="btn etc_btn sub_middle_text" onclick="searchData()">조회</button>
                                     </div>
                                 </td>
                             </tr>
                         </table>
                         <div>
	                		<p class="explain_txt_now"></p>
	                	</div>
                     </div>
                     
                     <!-- main -->
                     <div class="m_main">                
                       
                        <c:if test="${empty orderList }">
                        	<table class="m_table m_rows_table">
                        		<tr>
                        			<th>주문 내역이 없습니다.</th>
                        		</tr>
                        	</table>
                        </c:if>
                       
                        <c:forEach items="${orderMonArr }" var="month">
                        <c:set var="orderMonth" value="${month}" />
                        
                         <!-- 주문 월 -->
                         <div class="m_order_month">
                             <h4 class="point_text">${month }</h4>
                         </div>
                         
                         <!-- 주문 내역 -->
                         <div class="m_order_rows"> 
                          
                             <!-- 주문 월 주문내역  -->
                             <table class="m_table m_rows_table">
                                 <colgroup>
                                     <col style="width: 20%">
                                     <col style="width: 50%">
                                     <col style="width: 20%">
                                     <col style="width: 10%">
                                 </colgroup>
                                 
                                 <c:forEach items="${orderList }" var="list">
                                 
                                 	<c:if test="${list.getOrder_month().equals(orderMonth)}">
	                             
		                                 <tr class="m_order_row js_delivery_${list.getOrder_num() }_c">
		                                     <td class="p_date_area txt_center">
		                                     	
												 <a class="a p_date" href="<%=request.getContextPath() %>/bean_order_cont.do?order=${list.getOrder_num() }${uri_page}${uri_type}${uri_startEnd}">
		                                         	${list.getOrder_num() }
		                                         </a>
		                                         
		                                         
		                                         <p>(${list.getOrder_date().substring(0,10) })</p> 
		                                     </td>
		                                  
		                                     <td class="p_cont_area">
		                                         <div class="p_cont_imgcont">
		                                             <div class="p_img">
		                                                 <a href="<%=request.getContextPath() %>/bean_content.do?num=${list.getBeans_num()}" class="p_img_a">
		                                                     <img src="${list.getBeans_img() }" alt="${list.getBeans_name() }">
		                                                 </a>
		                                             </div>
		                                             <div class="p_cont">
		                                             	<c:choose>
		                                             		
		                                             		<%-- 주문 취소건일 경우 삭선 처리 --%>
		                                             		<c:when test="${list.getType_num()==3 }">
		                                             			<p style="text-decoration: line-through;">${list.getBeans_name() }</p>
		                                             		</c:when>
		                                             		
		                                             		<c:otherwise>
		                                             			<p>${list.getBeans_name() }</p>
		                                             		</c:otherwise>
		                                                 
		                                             	</c:choose>
		                                             </div>
		                                         </div>
		                                     </td>
		                                     <td class="txt_right">
		                                     	<c:choose>
		                                             		
                                             		<%-- 주문 취소건일 경우 삭선 처리 --%>
                                             		<c:when test="${list.getType_num()==3 }">
                                             			<p style="text-decoration: line-through;">
                                             				<fmt:formatNumber type="currency" value="${list.getOrder_price() }"/>
                                             			</p>
                                             		</c:when>
                                             		
                                             		<c:otherwise>
                                             			<p>
                                             				<fmt:formatNumber type="currency" value="${list.getOrder_price() }"/>
                                             			</p>
                                             		</c:otherwise>
                                                 
                                             	</c:choose>
		                                     
		                                     	
		                                     </td>
		                                     
		                                     <td class="txt_center js_delivery_${list.getOrder_num() }">
		                                     
			                                     <%-- 만약 배송중이면 구매완료 버튼 생성 버튼 클릭시 >> 배송완료로 변경 --%>
			                                     <c:choose>
													<c:when test="${list.getType_num()==0 }"><b class="c_delivery_before">${list.getType_name() }</b></c:when>
													<c:when test="${list.getType_num()>1 }"><b>${list.getType_name() }</b></c:when>
													<c:otherwise>
														<div>
															<button class="btn c_delivery_ok js_delivery_ok" value="${list.getOrder_num()}">구매완료</button>
														</div>
													</c:otherwise>
												</c:choose>
		                                     </td>
		                                 </tr>
	                                 
                                 	</c:if>
                                 
                                 </c:forEach>
                                 
                             </table>
                         </div>

                     </c:forEach>
                     
                 </div>
                 <%-- m_main 끝 ---------------------------------------------------------------%>
                 
	                 
                 </div>
             	<%-- order_main_in 끝 ---------------------------------------------------------%>
             	
           	 </section>
             <%-- order_main 끝 ---------------------------------------------------------------%>
         
         
         
         <!-- 페이지 ---------------------------------------------------------------------------->
         
         <div class="m_page">
              <div class="m_page_in">
          
                  <!-- back -->
                  <c:if test="${paging.page > 1 }">
                   <div class="m_page_area back_div">
                   	
                        <a href="<%=request.getContextPath() %>/order_list.do?page=1${uri_type }${uri_startEnd}" class="a">
                            <i class="fa-solid fa-angles-left"></i>
                        </a>
                    
                        <a href="<%=request.getContextPath() %>/order_list.do?page=${paging.page-1 }${uri_type }${uri_startEnd}" class="a">
                            <i class="fa-solid fa-angle-left"></i>
                        </a> 
                   
                   </div>
                  </c:if>   
                  
                  <!-- page number -->
                  <div class="m_page_area num_div">
                   	<c:forEach begin="${paging.startBlock }" end="${paging.endBlock }" var="i">
                       
                       <!-- 현재 페이지일때 --> 
                        <c:if test="${i == paging.page }">
							<a href="<%=request.getContextPath() %>/order_list.do?page=${i }${uri_type }${uri_startEnd}" class="a active_a">${i }</a>
						</c:if>
						
						<c:if test="${i != paging.page }">
							<a href="<%=request.getContextPath() %>/order_list.do?page=${i }${uri_type }${uri_startEnd}" class="a">${i }</a>
						</c:if>

                	</c:forEach>
                  </div>
                  
                  <!-- forward -->
                  <c:if test="${paging.page < paging.allPage }">
                   	<div class="m_page_area forward_div">
                   
                       	<a href="<%=request.getContextPath() %>/order_list.do?page=${paging.page +1 }${uri_type }${uri_startEnd}" class="a">
                           	<i class="fa-solid fa-angle-right"></i>
                       	</a>  
                       
                       	<a href="<%=request.getContextPath() %>/order_list.do?page=${paging.allPage }${uri_type }${uri_startEnd}" class="a">
                           	<i class="fa-solid fa-angles-right"></i>
                       	</a>
                       
                   	</div>
                  </c:if>
              </div>
          </div>
          <%-- m_page 끝 ----------------------------------------------------------------------%>
         
         
         </section>
         <%-- order_wrap 끝 -------------------------------------------------------------------%>
     </section>
     <%-- content 끝 --------------------------------------------------------------------------%>
     
     
     <%-- 푸터 --%>
     <jsp:include page="../layout/footer.jsp" />
     <script src="<%=request.getContextPath() %>/resources/js/cartAndOrderJs/orderList.js"></script>
</body>
</html>