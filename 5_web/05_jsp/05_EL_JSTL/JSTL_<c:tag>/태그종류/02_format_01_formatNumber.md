## <fmt:formatNumber 속성 = "" > 태그의 속성들

<table border="1" cellspaicng="0">
<tr>
    <th> var </th>
    <td> &lt;fmt:formatNumber var = "num" value = "1234" /&gt; </td>
    <td> 태그의 결과를 저장할 변수의 이름 </td>
</tr>
<tr>
    <th> value </th>
    <td> &lt;fmt:formatNumber value = "${2*1000}" /&gt; </td>
    <td> 출력될 값 지정 </td>
</tr>
<tr>
    <th> type </th>
    <td> &lt;fmt:formatNumber type = "percent/number/currency" /&gt;</td>
    <td> 출력될 타입 지정
        <br>percent : %
        <br>number : 숫자
        <br>currency : 통화형식
    </td>
</tr>
<tr>
    <th> currencyCode </th>
    <td> &lt;fmt:formatNumber type = "currency" currencyCode="KRW" /&gt;</td>
    <td> 통화 코드를 지정한다.(현재 위치 기준) 
        <br> 한국 원화는 KRW 이다.
    </td>
</tr>
<tr>
    <th> currencySymbol </th>
    <td> &lt;fmt:formatNumber type = "currency" currencySymbol="$" /&gt; </td>
    <td> 통화를 표시할 대 사용할 기호를 표시한다.</td>
</tr>
<tr>
    <th> pattern </th>
    <td>  &lt;fmt:formatNumber value="123456.78912" pattern=".0#"/&gt;</td>
    <td> 숫자가 출력될 양식을 지정한다.</td>
</tr>
<tr>
    <th> scope </th>
    <td></td>
    <td> 변수의 접근 범위를 지정한다.</td>
</tr>
</table>
- * &lt;fmt:formatNumber value="123456.78912" pattern=".#0"/&gt; 은 에러 난다.
<br>&lt;fmt:formatNumber value="123456.78912" pattern=".0#"/&gt; 은 에러 안난다.

## 예시 코드

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp/05_EL_JSTL/JSTL_%3Cc:tag%3E/img/tag/02_format_number.png" width="70%">

```
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--
	 	통화 형식 지정

		type = "currency" currencyCode 생략 >>> 현재 로컬 나라 화폐
		type = "currency" currencyCode = "EUR" >>> 유로
		fmt:setLocale value="en_US" 지정 >>> type = "currency" >>> 달러
	  -->

	<h2>formatNumber</h2>

	<!-- c:set 으로 var(변수) 지정 -->
	<c:set var="num" value="15000"/>
	${ num } <br>
	<fmt:formatNumber value="${ num }"/> <br>

	<hr>
	<!-- fmt:formatNumber으로 var(변수) 지정 -->
	<fmt:formatNumber var="formatNum" value="35000"/>
	<c:out value="${ formatNum }"/> <br>
	${ formatNum } <br>

	<hr>
	<!-- type:percent -->
	<fmt:formatNumber value="${ num }" type="percent"/> <br>

	<hr>
	<!-- 통화 설정 -->
	<fmt:formatNumber value="${ num }" type="currency"/> <br>
	<fmt:formatNumber value="${ num }" type="currency" currencyCode="EUR"/> <br>
	<fmt:formatNumber value="${ num }" type="currency" currencyCode="USD"/> <br>
	<fmt:setLocale value="en_US"/><fmt:formatNumber value="${ num }" type="currency"/> <br>
	<fmt:formatNumber value="${ num }" type="currency" currencySymbol="$"/> <br>

	<hr>
	<!-- pattern 반올림 된다.-->
	<fmt:formatNumber value="123456.78912" pattern=".#"/><br>
	<fmt:formatNumber value="123456.78912" pattern=".0"/><br>
	<fmt:formatNumber value="123456.78912" pattern=".0#"/><br>
	<fmt:formatNumber value="123456.78912" pattern=".00"/><br>
	<fmt:formatNumber value="123456.78912" pattern=".000" />

</body>
</html>
```
