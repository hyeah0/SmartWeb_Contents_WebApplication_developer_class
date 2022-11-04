<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="wrapper">
        <!-- header -->
        <header id="header">
            <div class="header_top">
                <div class="headerdiv"></div>
                <div class="headerdiv header_logo">
                    <a href="<%=request.getContextPath()%>/main.do"> <img src="source/img/logo.jpeg" alt="logo"> </a>
                </div>
                <div class="headerdiv header_login">
                	<!-- 기능 확인 필요 -->
                	<c:set var="session" value="${session }"/>
                	<c:if test="${empty session }">
	                    <!-- 로그인 하기 -->
	                    <a href=""> 
	                    	로그인
	                    </a>
                    </c:if>
                    <c:if test="${!empty session }">
                    	<!-- 로그아웃 -->
                    	<a href="">
                    		로그아웃
                    	</a>
                    </c:if>
                    <!-- 마이페이지  -->
                    <a href="<%=request.getContextPath() %>/mypage_main.do">
                    	마이페이지
                    </a>
                    
                    <!-- 장바구니 -->
                    <a href="">
                    	장바구니
                    </a>
                </div>
            </div>
            <section class="header_nav">
                <ul>
                	<li>
                		<a href="<%=request.getContextPath() %>/main_getBookCategory.do?listType=1&requestType=1&category=all" class="nav_a">도서전체보기</a>
                	</li>
                	
                	<c:set var="cgyList" value="${cgyList }"/>
                	<c:if test="${!empty cgyList }">
                		<c:forEach items = "${cgyList }" var = "cgyDto">
		                    <li>
		                    	<a href="<%=request.getContextPath() %>/main_getBookCategory.do?listType=1&requestType=1&category=${cgyDto.getCgy_num() }" class="nav_a" >${cgyDto.getCgy_name() }</a>
		                    </li>
	                    </c:forEach>
                    </c:if>
                </ul>
            </section>
        </header>
</body>
</html>