console.log('order.js')

	const pointRate = 0.05
	
	let rowTotal = document.querySelectorAll(".row_total") 				// 수량 * 단가 * (그람/100)
    
	let totalPrice = document.querySelectorAll(".total_price")         	// 상품가격  
    let allTotalPrice = document.querySelectorAll(".all_total_price")  	// 상품가격 + 배송비 - 사용포인트
    let allPoint = document.querySelectorAll(".all_point")             	// 적립포인트
	
	let inputUsePoint = document.querySelector(".input_use_point")  	// 입력한 사용포인트 태그
    let totalUsePoint = document.querySelectorAll(".total_use_point")  	// 사용포인트 태그(주문정보 부분에 위치)
    let canUsePoint = document.querySelector(".can_use_point")      	// 사용 가능한 포인트 태그

	// 주소관련 변수
	let addrRadio = document.querySelectorAll('.addr_radio')
    let addrSelected = document.querySelectorAll('.selected_addr')
   
    let addr = "";

	 //---------------------------------------------------------------------------------
	window.onload = CalcAllTotal();
    
    // 총 합계 함수
    function CalcAllTotal(){
   	   console.log('CalcAllTotal 실행')
      
       noAddr()
       this.nums = []
       this.sum = 0

       // row total nums 배열에 넣기
       for(let i=0; i<rowTotal.length; i++){
           let num = parseInt(rowTotal[i].textContent.replace(',', ''));
           this.nums.push(num)
       }

       // 배열에 들어간 값 저장
       this.nums.forEach(function(item){
           this.sum += parseInt(item)
       })

       finSum = this.sum

       // 총 상품 금액, 적립 포인트 수정
       let sumText = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
       let point = Math.round(finSum * pointRate)
       let pointText = point.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
   	   
       totalPrice.forEach(function(e,index){
       		totalPrice[index].textContent = sumText
       		allTotalPrice[index].textContent = sumText
       		allPoint[index].textContent = pointText
       })
       
       // 주소 확인
       checkAddr()
       
    }   


	// 슬라이더 -------------------------------------------------------- 
	// 변수
	let slider = document.querySelector('.slider')
	let summaryOrder = document.querySelector('.summary_order')
	let contentFade = document.querySelector('.content_fade')
	let deliverInfo = document.querySelector('.deliver_info')
	let orderPathA = document.querySelectorAll('.order_path_list a')
	 
 	// ---------------------------------------------------------------------------------------------
 	// fade in 
 	function fadeInActive(){
 		deliverInfo.classList.add('fade_active_txt')
	    
	    for(let i=0; i<3; i++){
	    	orderPathA[i].classList.add('fade_active_txt');
	    }
	    
	    contentFade.classList.add('fade_active')
	    
	    document.querySelector('.summary_order').classList.add('fade_active_txt')
		document.querySelector('.all_total_price').classList.add('fade_active_txt')
		document.querySelector('.pay_btn').setAttribute('disabled',true)
		document.querySelector('.detail_btn').setAttribute('disabled',true)
 	}
 	
 	// fade out
 	function fadeOutActive(){
 		deliverInfo.classList.remove('fade_active_txt')
		
		for(let i=0; i<3; i++){
	    	orderPathA[i].classList.remove('fade_active_txt');
	    }
	    
	    contentFade.classList.remove('fade_active')
	    
	    document.querySelector('.summary_order').classList.remove('fade_active_txt')
		document.querySelector('.all_total_price').classList.remove('fade_active_txt')
 	
 		document.querySelector('.pay_btn').removeAttribute('disabled')
 		document.querySelector('.detail_btn').removeAttribute('disabled')
 	}
 	
 	// ---------------------------------------------------------------------------------------------
	
	// 버튼 클릭시 주문 상세보기 화면 나오는 함수
	function showDetail(){
	    fadeInActive()
	    
	    summaryOrder.classList.add('hidden')
	    slider.classList.add('show')
	}
	
	// 버튼 클릭시 주문 상세보기 들어가는 함수
	function hideDetail(){
		fadeOutActive()

	    summaryOrder.classList.remove('hidden')
	    slider.classList.remove('show')
 	}
	
   // -------------- 포인트 사용
   // 적립 포인트 사용
   inputUsePoint.addEventListener('keyup',function(){
      		
      								
       let inputPoint = parseInt(inputUsePoint.value)				// 입력한 포인트 value 값
       let canUsePointV = parseInt(canUsePoint.textContent)			// 사용가능한 포인트 
	   let totalPriceC = totalPrice[0].textContent.replace(',','') // 상품 가격

       // 적립 포인트가 1000원 미만이면 input 창 막기
       if(canUsePointV<1000){
           inputUsePoint.setAttribute('disabled',true)
           inputUsePoint.value = 0
           inputPoint = 0
           let pointText = document.querySelector(".pointText")
           pointText.classList.add('alertText')
       }
       
       // 사용가능한 포인트보다 더 큰 포인트를 사용하려 하는 경우
       if(inputPoint>canUsePointV){
           inputUsePoint.value = canUsePointV
           inputPoint = canUsePointV
           canUsePoint.classList.add('alertText')
       }else{
           canUsePoint.classList.remove('alertText')
       }
       
       // 주문금액 보다 포인트를 더 사용하려는 경우
       if(totalPriceC < inputPoint){
       	   inputUsePoint.value = totalPriceC
       	   inputPoint = totalPriceC
       }
       
       // input value 값 공란일 경우 사용 포인트 0으로 변경 
       if(inputUsePoint.value == null || inputUsePoint.value == ""){
           inputPoint = 0
       }
       
       exceptUsePoint(inputPoint)
       exceptPointTotal(inputPoint)
   }) 
   
   function exceptUsePoint(usePointNum){
       
       for(let i in totalUsePoint){
       	 totalUsePoint[i].textContent = usePointNum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
       }
      
   }

   // 총 주문 금액 재설정 함수
   function exceptPointTotal(usePointNum){
      
      let totalPriceNum = parseInt(totalPrice[1].textContent.replace(',',''))
      
      let allTotalNum = (totalPriceNum - usePointNum)
      let allTotal = allTotalNum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
      
      for(let i in allTotalPrice){
       	 allTotalPrice[i].textContent = allTotal
       }
   }
   
   // 주소 선택 --------------------------------------------------------------------------------------
   // 주소가 "-" 일경우 결제하기 버튼 막기
   function checkAddr(){
   		
   		let nowAddr = addrSelected[0].value
   		
   		if(nowAddr == "-"){
   			document.querySelector('.pay_btn').setAttribute('disabled',true)
   
   			
   		}else{
   			document.querySelector('.pay_btn').removeAttribute('disabled')
   		}
   		
   		
   }
   
   // 주소 radio 버튼 클릭시
   addrRadio.forEach(function(e,index){
       		
       	addrRadio[index].addEventListener('click',function(){

			// 0: 집, 1: 회사, 2: 외
       		if(index==0){
       			
       			addr = document.querySelector('.addr1').value.replace('  ',' ')
       			addrSelected[0].value = addr.slice(0,5)
       			addrSelected[1].value = addr.slice(6)
       			noAddr()
       		
       		} else if(index==1){
       			
       			addr = document.querySelector('.addr2').value.replace('  ',' ')
       			addrSelected[0].value = addr.slice(0,6)
       			addrSelected[1].value = addr.slice(6)
       			noAddr()
       			
       		} else if(index==2){
       			fadeInActive()
       			document.querySelector('.modal_body').classList.remove('display_none')
       		}
       		
       		checkAddr()
       	})
    })
    
    // 주소 radio 버튼 [외] 클릭후 특정 주소 선택시
    function selectAddr(index){
    
    	addr = document.querySelector(`.addr${index}`).value.replace('  ',' ')
		addrSelected[0].value = addr.slice(0,5)
		addrSelected[1].value = addr.slice(6)
		
		noAddr()
		fadeOutActive()
		document.querySelector('.modal_body').classList.add('display_none')
		console.log(addr)
    }
    
    // 주소가 없을 경우 
    function noAddr(){
    	let tAddr = document.querySelectorAll('.t_addr')
    	let fAddr = document.querySelector('.f_addr')
    	
    	if(addrSelected[0].value=='-'){
    		tAddr[0].classList.add('display_none')
    		tAddr[1].classList.add('display_none')
    		fAddr.classList.remove('display_none')
    	
    	}else{
    		tAddr[0].classList.remove('display_none')
    		tAddr[1].classList.remove('display_none')
    		fAddr.classList.add('display_none')
    	}
    }
    
    // 모달창 닫기
	function closeModal(){
		console.log('종료 버튼 클릭')
		fadeOutActive()
		document.querySelector('.modal_body').classList.add('display_none')
	}
	   
		
	/////////////////////////////////////////////////////////////////////////////
	$.ajaxSetup({	
   			ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
			type: "post"
		})
		
		let directOrderBean = [];
 		for(let i=0; i<$(".d_con").length; i++){
 			directOrderBean.push($($(".d_con")[i]).val())
	 	}
	 	console.log(directOrderBean)
		
	
 		let requestType = $(".reqtype").val()
 		
 		// 장바구니 번호 배열
 		function rowCartNum(){
 			let rowCartNumArr = [];
 			
 			for(let i=0; i<$(".row_cart_num").length; i++){
	 			rowCartNumArr.push(Number($($(".row_cart_num")[i]).val()))
	 		}
	 		
	 		return rowCartNumArr;
 		}
 		
 		// 장바구니 내역의 상품 단가배열
 		function rowPrice(){
 			
 			let rowPriceArr = [];
	 		for(let i=0; i<$(".row_price").length; i++){
	 			rowPriceArr.push(Number($($(".row_price")[i]).val()))
	 		}
	 		
	 		return rowPriceArr;
 		}
 		
 	
	  
