<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>장바구니</title>
<link rel="shortcut icon" sizes="16x16 32x32 64x64"
	href="../source/img/logo_title.jpeg">
<link rel="stylesheet" href="css/frame.css">
<link rel="stylesheet" href="css/pageLayout.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/cart.css" />
<script src="https://kit.fontawesome.com/4338ad17fa.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style type="text/css">
.center_books {
	display: flex;
	justify-content: center;
	align-items: flex-start;
	height: 1500px;
	overflow: scroll;
}

.center_books_list {
	width: 90vw;
}
#center{
		height: 80vh;
}
</style>
</head>
<body>
	<jsp:include page="../include/main_top.jsp" />
	<br><br><br>
	<div id="center">
	<section>
		<div class="container" align="center">
			<h1>장바구니</h1>
			<%--<form name="orderform" id="orderform" method="post" class="orderform" action="/Page0" onsubmit="return false;">--%>
			<form method="post" name="next" class="orderform"
				onsubmit="return false;"
				action="<%=request.getContextPath()%>/cart_pay.do">

				<input type="hidden" name="cmd" value="order">
				<div class="basketdiv" id="basket">
					<div class="row head">
						<div class="subdiv">
							<div class="check">선택</div>
							<div class="img">이미지</div>
							<div class="pname">상품명</div>
						</div>
						<div class="subdiv">
							<div class="basketprice">가격</div>
							<div class="num">수량</div>
							<div class="sum">합계</div>
						</div>
						<div class="subdiv">

							<div class="basketcmd">삭제</div>
						</div>
						<div class="split"></div>
					</div>

					<c:set var="cart" value="${ cartList }" />
					<c:if test="${ !empty cart }">
						<c:forEach items="${ cart }" var="cartDTO" varStatus="status">
							<c:set var="bookDTO" value="${ bookList[status.index] }" />
							<div class="row data">
								<div class="subdiv">
									<div class="check">
										<input type="checkbox" name="buy"
											value="${ cartDTO.cart_num }" checked onclick="reCalc();">&nbsp;
									</div>
									<input type="hidden" name="bookNumber" value="${ cartDTO.book_num }">
									<div class="img">
										<img src="book_cover/${ bookDTO.book_img }" alt="image"
											width="40" height="50">
									</div>
									<div class="pname">
										<span>${ bookDTO.book_name }</span>
									</div>
								</div>
								<div class="subdiv">
									<div class="basketprice">
										<input type="hidden" name="price"
											id="price${ cartDTO.cart_num }" class="p_price"
											value="${ bookDTO.book_price }">
										<fmt:formatNumber value="${ bookDTO.book_price }" />
										원
									</div>
									<div class="num">
										<div class="updown">
											<span onclick="down(${ cartDTO.cart_num });"><i
												class="fas fa-arrow-alt-circle-down down"></i></span>&nbsp; <input
												type="text" name="p_num${ cartDTO.cart_num }"
												id="itemCnt${ cartDTO.cart_num }" size="2" maxlength="4"
												class="p_num" value="${ cartDTO.cart_qty }"> <span
												onclick="up(${ cartDTO.cart_num });"><i
												class="fas fa-arrow-alt-circle-up up"></i></span>
										</div>
									</div>
									<div class="sum">
										<input type="hidden" name="total_price"
											id="total_price${ cartDTO.cart_num }" class="p_price"
											value="${ bookDTO.book_price }"> <span
											id="sum${ cartDTO.cart_num }"><fmt:formatNumber
												value="${ (bookDTO.book_price * cartDTO.cart_qty) }" />원</span>
									</div>
								</div>
								<div class="subdiv">
									<div class="basketcmd">
										<a
											href="<%=request.getContextPath() %>/cart_delete.do?num=${ cartDTO.cart_num }"
											class="abutton">삭제</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>

					<c:if test="${ empty cart }">
						<h3>장바구니가 비어 있습니다.</h3>
					</c:if>
				</div>

				<div class="right-align basketrowcmd">
					<%--<a href="javascript:void(0)" class="abutton" onclick="basket.delCheckedItem();">선택상품삭제</a>
                <a href="javascript:void(0)" class="abutton" onclick="basket.delAllItem();">장바구니비우기</a>--%>
				</div>

				<br>

				<div class="bigtext right-align box blue summoney" id="sum_p_price">
					<c:set var="sum" value="${ total }" />
					<p>
						합계 : <span id="sum_price"><fmt:formatNumber
								value="${ sum }" />원</span>
					</p>
				</div>

				<div id="goorder" class="">
					<div class="clear"></div>
					<div class="buttongroup center-align cmd">
						<a href="javascript:checkout();">주문하기</a>
					</div>
				</div>
			</form>
		</div>
		
		</div>
		
	</section>
	</div>
	<jsp:include page="/include/main_bottom.jsp" />
   <!--  <script type="text/javascript" src="js/mainJs/categoryPageJs.js"></script> -->
</body>
</html>

<script>

    let temp = 0;

    function up(param) {
        temp = parseInt($("#itemCnt" + param).val()) + 1;
        if (temp < 1 || temp > 99) { return false; }
        $("#itemCnt" + param).val(temp);

        total(param);

        reCalc();
        ajaxUpdateCnt(param);
    }

    function down(param) {
        temp = parseInt($("#itemCnt" + param).val()) - 1;
        if (temp < 1 || temp > 99) { return false; }
        $("#itemCnt" + param).val(temp);

        total(param);

        reCalc();
        ajaxUpdateCnt(param);
    }

    function total(param) {
        let price = parseInt($("#price" + param).val());       // book_price 값
        let qty = parseInt($("#itemCnt" + param).val());       // cart_qty 값

        let total = price * qty;

        $("#sum" + param).text(comma(total));
    }

    function comma(param) {
        if (param === 0) return 0;

        let regex = /(^[+-]?\d+)(\d{3})/;
        let nstr = (param + '');

        while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');

        return nstr + "원";
    }

    // 체크된 상품의 부분합계의 합을 리턴하는 함수.
    function reCalc() {
        let sum = 0;
        $("input:checkbox[name=buy]:checked").each(function () {
            let tempSum = $("#sum" + $(this).val()).text();
            sum += parseInt(tempSum.replaceAll(",", "").replaceAll("원", ""));
        });
        $("#sum_price").text(comma(sum));
        console.log(sum)
    }

    function checkout(){

        if ($("input:checkbox[name='buy']:checked").length === 0 ){
            alert("하나 이상 담으세요.");
            return false;
        } else {
            document.next.submit();
        }
    }

    function ajaxUpdateCnt(param){

        let cnt = parseInt($("#itemCnt" + param ).val());

        // ajax 통신
        $.ajax({
            type : "get",
            url : "<%=request.getContextPath()%>/UpdateCountAction.do",
            data : {num : param , cnt : cnt },
            success : function(res){
                console.log(param);
                console.log(cnt);
                console.log(res);
            },
            error : function(XMLHttpRequest, textStatus, errorThrown){
                alert("데이터 통신 오류");
            }
        });
    }
</script>