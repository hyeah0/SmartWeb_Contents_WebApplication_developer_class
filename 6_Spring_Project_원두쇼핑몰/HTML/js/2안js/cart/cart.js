console.log('js')

// 스크롤 js
// 변수
const cont = document.querySelector(".recommend_products_section2");
const slider = document.getElementById('slider');
const slider_width = slider.offsetWidth;
const slider_children = slider.children;
const indi_bar = document.getElementById('indi_bar');
let window_width = window.innerWidth;
let slider_move_max = (slider_width - (window_width/2) * -1);
let slider_pos = 0;
let children_pos = 0;
let pct = 0;

// cont.addEventListener('wheel', function(e){
//     e.preventDefault;
//     // if(e.deltaY < 0 && slider_pos >= 0){
//     //     setTimeout(function(){
//     //         cont.style.top = `100%`;
//     //     },500);
//     //     return;
//     // }
//     move_slider(e.deltaY);
//     on_indicator;
// })

// function move_slider(amount){
//     slider_pos -= amount;
//     if(slider_pos < slider_move_max){
//         slider_pos = slider_move_max;
//         return;
//     }else if(slider_pos > 0){
//         slider_pos = 0;
//         return;
//     }
//     slider.style.transform = `translateX(${slider_pos}px)`;

// }

function on_indicator(){
    console.log(pct);
    pct = slider * 100 / slider_move_max;
    indi_bar.style.clipPath = `polygon(0% 0%, ${pct}% 0%, ${pct}% 100%, 0% 100% )`;
}