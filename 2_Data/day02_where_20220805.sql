/*
    day02_20220805
    오전 
        1. where
        2. like
        3. order by
        4. not
        
        5. connect roll / resource roll / cmd
        6. group 함수
        7. sequence 
        8. 제약조건
        
        
*/

/*
     ctrl + s : 저장
     ctrl + enter : 실행     
*/

/*
  select 
      from
     where
     group by
     having 
     order by
*/

/*
 중요
 - where 조건절
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
*/

/*
 1) = : 조건이 같은지
 2) < : 조건이 작은지
 3) <= : 조건이 작거나 같은지
 4) > : 조건이 큰지
 5) >= : 조건이 크거나 같던지
 6) != : 조건이 같지 않은지
 7) <> : 조건이 같지 않은지 
      - != 과 같은 의미이다.
 8) between A and B : a와 b사이에 있는가? 
      - 주의) 작은 값을 앞에 기술하고 큰값을 뒤에 기술한다.
 9) in(list) : list 값 중에 어느하나와 일치 하는지
 10) not between A and B : a와 b 사이에 있지 않다. (a,b 값을 포함하지 않다.)
 11) not in(list) : list 값과 일치하지 않다.
*/

select *
  from emp;
  
-- emp 테이블에서 담당업무가 'menager' 인 사원의 모든 정보를 출력하세요
select *
  from emp
 where job = 'MANAGER';
  
-- emp 테이블에서 담당업무가 '' 인 사원의 모든 정보를 출력하세요  
select *
  from emp
 where job = 'SALESMAN';

-- [문제1] emp 테이블에서 담당업무가 'clerk' 인 사원의 사번, 이름, 담당업무, 급여를 화면에 보여주세요
select empno
     , ename
     , job
     , sal
  from emp
  where job = 'CLERK';
  
-- [문제2] emp 테이블에서 1982/1/1 월 이후에 입사한 사원의 사번, 이름, 담당업무, 급여, 입사일자를 화면에 보여주세요
-- 날짜형 어떻게 where절로 찾아야하는지 확인 필
select empno
     , ename
     , job
     , sal
     , hiredate
  from emp
  where hiredate > '82/1/1';

-- [문제4] emp 테이에서 사번이 7902, 7788, 7566 인 사원의 사번 이름 담당업무를 화면에 보여주세요
select empno
     , job
  from emp
  where empno in (7902, 7799, 7566);

-- [문제5] emp 테이블에서 보너스가 300 이거나 500 이거나 1400 인 사원의 모든 정보를 화면에 보여주세요
select *
  from emp
  where comm between 300 and 500 
     or comm = 1400;

-- [문제6] member10 테이블에서 이름이 홍길동이면서 직업이 학생인 회원의 모든 정보를 화면에 보여주세요
select 
  from 
  where ;


-- [문제7] products 테이블에서 제조사가 '삼성' 또는 '현대' 이면서 입고가가 100만원 이하인 상품의 상품명과 입고가, 출고가를 화면에 보여주세요
select products_name
     , input_price
     , output_price
  from products 
 where company in('삼성', '현대')
   and input_price <= 1000000;

  where company = '삼성'
     or company = '현대'


-- [문제8] emp 테이블에서 급여가 1100 이상이고, 담당업무가 'manager' 인 사원의 사번, 이름, 담당업무, 급여를 화면에 보여주세요.
select empno
     , ename
     , job
     , sal
  from emp
 where sal > 1100
   and job = 'MANAGER';
  
/*
    중요!
    like 키워드 : 검색키워드 
*/

/*
     1) where ename like '%s%' 
       - '%s%' : ename 컬럼에 s자를 포함하는 사원의 이름 검
     2) where ename like 's%'
       - 력맨앞에 s가 포함되는 사원의 이름 출
     3) where ename like '%s'
       - 맨뒤에 s가 포함되는 사원의 이름 출력
     4) where ename like '_s%'
       - 두번째 글자에 s가 포함되는 사원의 이름을 출력
*/

-- emp테이블에서 사원명에 A라는 글자를 포함하는 사원의 모든 정보 출력
-- 사원명에 M 이라는 글자를 포함하는 사원의 모든정보 출력
    select *
      from emp 
  -- where ename like '%A%';
     where ename like '%M%';
 
-- emp 테이블에 사원명의 두번째 글자에 i라는 글자를 포함하는 사원의 모든정보 출력
    select *
      from emp
     where ename like '_I%';

