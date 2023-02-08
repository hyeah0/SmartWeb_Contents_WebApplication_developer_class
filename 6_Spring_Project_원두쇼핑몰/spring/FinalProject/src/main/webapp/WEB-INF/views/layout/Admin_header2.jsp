<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/resources/css/admin.css" rel="stylesheet" />
<script src="https://kit.fontawesome.com/8cabb9ab88.js" crossorigin="anonymous"></script>
<link href="<%=request.getContextPath()%>/resources/css/admin2.css" rel="stylesheet" />
</head>
<body>
<div>

	<div class="sidebar">
		
     <div class="sidebar-brand"> <a href="<%=request.getContextPath()%>/"><img class="img" src="<%=request.getContextPath()%>/resources/images/cuppa_logo.png" alt="cupofcoffee"></a></div>
       <ul class="sidebar_ul">
	      <li><a href="<%=request.getContextPath()%>/admin_memeber.do">회원관리</a></li>
	      <li><a href="<%=request.getContextPath()%>/admin_beans.do">원두관리</a></li>
	      <li><a href="<%=request.getContextPath()%>/admin_orderlist.do">배송관리</a></li>
	      <li><a href="<%=request.getContextPath()%>/admin_after.do">후기글관리</a></li>
	      <li><a href="<%=request.getContextPath()%>/admin_center.do">고객센터</a></li>
      </ul>
    </div>
</div>

</body>
