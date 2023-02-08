console.log('js')
   // 버튼 클릭시 ---------------------------------------------------------------
   
   /*
    numToString >> 변수명.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')"
    StringToNum >> parseInt(b_price.textContent.replace(/,/g , '')
    replaceAll(",", "")
   */
   
   // 변수 
   // 구매 최대 수량, 최소 수량 변수
   const maxOrder = 20
   const minOrder = 1
   
   // 구매 최대 그람, 최소 그람
   const maxGram = 400
   const minGram = 100
   
   const pointRate = 0.05
   let finSum = 0;
 
   // 버튼 변수 
   let btnUp = document.querySelectorAll(".btn_up")
   let btnDown = document.querySelectorAll(".btn_down")
   let gbtnUp = document.querySelectorAll(".gram_btn_up")
   let gbtnDown = document.querySelectorAll(".gram_btn_down")
   
   // 구매가능한 상품만
   let inputCnt = document.querySelectorAll(".input_cnt") 		// 수량 
   let rowPrice = document.querySelectorAll(".row_price") 		// 단가 
   let rowGram = document.querySelectorAll(".row_gram")	  		// 그람
   let rowTotal = document.querySelectorAll(".row_total") 		// 수량 * 단가 * (그람/100)
   let rowStock = document.querySelectorAll(".beans_count") 
   
   // 총 합계 변수
   let totalPrice = document.querySelector(".total_price")         // 상품가격
   let allTotalPrice = document.querySelector(".all_total_price")  // 상품가격 + 배송비 - 사용포인트
   let allPoint = document.querySelector(".all_point")             // 적립포인트

   let canOrderRow = document.querySelectorAll(".row_cart_num")		// 주문가능한 row
   let soldOutRow = document.querySelectorAll('.sold_out_row')		// 품절상품 row
   //---------------------------------------------------------------------------------
   	
   window.onload = onloadCalc()

   // 윈도우 로드시 row total 함수(단가 * 수량 * (그람수/100))
   function onloadCalc(){
	   
	   let heart = document.querySelectorAll('.heart_1')
	   
   		inputCnt.forEach(function(e,index){
   			
   			// 수량 최소값(1) 일경우 버튼 비활성화
   			if(inputCnt[index].value==minOrder){
		           btnDown[index].setAttribute('disabled',true)
		           btnDown[index].classList.add('disabled_btn')
		    }
		    
		    // 수량 최대값(20) 일경우 버튼 비활성화
		    if(inputCnt[index].value==maxOrder){
		           btnUp[index].setAttribute('disabled',true)
		           btnUp[index].classList.add('disabled_btn')
		    }
		    
		    // 그람 최소값(100) 일경우 버튼 비활성화
	    	if(rowGram[index].value==minGram){
		           gbtnDown[index].setAttribute('disabled',true)
		           gbtnDown[index].classList.add('disabled_btn')
		    }
		    
		    // 그람 최대값(400) 일경우 버튼 비활성화
   			if(rowGram[index].value==maxGram){
		           gbtnUp[index].setAttribute('disabled',true)
		           gbtnUp[index].classList.add('disabled_btn')
		    }
		    
   			
   			let rowPriceNum = parseInt(rowPrice[index].value) 	// 단가
   			let rowInCntNum = parseInt(inputCnt[index].value) 	// 수량
   			let rowGramNum = parseInt(rowGram[index].value)/100 // 그람수/100

   			let rowTotalNum = rowPriceNum * rowInCntNum * rowGramNum  
   			rowTotal[index].textContent = rowTotalNum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
   			CalcAllTotal()
   			
   		})  
   		
   		heart.forEach(function(e,index){
	   		heart[index].classList.add('heart_active')
   		})
   		
   		// 장바구니에 상품이 하나도 없거나, 품절 상품만 있을 경우 주문하기 버튼 삭제
        if(canOrderRow.length == 0 && soldOutRow.length >= 0 ){
       	  document.querySelector(".total_price_button").remove()
        }
   }
   
    // 수량 up 버튼 클릭시
   function upCnt(cartNum){
	  console.log("click up button : "+cartNum)
	  
	  up(cartNum)
	  
	  CalcRowTotal(cartNum)
	  CalcAllTotal()
	  
   }
   
   // 수량 down 버튼 클릭시
   function downCnt(cartNum){
	   console.log("click down button : "+cartNum)
	   
	   down(cartNum)
	   
	   CalcRowTotal(cartNum)
	   CalcAllTotal()
	   
   }
   
   // 수량 up 함수
   function up(cartNum){
	  
	  let clickedCnt = document.querySelector(".num_"+cartNum+"_cnt")
	  let clickedCntValue = clickedCnt.value
	  clickedCntValue++
	  clickedCnt.value = clickedCntValue
	  
	  let clickedUBtn = document.querySelector(".num_"+cartNum+"_Ubtn")
	  let clickedDBtn = document.querySelector(".num_"+cartNum+"_Dbtn")
	  
	  if(clickedCntValue >= minOrder){
		  clickedDBtn.removeAttribute('disabled')
          clickedDBtn.classList.remove('disabled_btn')
      }

      if(clickedCntValue >= maxOrder){
    	  clickedUBtn.setAttribute('disabled',true)
          clickedUBtn.classList.add('disabled_btn')
      }
      
      checkStock(cartNum, 'c')
      
      // DB 수정 함수
      cartReCntDB(cartNum, clickedCntValue)
      
   }
   
   // 수량 down 함수
   function down(cartNum){
		  
	  let clickedCnt = document.querySelector(".num_"+cartNum+"_cnt")
	  let clickedCntValue = clickedCnt.value
	  clickedCntValue--
	  clickedCnt.value = clickedCntValue
	  
	  // 수량 업다운 버튼
	  let clickedUBtn = document.querySelector(".num_"+cartNum+"_Ubtn")
	  let clickedDBtn = document.querySelector(".num_"+cartNum+"_Dbtn")
	  
	  // 그람 업 버튼
	  let clickedGUBtn = document.querySelector(".num_g_"+cartNum+"_Ubtn")
	  clickedGUBtn.removeAttribute('disabled')
	  clickedGUBtn.classList.remove('disabled_btn')
	  
	  if(clickedCntValue == minOrder){
	     clickedDBtn.setAttribute('disabled',true)
	     clickedDBtn.classList.add('disabled_btn')
      }
	
	  if(clickedCntValue < maxOrder){
	     clickedUBtn.removeAttribute('disabled')
	     clickedUBtn.classList.remove('disabled_btn')
	  }
	  
	  checkStock(cartNum, 'c')
      
      // DB 수정 함수
      cartReCntDB(cartNum, clickedCntValue)
   }
   
   // 그람 up 함수
   function gramUpCnt(cartNum){
   		console.log('그람 up클릭')
    	let clickedGram = document.querySelector(".num_"+cartNum+"_gram")
    	let clickedGramValue = parseInt(clickedGram.value) +100 
    	clickedGram.value = clickedGramValue
    	
    	let clickedGUBtn = document.querySelector(".num_g_"+cartNum+"_Ubtn")
	  	let clickedGDBtn = document.querySelector(".num_g_"+cartNum+"_Dbtn")
    	
    	if(clickedGramValue >= minGram){
			clickedGDBtn.removeAttribute('disabled')
	        clickedGDBtn.classList.remove('disabled_btn')
	    }
	
	    if(clickedGramValue >= maxGram){
	    	clickedGUBtn.setAttribute('disabled',true)
	        clickedGUBtn.classList.add('disabled_btn')
	    }
	    
	    checkStock(cartNum, 'g')
	    
	    CalcRowTotal(cartNum)
	   	CalcAllTotal()
   		
   		// DB 수정 함수
      	cartReGramDB(cartNum, clickedGramValue)
   }
   
   // 그람 down 함수
   function gramDownCnt(cartNum){
   		console.log('그람 down클릭')
   		let clickedGram = document.querySelector(".num_"+cartNum+"_gram")
    	let clickedGramValue = parseInt(clickedGram.value) -100 
    	clickedGram.value = clickedGramValue
    	
    	let clickedGUBtn = document.querySelector(".num_g_"+cartNum+"_Ubtn")
	  	let clickedGDBtn = document.querySelector(".num_g_"+cartNum+"_Dbtn")
	  	
	  	// 수량 업버튼 버튼
		let clickedUBtn = document.querySelector(".num_"+cartNum+"_Ubtn")
		clickedUBtn.removeAttribute('disabled')
		clickedUBtn.classList.remove('disabled_btn')
	  	
	  	if(clickedGramValue == minGram){
			 clickedGDBtn.setAttribute('disabled',true)
	         clickedGDBtn.classList.add('disabled_btn')
	    }
	
	    if(clickedGramValue < maxGram){
	    	 clickedGUBtn.removeAttribute('disabled')
	         clickedGUBtn.classList.remove('disabled_btn')
	    }
	    
	    checkStock(cartNum, 'g')
	    
	    CalcRowTotal(cartNum)
	   	CalcAllTotal()
	   	
	   	// DB 수정 함수
      	cartReGramDB(cartNum, clickedGramValue)
   }
   
   
   // 재고 확인 함수
   function checkStock(cartNum, type){
   
   		let clickedCntValue = parseInt(document.querySelector(".num_"+cartNum+"_cnt").value)
	    let clickedGramValue = parseInt(document.querySelector(".num_"+cartNum+"_gram").value)
	    let beanStock = parseInt(document.querySelector(".num_"+cartNum+"_b_cnt").textContent)
	    
	    // 수량 업 버튼
	    let clickedUBtn = document.querySelector(".num_"+cartNum+"_Ubtn")
	    
	    // 그람 업다운 버튼
	    let clickedGUBtn = document.querySelector(".num_g_"+cartNum+"_Ubtn")
	    
	    // 장바구니에 들어있는 총 g 
	    let totalCartGram = (clickedCntValue * clickedGramValue)
      
      	console.log(`totalCartGram : ${totalCartGram} , typeof ${typeof totalCartGram}`)
        console.log(`beanStock : ${beanStock}, typeof ${typeof beanStock}`)
        
        if(totalCartGram>beanStock){
        	if(type=='c'){
        		document.querySelector(".num_"+cartNum+"_cnt").value =  clickedCntValue - 1
        	}else{
        		document.querySelector(".num_"+cartNum+"_gram").value =  clickedGramValue - 100
        	}
        }
        
        if( ((clickedGramValue + 100) * clickedCntValue) >= beanStock){
        	clickedGUBtn.setAttribute('disabled',true)
	     	clickedGUBtn.classList.add('disabled_btn')
        
        }
        
        if( clickedGramValue >100){
	        if( (clickedGramValue * (clickedCntValue +1)) >= beanStock){
	       		
	       		clickedUBtn.setAttribute('disabled',true)
		        clickedUBtn.classList.add('disabled_btn')
	        }
        }
        
   }
   
   
   
   // 수량. 그람수 변화에 따라 합계 계산 함수
   function CalcRowTotal(cartNum){
       
	   let rPrice = parseInt(document.querySelector(".num_"+cartNum+"_Rprice").value)
	   let rCnt = parseInt(document.querySelector(".num_"+cartNum+"_cnt").value)
	   let rGram = parseInt(document.querySelector(".num_"+cartNum+"_gram").value)/100
	   
	   let rTotalTag = document.querySelector(".num_"+cartNum+"_Rtotal")
	   let rTotal = parseInt(rTotalTag.textContent.replace(',',''))
	   
	   calc = rPrice * rCnt * rGram
	   rTotalTag.textContent = calc.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
   }
   
   // 총 합계 함수 (품절 상품은 제외)
   function CalcAllTotal(){
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
       
       totalPrice.textContent = sumText
       allTotalPrice.textContent = totalPrice.textContent
       
       point(finSum) 
   }
   
   // 포인트 집계 함수
   function point(finSum){
   
       let point = Math.ceil(finSum * pointRate)
       let pointText = point.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
   
       allPoint.textContent = pointText
   }

   // 삭제 클릭시 ---------------------------------------------------------------
   function deleteRow(cartNum){
       
	   let rowArea = document.querySelector(".num_"+cartNum+"_row")
	   let hrdiv = document.querySelector(".num_"+cartNum+"_hrdiv")
	   
	   let rTotalTag = document.querySelector(".num_"+cartNum+"_Rtotal")
	   let rTotal = parseInt(rTotalTag.textContent.replace(',',''))
	  
	   rowArea.remove()
	   hrdiv.remove()
	   
	   let reCanOrderRow = document.querySelectorAll(".row_cart_num")
	   let reSoldOutRow = document.querySelectorAll('.sold_out_row')
	   
	   // 주문금액, 적립포인트 수정
       let reTotalPrice = finSum - rTotal
      
       finSum = reTotalPrice
       
       totalPrice.textContent = reTotalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
       allTotalPrice.textContent = totalPrice.textContent
	   
       point(finSum) 
       
       // 장바구니에 상품이 하나도 없을 경우 상품 row 에 안내문 출력
       if(canOrderRow.length == 0 && soldOutRow.length == 0 ){
       		disabledOrderBtn()
       }
       
       // 장바구니에 상품이 하나도 없거나, 품절 상품만 있을 경우 주문하기 버튼 삭제
       if(reCanOrderRow.length == 0 && reSoldOutRow.length >= 0 ){
       	 document.querySelector(".total_price_button").remove()
       }
       
       
       // DB 수정 함수
       deleteRowDB(cartNum)
   }
   
   // 품절 상품 삭제 클릭시 ---------------------------------------------------------------
   function deleteSoldOutRow(cartNum){
   	
   	   let rowArea = document.querySelector(".num_"+cartNum+"_row")
	   let hrdiv = document.querySelector(".num_"+cartNum+"_hrdiv")	
   		
	   rowArea.remove()
	   hrdiv.remove()

   	   let reCanOrderRow = document.querySelectorAll(".row_cart_num")
	   let reSoldOutRow = document.querySelectorAll('.sold_out_row')
   		
   	   console.log(`canOrderRow.length : ${canOrderRow.length}`)
       console.log(`soldOutRow.length : ${soldOutRow.length}`)
       
       // 장바구니에 상품이 하나도 없을 경우 주문하기 버튼 삭제
       if(canOrderRow.length == 0 && soldOutRow.length == 0 ){
       		disabledOrderBtn()
       }
       
       // 장바구니에 상품이 하나도 없거나, 품절 상품만 있을 경우 주문하기 버튼 삭제
       if(reCanOrderRow.length == 0 && reSoldOutRow.length >= 0 ){
       	 document.querySelector(".total_price_button").remove()
       }
   		
   		
   	   // DB 수정 함수
       deleteRowDB(cartNum)
   }
   
   
   // 장바구니 목록이 없다면 주문하기 버튼 없애기
   function disabledOrderBtn(){
   		
   		console.log('장바구니 목록이 없습니다.')
		document.querySelector(".rows_area").innerHTML = '<div class="row_area empty_cart">' 
			+ '<h3 class="point_text">담아둔 상품이 없습니다.</h3>'
		 	+ '</div>'
		
   }
   
   // ajax ----------------------------------------------------------
  	$.ajaxSetup({	
   			ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
			type: "post"
	})
  
   // 하트 버튼 클릭시 찜 수정 또는 등록 ajax 
   function heartRowDB(memNum, beansNum, cartNum){
   		
   		let clikedHeart = document.querySelector(".num_"+cartNum+"_heart")
   		clikedHeart.classList.toggle('heart_active')
   		
   		$.ajax({
   			url : "/coffee/heart.do",
   			data : {memNum : memNum , beansNum : beansNum},
   			datatype : "text",
   			success : function(data){
   				console.log("찜 성공");
   			},
   			error : function(){
   				console.log('찜 실패!');
   			}
   		})
   }
   
   // 삭제 버튼 클릭시 장바구니 삭제 ajax
   function deleteRowDB(cartNum){
   		console.log("cartNum : " + cartNum)
   	
   		$.ajax({
   			url : "/coffee/deleteCartRow.do",
   			data : { cartNum : cartNum },
   			datatype : "text",
   			success : function(data){
   				console.log("장바구니 행(row) 삭제 성공");
   			},
   			error : function(){
   				console.log("장바구니 행(row) 삭제 실패");
   			}
   		})
   }
   
   // 수량 버튼 클릭시 장바구니 수량 수정하는 ajax
   function cartReCntDB(cartNum, reCntValue){
   	
   		console.log("cartNum : " + cartNum)
   		console.log("reCntValue : " + reCntValue)
   		
   		$.ajax({
   			url : "/coffee/updateCartCnt.do",
   			data : { cartNum : cartNum, cartCnt : reCntValue},
   			datatype : "text",
   			success : function(data){
   				console.log("수량 수정 성공");
   			},
   			error : function(){
   				console.log('수량 수정 실패!');
   			}
   		})
   }
   
   // 그람 버튼 클릭시 장바구니 그람 수정하는 ajax
   function cartReGramDB(cartNum, reGramValue){
   	
   		console.log("cartNum : " + cartNum)
   		console.log("reGramValue : " + reGramValue)
   		
   		$.ajax({
   			url : "/coffee/updateCartGram.do",
   			data : { cartNum : cartNum, cartGram : reGramValue},
   			datatype : "text",
   			success : function(data){
   				console.log("그람 수정 성공");
   			},
   			error : function(){
   				console.log('그람 수정 실패!');
   			}
   		})
   }
 
	// 장바구니 번호 배열
	function makeCartNumArr(){
		let rowCartNumArr = [];
		
		for(let i=0; i<$(".row_cart_num").length; i++){
			rowCartNumArr.push(Number($($(".row_cart_num")[i]).val()))
		}
		
		return rowCartNumArr;
	}
 
  // 결제하기 버튼 클릭
  let order_btn = document.querySelector('.order_btn')
  order_btn.addEventListener('click',function(){
  		
  		// 장바구니 번호 넘겨줌
  		let rowCartArr = makeCartNumArr()
	  	location.href="bean_order.do?cart="+rowCartArr
	  	
  
  })
   
   
  
		
