## pr09 다른점

- 데이터 수정시 방법

  - pr09

    - 수정하기 버튼 클릭 -> 수정 폼페이지 이동 -> 수정폼페이지에서 비밀번호 작성<br>
      데이터에 기재된 비밀번호와 상이할 경우 수정 불가<br>
      데이터 상세 보는 액션 따로, 수정액션 따로<br>
    - 참고 코드
      - [상세보기 액션](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr09_MEMBER10_FrontController%2CEL%2CJSTL/src/main/java/com/member/action/MemberListDetailAction.md)
      - [업데이트 액션](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr09_MEMBER10_FrontController%2CEL%2CJSTL/src/main/java/com/member/action/MemberUpdateAction.md)
      - [업데이트 완료 액션](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr09_MEMBER10_FrontController%2CEL%2CJSTL/src/main/java/com/member/action/MemberUpdateOkAction.md)
      - [DAO](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr09_MEMBER10_FrontController%2CEL%2CJSTL/src/main/java/com/member/model/MemberDAO.md)
      - [FrontController](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr09_MEMBER10_FrontController%2CEL%2CJSTL/src/main/java/com/member/controller/FrontController.md)

  - pr10
    - 수정하기 버튼 클릭 -> 비밀번호 입력 페이지로 이동 -> 비밀번호 작성 <br>
      -> DB와 비밀번호가 같을 경우 수정폼페이지로 이동/ 상이할경우 수정 불가
    - 데이터 상세보는 액션에서 uri에 적힌 타입에 따라 상세보기 또는 수정 기능 실행
    - 참고 코드
      - [상세보기 액션](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr10_BOARD_%EA%B2%8C%EC%8B%9C%ED%8C%90_%ED%8E%98%EC%9D%B4%EC%A7%95%2C%EA%B2%80%EC%83%89/src/main/java/com/board/action/BoardContentViewAction.md)
      - [업데이트 액션](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr10_BOARD_%EA%B2%8C%EC%8B%9C%ED%8C%90_%ED%8E%98%EC%9D%B4%EC%A7%95%2C%EA%B2%80%EC%83%89/src/main/java/com/board/action/BoardUpdateAction.md)
      - [DAO](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr10_BOARD_%EA%B2%8C%EC%8B%9C%ED%8C%90_%ED%8E%98%EC%9D%B4%EC%A7%95%2C%EA%B2%80%EC%83%89/src/main/java/com/board/model/BoardDAO.md)
      - [FrontController](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr10_BOARD_%EA%B2%8C%EC%8B%9C%ED%8C%90_%ED%8E%98%EC%9D%B4%EC%A7%95%2C%EA%B2%80%EC%83%89/src/main/java/com/board/controller/FrontController.md)

- search

- paging
  - [pageAction](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr10_BOARD_%EA%B2%8C%EC%8B%9C%ED%8C%90_%ED%8E%98%EC%9D%B4%EC%A7%95%2C%EA%B2%80%EC%83%89/src/main/java/com/board/action/BoardListAction.md)
  - [view page](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr10_BOARD_%EA%B2%8C%EC%8B%9C%ED%8C%90_%ED%8E%98%EC%9D%B4%EC%A7%95%2C%EA%B2%80%EC%83%89/src/main/webapp/view/board_list.jsp)
