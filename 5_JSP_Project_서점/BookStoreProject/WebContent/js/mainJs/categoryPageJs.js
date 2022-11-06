 console.log('카테고리 페이지 js')

/* 누적판매순, 낮은가격순, 최신 등록순 버튼 클릭시 효과  */
 let btnList = document.querySelectorAll(".book_pick .btn")
 
 btnList.forEach((bookPickBtn) => {
    bookPickBtn.addEventListener('click',()=>{
        removeActiveClasses()
        bookPickBtn.classList.add('active')
    })
})

function removeActiveClasses(){
    btnList.forEach((bookPickBtn)=>{
        bookPickBtn.classList.remove('active')
    })
}

/* 앨범형,리스트형 클릭시 */
let listAlbumBtn = document.querySelectorAll(".layout_size_btn")

listAlbumBtn.forEach((listAlbumBtn) => {
    listAlbumBtn.addEventListener('click',()=>{
        removeLAActiveClasses()
        listAlbumBtn.classList.add('active')
    })
})

function removeLAActiveClasses(){
    listAlbumBtn.forEach((listAlbumBtn)=>{
        listAlbumBtn.classList.remove('active')
    })
}