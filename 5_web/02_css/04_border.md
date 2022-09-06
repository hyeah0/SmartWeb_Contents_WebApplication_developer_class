## border

- 테두리
- 형태

        border: 선의두께 선의종류 선의색상

- 특징별 개별사용
  - border-width: 2px : 테두리 선의 두께
  - border-style: solid : 테두리 선의 종류
  - border-color: black; : 테두리 선의 색상

### 테두리 선의 종류

- border-style : 테두리선의 종류
  - none : 테두리 없음
  - hidden : 테두리 숨김
  - solid : 실선, 단선(일반선)
  - dotted : 점선(...)
  - dashed : 파선(---)
  - double : 두줄선(이중선)
  - groove : 홈이 파여있는선
  - ridge : 솟은 모양의 선(groove의 반대)
  - inset : 요소 전체가 들어간선
  - outset : 요소 전체가 나온선

### 예시

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/02_css/img/css_border.png" width="80%" height="80%"/>

```
div{
		margin: 15px;
	}

	.box1{
		width: 500px;
		height: 10%;
		border: 5px solid lightgray;
	}

	.box2{
		width: 500px;
		height: 10%;
		border: 5px hidden lightgray;
	}

	.box3{
		width: 500px;
		height: 10%;
		border: 5px solid lightgray;
	}

	.box4{
		width: 500px;
		height: 10%;
		border: 5px dotted lightgray;
	}

	.box5{
		width: 500px;
		height: 10%;
		border: 5px dashed lightgray;
	}

	.box6{
		width: 500px;
		height: 10%;
		border: 5px double lightgray;
	}

	.box7{
		width: 500px;
		height: 10%;
		border: 5px groove lightgray;
	}

	.box8{
		width: 500px;
		height: 10%;
		border: 5px ridge lightgray;
	}

	.box9{
		width: 500px;
		height: 10%;
		border: 5px inset lightgray;
	}

	.box10{
		width: 500px;
		height: 10%;
		border: 5px outset lightgray;
	}
```
