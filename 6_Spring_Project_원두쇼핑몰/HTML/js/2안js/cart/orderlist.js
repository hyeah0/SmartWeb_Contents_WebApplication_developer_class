console.log('order list js')
// 변수
let selectTerm = document.querySelectorAll('.sel_term')
let clicked = document.querySelector('.clicked')

// 기간 선택 버튼 클릭시 나머지 li 오픈
function openLi(){
    console.log('s_term_btn 버튼 클릭')
    
    for(let i=0; i<selectTerm.length; i++){
        selectTerm[i].classList.remove('display_none')
    }
}

function displayNon(selectedTerm){
    for(let i=0; i<selectTerm.length; i++){
        selectTerm[i].classList.toggle("display_none")
        selectedTerm.classList.remove('display_none')
    }
}

selectTerm.forEach(function(e,index){
    selectTerm[index].addEventListener('click',function(){
        console.log('버튼 클릭' + selectTerm[index] )
        displayNon(selectTerm[index])
    })
})

