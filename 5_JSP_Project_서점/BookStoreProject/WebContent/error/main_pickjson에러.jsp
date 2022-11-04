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
    <link rel="stylesheet" href="css/frame.css">
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
			                                <img src="<%=request.getContextPath() %>/source/img/book/${bookBestDto.getBook_img()}">
			                            </a>
		                       		</div>
			                        <div class="booklist_cont">
			                            <h3>${bookBestDto.getBook_name() }</h3>
			                            <p>
			                            	<fmt:formatNumber value="${bookBestDto.getBook_price() }"/>
			                            </p>
			                        </div>
	                    		</div>
	                    		
	                    	</c:forEach>
	                    </c:if>
	                 </div>
                </div>
            </section>
            <section class="center_section center_banner_loca">
                배너 location
            </section>
            <section class="center_section center_store_pick">
                <h2>종로서적 PICK!</h2>
                <div class="store_pick_search">
                    <button id="book_sales">누적 판매순</button>
                    <button id="book_cheap">낮은 가격순</button>
                    <button id="book_recent">최신 등록순</button>
                </div>
                <div class="center_books">
                    <!-- 5행 2열 총 10개 책 foreach 예정 -->
                    <div class="center_books_div">
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
                        <!-- --------------------------------------------- -->
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
                    </div>
                </div>
            </section>
        </div>
        
		<jsp:include page="/include/main_bottom.jsp"/>
 		<!-- <script type="text/javascript" src="../js/mainJs/mainPickBtn.js"/> -->
 		<script>
	 		$(()=>{
	 			$.ajaxSetup({
	 				ContentType : "application/x-www-form-urlencorded;charset=UTF-8"
	 			})
	 			
                function getPickList(json){
	 				$.each(json, (index, item)=>{
	 						<!-- 2행 5열 총 10개 책 foreach 예정 -->
	 						$(".center_books_div").append(
	 								 "<div class='booklist'>" 
		                           + "<a href=''>"
		                           + "    <div class='booklist_imgArea'>"    
		                           + "       <img src='./source/img/book/"+ json.book_img +"' alt='book_theTherapist'>"
		                           + "    </div>"
		                           + "    <div class='booklist_cont'>"
		                           + "        <h3>더 테라피스트</h3>"
		                           + "        <p>16000</p>"
		                           + "    </div>"
		                           + "    <div class='booklist_cont_detail'>"
		                           + "        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>"
		                           + "    </div>"
		                           + " </a>"
		                           + "</div>")
	 					}	
					
	                		
              		}
                		
	 			$("#book_sales").on("click",()=>{
	 				console.log("버튼 클릭함!")
	 				$.ajax({
	 						url : "/BookStoreProject/main_getBookPick.do",
	 						data : {requestType : "book_sales" },
	 						datatype : "text",
	 						success : function(pickList){
	 							alert("데이터 가져왔습니다!");
								const json = JSON.stringify(pickList);
								alert(json);
								getPickList(json);
	 						},
	 						error : ()=>{alert('데이터를 가져오지 못했습니다.')}
	 				})
	 			})
	 		})
 		</script>
</body>
</html>