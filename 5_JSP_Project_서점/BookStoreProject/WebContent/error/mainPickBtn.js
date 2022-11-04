/**
 * <button id="book_sales">누적 판매순</button>
    <button id="book_cheap">낮은 가격순</button>
    <button id="book_recent">최신 등록순</button>
 */
 $(()=>{
	$.ajaxSetup({
		ContentType : "application/x-www-form-urlencorded;charset=UTF-8"
	})
	
	$("#book_sales").on("click",()=>{
		
		$.ajax({
				url : "/BookStoreProject/main_getBookSales.do",
				data : {requestType : "book_sales" },
				datatype : "text",
				success : function(pickList){
					alert("데이터 가져왔습니다!");
					const json = JSON.stringify(pickList);
					alert(json);
				},
				error : ()=>{alert('데이터를 가져오지 못했습니다.')}
		})
	})
})