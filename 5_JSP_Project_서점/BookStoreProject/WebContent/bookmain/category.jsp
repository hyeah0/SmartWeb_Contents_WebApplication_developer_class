<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>종로서적</title>
	<link rel="shortcut icon" sizes="16x16 32x32 64x64" href="../source/img/logo_title.jpeg">
    <link rel="stylesheet" href="css/frame.css">
    <link rel="stylesheet" href="css/pageLayout.css">
    <script src="https://kit.fontawesome.com/4338ad17fa.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
	
	<jsp:include page="../include/main_top.jsp"/>
	
	<!-- center -->
        <div id="center">
            <div class="category_page">
                
                <!-- contents -->
                <section class="center_section center_cont">
                	
                	<%-- 가져온 데이터 set --------------------------------------------------------------%>
	                	<%-- uri 주소값 설정 --%>
	                	<c:set var="uri_listType" value="listType=${listType }"/>			
	                    <c:set var="uri_requestType" value="requestType=${requestType }"/>
	                    <c:set var="uri_nowCgy" value="category=${nowCgy_num }"/>
	                    <c:set var="uri_page" value="page=${page}"/>
	                    <c:set var="uri_search" value="search_type=${search_type }&search_input=${search_input }"/>
	                    <c:set var="uri_request" value="requestType=${requestType }"/>
	                	
	                	<%-- 카테고리에 맞는 데이터 --%>
	                	<c:set var="bookCgyList" value="${bookCgyList }"/>
                   
                   <%-- ------------------------------------------------------------------------- --%>
                   
                    <!-- 메인 상단 카테고리명 -->
                    <section class="center_section center_cont_txt">
                        <h1>${nowCgy_name }</h1>
                    </section>
                    
                    <!-- 메인 상단 검색 -->
                    <section class="center_section center_cont_search_pick">
                        <!-- 정렬기준 -->
                        <div class="book_pick">
                        	
                           	<!-- 검색한 상태 -->
                           	<c:if test="${search == 1 }">
                           		
                           		<button class="btn" onclick="location.href='<%=request.getContextPath() %>/main_getBookCategory.do?${uri_listType }&requestType=book_sales&${uri_nowCgy }&${uri_page }&${uri_search }'" >누적 판매순</button>
                            	<p>|</p>
                            	<button class="btn" onclick="location.href='<%=request.getContextPath()%>/main_getBookCategory.do?${uri_listType }&requestType=book_price&${uri_nowCgy }&${uri_page }&${uri_search }'">낮은 가격순</button>
                            	<p>|</p>
                            	<button class="btn"  onclick="location.href='<%=request.getContextPath()%>/main_getBookCategory.do?${uri_listType }&requestType=book_recent&${uri_nowCgy }&${uri_page }&${uri_search }'">최신 등록순</button>
                           	
                           	</c:if> 
                           	
                           	<!-- 검색하지 않은 상태 -->
                           	<c:if test="${search != 1 }">
                           		<button class="btn" onclick="location.href='<%=request.getContextPath() %>/main_getBookCategory.do?${uri_listType }&requestType=book_sales&${uri_nowCgy }&${uri_page }'" >누적 판매순</button>
                            	<p>|</p>
                            	<button class="btn" onclick="location.href='<%=request.getContextPath()%>/main_getBookCategory.do?${uri_listType }&requestType=book_price&${uri_nowCgy }&${uri_page }'">낮은 가격순</button>
                            	<p>|</p>
                            	<button class="btn"  onclick="location.href='<%=request.getContextPath()%>/main_getBookCategory.do?${uri_listType }&requestType=book_recent&${uri_nowCgy }&${uri_page }'">최신 등록순</button>
                           	</c:if>
                        </div>
                        
                        <!-- 검색 -->
                        <div class="book_search">
                        	 <c:set var="cgyList" value="${cgyList }"/>
	                         <c:set var="nowCgy_num" value="${nowCgy_num }"/>
                        
                            <form class="book_search_form" method="post" action="main_getBookCategory.do?${uri_listType }&${uri_requestType }&${uri_nowCgy }">
                                <select class="search_type" name="search_type">
                                	 <option value="all">통합검색</option>
			                        
				                	<c:if test="${!empty cgyList }">
				                		<c:forEach items = "${cgyList }" var = "cgyDto">
				                			<c:if test="${cgyDto.getCgy_num().equals(nowCgy_num)  }">
						                    	<option value="${cgyDto.getCgy_num() }" selected>${cgyDto.getCgy_name() }</option>
						                    </c:if>
						                    <c:if test="${!cgyDto.getCgy_num().equals(nowCgy_num)  }">--%>
						                    	<option value="${cgyDto.getCgy_num() }">${cgyDto.getCgy_name() }</option>
						                     </c:if> 
					                     </c:forEach>
				                    </c:if>
				                    
                                </select>
                                
                                <!-- 검색어 입력 여부에 따른 input -->
                                <!-- 검색어 입력시 -->
                                <c:if test="${search == 1 }">
                                	<input class="search_input" name="search_input" placeholder="${search_input }">
                                </c:if>
                                <!-- 검색어 입력안했을경우 -->
                                <c:if test="${search != 1 }">
                                	<input class="search_input" name="search_input" placeholder="검색어를 입력해주세요">
                                </c:if>
                                
                                <button class="btn search_btn" type="submit">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </button>
                            </form>
                            
                            <!-- 정렬 방식 : 앨범형, 리스트형-->
                            <div class="book_search_layout">
                            	<!-- 앨범형 -->
                            	<!-- 검색한 상태 -->
                            	<c:if test="${search == 1 }">
                            		<button class="btn layout_size_btn" onclick="location.href='<%=request.getContextPath() %>/main_getBookCategory.do?listType=1&${uri_requestType }&${uri_nowCgy }&${uri_page }&${uri_search }'">
                            	</c:if> 
                            	<!-- 검색하지 않은 상태 -->
                            	<c:if test="${search != 1 }">
                            		<button class="btn layout_size_btn" onclick="location.href='<%=request.getContextPath() %>/main_getBookCategory.do?listType=1&${uri_requestType }&${uri_nowCgy }&${uri_page }'">
                            	</c:if>
                            	
                                    <c:if test="${listType==1 }">
                                    	<i class="fa-solid fa-clone"></i>
                                    </c:if>
                                    <c:if test="${listType!=1 }">
                                    	<i class="fa-regular fa-clone"></i>
                                    </c:if>
                               </button>
                               
                               	<!-- 리스트형 버튼 -->
                               	<!-- 검색한 상태 -->
                                <c:if test="${search == 1 }">
                               		<button class="btn layout_size_btn" onclick="location.href='<%=request.getContextPath() %>/main_getBookCategory.do?listType=2&${uri_requestType }&${uri_nowCgy }&${uri_page }&${uri_search }'">
                                </c:if>
                                <!-- 검색하지 않은 상태 -->
                            	<c:if test="${search != 1 }">
                            		<button class="btn layout_size_btn" onclick="location.href='<%=request.getContextPath() %>/main_getBookCategory.do?listType=2&${uri_requestType }&${uri_nowCgy }&${uri_page }'">
                            	</c:if>
                                
                                    <i class="fa-solid fa-list"></i>
                                </button>
                            </div>
                        </div>
                    </section>
                   
                   <!-- 메인 메인(북리스트) -->
                    <section class="center_section center_cont_book">
                        <div class="center_books">
                            
                            <!-- version 1. default 이미지 -->
                            <c:if test="${listType == 1 }">
                            	<div class="center_books_div">
                            		
                            		<!-- 검색시 자료가 없을경우-->
                            		<c:if test="${search == 1 && empty bookCgyList }">
                            			<div>자료가 없습니다.</div>
                            		</c:if>
                            		
                            		<!-- 검색시 자료가 있을경우 & 책자료가 있을 경우 -->
                            		<c:if test="${!empty bookCgyList }">
	                            		<c:forEach items="${bookCgyList }" var="bookList" begin="0" step="1"> 
			                                <div class="booklist category_booklist"> 
			                                    <div class="booklist_imgArea">
			                                        <a class="category_img_a" href="<%=request.getContextPath() %>/book_detail.do?book_num=${bookList.getBook_num() }">
			                                            <img src="<%=request.getContextPath() %>/source/img/book/${bookList.getBook_img() }" alt="${bookList.getBook_name() }"> 
			                                        </a>
			                                    </div>
			                                    <div class="booklist_cont">
			                                        <h3>${bookList.getBook_name() }</h3>
			                                        <p><fmt:formatNumber value="${bookList.getBook_price() }"/> </p>
			                                    </div>
			                                    
			                                    <div class="booklist_btn">
			                                            <button class="btn" type="submit"><i class="fa-brands fa-shopify"></i></button>
			                                            <button class="btn" type="submit"><i class="fa-solid fa-basket-shopping"></i></button>
			                                    </div>
			                                </div>
			                                
			                                <!-- <hr class="category_page_hr_v"> -->
		                                </c:forEach>
	                                </c:if>
	                            </div>
							</c:if>
					
						<!-- version 2. list형 -->
						<c:if test="${listType == 2 }">
                            <div class="center_books_list">
                            
                            		<!-- 검색시 자료가 없을경우-->
                            		<c:if test="${search == 1 && empty bookCgyList }">
                            			<div align="center">자료가 없습니다.</div>
                            		</c:if>
                            
                            		<!-- 검색시 자료가 있을경우 & 책자료가 있을 경우 -->
                            		<c:if test="${!empty bookCgyList }">
	                            		<c:forEach items="${bookCgyList }" var="bookList"> 
			                                <div class="center_book_list_type">
			                                    <div class="list_type_img">
			                                        <a class="category_img_a" href="<%=request.getContextPath() %>/book_detail.do?book_num=${bookList.getBook_num() }">
			                                             <img src="<%=request.getContextPath() %>/source/img/book/${bookList.getBook_img() }" alt="${bookList.getBook_name() }"> 
			                                        </a>
			                                    </div>
			                                    <div class="list_type_cont">
			                                        <div class="list_type_cont_book">
			                                             <h3>${bookList.getBook_name() }</h3>
			                                        	 <p><fmt:formatNumber value="${bookList.getBook_price() }"/> </p>
			                                        </div>
			                                        <p>${bookList.getBook_cont() }</p>
			                                    </div>
			                                    <div class="booklist_btn booklist_btn_list">
			                                            <button class="btn" type="submit"><i class="fa-brands fa-shopify"></i></button>
			                                            <button class="btn" type="submit"><i class="fa-solid fa-basket-shopping"></i></button>
			                                    </div>
			                                </div>
			                                
	                               			<hr class="category_page_hr">
	                                	</c:forEach>
	                                </c:if>
                            	</div>
                            </c:if>
                        </div>
                    </section>
                   
                   <!-- 메인 하단(페이지) -->
                    <section class="center_section center_cont_page">
                        <nav class="page_nav">
                            <ul class="page_ul">
                            
                              <!-- page back -->
                             	<c:if test="${page == 1 }">
                             		<li class="page_li">
	                               		<a class="page_a page_back paging_unable">
	                                 		<span>
	                                 			<i class="fa-solid fa-chevron-left"></i>
	                                 		</span>
	                               		</a>
		                             </li>
		                             <li class="page_li">
		                               <a class="page_a page_first paging_unable">
		                                 <span><i class="fa-solid fa-angles-left"></i></span>
		                               </a>
	                             	</li>
                            	</c:if>
                            	
                            	<c:if test="${page != 1 }">
                             		<li class="page_li">
	                               		<a class="page_a page_back" href="<%=request.getContextPath() %>/main_getBookCategory.do?${uri_listType }&${uri_requestType }&${uri_nowCgy }&page=1">
	                                 		<span>
	                                 			<i class="fa-solid fa-chevron-left"></i>
	                                 		</span>
	                               		</a>
		                             </li>
		                             <li class="page_li">
		                               <a class="page_a page_first" href="<%=request.getContextPath() %>/main_getBookCategory.do?${uri_listType }&${uri_requestType }&${uri_nowCgy_num }&page=${page-1}">
		                                 <span><i class="fa-solid fa-angles-left"></i></span>
		                               </a>
	                             	</li>
                            	</c:if>
                            	
	                            
                              <!-- page -->
                             	 <c:forEach begin="${startBlock }" end="${endBlock }" var="i">
		                              <!-- 현재 페이지일경우 -->
		                              <c:if test = "${i == page }">
		                              	 <li class="page_li">
		                              	 	<a class="page_a paging_active" href="<%=request.getContextPath() %>/main_getBookCategory.do?${uri_listType }&${uri_requestType }&${uri_nowCgy }&page=${i}">
		                              	 		${i }
		                              	 	</a>
		                              	 </li>
		                              </c:if>
		                              
		                              <!-- 현재 페이지가 아닐경우 -->
		                              <c:if test = "${i != page }">
			                              <li class="page_li">
			                              	 	<a class="page_a" href="<%=request.getContextPath() %>/main_getBookCategory.do?${uri_listType }&${uri_requestType }&${uri_nowCgy }&page=${i}">
			                              	 		${i }
			                              	 	</a>
		                              	  </li>
		                              </c:if>
                              	</c:forEach>
                              
                              <!-- next -->
                              	<!-- 가장 끝 페이지일 경우 -->
                              	<c:if test="${page == endBlock || empty bookCgyList}">
		                              <li class="page_li">
		                                <a class="page_a page_next paging_unable" href="#">
		                                  <span>
		                                  	<i class="fa-solid fa-chevron-right"></i>
		                                  </span>
		                                </a>
		                              </li>
		                              <li class="page_li">
		                                <a class="page_a page_last paging_unable" href="#">
		                                  <span>
		                                  	<i class="fa-solid fa-angles-right"></i>
		                                  </span>
		                                </a>
		                              </li>
	                            </c:if>
	                            <!-- 가장 끝페이지가 아닐경우 -->
	                            <c:if test="${page != endBlock && !empty bookCgyList}">
	                              <li class="page_li">
	                                <a class="page_a page_next" href="<%=request.getContextPath() %>/main_getBookCategory.do?${uri_listType }&${uri_requestType }&${uri_nowCgy }&page=${page+1}">
	                                  <span>
	                                  	<i class="fa-solid fa-chevron-right"></i>
	                                  </span>
	                                </a>
	                              </li>
	                              <li class="page_li">
	                                <a class="page_a page_last" href="<%=request.getContextPath() %>/main_getBookCategory.do?${uri_listType }&${uri_requestType }&${uri_nowCgy }&page=${allPage}">
	                                  <span>
	                                  	<i class="fa-solid fa-angles-right"></i>
	                                  </span>
	                                </a>
	                              </li>
	                            </c:if>
	                            
                            </ul>
                          </nav>
                    
                    </section>
                </section>
            </div>
        </div>
        
        <jsp:include page="/include/main_bottom.jsp"/>
        <script type="text/javascript" src="js/mainJs/categoryPageJs.js"></script>
        
</body>
</html>