-- [문제1] emp 테이블에서 이름이 's' 자로 끝나는 사원의
-- 사번 이름, 담당업무, 부서번호 화면에 보여주세요
    select ename, job, deptno
      from emp
      where ename like '%S';

-- [문제2] emp 테이블에서 이름이 세번째 글자가 'r' 이 들어가는
-- 사원의 이름과 담당업무 급여를 화면에 보여주세요
    select ename, job, sal
      from emp
      where ename like '__R%';

-- [문제3] emp 테이블에서 이름의 두번째 글자가 'o'인 
-- 사원의 모든 정보를 화면에 보여주세요
    select *
      from emp
     where ename like '_O%'; 

-- [문제4] emp 테이블에서 입사년도가 82년도인 사원의 
-- 사번, 이름, 담당업무, 입사일자를 화면에 보여주세요
    select empno
         , ename
         , job
         , hiredate
      from emp
     where hiredate like '82/%/%';

-- [문제5] member10 테이블에서 성이 '김'씨인 회원의
-- 모든정보를 화면에 보여주세요
    select *
      from member10
     where memname like '김%';

-- [문제6] member10 테이블에서 주소에 '서울시'가 들어가는
-- 회원의 이름, 주소, 직업을 화면에 보여주세요
    select memname, addr, job
      from member10
     where addr like '서울시%';

-- [문제7] products 테이블에서 제품명에 '에어컨'을 포함하는 
-- 제품의 제품명, 입고가, 출고가, 제조사를 화면에 보여주세요.
    select products_name, input_price, output_price, company
      from products 
     where products_name like '%에어컨%';

/*
    - 중요!
    - order by 절
    - 자료를 정렬하여 나타낼때 사용하는 명령문
    - order by 절을 사용할 대는 Select 구문의 가장 끝에 위치한다
    - asc : 오름차순
      desc : 내림차순
      기본적으로 order by는 오름차순이 default 이다.
      ( 오름차순 : 1,2,3 가, 나, 다)
      오름차순일 경우 asc를 생략해도 된다.
*/

-- member10 테이블에서 이름 기준으로 오름차순으로 정렬하여 화면에 출력
-- 단, 동명이인 경우 나이 기준으로 내림차순으로 정렬
     select * 
      from member10
      order by memname 
             , age desc;
     
-- [문제1] emp 테이블에서 부서번호를 기준으로 오름차순으로 정렬 후
-- 부서번호가 같은경우는 급여를 기준으로 내림차순 정렬
    select *
      from emp
      order by deptno 
             , sal desc;

-- [문제2] products 테이블에서 판매가격 기준으로 내림차순으로 정렬
-- 모든정보를 화면에 출력
    select *
      from products
     order by output_price desc;

-- [문제3] products 테이블에서 배송비를 기준으로 내림차순으로 정렬
-- 단, 배송비가 같은 경우 마일리지를 기준으로 내림차순으로 정렬하여 
-- 모든 정보를 화면에 출력
    select *
      from products 
     order by trans_cost desc , mileage desc;

-- [문제4] emp 테이블에서 입사일자가 오래된 사원부터 최근에 입사한 사원을
-- 기준으로 정렬을 하되, 사원명, 입사일자를 화면에 출력
    select ename, hiredate
      from emp
     order by hiredate;

-- [문제5] emp 테이블에서 급여를 기준으로 내림차순으로 정렬을 하여 모든 정보 출력
    select *
      from emp
     order by sal desc;

-- [문제6] emp 테이블에서 급여가 1100 이상인 사원들의 정보를 보여주되, 
-- 입사일자가 빠른순으로 정렬하여 화면에 출력
    select *
      from emp
     where sal >= 1100
     order by hiredate;

-- [문제7] emp 테이블에서 부서번호를 기준으로 오름차순 정렬하여 나타내고, 
-- 부서번호가 같은경우 담당업무를 오름차순으로 정렬
-- 만약 담당업무가 같을경우 급여가 많은데서 적은 순으로 정렬하여 모든 정보를
-- 화면에 출력
    select *
      from emp
     order by deptno, job
            , sal desc;

/*
    not 키워드
    - 쿼리문 작성시 긍정의 쿼리문 생성후 not 만 붙여주면 부정이 된다.
*/

