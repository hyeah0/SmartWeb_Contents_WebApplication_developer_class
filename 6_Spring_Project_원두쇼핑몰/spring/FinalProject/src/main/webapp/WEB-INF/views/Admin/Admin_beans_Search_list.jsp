<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원두 관리</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.easing/1.3/jquery.easing.1.3.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
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
	
	.empty1{
		margin-left: 23%;
	}
	
	.empty2{
		
	}
	
	.table{
		width: 95%;
	}
	
	.table_box{
		margin-top: 3%;
	}
	
	.page1{
		margin-left: 30%;
	}
	
	#hr1{
		border: solid 1px #000; 
		opacity: 100 !important;
	}
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
	
	.title_box{
		margin-bottom: 3%;
	}
	
	tr{
		text-align: center;
	}
	
	.c_check{
		width: 6%;
	}
	
	.c_num{
		width: 10%;
	}
	
	.c_name{	
		text-align: left;
	}
	
	.btn_1{
		background-color: #fff;
		border: 1px solid gray;
		border-radius: 10px;
	}

	/* 페이징 버튼 디자인 */
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
    
    table.table tr th, table.table tr td {
		padding: 12px 15px;
		vertical-align: middle;
    }
    
    table.table tr:hover{
    	background-color: #E6DBCD;
    }

	.btn_1:hover {
		background-color: #e9e9e9;
	}

	
	.tr_1{
	  border: 1px solid #d5d5d5;
	  padding: 10px;	
	  text-align: center;
	}
	.td_1{
	  border: 1px solid #d5d5d5;
	  padding: 10px;	
	  text-align: left;		
	}

	.box3{
		float: left;
	}	
	.table_1{
	  width: 73%;
	  border: 1px solid #e9e9e9;
	  border-collapse: collapse;	
	  height: 300px;
	}	
	
	.f_btn{
		float: right;
		border-radius: 10px;
		border: none;
		font-size: 17px;
		background-color: #D9CEC1;
		width: 60px;
		height: 35px;
	}
	.f_btn:hover{
		background-color: #C2B19C;
	
	}
	.btn_box{
		margin-right: 7%;
		margin-top: 1%;
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
		margin-left: 60%;
		outline: none;
	}	
</style>
</head>


<body>
<jsp:include page="../layout/Admin_header2.jsp"  />
	 <c:set value="${beans_list }" var="list" /> 
	 <c:set var="paging" value="${Paging }" />
	 	
	 	<div class="empty1">
	 		<div class="table_box">
	 		
	 			<h2><b>원두 관리</b></h2>
	 			
	 			<br><br>
	 				
	  <ul id="tabs" class="tabs">
	    <li class="tab-link current" data-tab="tab1">원두 리스트</li>  
	  </ul>	 				
	 		<div id="tab1" class="tab-content current">		
	 		<br>
	 		<form method="post" action="<%=request.getContextPath()%>/beans_search.do">
	 		<div style="display: flex;">
	 			<h6 style="margin-bottom: 0; margin-top: 7px;"><b>원두 검색 결과</b></h6>
	 			<input name="keyword"class="search_keyword" placeholder="원두이름으로 검색..">
	 			<button type="submit" class="sub_btn">검색</button>
	 		</div>
	 		</form>
	 		<hr id="hr1" width="95%">
	 		
	 		 <c:set var="count" value="${SearchCount }" />
	 		 	<div class="title_box">
	 		 		검색 원두 총 개수 : ${count }개
	 		 	</div>

		 		<table class="table">
		 			<tr style="pointer-events: none;">
		 				<th class="c_check">선택</th>
		 				<th class="c_num">원두번호</th>
		 				<th class="c_name">원두이름</th>
		 				<th>원두가격</th>
		 				<th>원두재고</th>
		 				<th>관리</th>
		 			</tr>
	
		 		 <c:forEach items="${list }" var="e">
		 		 	<tr>
		 		 		<td>
		 		 			<input type="checkbox">
		 		 		</td>
		 		 		<td>
		 		 			${e.getBeans_num()}
		 		 		</td>
		 		 		<td class="c_name" onclick="location.href='admin_beans_cont.do?no=${e.getBeans_num()}'">
		 					${e.getBeans_name() }
		 				</td>
		 				<td>
		 					<fmt:formatNumber value="${e.getBeans_price() }" />원
		 				</td>
		 				<td>
		 					${e.getBeans_count() }
		 		 		</td>
		 		 		<td>
		 		 			<button class="btn_1" onclick="location.href='admin_beans_modify.do?no=${e.getBeans_num()}'">수정</button>
		 		 			<button class="btn_1" onclick="if(confirm('원두를 삭제 하시겠습니까?')){location.href='admin_beans_delete.do?no=${e.getBeans_num()}'}else{return;}">삭제</button>
		 		 			
		 		 		</td>
		 		 	</tr>
		 		 
		 		 </c:forEach>
		 		</table>
	 		</div>
	 	</div>
	</div>
</body>

<script type="text/javascript">
	
	function readURL1(input) {
		  console.log(input.files);
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function (e) {
		      $("#img-preview1").attr("src", e.target.result);
		    };
		
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    $("#img-preview1").attr("src", noimage);
		  }
		}	

</script>
</html>