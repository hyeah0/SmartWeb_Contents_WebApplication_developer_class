## 파일 실행

```
- main.jsp : 메인 페이지
	|- SelectServlet.java : 회원 목록 요청에 응답(데이터를 받아와 member_list.jsp에 넘김)
        |- member_list.jsp : 회원 목록 확인 페이지
            |                 기능 : 회원가입, 상세 정보 보기
            |- contentServlet.java : 회원 상세 정보 요청에 응답
                |                    특정 회원번호를 받아와 해당 데이터를 member_const.jsp에 넘김
                |- member_cont.jsp : 회원 상세 정보 확인 페이지
                    |                기능 : 회원수정, 회원삭제, 회원목록으로 이동
                    |- UpdateServlet.java : 회원 수정 요청에 응답
                    |    |                   특정 회원번호를 받아와 수정이 필요한 데이터만 member_update.jsp로
                    |    |- member_update.jsp : 회원 수정 폼 페이지
                    |        |- UpdateOkServlet.java : 회원 수정 폼페이지에서 비밀번호 확인 후 데이터 수정
                    |            |- contentServlet.java : 데이터수정 완료 후
                    |                |                    회원 상세 정보 요청에 응답
                    |                |                    특정 회원번호인 데이터만 member_const.jsp로
                    |                |- member_cont.jsp : 회원 상세 정보 확인 페이지
                    |                                    기능 : 회원수정, 회원삭제, 회원목록으로 이동
                    |- DeleteServlet.java : 회원 삭제 요청에 응답
                    |    |                   특정 회원번호를 받아와 삭제가 필요한 데이터만 삭제
                    |    |- contentServlet.java : 데이터수정 완료 후
                    |                |            회원 상세 정보 요청에 응답
                    |                |            특정 회원번호인 데이터만 member_const.jsp로
                    |                |- member_cont.jsp : 회원 상세 정보 확인 페이지
                    |                                    기능 : 회원수정, 회원삭제, 회원목록으로 이동
                    | - SelectServlet.java : 회원 목록 요청에 응답
                                            특정 회원번호를 받아와 삭제가 필요한 데이터만 삭제
```

## 파일 실행 링크

### - 목록 확인

- [main.jsp](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/webapp/main.jsp) : 메인 페이지
  - [SelectServlet.java](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/java/controller/SelectServlet.md) : 회원 목록 요청에 응답(데이터를 받아와 member_list.jsp에 넘김)
    - [member_list.jsp](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/webapp/view/member_list.jsp) : 회원 목록 확인 페이지<br>기능 : 회원가입, 상세 정보 보기
      - [member_join.jsp](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/webapp/view/member_join.jsp) : 회원가입 폼 페이지
        - [InsertServlet.java](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/java/controller/InsertServlet.md) : 폼페이지 입력값을 데이터베이스에 추가
          - [SelectServlet.java](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/java/controller/SelectServlet.md) : 추가가 완료되면 회원 목록 페이지로 이동

#### - 목록에서 상세정보 확인

- [main.jsp](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/webapp/main.jsp) : 메인 페이지
  - [SelectServlet.java](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/java/controller/SelectServlet.md) : 회원 목록 요청에 응답(데이터를 받아와 member_list.jsp에 넘김)
    - [member_list.jsp](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/webapp/view/member_list.jsp) : 회원 목록 확인 페이지 <br>기능 : 회원가입, 상세 정보 보기
      - [contentServlet.java](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/java/controller/ContentServlet.md) : 회원 상세 정보 요청에 응답 <br>특정 회원번호를 받아와 해당 데이터를 member_const.jsp에 넘김
        - [member_cont.jsp](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/webapp/view/member_cont.jsp) : 회원 상세 정보 확인 페이지 <br>기능 : 회원수정, 회원삭제, 회원목록으로 이동

##### - 목록에서 상세정보 확인 & 회원 수정

