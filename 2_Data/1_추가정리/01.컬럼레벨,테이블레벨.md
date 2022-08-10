# Column-level / Table-level

## 1. Column-level 문법

    create table 테이블명(
         컬럼명 자료형 제약조건
       , 컬럼명 자료형 제약조건
       , name varchar(5) not null
    );

- 테이블 생성시 바로 컬럼 옆에 제약조건을 기제
- Not Null 제약조건은 column-level 문법으로 작성
- 나머지 4종류의 제약조건은 레벨문법 둘 중 하나만 쓰면 된다

- 만약 제약조건 2개 이상 작성하고 싶다면 스페이스 누르고 constraint 적은 뒤 다시 제약조건을 적으면 된다.

        create table foreign_test(
                 empno number primary key
               , ename varchar2(20) not null
               , job varchar(50) not null
               , deptno number(2) references dept(deptno)
                -- dept 테이블에 있는 deptno의 값이 들어감
                -- deptno은 dept 테이블참조키
            );

## 2. Table-level 문법

        create table 테이블명(
              컬럼명 자료형
            , 컬럼명 자료형
            , empno number
            , name varchar(5) not null
            , 제약조건(컬럼명)
            , primary key(empno)
        );

- 테이블 생성시 컬럼을 모두 정의 후 나서 마무리로 컬럼의 제약조건을 일괄적으로 지정한다.
- 하나의 테이블에 2개 이상의 기본키를 설정하는 것을 복합키라 하며, <br>
  복합키는 반드시 테이블 레벨 지정법으로 정의 해야 함

        create table foreign_test(
                      empno number
                    , ename varchar2(20) not null
                    , job varchar(50) not null
                    , deptno number(2)
                    , primary key(empno)
                    , foreign key(deptno) references dept(deptno)
                    );

## constraint 키워드

- 기본키, 외래키 제약조건 방식을 테이블레벨방식으로 테이블 생성

        create table emp77(
                  empno int
                , ename varchar(30) not null
                , sal int
                , deptno number(38)
                , constraint emp77_emptno_pk primary key(empno)
                , constraint emp77_deptno_fk foreign key(deptno) references dept71(deptno)
                -- constraint 테이블명_컬럼명_pk primary key(컬럼명)
                -- constraint 테이블명_컬럼명_fk foreign key(외래키) references 참조테이블(참조키)
        );
