/**
 * 마이페이지 게시글 글자수 10자 이하일 경우 버튼 막기
 */
 console.log('boardContCnt!')
 $(()=>{
	let inputLength = 0
	
	$(".board-table_inputCont").keyup(function(){
		input = $(".board-table_inputCont").val()
		inputLength = input.length
		
		if(inputLength<10){
			$(".writeBtn").attr('id', 'disabled')
       		$(".writeBtn").attr('disabled',true)
		}else{
			$(".writeBtn").removeAttr('id')
       		$(".writeBtn").attr('disabled',false)
		}
	})
})
