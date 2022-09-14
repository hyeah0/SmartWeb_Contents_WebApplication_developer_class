## JavaScript 에서 HTML 태그 삭제하기

| 소속             | 사용                     | 설명               |
| ---------------- | ------------------------ | ------------------ |
| HTML DOM Element | 부모.appendChild(변수명) | 삭제할 태그 변수명 |

- 예시

```
<body>

	<h1 id="header_1">Header1</h1>
	<h1 id="header_2">Header2</h1>

// 스크립트
<script type="text/javascript">

    onload = function() {

        let header2 =
        document.getElementById("header_2");

        // 특정 요소(태그)를 삭제하는 방법
        document.body.removeChild(header2);
    }

</script>
</body>
```
