const circleContainer = document.querySelector(".circle-container");
const container = document.querySelector(".container");


// 원형 버튼 nav
const nav = document.querySelector(".nav")
const closeNav = document.querySelector(".close-nav");


// 원형버튼 목록 표시 클릭시 버튼 컨테이너, 본문컨테이너에 클래스추가
nav.addEventListener('click',()=>{

    circleContainer.classList.add('circle-rotate');
    container.classList.add('rotate');
    
})

closeNav.addEventListener('click',()=>{

    circleContainer.classList.remove('circle-rotate');
    container.classList.remove('rotate');
})