/**
 * 
 */
 	
 	console.log('orderContent')
 	
	let deliveryOkBtn = document.querySelector('.js_delivery_ok') 
   
    
	deliveryOkBtn.addEventListener('click',function(){
		let orderNum = deliveryOkBtn.value
		console.log('구매완료 버튼 클릭')
		console.log(orderNum)
		
		// ajax 타입 변경 함수
		updateRowTypeNum(orderNum)
		
		// 버튼 텍스트 변경 함수
		changeTxt()
		
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
    	
	// 구매버튼 클릭시 구매버튼 변경 하기
	function changeTxt(){
		console.log('배송완료로 텍스트를 변경합니다.')
		document.querySelector('.delivery_ing_txt').remove()
		document.querySelector('.change_delivery_ok_txt').textContent = '(배송완료)'
	}
	
 