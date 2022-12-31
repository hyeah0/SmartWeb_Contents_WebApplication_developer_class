<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link href="<%=request.getContextPath()%>/resources/css/admin_board.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.easing/1.3/jquery.easing.1.3.js"></script>
<script type="text/javascript">
// 탭 두개 콘텐츠 값 다르게 보여주는 함수.
$(document).ready(function(){
	   
	  $('ul.tabs li').click(function(){
	    var tab_id = $(this).attr('data-tab');
	 
	    $('ul.tabs li').removeClass('current');
	    $('.tab-content').removeClass('current');
	 
	    $(this).addClass('current');
	    $("#"+tab_id).addClass('current');
	  });

});
</script>
<style type="text/css">
	/* 탭 메뉴 */
	ul.tabs{
	  margin: 0px;
	  padding: 0px;
	  list-style: none;
	}
	
	/* 탭 메뉴 글 */
	ul.tabs li{
	  background: none;
	  color: #222;
	  display: inline-block;
	  padding: 10px 15px;
	  cursor: pointer;
	  font-size: 15px;
	}	
	
	ul.tabs li.current{
	  /* background: #F4E9DC; */
	  color: #734338;
	  font-weight: bold;
	  border-radius: 0px 0px 0px 0px;
	  border-bottom: 3px solid #734338;
	}
	
	/* 탭 콘텐츠 영역 */
	.tab-content{
	  display: none;  
	  padding: 15px 0;
	}
	
	.tab-content.current{
	  display: inherit;
	}
	
	.tqtq{
		width: 20% !important;
	}
	
.c_name{	
		text-align: left;
		width: 40%
	}
	
#fin_a{
		width: 80px;
		height: 25px; 
		border-radius: 5px;
		border: none;
		background-color: #2E9E02;
		color: white;
	}
	#fin_b{
		width: 95px;
		height: 25px; 
		border-radius: 5px;
		border: none;
		background-color: #FF2727;
		color: white;
	}
	
	
.tqtqtqtq{
width: 140px !important;
}	

    table.table tr th, table.table tr td {
		padding: 12px 15px;
		vertical-align: middle;
    }
    
    table.table tr:hover{
    	background-color: #E6DBCD;
    }
    
 	.table{
		width: 95%;
	}  
	.table_box{
		margin-top: 3%;
	}
	
	.empty1{
		margin-left: 23%;
	}		
	tr{
		text-align: center;
	}	 
</style>
</head>
<body>
<jsp:include page="../layout/Admin_header2.jsp"  /> 

<c:set var="paging" value="${Paging }" />


<div class="empty1">
		<div class="table_box">
			<h2><b>고객센터</b></h2>
	 			
	 			<br><br>
				
		 		<ul id="tabs" class="tabs">
			    <li class="tab-link current" data-tab="tab1">답변 미완료</li>
				 <li class="tab-link" data-tab="tab2">답변 완료</li>	    
			  </ul>	 	
			  
			  	<div id="tab1" class="tab-content current">	
			  	<div style="display: flex;">	
			  	<h6 style="margin-bottom: 0; margin-top: 30px;"><b>답변 관리</b></h6>
			  	</div>
			  	<hr id="hr1" width="95%">		  		
		 		 <br>
		 		 	<table class="table">
		 			<tr style="pointer-events: none;" >
		 				<th>글번호</th>
		 				<th class="c_name">글제목</th>
		 				<th>작성일</th>
		 				<th>글작성자</th>
		 				<th>답변여부</th>
		 			</tr>
		 			<c:set value="${boardList }" var="board_List" />
  		 					<c:if test="${!empty board_List}">
				 				<c:forEach items="${board_List}" var="dto">
				 					<c:if test="${dto.getBoard_reply() == 0 }">
			 						<tr onclick="location.href='adminboard_cont.do?num=${dto.getBoard_num()}&page=${paging.getPage()}'">
			 						
					 					<td>${dto.getBoard_num() } </td>
					 					<td class="c_name">${dto.getBoard_title() } </td>
					 					<td>${dto.getBoard_date() } </td>
					 					<td>${dto.getMember_id() } </td>
					 					<td>
								 				
											<c:if test="${dto.getBoard_reply() eq '0' }">
												<button id="fin_b">답변대기중</button>
											</c:if>   
									  </td>
					 					
					 				</tr>
					 				
				 					</c:if>
					 				
				 				</c:forEach>
		 					</c:if>	   		
		 			</table>
		 			
		 			
			  	</div>
			  	
			  	
			  		<div id="tab2" class="tab-content">
				  	<div style="display: flex;">	
				  	<h6 style="margin-bottom: 0; margin-top: 30px;"><b>답변 관리</b></h6>
				  	</div>			  		
			  		<hr id="hr1" width="95%">
			  			<table class="table">
		 			<tr style="pointer-events: none;">
		 				<th>글번호</th>
		 				<th class="c_name">글제목</th>
		 				<th>작성일</th>
		 				<th>글작성자</th>
		 				<th>답변여부</th>
		 			</tr>
		 			<c:set value="${boardList }" var="board_List" />
  		 					<c:if test="${!empty board_List}">
				 				<c:forEach items="${board_List}" var="dto">
				 					<c:if test="${dto.getBoard_reply() == 1 }">
			 						<tr onclick="location.href='adminboardgreen_cont.do?num=${dto.getBoard_num()}&page=${paging.getPage()}'">
					 					<td>${dto.getBoard_num() } </td>
					 					<td class="c_name">${dto.getBoard_title() } </td>
					 					<td>${dto.getBoard_date() } </td>
					 					<td>${dto.getMember_id() } </td>
					 					<td>
								 				
											<c:if test="${dto.getBoard_reply() eq '1' }">
												<button id="fin_a">답변완료!</button>
											</c:if>   
									  </td>
					 				
					 				</tr>
				 					</c:if>
					 				
				 				</c:forEach>
		 					</c:if>	   		
		 			</table>
	  		</div>
	  	</div>			
</div>
</body>
</html>