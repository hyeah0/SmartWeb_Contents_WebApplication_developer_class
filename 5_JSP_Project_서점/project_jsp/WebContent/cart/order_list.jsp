<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>주문내역창</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="css/frame.css">
	<script src="https://kit.fontawesome.com/4338ad17fa.js" crossorigin="anonymous"></script>
	<style>
	    table {
	        text-align: center;
	    }
	    #top_name{
	    	margin-bottom: 0px;
	    }
	    #top_nav{
	    	margin-bottom: 0px;
	    }
	    #center{
			height: 80vh;
		}
		
		.footer_alert p{
			margin-bottom: 0px;
		}
	</style>
</head>
<body>
<jsp:include page="../include/main_top.jsp" />


<div id="center">
<form name="frm">
    <div class="container">
        <div class="px-4 py-5 my-5 text-center">
        <h1 class="display-5 fw-bold">주문목록</h1>
            <br>
            <div class="col-lg-9 mx-auto">
                <table class="table">
                    <thead class="thead-light">
                    <tr>
                        <th>주문번호</th>
                        <th>&nbsp;</th>
                        <th>도서명</th>
                        <th>총 주문수량</th>
                        <th>합계</th>
                    </tr>
                    </thead>
                    <c:set var="order" value="${ orderDetail }" />
                    <c:if test="${ !empty order }">
                    <c:forEach items="${ order }" var="order">
                    <tbody>
                    <tr>
                        <td>${ order.order_tmp_num }</td>
                        <td><img src="book_cover/${ order.book_img }" alt="image" width="40" height="50"></td>
                        <c:if test="${order.order_count > 1 }">
                        <td>${ order.book_name } 외 ${ order.order_count - 1 }</td>
                        </c:if>
                        <c:if test="${order.order_count == 1 }">
                            <td>${ order.book_name }</td>
                        </c:if>
                        <td>${ order.total_order_qty }</td>
                        <td><fmt:formatNumber value="${ order.total_order_price }" />원 </td>
                    </tr>
                    </tbody>
                    </c:forEach>
                    </c:if>
                </table>
                <c:set var="orderCon" value="${ orderCon }" />
                <c:if test="${ empty orderCon }">
                    <h3>주문목록이 없습니다.</h3>
                </c:if>
            </div>
        </div>
    </div>
</div>
</form>
</div>
<jsp:include page="../include/main_bottom.jsp" />

</body>
</html>