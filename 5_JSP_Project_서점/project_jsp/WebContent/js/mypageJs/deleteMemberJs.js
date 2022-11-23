/**
 * 체크박스 모두 선택해야 삭제 가능
 */
 console.log('deleteMemberjs!')

$(function(){
   
    $(".deleteOk").attr('disabled',true)
    $(".deleteOk").css('backgroundColor','gray')

    $(".deleteCheck").on('click',function(){
		let cnt = 0;  /** 두개 다 체크 */
        $(".deleteCheck").each(function(){
           
            // 체크 되었는지 확인
            let checkedVal = $(this).is(":checked")
            if(checkedVal == true){
                cnt++
                console.log(cnt)
            }else{
                cnt--
                console.log(cnt)
            }

            if(cnt==2){
                $(".deleteOk").attr('disabled',false)
                $(".deleteOk").css('backgroundColor','var(--main-color)')
                $(".deleteOk").mouseover(function(){
					$(".deleteOk").css('backgroundColor','var(--hover-color)')
				})
				$(".deleteOk").mouseout(function(){
						$(".deleteOk").css('backgroundColor','var(--main-color)')	
				})
            }else{
				$(".deleteOk").attr('disabled',true)
    			$(".deleteOk").css('backgroundColor','gray')
			}
        })
    })

})