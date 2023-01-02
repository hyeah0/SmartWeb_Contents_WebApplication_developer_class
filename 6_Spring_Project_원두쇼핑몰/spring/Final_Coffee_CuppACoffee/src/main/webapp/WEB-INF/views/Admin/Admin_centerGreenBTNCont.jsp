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
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.easing/1.3/jquery.easing.1.3.js"></script>
<style>

	.empty1{
		margin-left: 23%;
		
	}

	.table_box{
		margin-top: 3%;
		width: 95%;
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
	
	tr{
		text-align: center;
	}
	
	.c_num{
		width: 10%;
	}	
	.table_1{
	  width: 95%;
	  border: 1px solid #d5d5d5;
	  border-collapse: collapse;	
	  height: 250px;
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
	
	.table{
		width: 95%;
	}	
	
	.table_1 th{
		font-size: 15px;
	}	
	
	
	
	.second{
		margin-top: 3%;
		width: 95%;
	}
	
	#text_box{
		width: 100%;
		border: 1px solid #d5d5d5;
	 	resize: none;
		outline: none;
		border-radius: 10px;
		padding: 20px;
	}	
</style>
<script type="text/javascript">

$(function(){
	
	$("textarea.autosize").on('keydown keyup', function () {
	  	$(this).height(1).height( $(this).prop('scrollHeight')+12 );	
		});	
	
});

</script>
</head>
<body>

<jsp:include page="../layout/Admin_header2.jsp"  /> 
<c:set value="${greenbtn }" var="dto" />
<c:set value="${centerwrite }" var="dto1" />

 	 
	<div class="empty1">
 		<div class="table_box">
 		
 			<h2><b>고객 답변 완료 페이지</b></h2>	
			<br><br>
		
			<div class="table_con1">
				<table class="table">
					<tr>
						<th class="c_num">글 번호</th>
						<th>글 제목</th>
						<th>작성일</th>
						<th>작성자</th>
						<th>답변여부</th>
					</tr>
					<tr>				
						<td>${dto1.getBoard_num() }</td>
						<td>${dto.getBoard_title() }</td>
						<td>${dto.getBoard_date().substring(0,10) }</td>
						<td>${dto1.getMember_name()}(${dto1.getMember_id()})</td>
						<td>
							<c:if test="${dto1.getBoard_reply() eq '1' }">
								<button id="fin_a">답변완료!</button>
							</c:if>
						</td>
					</tr>
				</table>
			</div>				
				
			<div class="table_con2">
				
				<div>				
					<table class="table_1">
						<tr class="tr_1">
							<th style="width: 20%;">글 번호</th>
							<td class="td_1">${dto1.getBoard_num() }</td>
							<th style="width: 25%;">답변여부</th>
							<td class="td_1">
								<c:if test="${dto1.getBoard_reply() eq '1' }">
									<button id="fin_a">답변완료!</button>
								</c:if>							
							</td>						
						</tr>					
						<tr class="tr_1">
							<th>작성자</th>
							<td class="td_1">${dto1.getMember_name()}(${dto1.getMember_id()})</td>
							<th>작성일</th>
							<td class="td_1">${dto.getBoard_date().substring(0,10) }</td>
						</tr>		
						<tr class="tr_1">
							<th>글 제목</th>
							<td class="td_1" colspan="4">${dto.getBoard_title() }</td>
						</tr>									
						<tr class="tr_1">
							<th>글 내용</th>
							<td class="td_1" colspan="4" style="padding: 20px 0px 20px 30px;">${dto.getBoard_cont() }</td>
						</tr>
					</table>		
				</div>	
			</div>
				
			<div class="second">
				<h3>관리자 답변</h3>
				<div>
					 <textarea class="autosize" id="text_box" name="reply_cont"  style="overflow: hidden; min-height: 150px;" readonly>${dto.getReply_cont() }</textarea> 
				</div>
			</div>
		</div>
	</div>
</body>
</html>