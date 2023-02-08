/**
 * 
 */
 $(function(){
 	
 			// 결제 버튼 클릭
		$("#apibtn").click(function(){
			
			let itemName = $(".itemName").val()
			let quantity = $(".quantity").val()
			let totalAmout = $($(".all_total_price")[0]).text().replace(",","")
			let totalUsePoint = Number($($(".total_use_point")[0]).text().replace(",","")) // 사용한 포인트
			let savePoint = Number($($(".all_point")[0]).text().replace(",",""))
			
			//-----------------------------------------------------
			// 넘어온 페이지에 따라 session에 넘겨주는 값 상이
			// requestType=="c" : 장바구니에서 넘어온 주문서 작성페이지
			// requestType=="d" : 바로주문으로 넘어온 주문서 작성페이지
			
			if(requestType=="c"){	
				
				let rowCartArr = rowCartNum()	// 장바구니 번호
				let rowPriceArr = rowPrice()	// 주문가격
				
				$.ajax({
					url:'/coffee/order_session.do',
					traditional: true,	// ajax 배열 넘기기 옵션
					data : {requestType: requestType, 
					        rowCartArr: rowCartArr, rowPriceArr: rowPriceArr, 
					        totalUsePoint : totalUsePoint, savePoint : savePoint },
					async : false,
					dataType: 'data',
					success : function(data){
						console.log('order_session.do에 데이터 전송 완료(장바구니)')
					},
					error: function(error){
						console.log('order_session.do에 데이터 전송 실패(장바구니)')
					}
				})
				
			}else{
				
				let directOrderBean = [];
		 		for(let i=0; i<$(".d_con").length; i++){
		 			directOrderBean.push($($(".d_con")[i]).val())
			 	}
				
				$.ajax({
					url:'/coffee/order_session.do',
					traditional: true,	// ajax 배열 넘기기 옵션
					data : {requestType: requestType, directOrderBean: directOrderBean, totalUsePoint : totalUsePoint, savePoint : savePoint },
					async : false,
					dataType: 'data',
					success : function(data){
						console.log('order_session.do에 데이터 전송 완료(바로가기)')
					},
					error: function(error){
						console.log('order_session.do에 데이터 전송 실패(바로가기)')
					}
				})
			}
			
			
			if(totalAmout==0){
				
				console.log('결제금액 0원')
				
				$.ajax({
					url:'/coffee/approvalpay.do',
					data : {nonePay: "y" },
					dataType: 'text',
					async : false,
					success : function(data){
						let order_num = data;
						console.log(order_num);
						location.href=`bean_order_ok.do?order=${order_num}`;	
						
					},
					error: function(error){
						alert('결제금액 0원 에러남');
					}
				})
			
			}else{
				// 카카오 api에 데이터 넘기기--------------------------------
				$.ajax({
					url:'/coffee/kakaopay.do',
					traditional: true,	// ajax 배열 넘기기 옵션
					data : {itemName: itemName, quantity : quantity, totalAmout: totalAmout },
					async : false,
					dataType: 'json',
					success : function(data){
						let box = data.next_redirect_pc_url;
						window.open(box);
						window.close();
						
					},
					error: function(error){
						alert('kakaopay.do 에러남');
					}
				})
			}
			
			
			
		})
	})