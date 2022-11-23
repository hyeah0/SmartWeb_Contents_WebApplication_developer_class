<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String mem_name = (String)session.getAttribute("userName"); %>
    
    	<div id="center" class="mypageCenter">
	  	 	<div class="myPageCenterContainer">
    
				<!-- nav, content -->
                <section id="section-nav_cont">
                	
                	<!-- 마이페이지 상세페이지 nav -->
                    <section id="section-nav">
                        <section id="section-member" class="section-member">
                            <div class="member_photo_div">
                                <a class="member_photo" href="<%=request.getContextPath() %>/mypage_main.do">
                                    <img alt="profile" src="<%=request.getContextPath() %>/source/img/profile1.jpeg">
                                </a>
                                <h3><%=mem_name %></h3>
                            </div>
                        </section>
                        <nav class="mypage-nav">   
                        	
                        	<!-- 쇼핑내역 - 주문목록 -->
                            <ul class="mypage-nav_ul">
                                <h3 class="mypage-nav_h3">
                                    <a href="mypage_order.do">쇼핑내역</a>
                                </h3>
                                <li class="mypage-nav_li">
                                    <a href="mypage_order.do">주문목록</a>
                                </li>                     
                            </ul>
                            <hr class="mypage_hr">
                            
                            <!-- 문의 - 문의 접수, 문의 내역 -->
                            <ul class="mypage-nav_ul">
                                <h3 class="mypage-nav_h3">
                                    <a href="mypage_board_insert.do">문의</a>
                                </h3>
                                <li class="mypage-nav_li">
                                    <a href="mypage_board_insert.do">1:1문의</a>
                                </li>
                                <li class="mypage-nav_li">
                                    <a href="mypage_board_list.do">문의내역</a>
                                </li>
                             </ul>
                             <hr class="mypage_hr">
                            
                            <!-- 회원정보 - 회원 정보 관리 -->
                            <ul class="mypage-nav_ul">
                                <h3 class="mypage-nav_h3">
                                    <a href="mypage_member_update_req.do">회원정보</a>
                                </h3>
                                <li class="mypage-nav_li">
                                    <a href="mypage_member_update_req.do">회원정보관리</a>
                                </li>
                            </ul>
                            
                        </nav>
                    </section>
                   <!-- 마이페이지 상세페이지 nav  -->