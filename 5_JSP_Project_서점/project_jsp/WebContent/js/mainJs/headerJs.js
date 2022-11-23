/**
 * 헤더 카테고리 nav 클릭시 색상 변경
 */
 let nowURL = window.location.href

let url = new URL(nowURL)
let urlParams = url.searchParams
let category = urlParams.get("category")	

// html category nav들
let navA = document.querySelectorAll(".nav_a")
// html category nav의 id 값을 배열로 받아옴
let navAArr = new Array();

navA.forEach(function(ele,index){
	navAArr.push(ele.getAttribute('id'))
	
	if(category == null){
		navA[0].classList.remove('active')
		
	}else if(category === "all"){
		removeActiveClassesNav()
		navA[0].classList.add('active')
		
	}else if(category === navAArr[index]){
		removeActiveClassesNav()
		navA[index].classList.add('active')
	}
	
})

function removeActiveClassesNav(){
      navA.forEach((nav)=>{
          nav.classList.remove('active')
      })
  }


