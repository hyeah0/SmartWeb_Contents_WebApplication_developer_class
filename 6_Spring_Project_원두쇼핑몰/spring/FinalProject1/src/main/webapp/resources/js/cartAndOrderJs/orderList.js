/**
 * 1. 기간 설정 
    ㄴ default 시작일과 종료일은 당일 이후 선택 불가능
    ㄴ 시작일을 종료일 보다 후로 설정 못하게 지정 
    ㄴ 종료일을 시작일보다 전으로 설정 못하게 지정 
    
   2. 기간 선택 후 조회 버튼 누를 경우 해당하는 데이터 가져오기
   3. 구매완료 버튼 클릭시 배달 완료 처리
 */

	console.log('order list js')
	
	// 기간(일자) 변수
	let startDate = document.querySelector('.start_date')
	let endDate = document.querySelector('.end_date')
	let explain = document.querySelector('.explain_txt_now')
	let rows = document.querySelector('.rows').value
	
	// 쿼리스트링 가져오기
    function searchParam(key) {
	  return new URLSearchParams(location.search).get(key)
	}
	
	window.onload = function(){
		console.log('window.onload')
		
		// default 시작일과 종료일은 당일 이후 선택 불가능 
	 	endDate.setAttribute("max", new Date().toISOString().substring(0, 10))
	 	startDate.setAttribute("max", endDate.value)
	 	
	 	// 해당하는 주문건 텍스트 
		explainTxt(rows)
	 	
	}
	
	// 해당하는 주문건 텍스트 
	function explainTxt(rows){
	
		let page = searchParam('page')
		let type = searchParam('type')
		let startEnd = searchParam('startEnd')
		let typeName = ""
	 	
	 	switch (type){
	 		case '0' : typeName='배송대기'; break;
	 		case '1' : typeName='배송중';  break;
	 		case '2' : typeName='배송완료'; break;
	 		case '3' : typeName='주문취소'; break;
	 	}
	 	
	 	console.log(`page : ${page}`)
	 	console.log(`type : ${type}`)
	 	console.log(`startEnd : ${startEnd}`)
	 	
	 	if((page != null && type == null && startEnd == null) || (page == null && type == null && startEnd == null)){
	 		explain.innerHTML = `전체 주문건은 <b>${rows}</b>건 입니다.`
	 	
	 	}else if((type == '' || type == null) && startEnd != null){
 			explain.innerHTML = `${startDate.value} 부터 ${endDate.value} 까지 주문건은 <b>${rows}</b>건 입니다.`
	 		
	 	}else if(type != null && startEnd == null){
	 		explain.innerHTML = `<b>[${typeName}]</b> 인 주문건은 <b>${rows}</b>건 입니다.`
	 		
	 	}else if((type != '' || type != null) && startEnd != null){
	 		explain.innerHTML = `${startDate.value} 부터 ${endDate.value} 까지 <b>[${typeName}]</b>인 주문건은 <b>${rows}</b>건 입니다.`
	 	
	 	}
	
	}
	
	 
	 // 시작일을 종료일 보다 후로 설정 못하게 지정 
	 startDate.addEventListener('click',function(){
	    console.log('startdate 가 클릭 되었습니다.')
	    endDate.setAttribute("min", startDate.value)
	 })
	
	 // 종료일을 시작일보다 전으로 설정 못하게 지정 
	 endDate.addEventListener('click',function(){
	    console.log('endDate 가 클릭 되었습니다.')
	    startDate.setAttribute("max", endDate.value)
	    endDate.setAttribute("min", startDate.value)
	 })
    
    // 2. 기간 선택 후 조회 버튼 누를 경우 해당하는 데이터 가져오기
    function searchData(){
    	if(startDate.value == null){
    		startDate.value = new Date().toISOString().substring(0, 10)
    	}
    	if(endDate.value == null){
    		endDate.value = new Date().toISOString().substring(0, 10)
    	}
   		let startEnd = [startDate.value, endDate.value]
   		console.log(startEnd[0])
   		let page = searchParam('page')
   		let type = searchParam('type')
   		
   		if(page==null && type==null){
   			location.href=`order_list.do?startEnd=${startEnd}`
   		
   		}else{
   			location.href=`order_list.do?page=1&type=${type}&startEnd=${startEnd}`
   		}
    	
    }
    
	// 3. 구매완료 버튼 클릭시 배달 완료 처리
	let deliveryOkBtn = document.querySelectorAll('.js_delivery_ok') 
	deliveryOkBtn.forEach(function(e,index){
		
		deliveryOkBtn[index].addEventListener('click',function(){
			let orderNum = deliveryOkBtn[index].value
			console.log('구매완료 버튼 클릭')
			console.log(orderNum)
			
			// ajax 타입 변경 함수
			updateRowTypeNum(orderNum)
			
			// 배송중, 배송완료 수량 변경 함수
			changeDeliveryCnt()

			// 버튼 텍스트 변경 함수
			changeTxt(orderNum)
			
		})
		
	})
	
	// 배송중 수량, 배송완료 수량 변경
	function changeDeliveryCnt(){
		let deliveryOk = document.querySelector('.delivery_ok_a')
		let deliveryIng = document.querySelector('.delivery_ing_a')
		
		deliveryOk.textContent = parseInt(deliveryOk.textContent) + 1
		deliveryIng.textContent = parseInt(deliveryIng.textContent) - 1
	}
	
	// 구매버튼 클릭시 구매버튼 변경 하기
	function changeTxt(orderNum){
		console.log('배송완료로 텍스트를 변경합니다.')
		
		// 만약 쿼리스트링에 type 값이 있으면 row 삭제, 아닐경우 버튼 구역 텍스트 변경
		let type = searchParam('type')
		console.log(`type : ${type}`)
		
		if(type==null){
			let changeDiv = document.querySelector(".js_delivery_"+orderNum)
			changeDiv.innerHTML = "<b>배송완료</b>"

		}else{
			document.querySelector(".js_delivery_"+orderNum +"_c").remove()
			let deliveryIng = document.querySelector('.delivery_ing_a')
			
			explainTxt(deliveryIng.textContent)
		}
		
	}
	
	
	
	 // ajax ----------------------------------------------------------
	 $.ajaxSetup({	
	 		ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
	 		type: "post"
	 })
	
	 // 구매완료 버튼 클릭시(row) 배송완료로 타입 업데이트 ajax 
	 function updateRowTypeNum(orderNum){
	 	$.ajax({
	   			url : "/coffee/delivery_ok.do",
	   			data : {orderNum : orderNum },
	   			datatype : "text",
	   			success : function(result){
	   				console.log(`배송완료로 변경 성공 : ${result}`);
	   			
	   			},
	   			error : function(){
	   				console.log("배송완료로 변경 실패");
	   			}
	   		})
	 	}
	