<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  
<style type="text/css">



body {
        color: #566787;
		background: #f5f5f5;
		font-family: 'Varela Round', sans-serif;
		font-size: 13px;
	}
	.table-wrapper {
        background: #fff;
        padding: 20px 25px;
        margin: 30px 0;
		border-radius: 3px;
        box-shadow: 0 1px 1px rgba(0,0,0,.05);
    }
	.table-title {        
		padding-bottom: 15px;
		background: white;
		color: #fff;
		padding: 16px 30px;
		margin: -20px -25px 10px;
		border-radius: 3px 3px 0 0;
    }
    .table-title h2 {
		margin: 5px 0 0;
		font-size: 24px;
	}
	.table-title .btn-group {
		float: right;
	}
	.table-title .btn {
		color: #fff;
		float: right;
		font-size: 13px;
		border: none;
		min-width: 50px;
		border-radius: 2px;
		border: none;
		outline: none !important;
		margin-left: 10px;
	}
	.table-title .btn i {
		float: left;
		font-size: 21px;
		margin-right: 5px;
	}
	.table-title .btn span {
		float: left;
		margin-top: 2px;
	}
    table.table tr th, table.table tr td {
        border-color: #e9e9e9;
		padding: 12px 15px;
		vertical-align: middle;
    }
	table.table tr th:first-child {
		width: 60px;
	}
	table.table tr th:last-child {
		width: 100px;
	}
    table.table-striped tbody tr:nth-of-type(odd) {
    	background-color: #fcfcfc;
	}
	table.table-striped.table-hover tbody tr:hover {
		background: #f5f5f5;
	}
    table.table th i {
        font-size: 13px;
        margin: 0 5px;
        cursor: pointer;
    }	
    table.table td:last-child i {
		opacity: 0.9;
		font-size: 22px;
        margin: 0 5px;
    }
	table.table td a {
		font-weight: bold;
		color: #566787;
		display: inline-block;
		text-decoration: none;
		outline: none !important;
	}
	table.table td a:hover {
		color: #2196F3;
	}
	table.table td a.edit {
        color: #FFC107;
    }
    table.table td a.delete {
        color: #F44336;
    }
    table.table td i {
        font-size: 19px;
    }
	table.table .avatar {
		border-radius: 50%;
		vertical-align: middle;
		margin-right: 10px;
	}
    .pagination {
        float: right;
        margin: 0 0 5px;
    }
    .pagination li a {
        border: none;
        font-size: 13px;
        min-width: 30px;
        min-height: 30px;
        color: #999;
        margin: 0 2px;
        line-height: 30px;
        border-radius: 2px !important;
        text-align: center;
        padding: 0 6px;
    }
    .pagination li a:hover {
        color: #666;
    }	
    .pagination li.active a, .pagination li.active a.page-link {
        background: #03A9F4;
    }
    .pagination li.active a:hover {        
        background: #0397d6;
    }
	.pagination li.disabled i {
        color: #ccc;
    }
    .pagination li i {
        font-size: 16px;
        padding-top: 6px
    }
    .hint-text {
        float: left;
        margin-top: 10px;
        font-size: 13px;
    }    
    .delete{
    	right: 100px;
    
    }

	
	
	.zero{
	margin-top: 200px;
	margin-left:350px;
	
	width:75%;
	height: 100px;

	
}
.title{
	text-align: center;
	width:300;
}
.delete{
	text-align: center;
}
	/* 답변 미완료, 완료 */
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
.img_no{		
margin-left:15px;
border: 1px solid #FFF;
border-radius: 100%;
height: 100px;
width: 100PX;
 }
 .header__content {
    background-color: #a69b8d;
    -webkit-text-size-adjust: 100%;
    font: 100% sans-serif;
    --ikea-font: 'Noto IKEA', 'Noto Sans KR', 'Noto Sans', 'Roboto', 'Open Sans', system-ui, sans-serif !important;
    font-family: var(--ikea-font);
    font-size: .875rem;
    line-height: 1.571;
    visibility: visible;
    text-align: left;
    pointer-events: all;
    color: rgb(var(--colour-text-and-icon-5, 255, 255, 255));
    box-sizing: inherit;
    outline: none;
    margin: 0;
    display: flex;
    align-items: center;
    justify-content: space-around;
    padding: 80px 80px 50px 30px;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set value="${board_list }" var="boardlist" />
	<jsp:include page="../layout/header.jsp" />
	
		<div class="zero">
		<br>
		<br>
		<h1>내문의내역</h1>
			<div class="logout">
				<span>
				</span>
			</div>
	</div>

    <div class="container">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
					</div>
					<div class="col-sm-6">					
					</div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
						 <th class="no">문의번호</th>
                        <th class="title">내용</th>
                        <th	class="delete">삭제</th>
						<th class="result">처리상태</th>
                    </tr>
                </thead>
                <tbody>
                	<c:if test="${!empty boardlist }">
					<c:forEach items="${boardlist}" var="dto">
                    <tr>
                        <td>${dto.getBoard_num() }</td>
                        <td class="title"><a href="<%=request.getContextPath() %>/board_cont.do?num=${dto.getBoard_num()}">${dto.getBoard_title() }</a></td>
						   <td class="delete">                     
                           <a  href="<%=request.getContextPath() %>/myboard_delete.do?no=${dto.getBoard_num()}&num=${member_num}" class="delete" ><i class="fa-solid fa-trash"></i></a>                           
                       	 </td>
                       <td class="now">
						<%-- 게시글 번호랑 가지고 있는 게시글 번호랑 같고, 내용이 있을때 나와라. --%>
						<c:if test="${dto.getBoard_reply() eq '1'}">
							<button id="fin_a">답변완료</button>
						</c:if>
						<c:if test="${dto.getBoard_reply() ne '1' }">
							<button id="fin_b">답변 대기중</button>
						</c:if>     
				    </tr>  	
				    </c:forEach>
					</c:if>	
        
          
        
   
   
						<c:if test="${empty boardlist }">
                     		<td colspan="5" align="center">
                     	<h3>문의내역이없습니다..
                     	</h3>
                    	</td>
					</c:if>
	        </tbody>
            </table>
        </div>
    </div>
	
	
	
	
	
	<jsp:include page="../layout/footer.jsp" />
</body>
</html>