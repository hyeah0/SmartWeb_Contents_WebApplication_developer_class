/**
 * 메인페이지 종로 pick 비동기 처리
 */

$(function(){
	
	/** 
	    메인페이지 종로 pick 버튼 
	    누적판매순, 낮은가격순, 최신 등록순 버튼 클릭
	*/
	let requestType = ""
	
	$(".requestType").each(function(index, obj){
			
			$(this).on('click',()=>{
	
				// 클릭된 index에 따라 requestType 값 변경
				console.log(`${index} 번 클릭`)
				$(".requestType").removeClass('active')
				
				if(index==0){
					requestType = 'book_sales'
					
				}else if(index==1){
					requestType = 'book_price'
					
				}else{
					requestType= 'book_recent'
					
				}
				
				console.log(`requestType : ${requestType}`)
				$(this).addClass('active')
				
				getData();
				
			})	
	})
	
	/** 데이터 가져오는 함수 */
	function getData(){
		
		  /** ajax 공통 속성 */
	      $.ajaxSetup({
       			ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
				type: "post"
			})
		
			$.ajax({
					url : "/project_jsp/main_store_pick.do",
					data : {requestType : requestType},
					datatype : "xml",
					success : function(bookPickStr){
						
							let books = "";
							books += '<div class="center_books_div">';
							/** book을 찾아 book 이 없을때 까지 반복 */
							$(bookPickStr).find("book").each(function(){
							  
							  books += '<div class="booklist">';
							  books += '<a href="/project_jsp/book_detail.do?book_num=' + $(this).find("book_num").text() + '">';
						      books += '<div class="booklist_imgArea">';
							  books += '<img src="/project_jsp/book_cover/'+ $(this).find("book_img").text() + '">';
						      books += '</div>';
							  books += '<div class="booklist_cont">';
							  books += '<h3>' + $(this).find("book_name").text() + '</h3>';
							  books += '<p>';
							  books += $(this).find("book_price").text().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,') + ' 원';
							  books += '</p>';
							  books += '</div>';
							  books += '</a>';
					          books += '</div>';
							  
							
							$('.pick_div').addClass('none')
							$('.pick').html(books)
							}) /** each 끝 */
							books += '</div>'
					},/** success function 끝 */
					error: function(){alert('데이터 통신 오류입니다.')}
				})/** ajax 끝 */
	}
	
})
	