-- emp 테이블에서 담당업무가 'manager', 'clerk', 'analyst' 가아닌 사원의
-- 사번, 이름, 담당업무, 급여를 화면에 출력
    select empno
         , ename
         , job
         , sal
      from emp
      where job not in('MANAGER','CLERK','ANALYST');

-- [문제] emp 테이블에서 이름에 's'자가 들어가지 않는 사원의
-- 사원의 이름과 담당업무를 화면에 출력
    select ename, job
      from emp
     where ename not like '%S%';

-- [문제] emp 테이블에서 부서번호가 10번이 아닌 
-- 사원의 이름, 담당업무, 부서번호를 화면에 출력
    select ename, job, deptno
      from emp
     where deptno != 10;
  -- where deptno <> 10;
  -- where deptno not in 10;
    
-- [문제] member10 테이블에서 주소가 '서울시' 가아닌 
-- 회원의 모든 정보를 화면에 출력
    select * 
      from member10
     where addr not like '%서울시%';

-- [문제] products 테이블에서 출고가가 100만원 미만이 아닌
-- 제품의 상품명과 출고가를 화면에 출력
    select products_name, output_price
      from products 
     where not output_price < 1000000;

-- [문제] emp 테이블에서 보너스가 null 이 아닌 
-- 사원의 모든 정보를 화면에 출력
    select *
      from emp
     where comm is not null;

------------------------------------------------------------------------------------------------------------
/*

    - connect role 
        - 오라클에 접속할 수 있는 세션 생성 및 테이블을 생성하거나 조회할 수 있는 가장 일반적인 권한으로 구성되어있다.
        - 사용자가 데이터베이스에 접속 가능하도록 하기 위한 권한이 있는 role을 말한다.
        
    - resource role
        - 사용자가 테이블을 생성할 수 있도록 하기 위해서 시스템 권한을 묶어 놓은 것을 말한다.
          또한, insert, update, delete 구문을 사용할 수 있는 권한을 묶어 놓은 것을 말한다.
          
    - oracle cmd 
        - 계정 생성 : create 유저명 identified by 비밀번호;
        - 계정 관리자 설정 : grant connect, resource to 유저명;
            - ㄴ 만들어진 유저를 사용하기 위한 명령어
            
        - 비밀번호 변경 : alter user 유저명 identified by 비밀번호;
        - 계정 락 풀기 : alter user 유저명 identified by 1234 account unlock;
          
*/

/*

    group : 그룹함수
        - 여러행 또는 테이블 전체에 대하여 함수가 적용되어 하나의 결과값을 가져오는 함수
        
        1. avg(컬럼명)   : 평균값 구하기
        2. count(컬럼명) : 갯수 구하기 
                         - null 값은 카운트 되지 않는다.
        3. max(컬럼명)   : 해당 컬럼의 최대값
        4. min(컬럼명)   : 해당 컬럼의 최소값
        5. sum(컬럼명)   : 총 합을 구하는 함수

*/

     select comm
          , count(comm)
       from emp
      group by comm;
     
-- emp 테이블에서 사번을 가지고 있는 모든 사원의 수를 화면에 출력
    select count(empno)  
 -- select count(*)
      from emp;
    
-- [문제1] emp 테이블에서 관리자(mgr)의 수를 화면에 출력
    select count(distinct mgr)
      from emp;

-- [문제2] emp 테이블에서 보너스를 가진 사원의 수를 화면에 출력
    select count(comm)
      from emp;
      
     where comm is not null;

-- [문제3] emp 테이블에서 모든 Salesman의 
-- 급여 평균과 급여 최고액, 최소액, 합계액을 화면에 출력
    select avg(sal) as "평균"
         , max(sal) as "최고액"
         , min(sal) as "최소액"
         , sum(sal) as "합계"
      from emp
     where job = 'SALESMAN'; 

-- [문제] emp 테이블에서 등록되어 있는 
-- 사원의 총 수, 보너스가 null 이 아닌 인원수, 보너스의 평균, 
-- 등록되어 있는 부서의 수를 화면에 출력
    
    select count(*) as "사원수" 
         , count(comm) as "보너스 수령"
         , avg(comm) as "보너스 평균"
         , count(distinct deptno) as "부서의 수"
      from emp;

/*
    시퀀스(sequence)
        - 순서를 부여할때 사용하는 문법
        - 연속적인 번호를 만들어 준다.
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
*/

