## 데이터 출력시키는 방법 - 3가지

1. console.log() 를 이용하는 방법 : console창에서 확인가능
2. document.write() 를 이용하는 방법 : 사용자 창에서 확인가능
3. alert() 를 이용하는 방법 : 알림창에서 확인 가능

### 1. console.log()

- 화면 개발자 모드 콘솔창에서 확인이 가능하다.

```
console.log("텍스트");
```

### 2. document.write()

- HTML의 body 영역에 괄호 안의 내용을 출력해 준다.
- 가로 안에 HTML 태그 사용이 가능하다.
- document.write()을 연속으로 사용시 &lt;br&gt;태그를 사용해 주지 않으면 연결되서 보인다.

```
  document.write("텍스트1");
  document.write("텍스트2");  // ---> 텍스트1텍스트2
  document.write("<h1> h1 <br> h1 </h1>");
```

### 3. alert()

- 알림창에서 출력해준다.
- window.alert(); 지만 window는 생략이 가능하다.
- 유효성 체크할때 많이 사용한다.(빈값이 들어가면 안되는데 빈값이 들어가면 경고창)

```
alert("빈값을 입력했습니다.");
```

[알림창 더보기](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/03_js/03_alert_confirm_prompt.md)
