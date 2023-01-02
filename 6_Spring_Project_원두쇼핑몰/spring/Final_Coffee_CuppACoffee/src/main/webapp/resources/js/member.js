
/******************************/
/*******  로그인      ***********/
/******************************/



// 로그인 모달 팝업 
$('.login-pop').click(function(){
    $('.log-modal').fadeIn()
});

// 로그인 모달 팝업 닫기
$('.icon-close').click(function(){
    $('.log-modal').fadeOut()
    
});


//영역 밖 클릭 시 로그인 모달 창 꺼짐
$(document).on('click', function(e){
    if($('.log-modal').is(e.target)) {
     $('.log-modal').css({
         display:"none"
     });
    }
 });
 

// 회원가입 버튼 클릭 시 회원가입 모달 팝업
$('.mf-join').click(function() {
    $('.join-modal').fadeIn()
});


/******************************/
/*******  계정찾기    ***********/
/******************************/


// 게정 분실 버튼 클릭 시 계정 분실 모달 팝업 
$('.mf-find').click(function(){
    $('.find-modal').fadeIn()
});

// 계정찾기 모달 닫기
$('#fd-close').click(function(){
    $('.find-modal').fadeOut()
});

//영역 밖 클릭 시 계정찾기 모달 창 꺼짐
$(document).on('click', function(e){
    if($('.find-modal').is(e.target)) {
     $('.find-modal').css({
         display:"none"
     });
    }
 });


// 라디오버튼 선택 시 input 양식 변경 

$(function(){
    $('.find-modal .fd-select ')
});

/******************************/
/******* 회원가입     ***********/
/******************************/


// 회원가입 모달 팝업 
$('.join-pop').click(function(){
    $('.join-modal').fadeIn()
});

$('.icon-close').click(function(){
    $('.join-modal').fadeOut()
});


// 아이디 정규식 확인


$("#join-id").keyup(function(){

    let joinId = $("#join-id").val();
    let id_pattern = /^[a-zA-Z0-9]{6,}$/;
    let id_length = joinId.length;

    console.log("dddd"+joinId);

    $.ajax({
        url: "<%=request.getContextPath()%>/member_Id_check.do",
        type: "post",
        data: {
            member_id: joinId
        },
        success: function(result) {
            if (result==1) {
                $("#id-error").html("이미 사용 중인 아이디입니다.");
                $("#jf-btn").attr("disabled", "disabled");
            } else {
                $("#id-error").html("사용 가능한 아이디입니다.");
            }
        }
    });
  
});





// // 이메일 정규식 확인
// $("#join-email").on("input", function(){
//     let joinEmail = $("#join-email").val();
//     let email_pattern = /^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$/;
    
//     if(!email_pattern.test(joinEmail)) {
//         $(".email-error").show();

//     } else {
//         $(".email-error").hide();
//         $.ajax({
//             url: "<%=request.getContextPath()%>/member_login_check.do",
//             data: { paramId : "joinEmail "},
//             type: "get",
//             success : function(result) {
//                 if(result>0) {
//                     $("#join-email").show.html("사용할 수 없는 아이디입니다."); 
//                 } else {
//                     $("join-email").show.html("사용 가능한 아이디입니다.");
//                 }
//             }, error : function() {
//                 alert("에러가 발생했습니다.");
//             }
//         });
//     } 


// 회원가입 약관 전체 동의시 전체 checked 

$('#check-all').on('click', function() {
    var checked = $(this).is(':checked');

    if(checked){
        $(this).closest('.join-agr').find('input').prop('checked', true); 
    }else {
        $(this).closest('.join-agr').find('input').prop('checked', false);
    }
});



//영역 밖 클릭 시 회원가입 모달 창 꺼짐

$(document).on('click', function(e){
   if($('.join-modal').is(e.target)) {
    $('.join-modal').css({
        display:"none"
    });
}

});
