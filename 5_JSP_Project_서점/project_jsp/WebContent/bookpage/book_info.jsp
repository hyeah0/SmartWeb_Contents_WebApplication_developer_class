<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
	<title>도서 상세 정보</title>
	<link rel="stylesheet" href="css/book_info.css">
	<link rel="stylesheet" href="css/frame.css">
		
</head>

<body>

	<jsp:include page="../include/main_top.jsp" />
	
	<!-- 전체 감쌈(container) -->
	<div class="container">
	
	<%-- <div class="top_top"> 	<!--홈/카테고리-->
		&nbsp;
		<a href="<%=request.getContextPath() %>/">홈</a>
	      &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
	   <a href="<%=request.getContextPath() %>/">카테고리명</a>
	</div> <!--top--> --%>
	
	<!----------------------------------------------------------------------->
	<!-- <hr style="border: none; height: 1px; background-color: gray; margin: 10px 0px -10px 0px;"> -->
	
	<div class="content_title">
		<c:set var="book" value="${bookdto }"></c:set>
		<!--책 이미지 들어가는 부분-->
		<div class="top_left">
			<img class="book_img" alt=""
							src="<%=request.getContextPath() %>/book_cover/${book.getBook_img() }">
		</div> <!--top_left-->
		
		<!--책제목,저자,출판사,페이지수,가격-->
		<div class="top_right">
			<br><br>
			<div class="book_title">${book.getBook_name() }<br></div>
			<span class="book_writer">${book.getBook_writer() }</span>
			<span class="book_publisher">&nbsp;|&nbsp;${book.getBook_publisher() }&nbsp;|&nbsp;</span>
			<%-- <span class="book_page">${book.getBook_page() }</span><span id="bookpage">${book_page }</span>쪽 --%>
			<input type="text" id="book_page" value="${book.getBook_page() }" hidden=hidden />
			<input type="text" id="book_page_view" value="${book.getBook_page() }" readonly=readonly/>쪽

			
			
			<div class="book_price">
			<fmt:formatNumber var="bookprice" value="${book.getBook_price() }" /><div id="bookpricetag">${bookprice }</div>원
			</div>
			<div class="mileage_info">(적립포인트 1%)</div>
			<div class="shipment_info">택배배송 | 무료배송</div>
			
			<br><hr style="border: none; height: 1px; background-color: gray; margin: 0px 0px 7px 0px;">
			
			<div class="book_count">
				<input type="button" value="-" id="minus" onclick="minus()">
				<input type="text" id="count" value="1" readonly="readonly">
				<input type="button" value="+" id="plus" onclick="plus()">
			</div>
			
			<br><hr style="border: none; height: 1.2px; background-color: gray; margin: 11px 0px 15px 0px;">
			
			<div class="total">
			<span class="totaltext">총 금액</span>
			<input type="text" id="totalprice" value="${book.getBook_price() }" hidden=hidden />
			<input type="text" id="totalprice_view" value="${book.getBook_price() }" readonly=readonly/>원
			</div>
			
			<br><br><br>
			<div class="button_bundle">
				<button class="btn" onclick="goPay();" style="float:right;">바로결제</button>
			    <button class="btn" onclick="goCart();" style="float:right;">장바구니</button>
			</div>
		</div> <!--top_right-->
	
	</div> <!--content_title-->
	<hr style="border: none; height: 1px; background-color: gray; margin: 10px 0px -10px 0px;">
	<!----------------------------------------------------------------------->
	
	<div class="content_page">  <!--상세정보 (도서소개-목차-작가소개)-->
		
		<div class="reading_time_info"><!-- 완독 시간 안내 -->
		<span class="subtitle">완독 예상시간: </span>
		<input type="text" id="timeinfo" readonly=readonly />
		<div class="timeinfoinfo">완독 예상시간이란? 대한민국 성인 평균 독서 속도(1페이지당 1.2분)를 기준으로 하여 계산한 예상 독서시간입니다.
		<br>*정독,속독,발췌독 등 회원님의 독서 취향에 따라 실제 독서시간과 차이가 있을 수 있습니다.
		</div>
		<hr>
		<br><br>
		</div>
		
		<div class="intro_book"> <!--도서소개-->
		<div class="subtitle">도서소개</div>
		<hr>
		<div class="book_cont">${book.getBook_cont() }</div>
		<br><br>
		</div>
		
		<div class="intro_bookcont"><!--목차-->
		<div class="subtitle">목 차</div>
		<hr>
		<div class="book_index">${book.getBook_index() }</div> <!-- 목차 데이터가 없을 수 있음(아동도서) -->
		<br><br>
		</div>
		
		<div class="intro_writer"><!--작가소개-->
		<div class="subtitle">작가소개</div>
		<hr>
		<div class="book_writer_cont">${book.getBook_writer_cont() }</div>
		<br><br>
		</div>
	</div> <!--content_page-->
	
	</div> <!-- div class container -->
	
	<footer>
	<jsp:include page="../include/main_bottom.jsp" />
	</footer>
	
	<!-- ~~~~~~~~~~~~~~~~~~스크립트 태그~~~~~~~~~~~~~~~~~~ -->
	<script type="text/javascript">
		
		var count = 1;
		var countR = document.getElementById("count");
		
		var totalprice = Number(document.getElementById("totalprice").value); //hidden처리된 책 가격
		var totalprice_view = Number(document.getElementById("totalprice_view").value);
		

		//수량 버튼 조작(+)
		function plus(){
			count++;
			countR.value = count;
			
			console.log(count, typeof count);
			console.log(totalprice, typeof totalprice);
			
			totalprice_view = totalprice*count;
			console.log(totalprice_view, typeof totalprice_view);
			
			document.getElementById("totalprice_view").value = totalprice_view;
		}
		
		//수량 버튼 조작(-)
		function minus(){
			
			if(count > 1){
				count--;
				countR.value = count;
				totalprice_view = totalprice_view - totalprice;
				console.log(totalprice_view, typeof totalprice_view);
				
				document.getElementById("totalprice_view").value = totalprice_view;
			}
		}			
			
		
		//완독시간 계싼
		var page = Number(document.getElementById("book_page").value);
		var readingtime = 1.2 * page;
		
		readingtime = Number(readingtime.toFixed());
		
		function minuteTOhour(readingtime){
			console.log(readingtime, typeof readingtime);
			
		    let hour = Math.floor(readingtime/60);
		    let minute = Math.floor(readingtime - (hour*60));
		    
		    console.log(hour, typeof hour);
		    console.log(minute, typeof minute);
		    
		    str = hour + "시간 " + minute + "분";
		    
		    return str;
		}
		
		var readingtime_info = minuteTOhour(readingtime);
		
		document.getElementById("timeinfo").value = readingtime_info;


		function goPay() {
			let order_qty = $("#count").val();
			location.href='<%=request.getContextPath()%>/pay.do?book_num=${book.getBook_num() }&order_qty=' + order_qty;
		}

		function goCart() {
			let cart_qty = $("#count").val();
			location.href='<%=request.getContextPath()%>/cart_add.do?book_num=${book.getBook_num() }&cart_qty=' + cart_qty;
		}


	</script>
	
</body>
</html>