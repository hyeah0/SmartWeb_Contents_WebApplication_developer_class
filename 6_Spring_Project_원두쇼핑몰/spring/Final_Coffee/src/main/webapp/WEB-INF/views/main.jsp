<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% long time = System.currentTimeMillis(); %>




<link href="<%=request.getContextPath()%>/resources/css/main.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/swiper.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>ipt>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/swiper.min.js"></script>


<html>
<head>
	<title>Home</title>
<link href="<%=request.getContextPath()%>/resources/css/main.css" rel="stylesheet" />
</head>
<body>


<jsp:include page="./layout/header.jsp" />



<!--------------메인 비주얼 START---------------->


<div class="main-contents" id="main-contents">
	<div class="container-wide">
		<div class="main-visual">
			<video muted autoplay loop>
				<source src="<%=request.getContextPath()%>/resources/video/coffee_video.mp4" type="video/mp4">
				<strong>Your browser does not support the video tag.</strong>
				</video>
			<div class="main-title">
				<h2 class="visual-title" >내 입맛에 맞추는<br>나만의 커피</h2>
				<a href="<%=request.getContextPath()%>/bean_test.do?turn=1"><button type="button" class="btn btn-outline-light">추천받기</button></a>
			</div>
		</div>
	</div>


<!----------메인 비주얼 END---------------->





<!----------원두 추천 START---------------->

	<div class="main-recom swiper-container">
		<div class="recom-title">
			<h2 class="recom-h2 ">다양한 취향에 따라<br>내린 한 잔</h2>
			<p class="recom-txt ">편하게 즐기는 데일리부터<br>밤을 지켜주는 디카페인까지</p>
		</div>


		<div class="container recom-wrap">
			<ul class="swiper-wrapper">
				<li class="swiper-slide">
					<a href="#">
						<img src="https://image.oliveyoung.co.kr/uploads/images/goods/550/10/0000/0017/B00000017021201ko.jpg?l=ko">
						<p id="slide-txt">Purple Rain<br>테일러커피</p>
					</a>
				</li>

				<li class="swiper-slide">
					<a href="#">
						<img src="https://cdn.imweb.me/thumbnail/20220120/1135905abc858.png">
						<p id="slide-txt">Icebreaker<br>센터커피</p>
					</a>
				</li>

				<li class="swiper-slide">
					<a href="#">
						<img src="http://hellcafe.co.kr/web/product/big/202101/b831afa5f1e662a6f098ebdb81f3621c.png">
						<p id="slide-txt">HellCafe 강배전<br>헬카페</p>
					</a>
				</li>

				<li class="swiper-slide">
					<a href="#">
						<img src="https://s3.ap-northeast-2.amazonaws.com/meesig/v3/prod/image/item/main/211/46883f617b6d4b8e90ecc45a14fcf4ca20220524203436.">
						<p id="slide-txt">프루티봉봉<br>모모스커피</p>
					</a>
				</li>

			</ul>
		</div>

	</div>
<!----------원두 추천 END ---------------->



<!----------카페 추천 START---------------->

	<div class="main-shop container">
		<div class="shop-title">
			<h2 class="shop-h2">한번쯤은 마셔보고 싶던 로스터리 카페</h2>
		</div>

		<div class="container shop-wrap">
			<ul class="swiper-wrapper">

				<li class="swiper-slide">
					<a href="">
						<img src="https://d227tph7fpseou.cloudfront.net/static/main/roastery/roastery_1.jpg" alt="나무사이로">

						<div class="shop-info">
							<span class="shop-loc">통인동</span>
							<span class="shop-name">나무사이로</span>
						</div>

					</a>
				</li>


				<li class="swiper-slide">
					<a href="">
						<img src="https://d227tph7fpseou.cloudfront.net/static/main/roastery/roastery_2.jpg" alt="센터커피">
							
						<div class="shop-info">
							<span class="shop-loc">서울숲</span>
							<span class="shop-name">센터커피</span>
						</div>

					</a>
				</li>


				<li class="swiper-slide">
					<a href="">
						<img src="https://d227tph7fpseou.cloudfront.net/static/main/roastery/roastery_3.jpg" alt="피어커피">
						
						<div class="shop-info">
							<span class="shop-loc">광희문</span>
							<span class="shop-name">피어커피</span>
						</div>

					</a>
				</li>


				<li class="swiper-slide">
					<a href="">
						<img src="https://d227tph7fpseou.cloudfront.net/static/main/roastery/roastery_4.jpg" alt="txt커피">

						<div class="shop-info">
							<span class="shop-loc">창덕궁길</span>
							<span class="shop-name">txt커피</span>
						</div>
					</a>
				</li>

			</ul>	

		</div>	

		<div>
			<div class="shop-all">
				<button type="button" class="shop-btn" onclick="location.href='bean_list.do'">모든 원두 보기</button>
			</div>
		</div>

	</div>
<!----------카페 추천 END---------------->

<!----------내 취향 커피 START ---------------->

	<div class="main-taste container">
		<div class="container taste-wrap">

			<div class="taste-title">
				<h2 class="taste-h2">이번 커피도,&nbsp;다음 커피도<br>내가 좋아하는 맛으로만</h2>
				<p class="taste-sub">실패할 걱정 없이<br>취향에 맞는 나만의 커피</p>
			</div>

			<section>
				<div class="logos">
					<div class="taste-box hidden">
						<a href="">
							<img src="https://namusairo.com/web/product/big/20200420/00a038a01022758f99674d04c23327b0.jpg" alt="나무사이로 콜드브루 봄의 제전">
							
						</a>
					</div>


					<div class="taste-box hidden">
						<a href="">
							<img src="https://namusairo.com/web/product/big/202205/a1ab23dbda94edc4d0558e5d96e73d05.jpg" alt="나무사이로 콜드브루 풍요로운 땅">
						</a>
					</div>
						

					<div class="taste-box hidden">
						<a href="">
							<img src="https://coffee.pebblecompany.com/web/product/big/202205/b8f17ebc2b64318a63b8011370c4b9c5.png" alt="듁스 매스 드링킹 초콜릿">
						</a>
					</div>


					<div class="taste-box hidden">
						<a href="">
							<img src="https://coffee.pebblecompany.com/web/product/big/202205/f24c9755d4ff1b35e0b249fbeaf2fa4b.jpg" alt="듁스 과테말라 산 하신토 디카페인">
						</a>
					</div>
				</div>
			</section>
		</div>

	
	</div>	

<!----------내 취향 커피 END ---------------->

	

</div>


<script>


    //원두 추천 

    var recomSwiper = new Swiper(".main-recom .recom-wrap ",{
        effect: "slide",
        slidesPerView: 3,
        spaceBetween: 0,
        speed: 300,
        loop: true,
        touchEnabled: false,
        autoplay: {
            delay: 2000
        }

    });

	// 내 취향 ^^ 

	const observer = new IntersectionObserver((entries)=>{
		entries.forEach((entry)=> {
			console.log(entry)
			if(entry.isIntersecting) {
				entry.target.classList.add('show');
			} else {
				entry.target.classList.remove('show');
			}
		});
	});

	const hiddenElement = document.querySelectorAll('.hidden');
	hiddenElement.forEach((el)=>observer.observe(el));



</script>
<jsp:include page="layout/footer.jsp" />

