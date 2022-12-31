<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style type="text/css">

	.empty1{
		margin-left: 23%;
	}
	
	.table{
		width: 95%;
	}	

	.table_box{
		margin-top: 3%;
	}

	/* 페이징 버튼 디자인 */
	.page1{
		margin-left: 33%;
	}

	.pagination{
		color: #000;
	}
	.pagination li a:hover {
       	color: #666;
    }	
    .pagination li.active a, .pagination li.active a.page-link {
        background: #d9cec1;
        color: #000;
    }
    .pagination li.active a:hover {        
        background: #A66B56;
        color: #fff;
    }
	.pagination li.disabled i {
        color: #000;
    }
     .pagination li a {
	     border: none;
	     font-size: 13px;
	     min-width: 30px;
	     min-height: 30px;
	     color: #000;
	     margin: 0 2px;
	     line-height: 30px;
	     border-radius: 2px !important;
	     text-align: center;
	     padding: 0 6px;
    }	
    /* ------------------------------------- */


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
	
	.sub_btn{
		border-radius: 10px;
		border: none;
		font-size: 15px;
		background-color: #D9CEC1;
		width: 50px;
		height: 30px;	
		margin-left: 5px;
	}
	
	.sub_btn:hover {
		background-color: #C2B19C;
	}
	
	.search_keyword{
		width: 300px;
		height: 30px; 
		border-radius:7px; 
		border: 1px solid #c9c9c9;
		margin-left: 62%;
		outline: none;
	}	
	
	#hr1{
		border: solid 1px #000; 
		opacity: 100 !important;
	}	

	.title_box{
		margin-bottom: 3%;
	}

    table.table tr th, table.table tr td {
		padding: 12px 15px;
		vertical-align: middle;
    }
    
    table.table tr:hover{
    	background-color: #E6DBCD;
    }
	
	tr{
		text-align: center;
	}
		
	.c_num{
		width: 10%;
	}
	.c_check{
		width: 6%;
	}	
</style>
</head>
<%-- <link href="<%=request.getContextPath()%>/resources/css/admin_member.css" rel="stylesheet" /> --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
$( "#member_table tr" ).on( "mouseover", function() {
    $( this ).css( "background-color", "#f4f4f4" );
    $( this).children("tr").css( "cursor", "pointer" );
});

$( "#member_table tr" ).on( "mouseleave", function() {
    $( this ).css( "background-color", "white" );
});


</script>

<body>
<jsp:include page="../layout/Admin_header2.jsp"  />
	 <c:set value="${memberList }" var="member_list" /> 
	 <c:set var="paging" value="${Paging }" />
		<div class="empty1">
			
	 		<div class="table_box">
	 		
	 			<h2><b>회원 관리</b></h2>
	 			
	 			<br><br>	 			
	 		<form method="post" action="<%=request.getContextPath()%>/member_search.do">
	 		<div style="display: flex;">
	 			<h6 style="margin-bottom: 0; margin-top: 7px;"><b>회원 검색&nbsp;&nbsp;</b></h6>
	 			<input name="keyword" class="search_keyword" style="" placeholder="회원아이디으로 검색..">
	 			<button type="submit" class="sub_btn">검색</button>
	 		</div>
	 		</form>
	 		<hr id="hr1" width="95%">
	 		
	 		 <c:set var="count" value="${Count }" />
	 		 	<div class="title_box">
	 		 		회원 총 가입자 수 : ${count }개
	 		 	</div>
		
			<div class="warp">
				<table class="table">
				  <thead>
				    <tr style="pointer-events: none;" >
				   	  <th class="c_check">선택</th>
				      <th class="c_num">회원번호</th>
				      <th>회원아이디</th>
				      <th>회원이름</th>
				      <th>회원가입일</th>
				      <th>회원상태</th>
				    </tr>
				  </thead>
				  <c:if test="${!empty member_list }">
				  	<c:forEach items="${member_list }" var="dto">
						  <tbody>
								    <tr onclick="location.href='admin_cont.do?num=${dto.getMember_num()}&page=${paging.getPage()}'" >
		 		 					<td>
		 		 						<input type="checkbox">
		 		 					</td>								    
								      <td>${dto.getMember_num() }</td>
								      <td>${dto.getMember_id() }</td>
								      <td>${dto.getMember_name() }</td>
								      <td>${dto.getMember_date() }</td>
								      <td>				     
											<c:if test="${dto.getMember_use() ne '1'}">
												<button id="fin_a">회원</button>
											</c:if>
											<c:if test="${dto.getMember_use() eq '1' }">
												<button id="fin_b">탈퇴</button>
											</c:if>  		      
								      </td><!--  버튼끝 -->
								    </tr>
								    <tr> 
						  </tbody>
					  </c:forEach>
				  </c:if>
				</table>

		<div class="empty2">		
			<!-- 페이징 처리 -->
			<div class="page1">
				<nav class="paging">
		            <ul class="pagination">
		               <li class="page-item"><a class="page-link paging_btn"
		                  href="admin_memeber.do?page=1">◀◀</a></li> 
		               <c:if test="${paging.getPage() == 1 }">
		                <li>
		                 <a class="page-link paging_btn" 
		                        href="admin_memeber.do?page=1">◀</a> 
		                </li>
		                </c:if>
		                <c:if test="${paging.getPage() != 1 }">
		                <li>
		                  <a class="page-link paging_btn" 
		                        href="admin_memeber.do?">◀</a>
		                 
		                </li>
		                </c:if>
		               <c:forEach begin="${paging.getStartBlock() }" end="${paging.getEndBlock() }" var="i">
		      
		                  <c:if test="${i == paging.getPage() }">
		                     <li class="page-item active" aria-current="page"><a
		                        class="page-link paging_btn"   href="admin_memeber.do">${i }</a></li>
		                  </c:if>
		      
		                  <c:if test="${i != paging.getPage() }">
		                     <li class="page-item"><a class="page-link paging_btn" 
		                        href="admin_memeber.do?page=${i }">${i }</a></li>
		                  </c:if>
		               </c:forEach>
		      
		               <c:if test="${paging.getPage() < paging.getAllPage() }">
		                  <li class="page-item"><a class="page-link paging_btn"
		                     href="admin_memeber.do?page=${paging.getPage() + 1 }">▶</a></li>
		                  <li class="page-item"><a class="page-link paging_btn"
		                     href="admin_memeber.do?page=${paging.getPage() }">▶▶</a></li>
		               </c:if>
		            </ul>
		         </nav>				
				</div>				
				
			</div>

				</div>
				
			</div>	
		</div>	
</body>
</html>