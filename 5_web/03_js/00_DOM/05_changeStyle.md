## JavaScript 에서 HTML 태그 스타일 변경하기

| 소속             | 사용                      | 설명                                |
| ---------------- | ------------------------- | ----------------------------------- |
| HTML DOM Element | 태그.style.css속성 = "값" | 속성값에 따라 태그 스타일이 변한다. |

[css 속성값 참고](https://www.w3schools.com/jsref/dom_obj_style.asp)

## - 예시

```
<body>
    <h1 id="header">Header</h1>
    <script>
        onload = () => {
            let header = document.getElementById("header")

            // h1 태그의 스타일 변경
            header.style.border = "1px solid red"
            header.style.color = "blue"
            header.style.fontStyle = "italic"
            header.innerHTML = "abcd"
        }
    </script>
</body>
```
