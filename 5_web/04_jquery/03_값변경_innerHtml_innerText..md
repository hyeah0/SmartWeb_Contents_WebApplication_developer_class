## 제이쿼리 값 변경 또는 값 불러오기

<table border="1" cellspacing="0">
    <tr><th > 선택자 </th><th> 사용 </th><th> 설명 </th></tr>
    <tr><td rowspan="2"> html()   </td> <td>$("선택자").html();   </td> <td>선택한 요소의 html태그 및 콘텐츠값 불러오기 </td> </tr>
    <tr> <td>$("선택자").html("<변경할 태그> 콘텐츠 </변경할 태그>");    </td><td> 선택한 요소의 태그와 콘텐츠값 변경</td>  </tr>
    <tr><td rowspan="2"> text()   </td> <td>   $("선택자").text(); </td> <td> 선택자(태그)의 콘텐츠값 불러오기 </td> </tr>
    <tr> <td>$("선택자").text("콘텐츠");    </td><td> 선택자(태그)의 콘텐츠값 변경</td>  </tr>
    <tr><td rowspan="2"> val()   </td> <td>   $("선택자").val();  </td> <td> 선택자(태그)의 value 속성값 불러오기 </td> </tr>
    <tr> <td>$("선택자").val("새로운 value 값");    </td><td> 선택자(태그)의 value 속성값 변경하기</td>  </tr>
</table>

## - 예시

### - html

<div>
    <img src="" width="50%" height="50%">
    <img src="" width="50%" height="50%">
<div>

```
<body>
    <h2><i>html()</i></h2>

    <!-- 자바스크립트 : jquery -->
    <script>
        $(()=>{
                $("h2").html("<a href='#''>HTML 함수</a>");
            })
    </script>
</body>
```

### - text

<div>
    <img src="" width="50%" height="50%">
    <img src="" width="50%" height="50%">
<div>

```
<body>
    <h1>객체 조작 및 생성</h1>
    <h2>text()</h2>

    <!-- 자바스크립트 : jquery -->
    <script>
        $(()=>{
                $("h2").text();         // 텍스트 가져오기
                $("h2").text("변경!");   // 텍스트 변경
            })
    </script>
</body>
```

### - val

<div>
    <img src="" width="50%" height="50%">
    <img src="" width="50%" height="50%">
<div>

```
<body>
    <p>
        <!-- value = "초기값으로 들어감" -->
        <input type="text" name="user_name" id="user_name" value="홍길동">
    </p>
    <p>
        <input type="text" name="my_name" id="my_name" >
    </p>

    <!-- 자바스크립트 : jquery -->
    <script>
        $(()=>{
                let name = $("#user_name").val();   // value 값을 가져온다.
                $("#my_name").val(name);            // value 값을 지정한다.
            })
    </script>

</body>
```
