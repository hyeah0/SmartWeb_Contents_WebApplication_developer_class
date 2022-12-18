console.log('order list js')


 
/**
 * 기간 클릭
 */
 // 변수
 let selectTopBtn = document.querySelector('.sel')
 let selectTerm = document.querySelectorAll('.sel_term')
 
 let count = 0;
 
 // 기간 선택 버튼 클릭시 나머지 li 오픈
 function openLi(){
     console.log('s_term_btn 버튼 클릭')
     
     for(let i=0; i<selectTerm.length; i++){
         selectTerm[i].classList.toggle('display_none')
     }
 }
 
 // 특정 개월 선택시 해당 개월 외 나머지 display none 처리
 function displayNon(selectedTerm){
     selectTopBtn.classList.add("display_none")
     
     for(let i=0; i<selectTerm.length; i++){
         selectTerm[i].classList.add("display_none")
         selectedTerm.classList.remove('display_none')
     }
 }
 
 // 특정 개월 한번 더 선택시 display_none 클래스 삭제
 function remove(){
    if(count==2){
         for(let i=0; i<selectTerm.length; i++){
             selectTerm[i].classList.remove('clicked')
             selectTerm[i].classList.remove('display_none')
         }
       count=0;
     }
 }
 
 selectTerm.forEach(function(e,index){
    
     selectTerm[index].addEventListener('click',function(){
         console.log('버튼 클릭' + selectTerm[index] )
         selectTerm[index].classList.add('clicked');
         
         let clickedBtn = document.querySelector('.clicked')
         console.log(`${clickedBtn.value} 개월 전 클릭함`)
         
         displayNon(selectTerm[index])
         count++
         remove()
         
         
     })
   
 })
 
 

 // 기간 변수
 let startDate = document.querySelector('.start_date')
 let endDate = document.querySelector('.end_date')
 
 // default start_date / end_date 오늘날짜로 세팅
 startDate.value = new Date().toISOString().substring(0, 10);
 endDate.value = new Date().toISOString().substring(0, 10);
 
 // default 시작일과 종료일은 당일 이후 선택 불가능 
 startDate.setAttribute("max", endDate.value)
 endDate.setAttribute("max", startDate.value)
 
 // 시작일을 종료일 보다 후로 설정 못하게 지정 
 startDate.addEventListener('change',function(){
    console.log('startdate 가 변경 되었습니다.')
    endDate.setAttribute("min", startDate.value)
 })

 // 종료일을 시작일보다 전으로 설정 못하게 지정 
 endDate.addEventListener('change',function(){
    console.log('endDate 가 변경 되었습니다.')
    startDate.setAttribute("max", endDate.value)
 })
 
 
 
 

