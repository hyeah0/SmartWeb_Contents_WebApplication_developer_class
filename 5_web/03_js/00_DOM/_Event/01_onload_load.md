## onload / load

### 1. html

```
<태그명 onload="함수명">
```
태그가 load될때 함수를 실행

### 2. JavaScript

```
object.onload = function(){ objtec가 실행될때 실행문 };
window.onload = () => {화면이 실행될때 실행문};
```

- object 예시 : document.getElementById("\_\_\_\_")
- window 생략 가능
- 무명함수는 람다식으로 가능
  - 람다식 () => {}

### 3. using the addEventListener()

```
object.addEventListener("load", 함수명); ==> object가 load될때 함수를 실행

function 함수명() {
  예시 ) document.getElementById("____").innerHTML = "Iframe is loaded.";
}
```
