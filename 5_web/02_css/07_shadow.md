## shadow

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/02_css/img/css_shadow.png" width="80%" height="80%">

- text-shadow: <가로거리> <세로거리> <번짐정도> <색상>;
- box-shadow: <가로거리> <세로거리> <번짐정도> <색상>;

- 가로거리
  - 텍스트로부터 그림자까지의 가로거리
  - 양수 값 : 글자 오른쪽으로 그림자<br>
    음수 값 : 글자 왼쪽으로 그림자
  - 필수값
- 세로거리
  - 텍스트로부터 그림자까지의 세로거리
  - 양수 값 : 글자 아래쪽으로 그림자<br>
    음수 값 : 글자 위쪽으로 그림자
  - 필수값
- 번짐정도
  - 그림자가 번지는 정도를 말한다.
  - 양수 값 : 그림자가 퍼져나가는 정도<br>
    음수 값 : 그림자가 축소된다.
  - 기본값 : 0

```
<style type="text/css">

	.text1{
		text-shadow: 10px 10px 2px gray;
	}

	.test2{
		width: 100px;
		height: 100px;
		box-shadow: 10px 10px 2px gray;
	}

</style>

<h2 class="text1">텍스트 그림자 예제</h2>

<hr>

<div class="test2">박스 그림자 예제</div>
```

[그림자 참고 링크1](https://neumorphism.io/#e0e0e0)<br>
[그림자 참고 링크2](https://getcssscan.com/css-box-shadow-examples)
