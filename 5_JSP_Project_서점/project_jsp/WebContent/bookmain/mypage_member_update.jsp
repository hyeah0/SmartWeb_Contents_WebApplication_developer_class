<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>종로서적 회원정보 수정</title>
    <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="source/img/logo_title.jpeg">
    <script src="https://kit.fontawesome.com/4338ad17fa.js" crossorigin="anonymous"></script> 
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/frame.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypageCss/mypageLayout.css">   
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypageCss/mypageForm.css">   
    <style>
         tr{
            height: 80px;
        }
        
        .info_form_tr{
            border-top: 2px solid var(--main-color);
            height: 80px;
        }
        
         /* 수량입력시 수량조절 버튼 제거 */
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        
         .chBtn{
            margin: 0px;
            width: 160.48px;
            font-size: 15px;
            border: 2px solid var(--main-color);
            border-radius: 10px;
            transition: 0.4s ease-in-out; 
        }
        
        .chBtn:hover{
        	background-color: var(--main-color);
        	color : white;
        }
        
        #input_addr{
        	width: 700px;
        	padding: 10px;
		    border: none;
		    outline: none;
		    font-size: 15px;
		    border-radius: 10px;
		    background-color: white;
        }
        
         .activeBtn{
        	background-color: var(--main-color);
        	color: white;
        }
        
        .delete_member{
            font-size: 13px;
            color: gray;
        }
        
        .delete_member p{
            padding-left: 50px;
            padding-right: 50px;
            font
        }

        .delete_member_btn{
            border: 1.5px solid gray;
            padding: 3px 5px 3px 5px;
            border-radius: 10px;
        }
        
        .delete_member_btn:hover{
            background-color: var(--main-color);
            color: white;
        }
    </style> 
</head>
<body>

	<jsp:include page="/include/main_top.jsp"/>

	<!-- content : nav, content -->
	<jsp:include page="/include/mypage/mypage_detail_nav.jsp"/>
		
		<section id="section-cont">
            <div class="mypage-cont">
            
            	<!-- 콘텐츠 타입 -->
                <div class="mypage-cont_toptext">
                    <h3>회원정보</h3>
                </div>
                
                <!-- 콘텐츠 nav -->
                <div class="mypage-cont_nav_divContainer">
                     <div class="mypage-cont_nav_div">
                         <div class="mypage-cont_nav_each">
                             <a href="#" class="active">회원정보 관리</a>
                         </div>
                     </div>
                     <div class="mypage-cont_nav_effect"></div>
                 </div>
                
                 <!-- 콘텐츠 내용 -->
                 <div class="mypage_contents member-info-div">
                      
                      <!-- 회원정보 수정 -->
                      <div class="mypage-cont_toptext">
                          <h3>회원정보 수정</h3>
                      </div>

					  <c:set var="memDto" value="${memDto }" />
					  
                      <form class="mypage-form member-info_form" method="post" action="<%=request.getContextPath()%>/mypage_member_update_ok.do">
                      	 <input type="hidden" name="mem_num" value="${memDto.getMem_num() }">
                      	
                          <table class="mypage_table">
                              <tr class="info_form_tr">
                                  <th>아이디</th>
                                  <td>${memDto.getMem_id() } </td>
                              </tr>
                              <tr class="newPwd">
                                  <th> - </th>
                                  <td class="newPwd_td">
                                      <span class="btn chBtn changePwd">비밀번호 변경 &nbsp;<i class="fa-solid fa-caret-down"></i></span>
                                  </td>
                              </tr>
                              <tr class="input_newPwd_tr none">
                                  <th>새 비밀번호</th>
                                  <td>
                                      <input type="password" class="input_newPwd" name="input_newPwd" value="">
                                      <p class="alert_length">4자리 이상 문자 사용가능합니다.</p>
                                  </td>
                              </tr>
                              <tr class="input_newPwd_tr none">
                                  <th>새 비밀번호 확인</th>
                                  <td>
                                      <input type="password" class="input_newPwd_ck" name="input_newPwd_ck" value="">
                                      <p class="alert_ck none">비밀번호가 일치하지 않습니다.</p>
                                  </td>
                              </tr>
                              
                          </table>
                          
                          <table class="mypage_table">
                              <tr>
                                  <th>이름</th>
                                  <td>
                                      <input type="text" name="input_name" value="${memDto.getMem_name() }">
                                  </td>
                              </tr>
                              <tr>
                                  <th>이메일</th>
                                  <td>
                                      <input type="email" name="input_mail" value="${memDto.getMem_mail() }">
                                  </td>
                              </tr>
                              <tr>
                                  <th>휴대폰번호</th>
                                  <td>
                                      <input type="number" name="input_phone1" value="${memDto.getMem_phone().substring(0,3) }">
                                      <span> - </span>
                                      <input type="number" name="input_phone2" value="${memDto.getMem_phone().substring(4,8) }">
                                      <span> - </span>
                                      <input type="number" name="input_phone3" value="${memDto.getMem_phone().substring(9,13) }">
                                  </td>
                              </tr>
                              <tr>
                                  <th rowspan="2">주소</th>
                                  <td>
                                      <button type="button" class="btn chBtn addrBtn" onclick="goPopup();" >주소 재입력</button>
                                  </td>
                              </tr>
                              <tr>
                              	<td> 
                              		<input type="text" id="input_addr" class="input_addr" name="input_addr" value="${memDto.getMem_addr() }">
                              	</td>
                              </tr>
                              <tr>
                                 <td class="delete_member" colspan="2">
                                     <p>회원 탈퇴를 희망하시나요? <a class="btn delete_member_btn" href="<%=request.getContextPath()%>/mypage_member_delete.do">회원탈퇴 &gt; </a> </p>
                                 </td>
                              </tr>
                          </table>
                          
                          <div class="mypage-form_btn">
                              <input class="btn mem-info-ch_btn" type="submit" value="변경">
                              <button class="btn" onclick="history.back()"> 취소</button>
                          </div>

                      </form> 
                  </div>
        	</div>
		</section>
		<!-- section-cont 끝 -->	    	
   	<jsp:include page="/include/mypage/mypage_bottom.jsp"/>
    <jsp:include page="/include/main_bottom.jsp"/>
    
	<script type="text/javascript" src="js/mypageJs/newPwdCkJs.js"></script>
	<script>

		// 주소 창 팝업
		function goPopup(){
			document.querySelector(".addrBtn").classList.add('activeBtn')
			let pop = window.open("<%=request.getContextPath() %>/bookmain/mypage_jusoPopUp.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		}
		
		function jusoCallBack(roadFullAddr){
				document.querySelector(".addrBtn").classList.remove('activeBtn')
				let inputAddr = document.querySelector(".input_addr")
				inputAddr.value = roadFullAddr;
				inputAddr.setAttribute('value',roadFullAddr);
		}

	</script>
</body>
</html>