console.log('order.js')

// 상세보기 
// 변수
let offCanvas = document.querySelector('.offCanvas')
let summaryOrder = document.querySelector('.summary_order')
 
// 버튼 클릭시 주문 상세보기 화면 나오는 함수
function showDetail(){
    offCanvas.classList.add('show')
    summaryOrder.classList.add('hidden')
}

// 버튼 클릭시 주문 상세보기 들어가는 함수
function hideDetail(){
    offCanvas.classList.remove('show')
    summaryOrder.classList.remove('hidden')
}