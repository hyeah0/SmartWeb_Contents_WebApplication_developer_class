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
        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/cartAndOrderCss/orderListC.css">
        <script src="https://kit.fontawesome.com/4338ad17fa.js" crossorigin="anonymous"></script>
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
             <section class="order_top">
                 <!-- 홈 > 장바구니 > 주문서작성 > 결제완료 > 주문완료 -->
                 <section class="order_path">
                     <ul class="list order_path_list">
                         <li>
                             <a href="<%=request.getContextPath() %>" class="a order_path_a">홈</a>
                         </li>
                         <li>
                             <a class="a order_path_a disable">장바구니</a>
                         </li>
                         <li>
                             <a class="a order_path_a disable">주문서작성</a>
                         </li>
                         <li>
                             <a href="#" class="a last order_path_a"><b>주문완료</b></a>
                         </li>
                     </ul>
                 </section>
             </section>
		
			 <section class="order_main"> 
	            <div class="order_main_in">
	                <!-- head -->
	                <div class="m_header">
	                    <h3 class="point_text">주문 내역</h3>
	                    <div class="e_btn_area">
	                        <button class="btn etc_btn small_txt" onclick="location.href='order_list.do'">더보기</button>
	                    </div>
	                </div>
					<%-- head 끝 -----------------------------------------------------------------------------------------%>
	                
	                <!-- main -->
	                <div class="m_main">
	                    <!-- 주문 내역 -->
	                    <div class="m_order_rows m_main_t m_detail_t">
	                        <c:set var="summary" value="${summaryOrder }"/>
	                        <div class="m_order_num">
	                            <ul class="list">
	                                <li>주문번호 | <span><b>${summary.order_num }</b></span> </li>
	                                <li>주문일 | <span><b>${summary.order_date }</b></span> </li>
	                            </ul>
	                            
	                            
	                            <div class="m_order_cancel">
	                            
	                            	<c:if test="${summary.type_num==3 }">
	                                	<p>(주문 취소건)</p>
                                	</c:if>
                                	
                                	<c:if test="${summary.type_num!=3 }">
                                		<button onclick="location.href='order_all_cancel.do?onum=${summary.order_num }'">전체 주문 취소하기</button>
                                	</c:if>
                                	
	                            </div>
	                            
	                        </div>
	                        <table class="m_table m_s_t">
	                            <colgroup>
	                                <col style="width: 10%">
	                                <col style="width: 60%">
	                                <col style="width: 20%">
	                                <col style="width: 10%">
	                            </colgroup>
	                            <tr>
	                                <th>순번</th>
	                                <th>상품 정보</th>
	                                <th>상품 금액</th>
	                                <th>재구매</th>
	                            </tr>
	                            
	                             <c:forEach items="${orderList}" var="list">
	                            	
	                            	<tr class="m_tr">
	                              
	                                 <td class="p_row txt_center">
	                                 	${list.getOrder_row() }
	                                 </td>
	                                 <!-- 이미지 -->
	                                 <td class="p_cont_area">
	                                     <div class="p_cont_imgcont">
	                                         <div class="p_img">
	                                         	<a href="<%=request.getContextPath() %>/bean_content.do?num=${list.getBeans_num()}" class="p_img_a">
	                                                 <img src="${list.getBeans_img() }" alt="${list.getBeans_name() }">
	                                             </a>
	                                         </div>
	                                         <div class="p_cont">
	                                             <p class="sub_middle_text">${list.getBeans_name() }</p>
	                                             <p class="small_txt">그람 : <span> ${list.getCart_weight() }</span> </p>
	                                             <p class="small_txt">수량 : <span> ${list.getOrder_cnt() }</span> </p>
	                                             <p class="small_txt">
	                                             	<span> 
	                                            			<c:if test="${list.getCart_grind() eq 0 }">
	                                      	 	<i class="fa-solid fa-check"></i>
	                                       	 원두 그대로 주세요
	                                       </c:if>
	                                       
	                                       <c:if test="${list.getCart_grind() eq 1 }">
	                                       	 <i class="fa-solid fa-check"></i>
	                                      		 원두 갈아주세요
	                                   				 </c:if>
	                                             	</span> 
	                                             </p>
	                                         </div>
	                                     </div>
	                                 </td>
	                               
	                                 <td class="p_price txt_right">
	                                 	<fmt:formatNumber type="currency" value="${list.getOrder_price() }"/>
	                                 </td>
	                                 <td class="p_reorder">
	                                     <button class="btn small_txt" onclick="location.href='bean_cart_insert.do?no=${list.getBeans_num()}&count=${list.getOrder_cnt() }&weight=${list.getCart_weight() }&grind=${list.getCart_grind()}'">재구매</button>
	                                     <!-- <button class="btn small_txt" onclick="">주문취소</button> -->
	                                 </td>
	                                </c:forEach>
	                            </tr>
	                        </table>
	                        
	                    </div>
	                    <!-- ---------------------------- -->
	                    
	                    <!-- 결제 정보 -->
	                    <div>
	                        <div class="m_header">
	                            <h3 class="point_text">주문/결제 정보</h3>
	                        </div>
	                        <div class="o_all">
	                            <div class="o_pay_point">
	                            
	                                <div class="o_order_pay">
	                                    <div class="o_order">
	                                        <h5 class="middle_text">주문금액</h5>
	                                        <table>
	                                            <tr>
	                                                <th>상품금액</th>
	                                                <td class="txt_right">
	                                                    <fmt:formatNumber type="currency" value="${summary.order_price_total }"/> 
	                                                </td>
	                                            </tr>
	                                            <tr>
	                                                <th>배송비</th>
	                                                <td class="txt_right">
	                                                	<fmt:formatNumber type="currency" value="0"/> 
	                                                </td>
	                                            </tr>
	                                            <tr>
	                                                <th>포인트사용</th>
	                                                <td class="txt_right">
	                                                	- <fmt:formatNumber type="currency" value="${summary.use_point }"/> 
	                                                </td>
	                                            </tr>
	                                        </table>
	                                    </div>
	                                    <%-- o_order 까지 -------------------------------------------------------------------%>
	                                    <div class="o_pay">
	                                        <h5 class="middle_text">결제금액</h5>
	                                        <table>
	                                            <tr>
	                                                <th>카카오페이</th>
	                                                <td class="txt_right">
	                                                	<fmt:formatNumber type="currency" value="${summary.order_price_total - summary.use_point }"/>
	                                                </td>
	                                            </tr>
	                                        </table>
	                                    </div>
	                                    <%-- o_pay 까지 ---------------------------------------------------------------------%>
	                                </div>
	                                <%-- o_order_pay 까지 -------------------------------------------------------------------%>
	                               
	                                <div class="o_point">
	                                    <h5 class="middle_text">포인트</h5>
	                                    <table>
	                                        <tr>
	                                            <th>포인트적립</th>
	                                            <td class="txt_right">
	                                            	<fmt:formatNumber type="currency" value="${summary.order_price_total*0.05 }"/> 
	                                            </td>
	                                        </tr>
	                                    </table>
	                                </div> 
	                                
	                            </div>
	                            <%-- o_pay_point 까지 -----------------------------------------------------------------------%>
	                            
	                            <div class="o_conclusion">
	                            	<div class="o_conclusion_d">
	                                 <table class="o_conclusion_t">
	                                     <tr>
	                                         <th>주문금액</th>
	                                         <td class="txt_right">
	                                         	 <fmt:formatNumber type="currency" value="${summary.order_price_total }"/>
	                                         </td>
	                                     </tr>
	                                     <tr>
	                                         <th>배송비</th>
	                                         <td class="txt_right">
	                                         	<fmt:formatNumber type="currency" value="0"/> 
	                                         </td>
	                                     </tr>
	                                     <tr>
	                                         <th>포인트사용</th>
	                                         <td class="txt_right">
	                                         	- <fmt:formatNumber type="currency" value="${summary.use_point }"/> 
	                                         </td>
	                                     </tr>
	                                     <tr class="sep_tr">
	                                         <td colspan="2"></td>
	                                     </tr>
	                                     <tr>
	                                         <th>결제금액</th>
	                                         <td class="txt_right middle_text">
	                                         	<fmt:formatNumber type="currency" value="${summary.order_price_total - summary.use_point }"/>
	                                         </td>
	                                     </tr>
	                                 </table>
	                                </div>
	                                <%-- o_conclusion_d 까지 ----------------------------------------------------------------%>
	                            </div>
	                             <%-- o_conclusion 까지 ---------------------------------------------------------------------%>
	                        </div>
	                        <%-- o_all 까지 ---------------------------------------------------------------------------------%>
	                    </div>
	                    <%-- 결제정보 끝 ------------------------------------------------------------------------------------%>
	                </div>
	                <%-- m_main 끝 ----------------------------------------------------------------------------------------%>
	            </div>
	            <%-- order_main_in 끝 -------------------------------------------------------------------------------------%>
	        </section>
	        <%-- order_main 끝 --------------------------------------------------------------------------------------------%>
		
          </section>
          <%-- order_wrap 끝 ------------------------------------------------------------------------------------------------%>
         
      </section>
      <%-- content 끝 -------------------------------------------------------------------------------------------------------%>
        
        <%-- 푸터 --%>
        <jsp:include page="../layout/footer.jsp" />
</body>
</html>