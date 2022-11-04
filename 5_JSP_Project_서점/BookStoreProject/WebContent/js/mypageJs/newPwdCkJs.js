/**
 * 비밀번호 변경시 새로 입력한 비밀번호와 비밀번호 확인 입력한 것 비교
 */
 
$(()=>{
	
	let newInputPwd = 0;
	let newInputPwdCk = 0;
	let cnt = 1;
	
	$(".changePwd").click(()=>{
		cnt ++
		
		if(cnt%2 ==0){
			$('.input_newPwd_tr').removeClass('none')
			$(".changePwd").css('backgroundColor', 'var(--main-color)')
			$(".changePwd").css('color', 'white')
		}else{
			$('.input_newPwd_tr').addClass('none')
			$(".changePwd").css('backgroundColor', 'white')
			$(".changePwd").css('color', 'black')
		}
	})
	
	$(".input_newPwd").on('keyup', ()=>{
	
		newInputPwd = $(".input_newPwd").val().trim();
			
		// 비밀번호가 공란이거나, 4자 이하일 경우
		if(newInputPwd.length <=0 || newInputPwd.length < 4){
			
			let alert_length = '<p class="alert_length" style="color: red"><i class="fa-solid fa-circle-exclamation"></i> &nbsp;4자리 이상 문자 입력해주세요.</p>'
			$(".alert_length").html(alert_length)
			$(".input_newpwd").focus()
			
			// 조건에 맞지 않으면 새 비밀번호 확인 창, 버튼은 작성, 누를 수 없다.
			$(".input_newPwd_ck").attr('disabled',true)
			$(".input_newPwd_ck").css('backgroundColor', 'gray')
			$(".mem-info-ch_btn").attr('disabled', true)
			$(".mem-info-ch_btn").css('backgroundColor', 'gray')
		
		// 비밀번호가 4자 이상일경우
		}else{
			let alert_length = '<p class="alert_length" style="color: green">사용가능 합니다.</p>'
			$(".alert_length").html(alert_length)
			$(".input_newpwd").focus()
			
			// 조건에 맞으면 새 비밀번호 확인 창 입력 가능하다.
			$(".input_newPwd_ck").attr('disabled',false)
			$(".input_newPwd_ck").css('backgroundColor', 'var(--light-gray)')
		}
		
		if(newInputPwd !=newInputPwdCk){
			let alert_length = '<p class="alert_length" style="color: red"><i class="fa-solid fa-circle-exclamation"></i> &nbsp;비밀번호를 확인 해 주세요.</p>'
			$(".alert_length").html(alert_length)
			
			let alert_ck = '<p class="alert_ck" style="color: red"><i class="fa-solid fa-circle-exclamation"></i> &nbsp;비밀번호가 일치하지 않습니다.</p>'
			$('.alert_ck').html(alert_ck)
			
			$(".mem-info-ch_btn").attr('disabled', true)
			$(".mem-info-ch_btn").css('backgroundColor', 'gray')
		}
	})
	
	$(".input_newPwd_ck").on('keyup',()=>{
		newInputPwdCk = $('.input_newPwd_ck').val().trim();
		
		// 새비밀번호 확인 부분에 입력시에 비밀번호 변경 버튼이 잠긴다.
		$(".changePwd").off('click')
		$(".changePwd").css('backgroundColor', 'gray')
		
		// 새 비밀번호 와, 새 비밀번호 확인이 다를경우
		if(newInputPwd != newInputPwdCk || newInputPwdCk != newInputPwd){
			$('.alert_ck').removeClass('none')
			let alert_length = '<p class="alert_length" style="color: red"><i class="fa-solid fa-circle-exclamation"></i> &nbsp;비밀번호를 확인 해 주세요.</p>'
			$(".alert_length").html(alert_length)
			
			let alert_ck = '<p class="alert_ck" style="color: red"><i class="fa-solid fa-circle-exclamation"></i> &nbsp;비밀번호가 일치하지 않습니다.</p>'
			$('.alert_ck').html(alert_ck)
			
			$(".mem-info-ch_btn").attr('disabled', true)
			$(".mem-info-ch_btn").css('backgroundColor', 'gray')
		
		// 새 비밀번호 와, 새 비밀번호 확인이 같은경우
		}else if(newInputPwd == newInputPwdCk){
			console.log('같다!')
			let alert_ck = '<p class="alert_ck" style="color: green">비밀번호가 일치합니다.</p>'
			$('.alert_ck').removeClass('none')
			$('.alert_ck').html(alert_ck)
			
			
			let alert_length = '<p class="alert_length" style="color: green">사용가능 합니다.</p>'
			$(".alert_length").html(alert_length)
			
			$(".mem-info-ch_btn").attr('disabled', false)
			$(".mem-info-ch_btn").css('backgroundColor', 'var(--main-color)')
		}
		
	})
	
	
	
	
})