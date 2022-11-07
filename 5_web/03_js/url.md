- 현재 페이지 url : window.location.href
- 전체 쿼리스트링 : window.location.search
```
// 현재 url
let nowURL = window.location.href

// 현재 url에서 category인 파라미터 값을 받아 온다. ==> ?category=n001 >> noo1
let url = new URL(nowURL)
let urlParams = url.searchParams
let category = urlParams.get("category")	


let cgy = ["all","N004","N003","N002","N001"]
let navA = document.querySelectorAll(".nav_a")
console.log(`navA[1] : ${navA[1]}`)
console.log(`cgy[1] : ${cgy[1]}`)

if(category === cgy[0]){
	removeActiveClassesNav()
	navA[0].classList.add('active')
}else if(category === cgy[1]){
	removeActiveClassesNav()
	navA[1].classList.add('active')
}else if(category === cgy[2]){
	removeActiveClassesNav()
	navA[2].classList.add('active')
}else if(category === cgy[3]){
	removeActiveClassesNav()
	navA[3].classList.add('active')
}else if(category === cgy[4]){
	removeActiveClassesNav()
	navA[4].classList.add('active')
}


function removeActiveClassesNav(){
      navA.forEach((nav)=>{
          nav.classList.remove('active')
      })
  }


```
