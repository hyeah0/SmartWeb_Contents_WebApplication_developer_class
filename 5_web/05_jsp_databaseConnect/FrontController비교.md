## 비교

### - FrontController x

- Action 인터페이스, FrontController 가 없다.
- 예시) view 페이지에서
  update_ok.do로 넘기면 서블릿중 어노테이션 WebServlet이 /updat_ok.do 가 실행
  @WebServlet("/update_ok.do")

- @WebServlet("/update_ok.do") 에 해당하는 서블릿(클래스)는
  1.  한글인코딩
  2.  uri 또는 폼에서 가져올 데이터를 변수에 저장한다.
  3.  변수에 들어간 값을 dto 객체에 저장
  4.  해당 값들이 dao 메서드에 보내진다. (생성, 삭제, 수정, 값확인)
  5.  dao 메서드 결과값에 따라 script태그를 통해 알림창이 나오거나 [참고 코드](<https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr04_BOARD_%EA%B2%8C%EC%8B%9C%ED%8C%90(oracle%2Cmysql)_%EA%B2%80%EC%83%89%2C%EC%A1%B0%ED%9A%8C%EC%88%98%2Crownum%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%EC%8B%9C%EB%B9%84%EB%B0%80%EB%B2%88%ED%98%B8/src/main/java/com/board/controller/UpdateOkServlet.md>)<br>
      데이터를 묶어서 view 페이지로 보낸다. [참고코드](<https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr04_BOARD_%EA%B2%8C%EC%8B%9C%ED%8C%90(oracle%2Cmysql)_%EA%B2%80%EC%83%89%2C%EC%A1%B0%ED%9A%8C%EC%88%98%2Crownum%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%EC%8B%9C%EB%B9%84%EB%B0%80%EB%B2%88%ED%98%B8/src/main/java/com/board/controller/SearchServlet.md>)
      - 참고이미지
          <div>
             <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/img/FrontControllerCompare/FrontControllerX01.png" width="45%">
             <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/img/FrontControllerCompare/FrontControllerX02.png" width="45%">
          </div>
      - 1. 알림
      - 2. 데이터 묶어서 view 페이지로 이동

### FrontController o

1. Action 인터페이스 반환형을 String으로 한경우
2. Action 인터페이스 반환형을 정하지 않은 경우
3. Action 인터페이스 반환형을 ActionForward 클래스로 한경우

## 3가지 다른점

- 한글 인코딩, uri 확인 동일
- FrontController, 각 실행 클래스 상이

* command => 예시) uri 에서 /12_Member_MVC2/select.do <br>
  select.do를 말한다.

### 1. Action 인터페이스 반환형을 String으로 한경우

- Frontcontroller
  - 1. Action 인터페이스 null 선언
  - 2. Action 인터페이스 = new 실행될 클래스명();

<div>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/img/FrontControllerCompare/FrontControllerO01.png" width="45%">
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/img/FrontControllerCompare/FrontControllerO02.png" width="45%">
</div>

- [코드 참고 : FrontController](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr09_MEMBER10_FrontController%2CEL%2CJSTL/src/main/java/com/member/controller/FrontController.md)

- [코드 참고 : MemberListAction](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr09_MEMBER10_FrontController%2CEL%2CJSTL/src/main/java/com/member/action/MemberListAction.md)

- [코드 참고 : MemberJoinOkAction](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr09_MEMBER10_FrontController%2CEL%2CJSTL/src/main/java/com/member/action/MemberJoinOkAction.md)

### 2. Action 인터페이스 반환형을 정하지 않은 경우

### 3. Action 인터페이스 반환형을 ActionForward 클래스로 한경우
