/**
 * 1. 배송 대기 버튼 클릭시 배송중으로 변함, 버튼 색상 변경
 * 2. 전체 배송처리 하기 버튼 클릭시 배송대기중 >> 배송중으로 변경
 */
 console.log('adiminDelivery js')

 // 변수
 // 배송 버튼
 let deliveryBeforeBtn = document.querySelectorAll('.js_delivery_btn_b'); 

 // 쿼리스트링 가져오기
 function searchParam(key) {
   return new URLSearchParams(location.search).get(key)
 }

 // 1. 배송 대기 버튼 클릭시 배송중으로 변함, 버튼 색상 변경
 deliveryBeforeBtn.forEach(function(e,index){
 
 	deliveryBeforeBtn[index].addEventListener('click',function(){
 	
 		console.log(`${deliveryBeforeBtn[index]} 번 버튼 누름`)
 		
 		// 만약 쿼리스트링에 type 값이 있으면 row 삭제, 아닐경우 버튼 구역 텍스트 변경
		let type = searchParam('type')
		console.log(`type : ${type}`)
		
		if(type==null){
			deliveryBeforeBtn[index].setAttribute('disabled',true)
			deliveryBeforeBtn[index].textContent = '배송중'
 			deliveryBeforeBtn[index].classList.add('c_delivery_ing')

		}else{
			let orderRowTr = document.querySelector('.order_row_tr')
			let deliveryBefore = document.querySelector('.delivery_before_txt')
			orderRowTr.remove()
			deliveryBefore.textContent = deliveryBefore.textContent-1
		}
 		
 		let orderNum = deliveryBeforeBtn[index].value
 		console.log(orderNum)
 		
 		// ajax 업데이트 
 		updateRowTypeNum(orderNum)
 		
 		// 배송중 카운트 ++ 하기
 		let deliveryIng = document.querySelector('.delivery_ing_a')
 		deliveryIng.textContent = (parseInt(deliveryIng.textContent) +1)
 		
 		// 배송대기 카운트 -- 하기
 		let deliveryBefore = document.querySelector('.delivery_before_a')
 		deliveryBefore.textContent = (parseInt(deliveryBefore.textContent) -1)
 		
 		// 배송대기 버튼 클래스명 빼기
 		deliveryBeforeBtn[index].classList.remove('js_delivery_btn_b')
 	})
 })
 
 // 2. 전체 배송처리 하기 버튼 클릭시 배송대기중 >> 배송중으로 변경
 function allDeliveryIng(){
 	
 	// 배송대기 버튼 수정
 	deliveryBeforeBtn.forEach(function(e,index){
 		// 버튼 수정
 		deliveryBeforeBtn[index].textContent = '배송중'
 		deliveryBeforeBtn[index].classList.add('c_delivery_ing')
 		
 		// 배송대기 버튼 클래스명 빼기
 		deliveryBeforeBtn[index].classList.remove('js_delivery_btn_b')
 	})
 	
 	// ajax 업데이트 
 	updateAllTypeNum()
 	
 	// 배송중, 배송대기 재 카운트 하기
 	let deliveryIng = document.querySelector('.delivery_ing_a')
 	let deliveryBefore = document.querySelector('.delivery_before_a')
 	
 	deliveryIng.textContent = (parseInt(deliveryIng.textContent) + parseInt(deliveryBefore.textContent))
 	deliveryBefore.textContent = 0;
 }
 
 // ajax ----------------------------------------------------------
 $.ajaxSetup({	
 		ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
 		type: "post"
 })
 
 // 배송중 버튼 클릭시(row) 배송중으로 타입 업데이트 ajax 
 function updateRowTypeNum(orderNum){
 	$.ajax({
   			url : "/coffee/update_row_type_num.do",
   			data : {orderNum : orderNum },
   			datatype : "text",
   			success : function(result){
   				console.log(`배송중으로 변경 성공 : ${result}`);
   			
   			},
   			error : function(){
   				console.log("배송중으로 변경 실패");
   			}
   		})
 	}
 
  // 배송중 버튼 클릭시(row) 배송중으로 타입 업데이트 ajax 
 function updateAllTypeNum(){
 	$.ajax({
   			url : "/coffee/update_all_type_num.do",
   			datatype : "text",
   			success : function(result){
   				console.log(`전체 배송 대기중 >> 배송중으로 변경 성공 : ${result}`);
   			
   			},
   			error : function(){
   				console.log("전체 배송 대기중 >> 배송중으로 변경 실패");
   			}
   		})
 }
 
