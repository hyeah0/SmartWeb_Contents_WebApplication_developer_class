<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="shortcut icon" sizes="16x16 32x32 64x64" href="../source/img/logo_title.jpeg">
    <link rel="stylesheet" href="css/frame.css">
    <link rel="stylesheet" href="css/pageLayout.css">
    <script src="https://kit.fontawesome.com/4338ad17fa.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<title>종로서적</title>
	<style>
		.center_banner_loca_a{
            display: block;
            width: 100%;
            height: 100%;
            background-image: url('https://shop-phinf.pstatic.net/20220927_45/1664235727171lON1E_JPEG/C7C7BEBE.jpg');
            background-position: center center;
            background-size: cover;
        }
	</style>
</head>
<body>
		
		<jsp:include page="../include/main_top.jsp"/>
		
	 	<!-- center -->
       <div id="center">
            <section class="center_section center_banner_ad">
            	<!-- 배너 출처 : 종로서적 -->
            	<div class="slider-container" >
                    
                    <c:forEach items="${bannerList }" var="banner">
                    	<a class="slide active" 
                    	    href="<%=request.getContextPath() %>/book_detail.do?book_num=${banner.getBanner_event() }" 
                    	   style="background-image: url('${banner.getBanner_img() }')">    
                    	</a>
                    </c:forEach>
                   
                    <button class="banner_arrow banner_arrow_left">
                        <i class="fa-solid fa-chevron-left"></i>
                    </button>
                
                    <button class="banner_arrow banner_arrow_right">
                        <i class="fa-solid fa-chevron-right"></i>
                    </button>
                </div>
            </section>
            
            <section class="center_section center_search">
            	<!-- uri 주소값 설정 -->
               	<c:set var="uri_listType" value="listType=${listType }"/>			
                  <c:set var="uri_requestType" value="requestType=${requestType }"/>
                  <c:set var="uri_nowCgy" value="category=${nowCgy_num }"/>
                  <c:set var="uri_page" value="page=${page}"/>
                  <c:set var="uri_search" value="search_type=${search_type }&search_input=${search_input }"/>
                  <c:set var="uri_request" value="requestType=${requestType }"/>
            
            
                <form class="center_search_form" method="post" action="main_getBookCategory.do?listType=1&requestType=1&category=all">
                    <select class="search_type" name="search_type">
                        <option value="all">통합검색</option>
                        
                        <c:set var="cgyList" value="${cgyList }"/>
	                	<c:if test="${!empty cgyList }">
	                		<c:forEach items = "${cgyList }" var = "cgyDto">
			                    <option value="${cgyDto.getCgy_num() }">${cgyDto.getCgy_name() }</option>
		                    </c:forEach>
	                    </c:if>
	                    
                    </select>
                    <input class="search_input" name="search_input" placeholder="검색어를 입력해주세요">
                    <button class="btn search_btn" type="submit">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                </form>
            </section>
            
            <section class="center_section center_best">
                <h2>화제의 책</h2>
                <div class="center_books">
                    <div class="center_books_div">
	                    <c:set var="bookList" value="${bookBestList }"/>
	                    <c:if test="${!empty bookBestList }">
	                    	<c:forEach items="${bookBestList }" var="bookBestDto">
	                    		
	                    		<div class="booklist center_best_book"> 
		                        	<div class="booklist_imgArea">
			                            <div class="booklist_imgArea_index">
		                                    <p>
		                                    	<c:out value="${bookBestDto.getRownum() }"></c:out>
		                                    </p>
		                                    <p>BEST</p>
			                            </div>
			                            <a href="<%=request.getContextPath() %>/book_detail.do?book_num=${bookBestDto.getBook_num() }">
			                                <img src="<%=request.getContextPath() %>/book_cover/${bookBestDto.getBook_img()}">
			                            </a>
		                       		</div>
			                        <div class="booklist_cont">
			                            <h3>${bookBestDto.getBook_name() }</h3>
			                            <p>
			                            	<fmt:formatNumber value="${bookBestDto.getBook_price() }" /> 원
			                            </p>
			                        </div>
	                    		</div>
	                    		
	                    	</c:forEach>
	                    </c:if>
	                 </div>
                </div>
            </section>
            
            <section class="center_section center_banner_loca">
                <a class="center_banner_loca_a" href="https://blog.naver.com/jongnobooks/222891604077" target="_blank">
                </a>
            </section>
            
            <section class="center_section center_store_pick">
                <h2>종로서적 PICK!</h2>
                <div class="store_pick_search">
                    <button class="btn requestType active">누적 판매순</button>
                    <button class="btn requestType">낮은 가격순</button>
                    <button class="btn requestType">최신 등록순</button>
                </div>
                <div class="center_books pick">
                    <div class="center_books_div pick_div">
                      
                      <c:set var="bookPickList" value="${bookPickList }"/>
                      	 <c:if test="${!empty bookPickList }">
	                    	
	                    	 <c:forEach items="${bookPickList }" var="bookPickDto" end="9">
                      			 <div class="booklist"> 
		                            <a href="<%=request.getContextPath() %>/book_detail.do?book_num=${bookPickDto.getBook_num() }">
		                                <div class="booklist_imgArea">    
		                                    <img src="<%=request.getContextPath() %>/book_cover/${bookPickDto.getBook_img() }"  alt="${bookPickDto.getBook_img() }">
		                                </div>
		                                <div class="booklist_cont">
		                                    <h3>${bookPickDto.getBook_name() }</h3>
		                                    <p><fmt:formatNumber value="${bookPickDto.getBook_price() }"/> 원 </p>
		                                </div>
		                            </a>
                       			 </div>
                      		</c:forEach>
                      		
                      	</c:if>
                    </div>
                </div>
            </section>
        </div>
        
		<jsp:include page="/include/main_bottom.jsp"/>
 	
 	<script type="text/javascript" src="js/mainJs/bannerJs.js"></script>
 	<script type="text/javascript" src="js/mainJs/storePickJs.js"></script>	
</body>
</html>