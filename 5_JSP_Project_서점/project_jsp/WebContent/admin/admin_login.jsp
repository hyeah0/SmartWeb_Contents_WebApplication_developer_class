<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/userCss/user_Login.css"/>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="${pageContext.request.contextPath}../js/userJs/Login.js"></script>

</head>
<body>
<body id="particles-js"></body>
<div class="animated bounceInDown">
  <div class="container">
    <span class="error animated tada" id="msg"></span>
    <form name="form1" class="box" onsubmit="return checkStuff()" action="<%=request.getContextPath() %>/admin_login.do">
      <h4>ADMIN <span>로그인</span></h4>
      <h5>관리자 계정을 입력하세요</h5>
        <input type="text" name="id" placeholder="ID" autocomplete="off">
        <i class="typcn typcn-eye" id="eye"></i>
        <input type="password" name="password" placeholder="Passsword" id="pwd" autocomplete="off">
        <input type="submit" value="로그인" class="btn1">
      </form>
  </div> 
       <div class="footer">
      <span>Made with <i class="fa fa-heart pulse"></i> <a href="javascript:history.back();">By Book Store User</a></span>
    </div>
</div>
</body>
</html>