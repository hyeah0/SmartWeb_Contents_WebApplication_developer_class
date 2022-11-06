<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>종로서적 비밀번호 확인</title>
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
        
        .member-info-div .mypage-cont_toptext{
            height: 100px;
        }

        .member-ck-pwd_table tr:nth-child(1){
            border-top: 2px solid var(--main-color);
        }

        .member-ck-pwd_table input{
            width: 400px;
        }
        
         .pwd_result{
            padding: 10px;
            font-size: 15px;
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
                         <!-- 회원정보 관리 -->
                         <div class="mypage-cont_toptext">
                             <h3>비밀번호 확인</h3>
                             <p>안전한 개인 정보를 위해 비밀번호르 입력해 주세요.</p>
                         </div>

                         <form class="mypage-form">
                         	<input type="hidden" class="mem_num" value="1">
                             <table class="mypage_table member-ck-pwd_table">
                                 <tr>
                                     <th>비밀번호</th>
                                     <td class="input_pwd_td">
                                        <input class="input_pwd" name="input_pwd" placeholder="비밀번호를 입력하세요.">
                                     	<h5 class="pwd_result none"></h5>
                                     </td>
                                 </tr>
                             </table>
                             <div class="mypage-form_btn">
                                 <input class="btn pwd_ck_btn" type="button" value="확인하기">
                             </div>
                         </form>  
                                                  
                     </div>
                     
				</div>
			</section>
			<!-- section-cont 끝 -->	    	
        <jsp:include page="/include/mypage/mypage_bottom.jsp"/>
        <jsp:include page="/include/main_bottom.jsp"/>
		<script type="text/javascript" src="js/mypageJs/pwdCkJs.js"></script>
</body>
</html>