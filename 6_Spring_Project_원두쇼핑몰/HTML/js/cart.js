console.log("cart.js")

// 버튼 클릭시 수량 변경, 적립금, 합계 변경 ------------------------------------------
// 변수 ----------------------------------------------------------------------
// 버튼 변수
let btnUp = document.querySelectorAll(".table_btn_up");
let btnDown = document.querySelectorAll(".table_btn_down");

// 수량 변수
let tableCnt = document.querySelectorAll(".table_cnt")

// 적립금, row 합계 
let rowprice = document.querySelectorAll(".row_price")
let rowpoint = document.querySelectorAll(".row_point")
let rowtotal = document.querySelectorAll(".row_total")

// --------------------------------------------------------------------------

// default row 수량이 1일경우 down 버튼 비활성화
tableCnt.forEach(function(e,index){
    if(tableCnt[index].value==1){
        btnDown[index].setAttribute('disabled', true)
    }
})

btnUp.forEach(function(e,index){

    btnUp[index].addEventListener("click",function(){
        console.log(`${index}up버튼 클릭됨!`)
        up(index)
        rowTotalF(index)
    })
})

btnDown.forEach(function(e, index){
    btnDown[index].addEventListener("click",function(){
        console.log(`${index}down버튼 클릭됨!`)
        down(index)
    })
})

// 수량 증가 함수
function up(index){
    let tableCntValue = tableCnt[index].value
    tableCntValue++
    tableCnt[index].value = tableCntValue
    if(tableCntValue>=1){
        btnDown[index].removeAttribute('disabled')
    }
}

// 수량 감소 함수
function down(index){
    let tableCntValue = tableCnt[index].value
    tableCntValue--
    tableCnt[index].value = tableCntValue
    if(tableCntValue==1){
        btnDown[index].setAttribute('disabled',true)
    }
}

// 적립금 수정 함수
function rowTotalF(index){
    let total = rowprice[index].textContent * tableCnt[index].value
    console.log(total.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'))
    rowtotal[index].textContent = total
}

// 합계 수정 함수
