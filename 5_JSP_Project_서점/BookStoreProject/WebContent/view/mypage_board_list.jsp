<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>종로서적 문의내역</title>
    <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="source/img/logo_title.jpeg">
    <script src="https://kit.fontawesome.com/4338ad17fa.js" crossorigin="anonymous"></script> 
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/frame.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypageCss/mypageLayout.css">   
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/pagingLayout.css">
    <style>
         .table_body tr{
            height: 80px;
        }
		.board_row{
			width: 50px;
		}

        .board_date{
            width: 250px;
        }

        .board_type{
            width: 250px;
        }

        .board_cont{
            width: 400px;
        }

        .board_tr td:not(.board_cont){
            text-align: center;
        }

        .board_tr td:nth-of-type(5) button:hover{
            color: var(--hover-color);
        }

        .board_tr a:hover{
            font-weight: bold;
            color: var(--hover-color);
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
                             <a href="<%=request.getContextPath() %>/mypage_board_list.do">문의 내역</a>
                         </div>
                     </div>
                     <div class="mypage-cont_nav_effect"></div>
                 </div>
                
                <!-- 콘텐츠 내용 -->
                <div class="mypage_contents">
                	 
                	<!-- 기간 설정 -->
                    <div class="mypage-cont_toptext">
                        <form action="" class="">
                            <select name="order_term" id="">
                                <option value="">2010.10.01 - 2010.11.02</option>
                            </select>
                            <button class="cont_form_btn">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </button>
                        </form>
                    </div>
                    
                    <!-- 문의 목록 -->
                   	<table class="mypage_table">
                       <thead class="table_head">
                           <tr class="table_head_tr">
                           	   <th class="board_row">row</th>
                               <th class="board_date">등록일</th>
                               <th class="board_type">문의유형</th>
                               <th class="board_cont">게시글</th>
                               <th class="board_delete">삭제</th>
                           </tr>
                       </thead>
                       <tbody class="table_body">
                       	   <c:set var="boardList" value="${boardList }"/>
                           
                           <c:if test="${empty boardList }" >
                           		<tr class="board_tr">
                           			<td colspan="5">게시글이 없습니다.</td>
                           		</tr>
                           </c:if> 
                           
                           <c:if test="${!empty boardList }">
                           		<!-- 최대 10개 가능 -->
                           		<c:forEach items="${boardList }" var="boardDto">
			                       <tr class="board_tr">
			                           <td> ${boardDto.getRow() }</td>
		                               <td>
		                                   <a href="<%=request.getContextPath() %>/mypage_board_cont.do?board_num=${boardDto.getBoard_num() }">
		                                   			   ${boardDto.getBoard_date() }
		                                   </a>
		                               </td>
		                               <td>
		                                   ${boardDto.getBoard_cgy_name() }
		                               </td>
		                               <td class="board_cont">
		                               		${boardDto.getBoard_title() }
		                               </td>
		                               <td>
		                                   <button class="btn" onclick="location.href='<%=request.getContextPath() %>/mypage_board_delete.do?board_num=${boardDto.getBoard_num() }'">
		                                       <i class="fa-solid fa-trash"></i>
		                                   </button>
		                               </td>
	                               </tr> 
                               </c:forEach>
                           </c:if> 
                           
                       </tbody>
                   </table>                        
               </div>
                
               <!-- 페이징 -->
               <jsp:include page="../include/mypage/mypage_paging.jsp"/>
           
        	</div>
		</section>
		<!-- section-cont 끝 -->	    	
   	<jsp:include page="/include/mypage/mypage_bottom.jsp"/>
    <jsp:include page="/include/main_bottom.jsp"/>
</body>
</html>