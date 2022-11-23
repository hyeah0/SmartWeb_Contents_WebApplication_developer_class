<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
<head>
    <title>결제완료창</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <style>
        .container {
            max-width: 1200px;
        }
    </style>
</head>
<body>

<form method="post" action="<%=request.getContextPath() %>/main.do">
<div class="container">
<div class="px-4 py-5 my-5 text-center">
    <h1 class="display-5 fw-bold">주문이 완료되었습니다.</h1>
    <br><br>
    <div class="col-lg-6 mx-auto">
        <c:set var="order" value="${ order }" />
            <h2>주문 일시 : ${ order[0].order_date }</h2>
        <br><br>
        <c:set var="total" value="${ total }" />
        <h2>결제 금액 : <fmt:formatNumber value="${ total }" />원</h2>
        <%--<p>(주문 일시 : ${ orderDTO.order_date })</p>--%>
        <%--</c:forEach>--%>
        <%--<hr>--%>
        <%--<c:forEach var="order" items="${ orders }">
            <h4><span class="badge badge-warning">출고중</span></h4>--%>
            <%--<table class="table">
                <thead class="thead-light">
                <tr>
                    <th>&nbsp;</th>
                    <th>도서명</th>
                    <th>가격</th>
                    <th>수량</th>
                    <th>합계</th>
                </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>&lt;%&ndash;cart_num&ndash;%&gt;</th>
                        <td>&lt;%&ndash;book_name&ndash;%&gt;</td>
                        <td>&lt;%&ndash;book_price&ndash;%&gt;</td>
                        <td>&lt;%&ndash;order_qty&ndash;%&gt;</td>
                        <td>&lt;%&ndash;부분합계&ndash;%&gt;</td>
                    </tr>
                </tbody>
                <tfoot>
                <tr>
                    <td colspan="4"></td>
                    <td>42000&lt;%&ndash;합계금액&ndash;%&gt;</td>
                </tr>
                </tfoot>
            </table>--%>
        <%--</c:forEach>--%>
        <br><br>
        <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
            <button type="submit" class="btn btn-primary btn-lg px-4 gap-3">홈으로</button>
        </div>
    </div>
</div>
</div>
</form>
<%--<c:set var="list" value="${ OrderList }" />
<c:set var="dto" value="${ CartList }" />
<c:if test="${ !empty list }">
    <c:forEach items="${ list }">
        <tr>
            <th scope="row">${ dto.getCart_num() }</th>
            <td>${ list.getBook_name() }</td>
            <td>${ list.getBook_price() }</td>
            <td>${ list.getBook_qty() }</td>
            <td>${ (list.getBook_price() * list.getBook_qty()) }</td>
        </tr>
    </c:forEach>
</c:if>--%>

</body>
</html>
