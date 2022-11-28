console.log("cart.js")

// 버튼 클릭시 수량 변경, 적립금, 합계 변경 ------------------------------------------
// 변수 ----------------------------------------------------------------------
// 구매최대값
const maxOrder = 20;
const minOrder = 1;

// 버튼 변수
let btnUp = document.querySelectorAll(".table_btn_up");
let btnDown = document.querySelectorAll(".table_btn_down");

// 수량 변수
let tableCnt = document.querySelectorAll(".table_cnt")

// 적립금, row 합계 변수
let rowPrice = document.querySelectorAll(".row_price")
let rowPoint = document.querySelectorAll(".row_point")
let rowTotal = document.querySelectorAll(".row_total")

// 총 상품금액, 배송비, 총 합계 변수
let allTotal = document.querySelectorAll(".table_all_total")
let deliveryFee = document.querySelectorAll(".table_delivery_fee")
let lastTotal = document.querySelectorAll(".table_last_total")

// --------------------------------------------------------------------------

// default row 수량이 1일경우 down 버튼 비활성화
tableCnt.forEach(function(e,index){
    if(tableCnt[index].value==1){
        btnDown[index].setAttribute('disabled', true)
    }
})

// 수량 up 버튼 클릭시
btnUp.forEach(function(e,index){
    btnUp[index].addEventListener("click",function(){
        console.log(`${index}up버튼 클릭됨!`)
        up(index)
        functionRowTotal(index)
        functionAllTotal()
    })
})

// 수량 down 버튼 클릭시
btnDown.forEach(function(e, index){
    btnDown[index].addEventListener("click",function(){
        console.log(`${index}down버튼 클릭됨!`)
        down(index)
        functionRowTotal(index)
        functionAllTotal()
    })
})

// input 창에 수량 작성시
tableCnt.forEach(function(e, index){
    tableCnt[index].addEventListener("keyup",function(){
        if(tableCnt[index].value > maxOrder){
            alert('최대 20개만 구매 가능합니다.')
            tableCnt[index].value = maxOrder
            btnUp[index].setAttribute('disabled', true)
            btnDown[index].removeAttribute('disabled')

        }else if(tableCnt[index].value == maxOrder){
            btnUp[index].setAttribute('disabled', true)
            btnDown[index].removeAttribute('disabled')

        }else if(tableCnt[index].value<=0){
            alert('최소 1개 이상 구매 가능합니다.')
            tableCnt[index].value = minOrder
        }

        functionRowTotal()
    })
})

// 함수 ------------------------------------------------
// 수량 증가 함수
function up(index){
    let tableCntValue = tableCnt[index].value
    tableCntValue++
    tableCnt[index].value = tableCntValue
    if(tableCntValue >= minOrder){
        btnDown[index].removeAttribute('disabled')
    }

    if(tableCntValue >= maxOrder){
        btnUp[index].setAttribute('disabled',true)
    }
}

// 수량 감소 함수
function down(index){
    let tableCntValue = tableCnt[index].value
    tableCntValue--
    tableCnt[index].value = tableCntValue
    if(tableCntValue == minOrder){
        btnDown[index].setAttribute('disabled',true)
    }

    if(tableCntValue < maxOrder){
        btnUp[index].removeAttribute('disabled')
    }
}

// 수량 추가&추감 시 합계, 적립금 수정 함수
function functionRowTotal(index){
    // 행 합계
    let total = rowPrice[index].textContent * tableCnt[index].value
    let totalComma = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
    
    // 포인트 합계
    let pointRate = 0.01
    let point = (total * pointRate)
    let pointComma = point.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
    
    rowTotal[index].textContent = totalComma
    rowPoint[index].textContent = pointComma
}

// 최종 토탈 금액 합계 함수
function functionAllTotal(){
    this.nums = [];
    this.sum = 0;

    // nums 배열에 넣기 
    for(let i=0; i<rowTotal.length; i++ ){
        // 콤마 찍혀있는 숫자를 정수형으로 변환
        let num = parseInt(rowTotal[i].textContent.replace(/,/g , ''));
        this.nums.push(num);
        console.log(`rowTotal[i].textContent : ${rowTotal[i].textContent}`);
        console.log(`num : ${num}`);
    }
    // 배열에 들어간값 더하기
    this.nums.forEach(function(item){
        this.sum += parseInt(item);
    })

    console.log(`sum : ${sum}`)

    // 총 상품 금액 수정
    allTotal.forEach(function(e, index){
        let sumComma = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
        allTotal[index].textContent = sumComma;
    })

    // 결제 예정금액 수정
    lastTotal.forEach(function(e,index){
        let sumComma = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
        lastTotal[index].textContent = sumComma;
    })
    
   
}

