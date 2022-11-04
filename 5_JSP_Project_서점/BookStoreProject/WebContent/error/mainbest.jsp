<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.JSONArray"%>
<%@page import="com.book.model.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println("----------------- mainbest.jsp -----------------");
	BookDAO dao = BookDAO.getInstance();
	/* best 가져오기 */
	JSONArray bestBook = dao.getBestBookList();
	
	/* ajax를 호출한 곳에 bestBook값을 넘겨줌 */
	/* PrintWriter out = response.getWriter();*/
	out.println(bestBook.toString());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>