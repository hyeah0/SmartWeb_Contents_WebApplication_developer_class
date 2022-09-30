<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL(표현 언어) 내장객체</title>
</head>
<body>
	<h2>EL(표현 언어) 내장객체</h2>
	<% 
		int res = 45 + 171;
		pageContext.setAttribute("Res", res);
		request.setAttribute("R", 1000);
		session.setAttribute("S", 10000);
		application.setAttribute("A", 100000);
		
		RequestDispatcher rd = request.getRequestDispatcher("Ex06.jsp");
		rd.forward(request, response); 
		/* 
			forward 일경우 이동된 페이지는 url에서 확인 되지 않는다. (Ex06.jsp) 
			http://localhost:8181/11_EL_JSTL/EL/Ex05.jsp 
		*/
		
	%>
	
	<p>pageContext >>> ex05페이지에서만 값 유효</p>
	<p>request >>> forward로 넘어갈 경우에만 값 유효</p>
	<p>session >>> 유효시간까지 값 유효</p>
	<p>application >>> 애플리케이션 종료시까지 값 유효</p>
	<br>
	
	<hr>
	<code>
	&lt;% <br>
		int res = 45 + 171;<br>
		pageContext.setAttribute("Res", res);<br>
		request.setAttribute("R", 1000);<br>
		session.setAttribute("S", 10000);<br>
		application.setAttribute("A", 100000);<br>
	%&gt;
	</code>
	
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