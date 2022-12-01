console.log('js')
// 버튼 클릭시 ---------------------------------------------------------------
// 변수 
// 구매 최대값, 최소값 변수
const maxOrder = 20
const minOrder = 1
const pointRate = 0.05
let finSum = 0;

// 버튼 변수 
let btnUp = document.querySelectorAll(".btn_up")
let btnDown = document.querySelectorAll(".btn_down")

// input 변수
let inputCnt = document.querySelectorAll(".input_cnt")
let rowPrice = document.querySelectorAll(".row_price")
let rowTotal = document.querySelectorAll(".row_total")

// 총 합계 변수
let totalPrice = document.querySelector(".total_price")
let allTotalPrice = document.querySelector(".all_total_price")
let allPoint = document.querySelector(".all_point")

// input hidden 값으로 넘겨줘야할 값
let rowTotalH = document.querySelectorAll(".row_total_hidden")
let totalPriceH = document.querySelector(".total_price_hidden")
let allPointH = document.querySelector(".all_point_hidden")

// 총 합 
// default row 수량이 1일경우 down 버튼 비활성화
inputCnt.forEach(function(e,index){
    if(inputCnt[index].value==1){
        btnDown[index].setAttribute('disabled',true)
        btnDown[index].classList.add('disabled_btn')
    }
    functionRowTotal(index)
    functionAllTotal()
})

// 수량 up 버튼 클릭시
btnUp.forEach(function(e,index){
    btnUp[index].addEventListener("click",function(){
        console.log(`${index} up 버튼 클릭`)
        up(index)
        functionRowTotal(index)
        functionAllTotal()
    })
})

btnDown.forEach(function(e,index){
    btnDown[index].addEventListener("click",function(){
        console.log(`${index} down 버튼 클릭`)
        down(index)
        functionRowTotal(index)
        functionAllTotal()
    })
})

// input 창에 수량 작성시
// inputCnt.forEach(function(e, index){
//     inputCnt[index].addEventListener("keyup",function(){
//         if(inputCnt[index].value > maxOrder){
//             alert('최대 20개만 구매 가능합니다.')
//             inputCnt[index].value = maxOrder
//             btnUp[index].setAttribute('disabled', true)
//             btnUp[index].classList.add('disabled_btn')
//             btnDown[index].removeAttribute('disabled')
//             btnDown[index].classList.remove('disabled_btn')

//         }else if(inputCnt[index].value == maxOrder){
//             btnUp[index].setAttribute('disabled', true)
//             btnUp[index].classList.add('disabled_btn')
//             btnDown[index].removeAttribute('disabled')
//             btnDown[index].classList.remove('disabled_btn')

//         }else if(inputCnt[index].value<=0){
//             alert('최소 1개 이상 구매 가능합니다.')
//             inputCnt[index].value = minOrder
//             btnUp[index].classList.remove('disabled_btn')
//             btnDown[index].classList.add('disabled_btn')
//         }

//         functionRowTotal()
//     })
// })

// 함수 -----------------------------------------------------
// 수량 증가 함수
function up(index){
    let cntValue = inputCnt[index].value
    cntValue++
    inputCnt[index].value = cntValue

    if(cntValue >= minOrder){
        btnDown[index].removeAttribute('disabled')
        btnDown[index].classList.remove('disabled_btn')
    }

    if(cntValue >= maxOrder){
        btnUp[index].setAttribute('disabled',true)
        btnUp[index].classList.add('disabled_btn')
    }
}

// 수량 감소 함수
function down(index){
    let cntValue = inputCnt[index].value
    cntValue--
    inputCnt[index].value = cntValue

    if(cntValue == minOrder){
        btnDown[index].setAttribute('disabled',true)
        btnDown[index].classList.add('disabled_btn')
    }

    if(cntValue < maxOrder){
        btnUp[index].removeAttribute('disabled')
        btnUp[index].classList.remove('disabled_btn')
    }
}

// 수량 추가, 감소시 행 합계 수정 함수
function functionRowTotal(index){
    // 행합계
    let rowFinTotal = rowPrice[index].textContent * inputCnt[index].value
    let rowTotalComma = rowFinTotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')

    rowTotal[index].textContent = rowTotalComma
    rowTotalH[index].values = rowFinTotal
}

// 총 합계 함수
function functionAllTotal(){
    this.nums = [];
    this.sum = 0;

    // row total nums 배열에 넣기
    for(let i=0; i<rowTotal.length; i++){
        let num = parseInt(rowTotal[i].textContent.replace(/,/g , ''));
        this.nums.push(num)
    }

    // 배열에 들어간 값 저장
    this.nums.forEach(function(item){
        this.sum += parseInt(item);
    })

    finSum = this.sum

    // 총 상품 금액, 적립 포인트 수정
    let sumText = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
    totalPrice.textContent = sumText
    allTotalPrice.textContent = totalPrice.textContent
    totalPriceH.value = this.sum
    
    point(finSum) 
}

// 포인트 집계 함수
function point(finSum){
    let point = finSum * pointRate
    let pointText = point.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
    allPoint.textContent = pointText
    allPointH.value = point
}

// 삭제 클릭시 ---------------------------------------------------------------
// 삭제 버튼 변수
let rowArea = document.querySelectorAll('.row_area')
function deleteRow(index){
    rowArea[index].classList.add('display_none')
    
    let dProductPrice =  parseInt(rowTotal[index].textContent.replace(/,/g , ''));
    let reTotalPrice = finSum - dProductPrice
   
    finSum = reTotalPrice
    totalPriceH.value = reTotalPrice

    totalPrice.textContent = reTotalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
    allTotalPrice.textContent = totalPrice.textContent.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')

    point(finSum) 
}
