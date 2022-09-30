<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL(표현 언어) 내장객체 출력2</title>
</head>
<body>
	
	<h2>Ex05에서 forward로 Ex06으로 이동 -> 
	<br>Ex06에서 javascript location으로 Ex07으로 이동 (현재 파일명 : Ex07)</h2>
	<p> url에서도 파일명 확인 가능 </p>
	<p> http://localhost:8181/11_EL_JSTL/EL/Ex07.jsp </p>
	
	<br>
	<p>pageContext >>> ex05페이지에서만 값 유효</p>
	<p>request >>> forward로 넘어갈 경우에만 값 유효</p>
	<p>session >>> 유효시간까지 값 유효</p>
	<p>application >>> 애플리케이션 종료시까지 값 유효</p>
	<br>
	
	<h2>JSP 표현식으로 scope 내용 출력</h2>
	<p>pageContext >>> &lt;%=pageContext.getAttribute("Res") %&gt; >>> <%=pageContext.getAttribute("Res") %></p>
	<p>request >>> &lt;%=request.getAttribute("R") %&gt; >>> <%=request.getAttribute("R") %> </p>
	<p>session >>> &lt;%=session.getAttribute("S") %&gt; >>> <%=session.getAttribute("S") %> </p>
	<p>application >>> &lt;%=application.getAttribute("A") %&gt; >>> <%=application.getAttribute("A") %></p> 
	<br>
	
	<h2>EL(표현 언어)로 scope 내용 출력</h2>
	<p>pageContext >>> \${pageScope.Res} 또는 \${Res} >>> ${pageScope.Res} 또는 ${Res} </p>
	<p>request >>> \${requestScope.R} 또는 \${R} >>> ${requestScope.R} 또는 ${R} </p>
	<p>session >>> \${sessionScope.S} 또는 \${S} >>> ${sessionScope.S} 또는 ${S} </p>
	<p>request >>> \${applicationScope.A} 또는 \${A} >>> ${applicationScope.A} 또는 ${A} </p>
	

</body>
</html>