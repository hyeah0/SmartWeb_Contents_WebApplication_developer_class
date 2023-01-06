<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

</head>
<body>
    
    <form action="<c:url value='/login/login'/>" method="post" onsubmit="return formCheck(this);">
        <h3 id="title">Login</h3>
        <div id="msg">
	    <c:if test="${not empty param.msg}">
			<i class="fa fa-exclamation-circle"> ${URLDecoder.decode(param.msg)}</i>
	    </c:if>
	</div>
        <input type="text" name="id" placeholder="이메일 입력" autofocus value="${cookie.id.value}">
        <input type="password" name="pwd" placeholder="비밀번호">
        <button>로그인</button>
        <div>
            <label>
	            <input type="checkbox" name="rememberId" ${empty cookie.id.value? "" : "checked"}> 아이디 기억
            </label> |
            <a href="">비밀번호 찾기</a> |
            <a href="">회원가입</a>
            <input type="hidden" name="toURL" value="${param.toURL}">
        </div>
        <script>
            function formCheck(frm) {
                 let msg ='';

                 if(frm.id.value.length==0) {
                     setMessage('id를 입력해주세요.', frm.id);
                     return false;
                 }

                 if(frm.pwd.value.length==0) {
                     setMessage('password를 입력해주세요.', frm.pwd);
                     return false;
                 }

                 return true;
            }

            function setMessage(msg, element){
                 document.getElementById("msg").innerHTML = ` ${'${msg}'}`;

                 if(element) {
                     element.select();
                 }
            }
        </script>
    </form>
</body>
</html>