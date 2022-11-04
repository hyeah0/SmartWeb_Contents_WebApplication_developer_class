<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<link rel="shortcut icon" sizes="16x16 32x32 64x64" href="../source/img/logo_title.jpeg">
    <link rel="stylesheet" href="/css/frame.css">
    <script src="https://kit.fontawesome.com/4338ad17fa.js" crossorigin="anonymous"></script>
</head>
<body>
		<jsp:include page="../include/main_top.jsp"/>
		
	 	<!-- center -->
       <div id="center">
            <section class="center_section center_banner_ad">
                <a href="#">
                    <!-- day18강의 참고 -->
                    <div class="banner_arrow banner_arrow_left">
                        <button>
                            <i class="fa-solid fa-chevron-left"></i>
                        </button>
                    </div>
                    
                    <div class="banner_arrow banner_arrow_right">
                        <button>
                            <i class="fa-solid fa-chevron-right"></i>
                        </button>
                    </div>
                </a>
            </section>
            <section class="center_section center_best">
                <h2>화제의 책</h2>
                <div class="center_best_books">
                    
                    <c:set var="bookList" value="${bookList }"/>
                    <c:if test="${!empty bookList }">
                    	
                    	<c:forEach items="${bookList }" var="bookDto" end="${count = 4 }">
                    		<c:set var="count" value="${count+1 }"/>
                    		
                    		<div class="booklist center_best_book"> 
	                        	<div class="booklist_imgArea">
		                            <div class="booklist_imgArea_index">
	                                    <p>
	                                    	<c:out value="${count }"></c:out>
	                                    </p>
	                                    <p>BEST</p>
		                            </div>
		                            <a href="">
		                                <!-- <img src="./source/img/book/bookn001theTherapist.jpeg" alt="book_theTherapist"> -->
		                                <img src="<%=request.getContextPath() %>/source/img/book/${bookDto.getBook_img()}">
		                            </a>
	                       		</div>
		                        <div class="booklist_cont">
		                            <h3>${bookDto.getBook_name() }</h3>
		                            <p>
		                            	<fmt:formatNumber value="${bookDto.getBook_price() }"/>
		                            </p>
		                        </div>
                    		</div>
                    		
                    	</c:forEach>
                    </c:if>
                    <c:if test="${empty bookList }">
                    	<div>
                    		데이터 없음
                    	</div>
                    </c:if>
                </div>
            </section>
            <section class="center_section center_banner_loca">
                배너 location
            </section>
            <section class="center_section center_store_pick">
                <h2>종로서적 PICK!</h2>
                <div class="store_pick_search">
                    <button>누적 판매순</button>
                    <button>낮은 가격순</button>
                    <button>최신 등록순</button>
                </div>
                <div class="center_books_table">
                  <table>
                        <!-- 3행 7열 총 15개 책 foreach 예정 -->
                        <tr>
                            <td>
                                <div class="booklist"> 
                                    <a href="">
                                        <div class="booklist_imgArea">    
                                             <img src="./source/img/book/book_theTherapist.jpeg" alt="book_theTherapist">
                                        </div>
                                        <div class="booklist_cont">
                                            <h3>더 테라피스트</h3>
                                            <p>16000</p>
                                        </div>
                                        <div class="booklist_cont_detail">
                                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                                        </div>
                                    </a>
                                </div>
                            </td> 
                            <td>
                                <div class="booklist"> 
                                    <a href="">
                                        <div class="booklist_imgArea">    
                                             <img src="./source/img/book/book_theTherapist.jpeg" alt="book_theTherapist">
                                        </div>
                                        <div class="booklist_cont">
                                            <h3>더 테라피스트</h3>
                                            <p>16000</p>
                                        </div>
                                        <div class="booklist_cont_detail">
                                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                                        </div>
                                    </a>
                                </div>
                            </td> 
                            <td>
                                <div class="booklist"> 
                                    <a href="">
                                        <div class="booklist_imgArea">    
                                             <img src="./source/img/book/book_theTherapist.jpeg" alt="book_theTherapist">
                                        </div>
                                        <div class="booklist_cont">
                                            <h3>더 테라피스트</h3>
                                            <p>16000</p>
                                        </div>
                                        <div class="booklist_cont_detail">
                                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                                        </div>
                                    </a>
                                </div>
                            </td> 
                            <td>
                                <div class="booklist"> 
                                    <a href="">
                                        <div class="booklist_imgArea">    
                                             <img src="./source/img/book/book_theTherapist.jpeg" alt="book_theTherapist">
                                        </div>
                                        <div class="booklist_cont">
                                            <h3>더 테라피스트</h3>
                                            <p>16000</p>
                                        </div>
                                        <div class="booklist_cont_detail">
                                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                                        </div>
                                    </a>
                                </div>
                            </td> 
                            <td>
                                <div class="booklist"> 
                                    <a href="">
                                        <div class="booklist_imgArea">    
                                             <img src="./source/img/book/book_theTherapist.jpeg" alt="book_theTherapist">
                                        </div>
                                        <div class="booklist_cont">
                                            <h3>더 테라피스트</h3>
                                            <p>16000</p>
                                        </div>
                                        <div class="booklist_cont_detail">
                                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                                        </div>
                                    </a>
                                </div>
                            </td> 
                            <td>
                                <div class="booklist"> 
                                    <a href="">
                                        <div class="booklist_imgArea">    
                                             <img src="./source/img/book/book_theTherapist.jpeg" alt="book_theTherapist">
                                        </div>
                                        <div class="booklist_cont">
                                            <h3>더 테라피스트</h3>
                                            <p>16000</p>
                                        </div>
                                        <div class="booklist_cont_detail">
                                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                                        </div>
                                    </a>
                                </div>
                            </td> 
                            <td>
                                <div class="booklist"> 
                                    <a href="">
                                        <div class="booklist_imgArea">    
                                             <img src="./source/img/book/book_theTherapist.jpeg" alt="book_theTherapist">
                                        </div>
                                        <div class="booklist_cont">
                                            <h3>더 테라피스트</h3>
                                            <p>16000</p>
                                        </div>
                                        <div class="booklist_cont_detail">
                                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                                        </div>
                                    </a>
                                </div>
                            </td> 
                        </tr>
                    </table>
                </div>
            </section>
        </div>
        
		<jsp:include page="/include/main_bottom.jsp"/>

</body>
</html>