## day02_20220805

1. where
2. like
3. order by
4. not
5. group 함수
6. sequence

### 1. where 조건절

- 모든 데이터를 가져오는 것이 아니라 사용자가 원하는 데이터만 가져온다.
- 데이터 조회시 사용
- where 조건절은 자료를 필터링 할 때 사용되는 키워드장
- where 조건절은 from 테이블이름 뒤에 기술해야한다.
- 형식)

        select 컬럼명
             , 컬럼명
             , ...
             , 컬럼명
        from 테이블명
        where 조건식

### - 조건

1. = : 조건이 같은지
2. < : 조건이 작은지
3. <= : 조건이 작거나 같은지
4. \> : 조건이 큰지
5. \>= : 조건이 크거나 같던지
6. != : 조건이 같지 않은지
7. <> : 조건이 같지 않은지
   - != 과 같은 의미이다.
8. between A and B : a와 b사이에 있는가?
   - 주의) 작은 값을 앞에 기술하고 큰값을 뒤에 기술한다.
9. in(list) : list 값 중에 어느하나와 일치 하는지
10. not between A and B : a와 b 사이에 있지 않다. (a,b 값을 포함하지 않다.)
11. not in(list) : list 값과 일치하지 않다.
12. A is not null : A는 null이 아니다.

### 2. like 키워드

- 검색시 사용
- % : 만능 문자
- \_ : 글자대체

1.  where ename like '%s%'
    - '%s%' : ename 컬럼에 s자를 포함하는 사원의 이름 검색
2.  where ename like 's%'
    - 맨앞에 s가 포함되는 사원의 이름 출력
3.  where ename like '%s'
    - 맨뒤에 s가 포함되는 사원의 이름 출력
4.  where ename like '\_s%'
    - 두번째 글자에 s가 포함되는 사원의 이름을 출력

### 3. order by 절

- 자료를 정렬하여 나타낼때 사용하는 명령문
- order by 절을 사용할 대는 Select 구문의 가장 끝에 위치한다
- asc : 오름차순
- desc : 내림차순
- 기본적으로 order by는 오름차순이 default 이다.
- 오름차순일 경우 asc를 생략해도 된다.

### 4. not 키워드

- 쿼리문 작성시 긍정문 작성후 앞에 not을 붙여 부정문으로 만든다.
- ~일경우 출력 --> ~가 아닐경우 출력
- 기호표시의 부정은 where not 을 쓴다.

  - 예시

          select products_name, output_price
            from products
            where not output_price < 1000000;

### 5. group : 그룹함수

- 여러행 또는 테이블 전체에 대하여 함수가 적용되어 하나의 결과값을 가져오는 함수

1. avg(컬럼명) : 평균값 구하기
2. count(컬럼명) : 갯수 구하기
   - null 값은 카운트 되지 않는다.
3. max(컬럼명) : 해당 컬럼의 최대값
4. min(컬럼명) : 해당 컬럼의 최소값
5. sum(컬럼명) : 총 합을 구하는 함수

#### 그룹함수 예시

emp 테이블에서 등록되어 있는 <br>
사원의 총 수, 보너스가 null 이 아닌 인원수, 보너스의 평균, <br>
등록되어 있는 부서의 수를 화면에 출력

        select count(*) as "사원수"
            , count(comm) as "보너스 수령"
            , avg(comm) as "보너스 평균"
            , count(distinct deptno) as "부서의 수"
        from emp;

### 6. 시퀀스(sequence)

- 순서를 부여할때 사용하는 문법
- 연속적인 번호를 만들어 준다.
- 단, 중간에 번호 하나가 지워졌을때 다른 번호가 앞당겨지지 않는다.

- 예) 게시판 글 순서
- 형식)

        create sequence 시퀀스명
                  start with n(시작번호 설정 _ 기본값 : 1)
              increment by n(증가번호 설정 _ 기본값 : 1)
               maxvalue n(시퀀스 최대 번호 설정)
               minvalue n(시퀀스 최소 번호 설정)
                  cache / no cache (캐쉬 메모리 사용 여부)
                        1) cache : 시퀀스를 빨리 제공하기 위해 미리 캐쉬 메모리에 시퀀스를 넣어두고,
                                    준비하고 있다가 시퀀스 작업이 필요할 때 사용을 한다.
                                    default - 20개의 시퀀스를 캐쉬메모리에 보관하게 한다.
                                    - 문제 : 20개의 캐쉬메모리가 다 사용이 되지 않고 재부팅시
                                    기존의 캐쉬들이 사라진다.
                                    만약 10개만 사용하고 재부팅 하면, 다음날 21부터 시작한다.
                        2) nocahe : cache 기능을 사용하지 않겠다는 의미

- 예시)

        create sequence memo_seq
                start with 1
            increment by 1
                nocache;

#### 6. 시퀀스 사용 예시

- memo 테이블 생성

            create table memo(
                bunho number(5) primary key, 
                title varchar2(100) not null,
                writer varchar2(50) not null,
                cont varchar2(1000) not null,
                regdate date
            );

- memo 테이블 이용시 사용할 시퀀스 생성
 
            create sequence memo_seq
                      start with 1
                  increment by 1
                    nocache;
            
- memo 테이블에 데이터 저장

            insert into memo values(memo_seq.nextval, '메모1', '홍길동', '길동이 메모', sysdate);
            insert into memo values(memo_seq.nextval, '메모2', '이ㅇㅇ', '이씨의 메모', sysdate);
            insert into memo values(memo_seq.nextval, '메모3', '김ㅇㅇ', '김씨의 메모', sysdate);
            insert into memo values(memo_seq.nextval, '메모4', '배ㅇㅇ', '배씨의 메모', sysdate);
            insert into memo values(memo_seq.nextval, '메모5', '오ㅇㅇ', '오씨의 메모', sysdate);

- 첫번째열은 시퀀스로 중복되지 않은 연속적인 번호가 만들어진다

- 결과
 
|bunho | title | writer | con |   regdate|
| ---- | ---- |---- |---- |---- |
| 1 | 메모1 | 홍길동 | 길동이 메모 | 2022-08-05 |
| 2 | 메모2 | 이ㅇㅇ | 이씨의 메모 | 2022-08-05 |
| ....................................... |
| 5 | 메모5 | 오ㅇㅇ | 오씨의 메모 | 2022-08-05 |
