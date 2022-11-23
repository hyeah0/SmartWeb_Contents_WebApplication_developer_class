<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="source/img/logo_title.jpeg">
    <script src="https://kit.fontawesome.com/4338ad17fa.js" crossorigin="anonymous"></script> 
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/frame.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypageCss/mypageLayout.css">   
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypageCss/mypageForm.css">   
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypageCss/mypageBoard.css"> 
    <title>종로서적 문의상세</title>
    <style>
        .top{
            border-top: 2px solid var(--main-color);
        }
        
        .board-table_tbody td{
        	display: flex;
        	flex-direction: row;
        	justify-content: left;
        	align-items: flex-start;
        }
        
        .board-table_title td{
        	font-weight: bold;
        }
        
        .board-table_tr td{
        	height: 400px;
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
                             	<a href="<%=request.getContextPath() %>/mypage_board_insert.do">문의 접수</a>
	                         </div>
	                         <div class="mypage-cont_nav_each">
	                             <a href="<%=request.getContextPath() %>/mypage_board_list.do" class="active">문의 내역</a>
	                         </div>
                         </div>
                         <div class="mypage-cont_nav_effect"></div>
                    </div>
                    
                    <!-- 콘텐츠 내용 -->
                    <div class="mypage_contents">
                    	
                    	<!-- 문의하기 폼 -->
                        <div class="mypage-form board-form">
                            <table class="mypage_table board-table">
                                <tbody class="board-table_tbody">
                                	
                                	<!-- 문의 유형 -->
                                	<tr class="top">
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
                                        <td class="tmp" colspan="3" >
                                            ${boardDto.getBoard_cgy_name() }
                                        </td>
                                    </tr>
                            	</tbody>
                            </table>
                            <table class="mypage_table board-table"> 
                            	<tbody class="board-table_tbody">    
                                    <!-- 문의 제목 -->
                                    <tr class="board-table_title">
                                        <th rowspan="2">내용</th>
                                        <td>
                                        	${boardDto.getBoard_title() }
                                        </td>
                                    </tr>
                                    
                                    <!-- 문의 내용 -->
                                    <tr class="board-table_tr">
                                        <td>
                                        	${boardDto.getBoard_cont() }
                                        </td>
                                    </tr>
                                    
                                    <!-- 문의 사진 -->
                                    <tr class="board-table_file">
                                        <th>사진첨부</th>
                                        <c:if test="${empty boardDto.getBoard_image() }">
                                        	 <td class="non_img"><p>첨부이미지가 없습니다.</p></td>
                                        </c:if>
                                        <c:if test="${!empty boardDto.getBoard_image() }">
	                                        <td>
	                                            <img alt="첨부사진" src="<%=request.getContextPath() %>/boardUpload/${boardDto.getBoard_image() }" width ="100px">
	                                        </td>
                                        </c:if>
                                    </tr>
                                    
                                </tbody>
                            </table>
                            
                            <!-- 작성 버튼 -->
                            <div class="mypage-form_btn">
                                  <input class="btn" type="button" onclick="location.href='<%=request.getContextPath() %>/mypage_board_cont.do?board_num=${boardDto.getBoard_num()}&update=1'" value="수정">
                                  <input class="btn" type="button" onclick="location.href='<%=request.getContextPath() %>/mypage_board_delete.do?board_num=${boardDto.getBoard_num()}'" value="삭제">
                                  <input class="btn" type="button" onclick="location.href='<%=request.getContextPath() %>/mypage_board_list.do'" value="문의내역">
                            </div>
                        </div>       
                    	
               		</div>
				</div>
			</section>
			<!-- section-cont 끝 -->	    	
        <jsp:include page="/include/mypage/mypage_bottom.jsp"/>
        <jsp:include page="/include/main_bottom.jsp"/>
        
</body>
</html>