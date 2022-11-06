<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>종로서적 문의하기</title>
    <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="source/img/logo_title.jpeg">
    <script src="https://kit.fontawesome.com/4338ad17fa.js" crossorigin="anonymous"></script> 
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/frame.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypageCss/mypageLayout.css">   
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypageCss/mypageForm.css">   
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypageCss/mypageBoard.css"> 
    <style>
        .board-table_type{
            border-top: 2px solid var(--main-color);
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
                        <h3>문의</h3>
                    </div>
                    
                    <!-- 콘텐츠 nav -->
                    <div class="mypage-cont_nav_divContainer">
                         <div class="mypage-cont_nav_div">
                             <div class="mypage-cont_nav_each">
                             	<a href="<%=request.getContextPath() %>/mypage_board_insert.do" class="active">문의 접수</a>
	                         </div>
	                         <div class="mypage-cont_nav_each">
	                             <a href="<%=request.getContextPath() %>/mypage_board_list.do">문의 내역</a>
	                         </div>
                         </div>
                         <div class="mypage-cont_nav_effect"></div>
                    </div>
                    
                    <!-- 콘텐츠 내용 -->
                    <div class="mypage_contents">
                    	
                    	<!-- 문의하기 폼 -->
                        <form class="mypage-form board-form" method="post" enctype="multipart/form-data" action="mypage_board_insert_ok.do">
                            <table class="mypage_table board-table">
                                <tbody class="board-table_tbody">
                                	
                                	<!-- 문의 유형 -->
                                    <tr class="board-table_type">
                                        <th class="must_th">문의유형</th>
                                        <td>
                                            <select name="board_cgy_num" required>
                                                <option value="c1">반품/교환/환불</option>
                                                <option value="c2">웹사이트 이용관련</option>
                                            </select>
                                        </td>
                                    </tr>
                                    
                                    <!-- 문의 제목 -->
                                    <tr class="board-table_title">
                                        <th rowspan="2" class="must_th">내용</th>
                                        <td>
                                            <input class="board-table_inputTitle" name="board_title" placeholder="제목을 입력해 주세요" required>
                                        </td>
                                    </tr>
                                    
                                    <!-- 문의 내용 -->
                                    <tr class="board-table_tr">
                                        <td>
                                        	<textarea class="board-table_inputCont" name="board_cont" id="" cols="50" rows="20" placeholder="빠른 답변을 위해 10자 이상의 문의내용을 입력해주세요." required></textarea>
                                        </td>
                                    </tr>
                                    
                                    <!-- 문의 사진 -->
                                    <tr class="board-table_file">
                                        <th>사진첨부</th>
                                        <td>
                                            <input class="board-table_inputFile" name="board_image" type="file">
                                        </td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                            
                            <!-- 작성 버튼 -->
                            <div class="mypage-form_btn">
                                <input class="btn" type="submit" value="작성">
                                <input class="btn" type="button" onclick="location.href='<%=request.getContextPath() %>/mypage_board_list.do'" value="취소">
                            </div>
                        </form>       
                    	
               		</div>
				</div>
			</section>
			<!-- section-cont 끝 -->	    	
        <jsp:include page="/include/mypage/mypage_bottom.jsp"/>
        <jsp:include page="/include/main_bottom.jsp"/>
</body>
</html>