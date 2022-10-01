```
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- taglib 선언 방식 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	 <h2>JSTL 의 기본적인 태그들</h2>
	 <h3>변수태그</h3>
	 <p> <c:set var="str" value="Hello JSTL!!!" /> </p>
	 <hr>

	 <h3>출력태그</h3>
	 <p>JSTL 값 출력 >>> <c:out value="str"/> </p>
	 <p>JSTL 변수값 출력 >>> <c:out value="${ str } "/> </p>
	 <%-- 에러 : <p>JSTL 변수값 출력 >>> <c:out var="str"/> </p> --%>
	 <hr>

	 <h3>삭제태그</h3>
	 <p>JSTL 값 삭제 >>> <c:remove var="str"/> </p>

	 <hr>
	 <h3>조건 처리 태그(if)</h3>
	 <p> <c:if test="${10 >5}" var="k"/> </p>
	 <p> 조건식 결과 >>> <c:out value="${k}"/> </p>

	 <hr>
	 <h3>조건 처리 태그(choose)</h3>
	 <p> 학점처리 </p>
	 <p> <c:set var="grade" value="89"/> </p>
	 <p>
	 	 <c:choose>
	 	 	<c:when test="${grade >= 90}"> 결과 : A학점 </c:when>
	 	 	<c:when test="${grade >= 80}"> 결과 : B학점 </c:when>
	 	 	<c:when test="${grade >= 70}"> 결과 : C학점 </c:when>
	 	 	<c:when test="${grade >= 60}"> 결과 : D학점 </c:when>
	 	 	<c:otherwise> 결과 : F학점 </c:otherwise>
 	 	</c:choose>
	 </p>

	 <hr>
	 <h3>반복 처리(forEach)</h3>
	 <p> 반복문을 이용하여 1~10 까지 출력 </p>
	 <p>
	 	 <c:forEach begin="1" end="10" step="1" var="i">
	 	 	${i}
	 	 </c:forEach>
	 </p>
	 <p> step 생략시 1씩 증가 </p>

	 <hr>
	 <h3>반복 처리(forEach items="객체")</h3>
	 <p> 배열 출력 {"사과", "포도", "오렌지", "바나나"} </p>
	 <%
	 	String[] str = {"사과", "포도", "오렌지", "바나나"};
		pageContext.setAttribute("List", str);
	 %>
	 <p> 결과 </p>
	 <p>
	 	<c:forEach items="${List}" var="k">
	 		${k}
	 	</c:forEach>
	 </p>

</body>
</html>
```
