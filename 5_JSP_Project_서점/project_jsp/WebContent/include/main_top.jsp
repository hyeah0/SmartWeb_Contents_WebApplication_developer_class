<%@page import="com.book.model.CategoryDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.book.model.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String name = (String) session.getAttribute("userName");
	CategoryDAO cgyDao = CategoryDAO.getInstance();
	List<CategoryDTO> cgyList = cgyDao.getCategoryList();
%>
<body>

	<div class="wrapper">
		<!-- header -->
		<header id="header">
			<div class="header_top">
				<div class="headerdiv"></div>
				<div class="headerdiv header_logo">
					<a href="<%=request.getContextPath()%>/main.do"> <img
						src="source/img/logo.jpeg" alt="logo">
					</a>
				</div>
				<div class="headerdiv header_login">
					<c:set var="dto" value="${userId }" />
					
					<!-- 로그인 하기 -->
					<c:if test="${empty userNum }">

						<a href="<%=request.getContextPath()%>/member_login.do"> 로그인 </a>
					</c:if>
					
					<!-- 로그인 되어있을 경우 -->
					<c:if test="${!empty userNum }">
						<div class="login_name">
							<p id="top_name">
								<b><%=name%></b> 님 반갑습니다!
							</p>
						</div>
						<div class="login_btn">
							<!-- 로그아웃 -->
							<a href="<%=request.getContextPath()%>/member_logout_ok.do">
								로그아웃 </a>

							<!-- 마이페이지  -->
							<a href="<%=request.getContextPath()%>/mypage_main.do">
								마이페이지 </a>

							<!-- 장바구니 -->
							<a href="<%=request.getContextPath() %>/cart_list.do"> 장바구니 </a>
						</div>
					</c:if>

				</div>
			</div>
			<section class="header_nav">
				<ul id="top_nav"">
					<li><a class="nav_a"
						href="<%=request.getContextPath()%>/main_getBookCategory.do?listType=1&requestType=1&category=all">도서전체보기</a>
					</li>

					<c:set var="cgyList" value="<%=cgyList %>" />
					<c:if test="${!empty cgyList }">
						<c:forEach items="${cgyList }" var="cgyDto">
							<li>
								<a id="${cgyDto.getCgy_num() }" class="nav_a"
									href="<%=request.getContextPath() %>/main_getBookCategory.do?listType=1&requestType=1&category=${cgyDto.getCgy_num() }">${cgyDto.getCgy_name() }</a>
							</li>
						</c:forEach>
					</c:if>
				</ul>
			</section>
		</header>