-- memo 테이블 생성
    create table memo(
        bunho number(5) primary key, 
        title varchar2(100) not null,
        writer varchar2(50) not null,
        cont varchar2(1000) not null,
        regdate date
    );

-- memo 테이블 이용시 사용할 시퀀스 생성
    create sequence memo_seq
              start with 1
          increment by 1
            nocache;
            
-- memo 테이블에 데이터 저장
    insert into memo values(memo_seq.nextval, '메모1', '홍길동', '길동이 메모', sysdate);
    insert into memo values(memo_seq.nextval, '메모2', '이ㅇㅇ', '이씨의 메모', sysdate);
    insert into memo values(memo_seq.nextval, '메모3', '김ㅇㅇ', '김씨의 메모', sysdate);
    insert into memo values(memo_seq.nextval, '메모4', '배ㅇㅇ', '배씨의 메모', sysdate);
    insert into memo values(memo_seq.nextval, '메모5', '오ㅇㅇ', '오씨의 메모', sysdate);

/*    
-- 키 제약조건
    - 테이블에 부적합한 자료가 입력되는 것을 방지하기 위해 테이블을 생성할 때 
      각 컬럼에 대해서 정의하는 여러가지 규칙을 정한것을 말한다.

    1) unique 제약조건
        - 열에 저장할 데이터의 중복을 허용하지 않고자 할때 사용하는 제약조건
        - null 값은 허용한다.
        
    2) not null 제약조건
        - null 값이 입력 되지 못하게 하는 제약 조건 
        - 특정 열 상관 없이 null 값이 들어가면 안된다.
        
    3) check 제약조건
        - 열의 저장할 수 있는 값의 범위 또는 패턴을 정의 할때 사용되는 제약조건
    
    4) primary key 제약조건 (기본키)
        - 테이블에 하나만 존재해야한다
        
    5) foreign key 제약조건 (외래키)
        - 다른 테이블 필드(컬럼)를 참조해서 무결성을 검사하는 제약 조건
        - 참조키 : 부모테이블의 컬럼을 이야기 한다.
        - 외래키 : 자식테이블의 컬럼을 이야기 한다.
        - 자식테이블의 컬럼 값(데이터)이 부모테이블에 없는경우 무결성의 규칙이 깨져버린다.
        - 외래키가 존재하기 위해 우선적으로 부모테이블이 먼저 생성되어야한다.
        - 옵션 
            * on delete cascade  : 부모의 컬럼 데이터를 삭제시 자식의 데이터도 삭제된다. 
            * on delete set null : 부모의 컬럼 데이터를 삭제시 자식의 데이터는 null 값이 된다.

*/

-- not null 제약조건 테스트
    create table null_test(
            col1 varchar2(10) not null,
            col2 varchar2(10) not null,
            col3 varchar2(10) 
    );
    
    insert into null_test values('aa1','aa2','aa3');
    insert into null_test(col1, col2) values ('bb1','bb2');
    insert into null_test(col1, col2) values ('cc1',''); 
-- col2 는 not null 제약조건으로 Null 값이 들어갈 수 없다.
-- Error report -
-- ORA-01400: cannot insert NULL into ("ADMIN"."NULL_TEST"."COL2")

-- unique 테스트
    create table unique_test(
            col1 varchar2(10) unique,
            col2 varchar2(10) unique,
            col3 varchar2(10) not null,
            col4 varchar2(10) not null
    );
    
    insert into unique_test values('aa1','aa2','aa3','aa4');
    insert into unique_test values('aa1','b','aa3','aa4');

-- 외래키 테스트
    create table foreign_test(
        empno number primary key,
        ename varchar2(20) not null,
        job varchar(50) not null,
        deptno number(2) references dept(deptno)
        -- 참조 dept 테이블에 있는 deptno의 값이 들어감 
        -- deptno은 dept 테이블참조키
    );
    
    insert into foreign_test values(1111, '홍길동', '영업부', 30);
    insert into foreign_test values(1112, '배ㅇㅇ', '회계부', 10);
    insert into foreign_test values(1113, '길ㅇㅇ', '기획부', 50); -- 부모테이블의 해당 컬럼에 50 값이 없다.
    
-- check 테스트
    create table check_test(
        gender varchar2(6) constraint gender_ck check(gender in('남자','여자'))
    );
    
    insert into check_test values('남자');
    insert into check_test values('여자');
    insert into check_test values('달팽이');
    
    