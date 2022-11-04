<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>종로서적 쇼핑내역</title>
    <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="source/img/logo_title.jpeg">
    <script src="https://kit.fontawesome.com/4338ad17fa.js" crossorigin="anonymous"></script> 
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/frame.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypageCss/mypageLayout.css">   
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypageCss/mypageOrderBook.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/pagingLayout.css">
</head>
<body>

	<jsp:include page="/include/main_top.jsp"/>

		<!-- content : nav, content -->
		<jsp:include page="/include/mypage/mypage_detail_nav.jsp"/>
			
			<section id="section-cont">
                <div class="mypage-cont">
                
                	<!-- 콘텐츠 타입 -->
                    <div class="mypage-cont_toptext">
                        <h3>쇼핑내역</h3>
                    </div>
                    
                    <!-- 콘텐츠 nav -->
                    <div class="mypage-cont_nav_divContainer">
                        <div class="mypage-cont_nav_div">
                            <div class="mypage-cont_nav_each">
                                <a href="mypage_order.do">주문목록</a>
                            </div>
                        </div>
                        <div class="mypage-cont_nav_effect"></div>
                    </div>
                    
                    <!-- 콘텐츠 내용 -->
                    <div class="mypage_contents">
                    
                    	<!-- 기간 설정 -->
                        <div class="mypage-cont_toptext">
                            <form action="" class="">
                                <select name="order_term" id="">
                                    <option value="">2010.10.01 - 2010.11.02</option>
                                </select>
                                <button class="cont_form_btn">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </button>
                            </form>
                        </div>
                        
                        <!-- 주문 목록 -->
                        <table class="mypage_table order_table">
                            <tbody>
                            
                                <!-- for each 로 돌릴예정 -->
                                <!-- 책 6개 가능 -->
                                <tr>
                                    <td class="mypage_table_td order_tbody_date">
                                        <a href="#">일자</a>
                                    </td>
                                    <td class="order_tbody_img">
                                        <a href="<%=request.getContextPath() %>/book_detail.do?book_num=${bookBestDto.getBook_num() }"">
                                            <img src="./source/img/book/book_trandKorea.jpeg">
                                        </a>
                                    </td>
                                    <td class="order_tbody_bname">책이름</td>
                                    <td class="order_tbody_cnt">2</td>
                                    <td class="order_tbody_price">15000</td>
                                </tr>
                                
                               
                            </tbody>
                        </table>
                    </div>
                    
                    <!-- 페이징 -->
                    <jsp:include page="../include/mypage/mypage_paging.jsp"/>
               
            	</div>
			</section>
			<!-- section-cont 끝 -->	    	
        <jsp:include page="/include/mypage/mypage_bottom.jsp"/>
        <jsp:include page="/include/main_bottom.jsp"/>
</body>
</html>