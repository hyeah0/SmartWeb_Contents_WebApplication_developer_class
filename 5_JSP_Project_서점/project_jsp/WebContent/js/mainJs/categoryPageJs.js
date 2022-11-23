/**
 * 카테고리 페이지 
 * 누적판매순, 낮은가격순, 최신등록순 버튼 클릭, 앨범형.리스트형 클릭시 버튼 색상 변경
 */

// header.js 에 있음
// let nowURL = window.location.href
// let url = new URL(nowURL)
// let urlParams = url.searchParams
 
// 카테고리 페이지 -----------------------------------------------------------
let requestType = urlParams.get("requestType")	
let listType = urlParams.get("listType")	

let btnList = document.querySelectorAll(".book_pick .btn")
let listAlbumBtn = document.querySelectorAll(".layout_size_btn")

/* 누적판매순, 낮은가격순, 최신 등록순 버튼 클릭시 효과  */
if(requestType == "1" || requestType === "book_sales"){
	removeActiveClasses()
	btnList[0].classList.add('active')

	
}else if(requestType === "book_price"){
	removeActiveClasses()
	btnList[1].classList.add('active')
	
}else{
	removeActiveClasses()
	btnList[2].classList.add('active')
}

function removeActiveClasses(){
      btnList.forEach((bookPickBtn)=>{
          bookPickBtn.classList.remove('active')
      })
  }
  
/* 앨범형 리스트형 클릭시 텍스트 색상 변경 */
if(listType == "1"){
	removeLAActiveClasses()
	listAlbumBtn[0].classList.add('active')

}else{
	removeLAActiveClasses()
	listAlbumBtn[1].classList.add('active')
}


function removeLAActiveClasses(){
    listAlbumBtn.forEach((listAlbumBtn)=>{
        listAlbumBtn.classList.remove('active')
    })
}