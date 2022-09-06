## nth-of-type()

- 순서선택자
  <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/02_css/img/css_nth.png" width="80%" height="80%"/>

- 홀수, 짝수 선택시

1. nth-of-type(2n) >>> 2n

```
    /* 2의 배수(짝수)에 디자인 적용 */
	ul li:nth-of-type(2n) {
		color: skyblue;
	}

	/* 2의 배수+1(홀수)에 디자인 적용 */
	ul li:nth-of-type(2n+1) {
		color: green;
	}
```

2. nth-of-type(odd) >> odd 또는 even 사용

```
    /* 홀수 선택자 */
	ul li:nth-of-type(odd) {
		color: gray;
	}

	/* 짝수 선택자 */
	ul li:nth-of-type(even) {
		color: red;
	}
```

## 첫번째 선택자, 마지막 선택자

- first-child / last-child

  <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/02_css/img/css_first_last.png" width="80%" height="80%"/>
