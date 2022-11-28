console.log("cart.js")

// 버튼 클릭시 수량 변경, 적립금, 합계 변경 ------------------------------------------
// 변수 ----------------------------------------------------------------------
// 버튼 변수
let btnUp = document.querySelectorAll(".table_btn_up");
let btnDown = document.querySelectorAll(".table_btn_down");

// 수량 변수
let tableCnt = document.querySelectorAll(".table_cnt")

// 적립금, row 합계 
let rowprice = document.querySelectorAll(".table_row_price")
let rowpoint = document.querySelectorAll(".table_row_point")
let rowtotal = document.querySelectorAll(".table_row_point")

// --------------------------------------------------------------------------


btnUp.forEach(function(e, index){
    this.addEventListener("click",function(){
        console.log("up버튼 클릭됨!")
        // up()
    })
})

btnDown.forEach(function(e, index){
 this.addEventListener("click",function(){
    console.log("down버튼 클릭됨!")
    // down()
})

// 수량 default 
// if(cntValue=1){
//     btnDown.setAttribute('disabled', true)
// }

// 수량 증가 함수
// function up(){
//     cntValue++
//     tableCnt.value = cntValue
//     if(cntValue!=1){
//         btnDown.removeAttribute('disabled')
//     }
// }

// 수량 감소 함수
// function down(){
//     cntValue--
//     console.log(cntValue)
    
//     tableCnt.value = cntValue
//     if(cntValue==1){
//         btnDown.setAttribute('disabled',true)
//     }
// }