# script 위치에 따라 특징

- head 안에 넣었을때

  - js 파일이 크고 인터넷이 느릴때 홈페이지를 보는데까지 많은 시간이 소요된다

- body 가장 끝부분에 넣었을때

  - js 파일에 의존적인 홈페이지일 경우, 정상적인 홈페이지 보이기 까지 시간이 걸릴 수 있다.

# async / defer 차이

- head 안에 스크립트 태그사이에 위치

```
<head>
    ...
    <script async src="./js1_async_defer.js"></script>
    <script defer src="./js1_async_defer.js"></script>
</head>
```

### async

- 다운받는 시간 절약되나, html 실행하는 동안 js가 덜 다운 받아졌다면 홈페이지 실행까지 시간이 걸릴 수 있다.

### defer

- html실행하는 동안 js다운로드 진행

<br>
<br>
<br>
<br>
- 출처 : dreamcoding
