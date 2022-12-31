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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
	
	.c_name{	
		text-align: left;
	}	  		
</style>
</head>
<body>
<jsp:include page="../layout/Admin_header2.jsp"  />
<c:set value="${afterList }" var="afterList" />
<c:set var="paging" value="${Paging }" />

	<div class="empty1"> 
 		<div class="table_box">
		
			<h2><b>후기글 관리</b></h2>
			
			<br><br>
	 		<div style="display: flex;">
	 			<h6 style="margin-bottom: 0; margin-top: 7px;"><b>후기글 정보&nbsp;&nbsp;</b></h6>
	 		</div>

	 		<hr id="hr1" width="95%">
	 		
	 		 <c:set var="count" value="${Count }" />
	 		 	<div class="title_box">
	 		 		후기글 총 개수 : ${count }개
	 		 	</div>
	
		<div class="third">
			<table class="table">
				<tr style="pointer-events: none;" >
				<th class="th1">글번호</th>
				<th class="c_name">원두이름</th>
				<th>작성자</th>
				<th>작성일</th>
				</tr>	
				

			<c:forEach items="${afterList }" var="dto">
			
			
			<tr onclick="location.href='admin_Write_cont.do?num=${dto.getWrite_num()}'">
				<td>${dto.getWrite_num() }</td>
				<td class="c_name">${dto.getBeans_name() }</td>
				<td>${dto.getMember_id() }</td>
				<td>${dto.getWrite_date() }</td>	
			</tr>
			</c:forEach>
			</table>
			<!--page  -->
		<div class="pages">
			<div class="page1">
				<nav class="paging">
		            <ul class="pagination">
		               <li class="page-item"><a class="page-link paging_btn"
		                  href="admin_beans.do?page=1">◀◀</a></li> 
		               <c:if test="${paging.getPage() == 1 }">
		                <li>
		                 <a class="page-link paging_btn" 
		                        href="admin_beans.do?page=1">◀</a> 
		                </li>
		                </c:if>
		                <c:if test="${paging.getPage() != 1 }">
		                <li>
		                  <a class="page-link paging_btn" 
		                        href="admin_beans.do?">◀</a>
		                 
		                </li>
		                </c:if>
		               <c:forEach begin="${paging.getStartBlock() }" end="${paging.getEndBlock() }" var="i">
		      
		                  <c:if test="${i == paging.getPage() }">
		                     <li class="page-item active" aria-current="page"><a
		                        class="page-link paging_btn"   href="admin_beans.do">${i }</a></li>
		                  </c:if>
		      
		                  <c:if test="${i != paging.getPage() }">
		                     <li class="page-item"><a class="page-link paging_btn" 
		                        href="admin_beans.do?page=${i }">${i }</a></li>
		                  </c:if>
		               </c:forEach>
		      
		               <c:if test="${paging.getPage() < paging.getAllPage() }">
		                  <li class="page-item"><a class="page-link paging_btn"
		                     href="admin_beans.do?page=${paging.getPage() + 1 }">▶</a></li>
		                  <li class="page-item"><a class="page-link paging_btn"
		                     href="admin_beans.do?page=${paging.getPage() }">▶▶</a></li>
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