- connect role

  - 오라클에 접속할 수 있는 세션 생성 및 테이블을 생성하거나 조회할 수 있는 가장 일반적인 권한으로 구성되어있다.
  - 사용자가 데이터베이스에 접속 가능하도록 하기 위한 권한이 있는 role을 말한다.

- resource role
  - 사용자가 테이블을 생성할 수 있도록 하기 위해서 시스템 권한을 묶어 놓은 것을 말한다. <br>
    또한, insert, update, delete 구문을 사용할 수 있는 권한을 묶어 놓은 것을 말한다.
- oracle cmd
  | 내용 | 명령문 |
  |--- | --- |  
  | sql 실행(로그인) | sqlplus |
  | sql 실행 | sqlplus / as sysdba |
  | 계정 생성 | create 유저명 identified by 비밀번호; |
  | 계정 관리자 설정 <br> 만들어진 유저 사용 목적 | grant connect, resource to 유저명; |
  | 비밀번호 변경 | alter user 유저명 identified by 변경할 비밀번호; |
  | 계정 락 풀기 | alter user 유저명 identified by 비밀번호 account unlock; |