- [main.jsp](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/webapp/main.jsp) : 메인 페이지
  - [SelectServlet.java](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/java/controller/SelectServlet.md) : 회원 목록 요청에 응답(데이터를 받아와 member_list.jsp에 넘김)
    - [member_list.jsp](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/webapp/view/member_list.jsp) : 회원 목록 확인 페이지 <br>기능 : 회원가입, 상세 정보 보기
      - [contentServlet.java](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/java/controller/ContentServlet.md) : 회원 상세 정보 요청에 응답 <br>특정 회원번호를 받아와 해당 데이터를 member_const.jsp에 넘김
        - [member_cont.jsp](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/webapp/view/member_cont.jsp) : 회원 상세 정보 확인 페이지 <br>기능 : 회원수정, 회원삭제, 회원목록으로 이동
          - [UpdateServlet.java](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/java/controller/UpdateSerlvlet.md) : 회원 수정 요청에 응답 <br>특정 회원번호를 받아와 수정이 필요한 데이터만 member_update.jsp로
            - [member_update.jsp](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/webapp/view/member_update.jsp) : 회원 수정 폼 페이지
              - [UpdateOkServlet.java](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/java/controller/UpdateOkServlet.md) : 회원 수정 폼페이지에서 비밀번호 확인 후 데이터 수정
                - [contentServlet.java](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/java/controller/ContentServlet.md) : 데이터수정 완료 후 <br>회원 상세 정보 요청에 응답 <br>특정 회원번호인 데이터만 member_const.jsp로
                  - [member_cont.jsp](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/webapp/view/member_cont.jsp) : 회원 상세 정보 확인 페이지 <br>기능 : 회원수정, 회원삭제, 회원목록으로 이동

##### - 목록에서 상세정보 확인 & 회원 삭제

- [main.jsp](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/webapp/main.jsp) : 메인 페이지
  - [SelectServlet.java](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/java/controller/SelectServlet.md) : 회원 목록 요청에 응답(데이터를 받아와 member_list.jsp에 넘김)
    - [member_list.jsp](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/webapp/view/member_list.jsp) : 회원 목록 확인 페이지 <br>기능 : 회원가입, 상세 정보 보기
      - [contentServlet.java](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/java/controller/ContentServlet.md) : 회원 상세 정보 요청에 응답 <br>특정 회원번호를 받아와 해당 데이터를 member_const.jsp에 넘김
        - [member_cont.jsp](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/webapp/view/member_cont.jsp) : 회원 상세 정보 확인 페이지 <br>기능 : 회원수정, 회원삭제, 회원목록으로 이동
          - [DeleteServlet.java]() : 회원 삭제 요청에 응답 <br> 특정 회원번호를 받아와 삭제가 필요한 데이터만 삭제
            - [contentServlet.java](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/java/controller/ContentServlet.md) : 데이터수정 완료 후 <br>회원 상세 정보 요청에 응답 <br>특정 회원번호인 데이터만 member_const.jsp로
              - [member_cont.jsp](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/webapp/view/member_cont.jsp) : 회원 상세 정보 확인 페이지 <br>기능 : 회원수정, 회원삭제, 회원목록으로 이동

##### - 목록에서 상세정보 확인 & 회원 목록

- [main.jsp](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/webapp/main.jsp) : 메인 페이지
  - [SelectServlet.java](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/java/controller/SelectServlet.md) : 회원 목록 요청에 응답(데이터를 받아와 member_list.jsp에 넘김)
    - [member_list.jsp](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/webapp/view/member_list.jsp) : 회원 목록 확인 페이지 <br>기능 : 회원가입, 상세 정보 보기
      - [contentServlet.java](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/java/controller/ContentServlet.md) : 회원 상세 정보 요청에 응답 <br>특정 회원번호를 받아와 해당 데이터를 member_const.jsp에 넘김
        - [member_cont.jsp](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/webapp/view/member_cont.jsp) : 회원 상세 정보 확인 페이지 <br>기능 : 회원수정, 회원삭제, 회원목록으로 이동
          - [SelectServlet.java](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/java/controller/SelectServlet.md) : 회원 목록 요청에 응답 <br> 특정 회원번호를 받아와 삭제가 필요한 데이터만 삭제

## 파일 위치

- java

  - controller package

    - [ContentServlet.java](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/java/controller/ContentServlet.md)
    - [InsertServlet.java](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/java/controller/InsertServlet.md)
    - [SelectServlet.java](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/java/controller/SelectServlet.md)
    - [UpdateOkServlet.java](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/java/controller/UpdateOkServlet.md)
    - [UpdateServlet.java](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/java/controller/UpdateSerlvlet.md)

  - model package

    - [memberDAO.java](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/java/model/MemberDAO.md)
    - [memberDTO.java](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/java/model/MemberDTO.md)

- webapp

  - view

    - [member_cont.jsp](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/webapp/view/member_cont.jsp) : 회원 상세보기( 추가, 삭제, 목록 버튼 )
      - [member_join.jsp](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/webapp/view/member_join.jsp) : 회원 가입
      - [member_list.jsp](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/webapp/view/member_list.jsp) : 회원 목록
      - [member_update.jsp](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/webapp/view/member_update.jsp) : 회원 추가

  - [main.jsp](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr02_MEMBER10_%EB%AA%A9%EB%A1%9D%2C%EC%B6%94%EA%B0%80%2C%EC%88%98%EC%A0%95%2C%EC%82%AD%EC%A0%9C%2C%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0/src/main/webapp/main.jsp)
