<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	#table_1{
		
	}
	
	
	
	#con_1{
		margin-left: 23%;
		margin-top: 200px;
		margin-bottom: 50px;
		border: 1px solid #c6c6c6;
		width: 55%;
		padding: 40px 30px 30px 30px;
		border-radius: 10px;
	}
	
	#content{
		resize: none;
		border: none;
		outline: none;
	}

	
	
	#re_writer{
		border: none;
		pointer-events: none;
		font-weight: bold;
		width: 500px;
	}	
	
	#re_content{    
		width: 100%;
	    border: none;
	    resize: none;
	    outline: none;
	}
	
	#replyBtn{
		border: none;
	    font-size: 15px;
	    border-radius: 6px;
	    text-align: center;
	    background-color: white;
	    float: right;
	}
	
	#con_2{
		border: 1px solid #c6c6c6;
		border-radius: 10px;
		padding: 25px 10px 25px 25px;
		background-color: #F0F0F0;
	}
	
	#con_3{
		padding: 10px;
	}
	
	#pro_img{
	
		width: 35px;
		height: 35px; 
		margin: 0; 
		float: left; 
		margin-top: 10px;
		margin-left: 10px; 
		margin-right: 10px;
	}
	
	#tag_1{
		font-weight: bold; 
		color: #000; 
		text-decoration: none;
	}
	
	#tit_btn{
		border: none;
		font-size: 18px;
		font-weight: bold;
		float: right;
		background-color: #fff;
		margin-right: 2%;
	}
		.zero{
	
	


	
}
	
</style>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../layout/header.jsp" />

<div class="zero">
	<div id="con_1">
			<c:set var="dto" value="${board_cont }" />
			<c:set var="dto1" value="${admin_reply}"/>		
				<div>
				<h2>${dto.getBoard_title() }
					${dto1.getReply_cont() }
				</h2>
							
				<br>
		
				<div>
					<b style="font-size: 19px;"> ${dto.getBoard_title() } </b>
					<br>
					
				</div>	
				</div>
				<hr>
				
		
			<div id="con_2">
				<p>
				📢 본 게시판은 문의 게시판입니다.<br>
				📢 궁금하신 내용이나 불편한 점을 자유롭게 문의해 주세요.</p>
				
				문의하신 내용은 고객센터에서 확인 후 영업일 기준 1~3일 이내에 답변 드리도록 하겠습니다.<br>
				* 운영 시간: 평일 (월 ~ 금) 10:00 ~ 18:00
			</div>
			<br>
			<div id="con_3">
			
				<p>${dto.getBoard_cont() }</p>
			
			</div>
			
			
			<br>
			
			<hr style="width: 100%;">
			
			
			<%-- 여기서 관리자가 답변을 주었다면 관리자 답변도 함께 띄워주고 / 답변이 없다면 null이라면 콘텐츠만 띄워준다. --%>
		<div>
			
				<c:if test="${dto.getBoard_reply() eq dto1.getReply_num()}">
					<table id="table_1">
						<tr>
							<th style="font-size: 20px;">↳ 답변</th>
						</tr>
						<tr>
							<td><br><span style="font-weight: bold; font-style: italic; font-size: 23px;">Cuppa Coffee</span><br>
								안녕하세요. 커퍼 커피입니다.<br><br>
								${dto1.getReply_cont() }<br><br>
								궁금하신 내용에 대해 도움이 되셨길 바랍니다.<br><br>
								감사합니다.😄<br>
							</td>
						</tr>
					</table>
				
				</c:if>
			
			</div>  -

		</div>
</div>
</body>
</html>