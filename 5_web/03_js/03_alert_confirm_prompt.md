## 입출력 대화상자(알림창) - 3가지

<div>
  <div>
    <h3>alert()</h3>
    <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/03_js/img/031_js_alert.png" width="30%" height="30%">
  <div>
  <div>
    <h3>confirm()</h3>
    <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/03_js/img/032_js_confirm.png" width="30%" height="30%">
  <div>
  <div>
    <h3>prompt()</h3>
    <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/03_js/img/033_js_prompt.png" width="30%" height="30%">
  <div>
</div>

### 1. alert() : 알림(경고)창

    - 특정 정보를 사용자에게 메세지 창으로 알려주기 위해 사용한다.
    - 예시) window.alert("알림 또는 경고 메세지"); 또는
      alert("알림 또는 경고 메세지");

### 2. confirm() : 확인창

    - 확인 또는 취소 창이 나타나는 알림창
    - 결과값 : boolean 형

      - [확인] : true 값 반환
      - [취소] : false 값 반환

    - 예시)

      window.confirm("문자열"); 또는
      confirm("문자열");

### 3. prompt() : 입력창

    - 키보드로 데이터를 입력받을때 사용하는 알림창
    - 숫자를 입력받아도 String(문자열)로 인식한다.
    - 숫자는 따로 숫자로 변환이 필요하다.

      - parseInt, Number 를 이용 하면 된다.
      - 예시)

            parseInt(변수명)
            Number(변수명)  ---> Number = 클래스 객체

    - 입력받을때 숫자로 입력 받거나, 입력받은 후 숫자로 변경 처리 한다.

    - 예시)

            window.prompt("문자열", [초기값-생략가능]); 또는
            prompt("문자열", [초기값-생략가능]);
