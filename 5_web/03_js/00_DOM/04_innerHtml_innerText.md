## JavaScript 에서 HTML 컨텐츠값 수정

- 컨텐츠 값이란 ?
  - 태그 사이에 들어갈 값
  - &lt;태그&gt;컨텐츠값&lt;/태그&gt;

| 소속             | 사용                          | 설명                    |
| ---------------- | ----------------------------- | ----------------------- |
| HTML DOM Element | 태그.innerHTML = "텍스트, 값" | 태그값에 들어갈 값 지정 |
| HTML DOM Element | 태그.innerText = "텍스트, 값" | 태그값에 들어갈 값 지정 |

## innerText/ innerHTML 차이

- 만약 하단과 같이 코드를 짠다면 결과는 이미지와 같다
  <img src="" width="100%" height="100%">
  - innerHTML은 컨텐츠값이 빨강색으로 보여지고 태그가 보여지지 않는다.
  - innerText는 컨텐츠값 색상이 변하지 않고 텍스트 그대로 반환된다.

```
<body>
    <div id="myDiv1"></div>
    <div id="myDiv2"></div>
    <script>
        onload = () => {
            let myDiv1 = document.querySelector("#myDiv1")
            let myDiv2 = document.querySelector("#myDiv2")
             myDiv1.innerHTML = "<p style='color:red'>안녕하세요</p>"
             myDiv2.innerText = "<p style='color:red'>안녕하세요</p>"
        }
    </script>
</body>
```
