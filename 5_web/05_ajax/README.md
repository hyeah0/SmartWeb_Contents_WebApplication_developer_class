## AJAX (Asyncchronous Javascript And XML)

- HTML, CSS, JavaScript 를 활용해서 동적이면서 인터렉티브한 사용자 화면 조작은 물론<br>
  서버와의 비동기 데이터 통신을 통해서 응답성이 좋은 데이터 처리를 가능하게 하는 웹 개발 기법
- Ajax는 빠르게 동작하는 동적인 웹페이지를 만들기 위한 개발 기법 중 하나이다.
- Ajax는 웹 페이지를 전체 로딩하지 않고 웹페이지의 일부분만 갱신 할 수 있다.<br>
  즉, Ajax를 이용하면 백그라운 영역에서 서버와 통신하여 그 결과를 웹 페이지의<br> 일부분에만 표시할 수 있다.

## 비동기 통신

- 비동기 통신 방식은 웹페이지를 리로드 하지 않고 데이터를 불로오는 방식이다.
- 장점 : 필요한 부분만 불러와 사용할 수 있어 리소스 낭비를 줄일 수 있다.<br>
  (페이지 전체 리로드 경우 리소스 다시 불러와야하는데, 이럴경우 이미지, 스크립트, 기타 코드등을 모두 재요청 해야한다.
  재 요청시 불필요한 리소스 낭비 발생)

## Ajax의 장점

- 새로고침을 통해 새로운 컨텐츠를 반영해야하는 정적인 웹페이지가 아닌 <br>
  동적인 웹페이지를 만들 수 있다.
- 전체 페이지에서 실제로 바뀌어야 할 내용이 특정 부분에 해당한다면 <br>
  그 영역의 데이터만 따로 서버에서 받아 올 수 있다.<br>
  따라서 서버의 네트워크 부하를 줄여 줄 수 있다.
- 웹 페이지가 로드된 후에 서버로 데이터 요청과 데이터를 받을 수 있다.
- 백그라운드 영역에서 서버로 데이터를 보낼 수 있다.

## 제이쿼리 Ajax 사용법

- 형식)

```
$.ajax({
      type 		: "get" 또는 "post"
    , async 	: "true" 또는 "false"    		-- 거의 사용 안함
    , url 		: "요청할 url주소"
    , data 		: {서버로 전송할 데이터}
                    {변수명 : 값 }
    , datatype 	: "서버에서 전송 받을 데이터 형식_ 데이터 값을 받을 파일 형식"
                    (예 : XML, HTML, TEXT, JSON )
    , success 	: 정상요청, 정상적으로 응답을 받은 경우 처리내용 작성
    , error 	: 오류 발생시 처리내용 작성
    , complete 	: 작업 완료 후 처리할 내용		-- 거의 사용 안함
}
```

## 서버와 다양한 형태의 데이터를 주고 받을 수 있다.

- JSON
- XML
- HTML
- jsp 등

### - 예시 이미지

- JSON
  <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_ajax/img/ajax_json.png" width="70%">

- XML
  <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_ajax/img/ajax_xml.png" width="70%">

- HTML
  <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_ajax/img/ajax_html.png" width="70%">

- jsp 등
  <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_ajax/img/ajax_jsp1.png" width="70%">
