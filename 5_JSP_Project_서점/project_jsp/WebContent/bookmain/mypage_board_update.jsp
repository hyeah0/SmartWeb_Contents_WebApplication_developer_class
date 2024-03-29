<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>종로서적 문의수정</title>
    <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="source/img/logo_title.jpeg">
    <script src="https://kit.fontawesome.com/4338ad17fa.js" crossorigin="anonymous"></script> 
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/frame.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypageCss/mypageLayout.css">   
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypageCss/mypageForm.css">   
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypageCss/mypageBoard.css"> 
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <style>
        .top{
            border-top: 2px solid var(--main-color);
        }
        .board-table_file td{
        	display: flex;
        	flex-direction: row;
        	justify-content: left;
        }
        
        .board-table_beFile_div{
        	width: 120px;
        	height: 220px;
			margin-left: 20px;
			padding : 10px;
			border-radius: 10px;
			background-color: var(--light-gray);
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			
		}
		
		.board-table_beFile_btn{
			padding: 5px;
		}
		
		.board-table_beFile_btn:hover{
			color : var(--hover-color);
		}

        .clicked{
            color : var(--hover-color);
        }

        .clicked_btn{
            opacity: 0.5;
        }
        
        #disabled{
            background-color: gray;
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
                        <form class="mypage-form board-form" method="post" enctype="multipart/form-data" action="mypage_board_update_ok.do">
                             <input type="hidden" name="board_num" value="${boardDto.getBoard_num() }">
                             <!-- 전에 첨부했던 이미지 삭제시 1, 기존 이미지 유지시 0 -->
                             <input type="hidden" name="board_beimage_result" class="board_beimage_result" value=0>
                             <table class="mypage_table board-table">
                                <tbody class="board-table_tbody">
                                	
                                	<!-- 문의 유형 -->
                                	<tr class="top">
                                		<th>게시글 번호</th>
                                		<td>${boardDto.getBoard_num() }</td>
                                		
                                		<c:if test="${empty boardDto.getBoard_update() }">
	                                		<th>작성일</th>
	                                		<td>${boardDto.getBoard_date() }</td>
                                		</c:if>
                                		<c:if test="${!empty boardDto.getBoard_update() }">
	                                		<th>작성일<br>수정일</th>
	                                		<td>${boardDto.getBoard_date() } <br> ${boardDto.getBoard_update() }</td>
                                		</c:if>
                                	</tr>
                                	
                                    <tr>
                                        <th>문의유형</th>
                                        <td class="tmp">
                                            ${boardDto.getBoard_cgy_name() }
                                        </td>
                                    </tr>
                            	</tbody>
                            </table>
                           
                            <table class="mypage_table board-table">
                                <tbody class="board-table_tbody">
                                	
                                    
                                    <!-- 문의 제목 -->
                                    <tr class="board-table_title">
                                        <th rowspan="2" class="must_th">내용</th>
                                        <td>
                                            <input class="board-table_inputTitle" name="board_title" value="${boardDto.getBoard_title() }">
                                        </td>
                                    </tr>
                                    
                                    <!-- 문의 내용 -->
                                    <tr class="board-table_tr">
                                        <td>
                                        	<textarea class="board-table_inputCont" name="board_cont" id="" cols="50" rows="20" minlength="10">${boardDto.getBoard_cont() }</textarea>
                                        </td>
                                    </tr>
                                    
                                    <!-- 문의 사진 -->
                                    <c:if test="${!empty boardDto.getBoard_image()}">
	                                    <tr class="board-table_file">
	                                        <th rowspan="2">사진첨부</th>
	                                        <td class="board-table_beFile">
	                                        	<div class="board-table_beFile_div">
		                                            <div class="board-table_beFile_div_img">
		                                            	 <img alt="첨부사진" name="board_beimage" src="<%=request.getContextPath() %>/boardUpload/${boardDto.getBoard_image() }" width ="100px" class="img">
		                                            </div>
		                                            <div class="btn board-table_beFile_btn" onclick="deleteImg()">
		                                            	<i class="fa-solid fa-trash"></i>
		                                            </div>
	                                            </div>
	                                        </td>
	                                    </tr>
	                                     <tr class="board-table_file">
		                                     <td class="board-table_newFile">
	                                            <input class="board-table_inputFile" name="board_newimage" type="file" disabled>
	                                         </td>    
                                    	</tr>
                                    </c:if>
                                    <c:if test="${empty boardDto.getBoard_image()}">
	                                    <tr class="board-table_file">
	                                    	<th>사진첨부</th>
	                                    	<td class="board-table_newFile">
	                                            <input class="board-table_inputFile" name="board_newimage" type="file">
	                                        </td>    
	                                    </tr>
                                    </c:if>
                                </tbody>
                            </table>
                            
                            <!-- 작성 버튼 -->
                            <div class="mypage-form_btn">
                                <input class="btn writeBtn" type="submit" value="수정">
                                <input class="btn" type="button" onclick="location.href='<%=request.getContextPath() %>/mypage_board_list.do'" value="취소">
                            </div>
                        </form>       
                    	
               		</div>
				</div>
			</section>
			<!-- section-cont 끝 -->	    	
        <jsp:include page="/include/mypage/mypage_bottom.jsp"/>
        <jsp:include page="/include/main_bottom.jsp"/>
         <script type="text/javascript" src="js/mypageJs/boardContCntJs.js"></script>	
       <script>
   			let count = 0;

   			document.querySelector(".board-table_beFile_btn")

	       function deleteImg(){
	           let button = document.querySelector(".board-table_beFile_btn")
	           let imgDiv = document.querySelector(".img")
	           let imgResult = document.querySelector(".board_beimage_result")
	           let imgNew = document.querySelector(".board-table_inputFile")
	           
	           if(count == 0 ){
	               count ++;
	               button.classList.add('clicked')
	               imgDiv.classList.add('clicked_btn')
	               imgResult.value = count
	               imgNew.removeAttribute("disabled",false) 
	               
	           }else{
	               button.classList.remove('clicked')
	               imgDiv.classList.remove('clicked_btn')
	               count = 0
	               imgResult.value = count
	               imgNew.setAttribute("disabled",true)
	           }
          
      		}
       </script>
</body>
</html>