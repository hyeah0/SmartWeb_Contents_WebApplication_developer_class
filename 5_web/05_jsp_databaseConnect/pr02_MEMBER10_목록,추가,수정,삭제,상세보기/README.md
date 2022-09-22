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

- [main.jsp]() : 메인 페이지
  - [SelectServlet.java]() : 회원 목록 요청에 응답(데이터를 받아와 member_list.jsp에 넘김)
    - [member_list.jsp]() : 회원 목록 확인 페이지<br>기능 : 회원가입, 상세 정보 보기
      - [member_join.jsp]() : 회원가입 폼 페이지
        - [InsertServlet.java]() : 폼페이지 입력값을 데이터베이스에 추가
          - [SelectServlet.java]() : 추가가 완료되면 회원 목록 페이지로 이동

#### - 목록에서 상세정보 확인

- [main.jsp]() : 메인 페이지
  - [SelectServlet.java]() : 회원 목록 요청에 응답(데이터를 받아와 member_list.jsp에 넘김)
    - [member_list.jsp]() : 회원 목록 확인 페이지 <br>기능 : 회원가입, 상세 정보 보기
      - [contentServlet.java]() : 회원 상세 정보 요청에 응답 <br>특정 회원번호를 받아와 해당 데이터를 member_const.jsp에 넘김
        - [member_cont.jsp]() : 회원 상세 정보 확인 페이지 <br>기능 : 회원수정, 회원삭제, 회원목록으로 이동

##### - 목록에서 상세정보 확인 & 회원 수정

- [main.jsp]() : 메인 페이지
  - [SelectServlet.java]() : 회원 목록 요청에 응답(데이터를 받아와 member_list.jsp에 넘김)
    - [member_list.jsp]() : 회원 목록 확인 페이지 <br>기능 : 회원가입, 상세 정보 보기
      - [contentServlet.java]() : 회원 상세 정보 요청에 응답 <br>특정 회원번호를 받아와 해당 데이터를 member_const.jsp에 넘김
        - [member_cont.jsp]() : 회원 상세 정보 확인 페이지 <br>기능 : 회원수정, 회원삭제, 회원목록으로 이동
          - [UpdateServlet.java]() : 회원 수정 요청에 응답 <br>특정 회원번호를 받아와 수정이 필요한 데이터만 member_update.jsp로
            - [member_update.jsp]() : 회원 수정 폼 페이지
              - [UpdateOkServlet.java]() : 회원 수정 폼페이지에서 비밀번호 확인 후 데이터 수정
                - [contentServlet.java]() : 데이터수정 완료 후 <br>회원 상세 정보 요청에 응답 <br>특정 회원번호인 데이터만 member_const.jsp로
                  - [member_cont.jsp]() : 회원 상세 정보 확인 페이지 <br>기능 : 회원수정, 회원삭제, 회원목록으로 이동

##### - 목록에서 상세정보 확인 & 회원 삭제

- [main.jsp]() : 메인 페이지
  - [SelectServlet.java]() : 회원 목록 요청에 응답(데이터를 받아와 member_list.jsp에 넘김)
    - [member_list.jsp]() : 회원 목록 확인 페이지 <br>기능 : 회원가입, 상세 정보 보기
      - [contentServlet.java]() : 회원 상세 정보 요청에 응답 <br>특정 회원번호를 받아와 해당 데이터를 member_const.jsp에 넘김
        - [member_cont.jsp]() : 회원 상세 정보 확인 페이지 <br>기능 : 회원수정, 회원삭제, 회원목록으로 이동
          - [DeleteServlet.java]() : 회원 삭제 요청에 응답 <br> 특정 회원번호를 받아와 삭제가 필요한 데이터만 삭제
            - [contentServlet.java]() : 데이터수정 완료 후 <br>회원 상세 정보 요청에 응답 <br>특정 회원번호인 데이터만 member_const.jsp로
              - [member_cont.jsp]() : 회원 상세 정보 확인 페이지 <br>기능 : 회원수정, 회원삭제, 회원목록으로 이동

##### - 목록에서 상세정보 확인 & 회원 목록

- [main.jsp]() : 메인 페이지
  - [SelectServlet.java]() : 회원 목록 요청에 응답(데이터를 받아와 member_list.jsp에 넘김)
    - [member_list.jsp]() : 회원 목록 확인 페이지 <br>기능 : 회원가입, 상세 정보 보기
      - [contentServlet.java]() : 회원 상세 정보 요청에 응답 <br>특정 회원번호를 받아와 해당 데이터를 member_const.jsp에 넘김
        - [member_cont.jsp]() : 회원 상세 정보 확인 페이지 <br>기능 : 회원수정, 회원삭제, 회원목록으로 이동
          - [SelectServlet.java]() : 회원 목록 요청에 응답 <br> 특정 회원번호를 받아와 삭제가 필요한 데이터만 삭제

## 파일 위치

- java

  - controller package

    - ContentServlet.java
    - InsertServlet.java
    - SelectServlet.java
    - UpdateServlet.java

  - model package

    - memberDAO.java
    - memberDTO.java

- webapp

  - view

    - member_cont.jsp : 회원 상세보기( 추가, 삭제, 목록 버튼 )
      - member_join.jsp : 회원 가입
      - member_list.jsp : 회원 목록
      - member_update.jsp : 회원 추가

  - main.jsp
