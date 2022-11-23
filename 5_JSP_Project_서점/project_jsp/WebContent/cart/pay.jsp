<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>결제창</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">

<link rel="shortcut icon" sizes="16x16 32x32 64x64"
	href="../source/img/logo_title.jpeg">
<link rel="stylesheet" href="css/frame.css">
<link rel="stylesheet" href="css/pageLayout.css">
<script src="https://kit.fontawesome.com/4338ad17fa.js"
	crossorigin="anonymous"></script>
<title>종로서적</title>
<style>
.center_banner_loca_a {
	display: block;
	width: 100%;
	height: 100%;
	background-image:
		url('https://shop-phinf.pstatic.net/20220927_45/1664235727171lON1E_JPEG/C7C7BEBE.jpg');
	background-position: center center;
	background-size: cover;
}
 #top_name{
 	margin-bottom: 0px;
 }
 #top_nav{
 	margin-bottom: 0px;
 }
</style>

<style>
.container {
	max-width: 1200px;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}
#d{
	background-color: #0d6efd;
}

</style>
</head>
<body class="bg-light">

	<jsp:include page="../include/main_top.jsp" />

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<h2 align="center">
		<span class="badge bg-secondary">결제창</span>
	</h2>
	<br>
	<br>
	<div class="container">
		<main>
			<form class="needs-validation" novalidate name="pay" method="post"
				action="<%=request.getContextPath()%>/cart_pay_ok.do">
				<div class="row g-8">
					<div class="col-md-7 col-lg-6 order-md-last">
						<h4 class="d-flex justify-content-between align-items-center mb-3">
							<span class="text-primary">결제 진행 상품</span>
						</h4>
						<ul class="list-group mb-3">
							<c:set var="pay" value="${ payList }" />
							<c:if test="${ !empty pay }">
								<c:forEach items="${ pay }" var="payDTO" varStatus="status">
									<c:set var="bookDTO" value="${ bookPayList[status.index] }" />
									<li
										class="list-group-item d-flex justify-content-between lh-sm">
										<div>
											<h6 class="my-0">${ bookDTO.book_name }</h6>
										</div> <span class="badge bg-primary rounded-pill">${ payDTO.cart_qty }</span>
										<input type="hidden" name="count" value="${ payDTO.cart_qty }">
										<input type="hidden" name="bookNum"
										value="${ bookDTO.book_num }"> <input type="hidden"
										name="buy" value="${ payDTO.cart_num }"> <c:set
											var="price" value="${ bookDTO.book_price}" /> <c:set
											var="qty" value="${ payDTO.cart_qty }" /> <span
										class="text-muted"><fmt:formatNumber
												value="${ price * qty }" />원</span> <c:set var="total"
											value="${total + (price * qty) }" />
									</li>
									<input type="hidden" name="book_num"
										value="${ bookDTO.book_num }">
								</c:forEach>
							</c:if>
							<li class="list-group-item d-flex justify-content-between">
								<strong>합계</strong> <strong><fmt:formatNumber
										value="${ total }" />원</strong>
							</li>
						</ul>
					</div>

					<c:set var="dto" value="${ dto }" />
					<div class="col-md-5 col-lg-6">
						<h4 class="mb-3">배송 정보</h4>
						<div class="row g-3">
							<div class="col-sm-6">
								<label for="name" class="form-label">이름</label> <input
									type="text" class="form-control" id="name" placeholder=""
									value="${ dto.mem_name }" required>
								<div class="invalid-feedback">이름을 입력하세요.</div>
							</div>

							<div class="col-8">
								<label for="phone" class="form-label">연락처</label> <input
									type="text" class="form-control" id="phone" placeholder=""
									value="${ dto.mem_phone }" required>
								<div class="invalid-feedback">연락처를 입력하세요.</div>
							</div>

							<div class="col-12">
								<label for="email" class="form-label">이메일</label> <input
									type="email" class="form-control" id="email"
									value="${ dto.mem_mail }">
								<div class="invalid-feedback">이메일을 입력하세요.</div>
							</div>

							<div class="col-12">
								<label for="address" class="form-label">주소</label> <input
									type="text" class="form-control" id="address" required
									value="${ dto.mem_addr }">
								<div class="invalid-feedback">주소를 입력하세요.</div>
							</div>
						</div>

						<hr class="my-4">

						<h4 class="mb-3">결제수단</h4>

						<div class="my-3">
							<div class="form-check">
								<input id="credit" name="paymentMethod" type="radio"
									class="form-check-input" checked required> <label
									class="form-check-label" for="credit">신용/체크카드</label>
							</div>
						</div>

						<div class="row gy-3">
							<div class="col-md-6">
								<label for="cc-number" class="form-label">카드번호</label> <input
									type="text" class="form-control" id="cc-number"
									name="mem_card_num" oninput="CardNumber(this)" maxlength="19"
									placeholder="" required>
								<div class="invalid-feedback">카드번호를 입력하세요.</div>
							</div>

							<div class="col-md-6">
								<label for="cc-pwd" class="form-label">카드 비밀번호</label> <input
									type="password" class="form-control" id="cc-pwd"
									name="mem_card_pwd" maxlength="4" placeholder="" required>
								<div class="invalid-feedback">카드 비밀번호를 입력하세요.</div>
							</div>
						</div>

						<hr class="my-4">
						<a href="javascript:checkout();"
							id="d" class="w-100 btn btn-primary btn-lg">결제하기</a> <input
							type="hidden" name="total" value="${ total }"> <input
							type="hidden" name="temp" id="temp" value="">
					</div>
				</div>
			</form>
		</main>
	</div>

	<jsp:include page="/include/main_bottom.jsp" />

	<script type="text/javascript" src="js/mainJs/categoryPageJs.js"></script>

</body>
</html>

<script>

    let list = new Array();

    $("input:hidden[name=buy]").each(function () {
        list.push($(this).val());
    });
    $("#temp").val(list);

    console.log($("#temp").val());

    /*let sum = 0;

    $("input:hidden[name=count]").each(function () {
        sum += parseInt($(this).val());
    });

    $("#tempCount").val(sum);

    console.log($("#tempCount").val());*/

    function checkout(){
        if ($("#cc-number").val() === '' || $("#cc-pwd").val() === ''){
            alert("카드 정보를 입력하세요.");
            return false;
        } else {
            document.pay.submit();
        }
    }

   //카드번호 (-) 자동입력 정규식
   const CardNumber = (target) => {
    	target.value = target.value.replace(/[^0-9]/g, '').replace
    	(/^(\d{0,4})(\d{0,4})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3-$4").replace(/(\-{1,3})$/g,"");
    }
</script>