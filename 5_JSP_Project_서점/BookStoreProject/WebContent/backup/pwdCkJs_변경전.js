/**
 * 
 */
 console.log('pwdCkJs 연결 완료!')
 
 $(()=>{
	
	$(".pwd_ck_btn").on('click', ()=>{
	
		console.log('버튼 눌림!')
		
		$.ajax({
			type : "post",
			url : "/BookStoreProject/mypage_member_update_ck_pwd.do",
			data : {input_pwd : $(".input_pwd").val()},
			datatype : "jsp",
			success : function(result){
				
				if(result == -1){
					let warningTxt = '<h5 class="pwd_result" style="color: red" ><i class="fa-solid fa-circle-exclamation"></i> &nbsp;비밀번호가 다릅니다.</h5>';
					
					$(".pwd_result").removeClass('none')
					$(".pwd_result").html(warningTxt);
					$(".input_pwd").val('').focus();
					
				}else{
					$(".pwd_result").addClass('none')
					$(".mypage-form").html('<input type="hidden" name="mem_num" value="1">')
					$(location).attr("href", "/BookStoreProject/mypage_member_update.do")
				}
				
			},
			error : function(result){ alert("데이터 통신 오류입니다.") }			
			
		})
		
	})
	
	
})