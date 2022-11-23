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
    <form name="form1" class="box" onsubmit="return checkStuff()" action="<%=request.getContextPath() %>/member_login_ok.do">
      <h4><a href="<%=request.getContextPath() %>/main.do">사용자 <span>로그인</span></a></h4>
      <h5>로그인할 계정을 입력하세요</h5>
        <input type="text" name="id" placeholder="ID" autocomplete="off">
        <i class="typcn typcn-eye" id="eye"></i>
        <input type="password" name="password" placeholder="Passsword" id="pwd" autocomplete="off">
        <label>
          <input type="checkbox" name="loginchk" value="true">
         <%--  <span></span>
          <small class="rmb">ID 자동체크</small>--%>
        </label>
        <a href="member_findld.do" class="find_text">아이디 찾기</a>
        <a href="member_findpw.do" class="forgetpass">비밀번호 찾기</a>
        <input type="submit" value="로그인" class="btn1">
      </form>
        <a href="member_sign.do" class="dnthave">회원가입</a>
  </div> 
       <div class="footer">
      <span>Made with <i class="fa fa-heart pulse"></i> <a href="<%=request.getContextPath() %>/admin_login_page.do">By Book Store Admin</a></span>
    </div>
</div>
</body>
</html>