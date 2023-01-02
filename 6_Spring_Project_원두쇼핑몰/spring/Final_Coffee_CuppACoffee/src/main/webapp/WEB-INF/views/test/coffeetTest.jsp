<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<% long time = System.currentTimeMillis(); %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>나만의 커피 취향 테스트</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/coffeeTest.js"> </script>
</head>
<body>
<div class="container test-container">

    <header class="ts-header">
        <button class="ts-logo" onclick=""><img src="<%=request.getContextPath()%>/resources/images/coffee_beans.png" alt="coffee beans"></button>
    </header>

    <section class="main ts-wrapper">
        <div class="title">
            <h1 class="main-title">내 취향에 맞는 나만의 커피 찾기</h1>
            <h3 class="sec-title">원두 추출부터 가격대까지 원하는 대로 골라마셔요</h3>
        </div>
    
        <div class="start-wrap">
            <button class="start">시작</button>
        </div>
    </section>

    <section class="qna ts-wrapper">


    </section>

    <section class="result ts-wrapper">
        

    </section>
</div>
</body>
</html>