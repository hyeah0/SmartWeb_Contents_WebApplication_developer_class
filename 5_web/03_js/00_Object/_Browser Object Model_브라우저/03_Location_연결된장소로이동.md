## Location 인터페이스

- 객체가 연결된 장소(URL)를 표현한다.

### - Location 속성

- location.href : 온전한 URL을 값으로 하는 String
- location.protocol
- location.host
- location.hostname
- location.port
- location.pathname
- location.search
- location.hash

### - Location 메서드

- location.reload() : 현재 URL 리소스를 다시 불러온다.
- location.assign(주소) : 작성한 주소로 이동, 뒤로 가기 가능(이동하기 전 페이지로 뒤로가기 가능)
- location.replace(주소) : 작성한 주소로 이동, 뒤로가기 불가능(이동하기 전 페이지로 뒤로가기 불가)

[속성 & 메서드 참고](https://developer.mozilla.org/ko/docs/Web/API/Location)

```
<script>
     function testReload(){
            window.location.reload();
        }

    function testAssign(){
        window.location.assign("https://watcha.com/browse/video");
    }

    function testReplace(){
        window.location.replace("https://watcha.com/browse/video");
    }
</script>

<body>
    <input type="button" onclick="testReload()" value="Reload 테스트!">
    <input type="button" onclick="testAssign()" value="Assign 테스트!">
    <input type="button" onclick="testReplace()" value="Replace 테스트!">
</body>
```

## location.href = "주소값"

- 주소값으로 이동

### - 방법1 : 변수로 주소 일부작성, 이후 나머지 주소 작성

- 알림창에 자주 사용하는 포털사이트를 입력하면 해당페이지로 이동한다.

  ```
  let site = prompt("네이버, 다음, 구글 중 자주 사용하는 포털사이트는?");

  let url;

  switch(site){
      case "네이버" :
                      url = "www.naver.com";
                      break;
      case "다음" :
                      url = "www.daum.com";
                      break;
      case "구글" :
                      url = "www.google.com";
                      break;
      default :
              alert("보기 중에 없는 사이트 입니다.")
  }

  if(url){
      // 실제 페이지로 이동이 진행되는 명령어
      location.href="http://" + url;
  }else{
      // 현재 페이지를 새로고침하는 명령어
      location.reload();
  }

  ```

### - 방법2 : 버튼클릭시 해당 페이지로 이동, 주소 한번에 작성

```
<script>
    function goHompage() {
                location.href = "https://www.netflix.com";
            }
    </script>
<body>

    <input type="button" onclick="goHompage()" value="자주 사용하는 포털사이트로 이동!">

</body>

```
