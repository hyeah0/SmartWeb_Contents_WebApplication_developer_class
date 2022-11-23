/**
 * 배너 js
 */

// 슬라이더 배열로 가져오기
const slides = document.querySelectorAll(".slide")

// 왼쪽, 오른쪽 버튼 가져오기
const leftBtn = document.querySelector('.banner_arrow_left')
const rightBtn = document.querySelector('.banner_arrow_right')

// 실행된 슬라이더
let activeSlide = 0;

// 3초마다 배너 변경
function setIntervalFunction(){
	activeSlide ++
	
	if(activeSlide > slides.length-1){
        activeSlide = 0;
    }
    setActiveSlide();
}
setInterval(setIntervalFunction, 3000);

// 함수
// 현재 실행중인 슬라이드에 active 클래스 추기
function setActiveSlide(){
    slides.forEach(slide=>{
        slide.classList.remove('active')
    })

    slides[activeSlide].classList.add('active')
}

// 버튼 클릭시 슬라이드 움직임
leftBtn.addEventListener('click',()=>{
    activeSlide--

    if(activeSlide<0){
        activeSlide = slides.length-1;
    }
    setActiveSlide();
})

rightBtn.addEventListener('click',()=>{
    activeSlide ++

    if(activeSlide > slides.length-1){
        activeSlide = 0;
    }
    setActiveSlide();
})