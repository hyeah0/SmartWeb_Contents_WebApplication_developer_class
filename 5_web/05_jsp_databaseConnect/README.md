## MVC 패턴

- MVC 패턴이란?

  - Model - View - Controller 의 약자로 애플리케이션을 세가지 역할로 구분한 개발 방법론 이다.

- WEB에 적용시 하단과 같은 순서로 이루어 진다.
  <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/img/MVC.jpeg" width="80%">

  1. 사용자가 웹사이트에 접속(User)
  2. Controller는 사용자가 요청한 웹페이지를 서비스하기 위해 모델을 호출(Mainpulates)
  3. Model은 DB나 파일과 같은 데이터 소스를 제어한 후 그 결과를 return
  4. Controller는 Model이 리턴한 결과를 View 에 반영(update)
  5. 데이터가 반영된 View는 사용자에게 보여진다.
