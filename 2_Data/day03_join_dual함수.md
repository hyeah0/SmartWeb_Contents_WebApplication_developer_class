## day03_20220808

1. join 이란??
2. cross, equi, self, outer join
3. dual 테이블
4. 서브쿼리
5. group by

### 1. join on 키워드

- 테이블과 테이블을 연결하여 특정한 데이터를 얻고자 할때 사용
- 두개 이상의 테이블의 정보가 나뉘어 져있을때 사용
- 중복해서 데이터가 저장되는 것을 막기 위한다.
- 두개의 테이블로 나누어진 경우에는 데이터의 중복은 발생하지 않지만, 원하는 정보를 얻으려면
  여러번의 질의를 해야하는 불편함이 발생한다.
- 특정 사원이 소속된 부서의 부서명을 알고 싶은경우에는 emp 테이블과 dept 테이블을 넘나드는 작업이 생기므로 상당히 불편하다. <br>
  그래서 두개의 테이블을 결합해서 원하는 결과를 얻어낼 수 있도록 조인이라는 기능이 생겼다.

### 2. 조인의 종류

1.  cross join
2.  equi join / inner join
3.  self join
4.  outer join

#### 1. cross join

- 두 개 이상의 테이블이 조인할 때 조건없이 테이블의 결합이 이루어지는 조인
- 테이블 상호간에 연결 될 수 잇는 모든 경우의 수를 산출하여 나타내는 조인이다. <br>
  그렇기 때문에 테이블 전체 행의 컬럼(열)이 조인이 된다.
- 동일한 내용이 반복될 수 있다.(데이터 복제에 많이 사용)
- 현재 사용 안됨

#### 2. equi join / inner join

- 가장 많이 사용되는 조인 방법
- 조인의 대상이 되는 두 테이블에서 공통적으로 존재하는 컬럼의 값이 일치되는 행을 연결하여 결과를 생성하는 방법.
- 두 테이블이 조인을 하려면 일치되는 공통 행이 있어야한다.

##### - equi join 과 inner join의 차이점

- equi join

  - 형태)

          select 컬럼
            from 테이블1, 테이블2
           where (테이블1의)컬럼명=(테이블2의)컬럼명
             and 조건식;

- inner join (inner 생략가능)

  - 형태)

        select 컬럼명
          from 테이블1
         inner join 테이블2
            on 테이블1.컬럼명 = 테이블2.컬럼명
         where 조건식 ;

#### 3. self join

- 자기 자신을 조인한다.
- 하나의 테이블 내에서 조인을 해야 자료를 얻을 수 있는데, <br>
  말 그대로 자기 자신 테이블이 조인을 맺는 것을 말한다.
- from절 다음에 테이블 이름을 나란히 두번 기술 할 수 없다. <br>
  따라서 같은 테이블이 하나 더 존재하는 것처럼 사용할 수 있도록 테이블에 별칭을 붙여서 사용해야 한다.

#### 4. full outer join / left outer, right outer

- 2개 이상의 테이블이 조인이 될 때 어느 한쪽 테이블에는 해당되지 않는 경우 <br> 그 데이터가 출력이 되지 않는 문제점을 해결 하기 위해 사용되는 조인 기법
- 정보가 부족한 테이블의 컬럼뒤에 '(+)' 기호를 붙여 사용된다.

### 예시

#### 1. cross join

- emp, dept 모두 확인 가능 (중복데이터 발생)

        select *
        from emp, dept;

#### 2. equi join(inner join)

- emp 테이블에서 사원의 사번, 이름, 담당업무, 부서번호 및 부서명, 근무위치를 화면에 보여주세요.
- emp 테이블과 dept 테이블을 조인시켜 주어야 한다.
- equi join

        select empno, e.ename, e.job
            , d.deptno, d.dname, d.loc
            - 별칭 생략가능(동일한 컬럼명이 아니라면)
         from emp e, dept d
        where e.deptno = d.deptno;

        -- equi join
        select e.ename
            , d.deptno, d.dname
         from emp e, dept d
        where e.deptno = d.deptno
          and e.ename = 'SCOTT';

        -- inner join
        select ename, e.deptno, dname
          from emp e
         inner join dept d
            on e.deptno = d.deptno
         where ename = 'SCOTT';

#### 3. self join

- emp 테이블에서 각 사원별 관리자의 이름을 화면에 출력해 보자
- 예시) clerk 의 매니저 이름은 king 입니다.
- mgr = 매니저 번호 / empno = 사번

        select e1.ename || '의 매니저 이름은 ' || e2.ename || ' 입니다.'
         from emp e1
         join emp e2
           on e1.mgr = e2.empno;

#### 4. outter join

        ----------------------------------------
        -- full outer join --

        select e1.ename, e1.job, e1.mgr
          from emp e1
          full outer join emp e2
            on e1.mgr = e2.empno;

        ----------------------------------------
        -- right outer join --
        -- 1. +기호 사용
        -- + 기호는 행이 부족한 곳에 기호를 붙인다

        select e.ename
             , d.deptno, d.dname
         from emp e
         join dept d
           on e.deptno(+) = d.deptno;

        -- 2. right outer join
        -- 공통된 행중 from 테이블에는 없지만
           join 테이블에는 있으면 right outer
        -- 공통된 행중 from 테이블에는 있지만
           join 테이블에는 없으면 left outer

        select e.ename
             , d.deptno, d.dname
          from emp e
         right outer join dept d
            on e.deptno = d.deptno;
        ----------------------------------------
        -- left outer join --
        select e1.ename, e1.job, e1.mgr
         from emp e1
         join emp e2
           on e1.mgr = e2.empno(+);

        select e1.ename, e1.job, e1.mgr
          from emp e1
          left outer join emp e2
            on e1.mgr = e2.empno;

### 3. dual 테이블

- 오라클에서 자체적으로 제공해주는 테이블
- 간단하게 함수를 이용해서 계산, 결과 값을 확인할때 사용하는 테이블
- 사용용도
  - 특정 테이블을 생성할 필요 없이 함수 또는 계산을 하고자 할때 사용한다.

#### - 오라클에서 제공해 주는 함수들

##### 1. 날짜와 관련된 함수들

| 함수                              | 설명                                                |
| --------------------------------- | --------------------------------------------------- |
| sysdate                           | 현재 시스템 날짜                                    |
| add_months(현재날짜, 숫자(개월수) | 현재날짜에서 개월수를 더해주는 함수                 |
| next_day(현재날짜, '요일')        | 다가올 날짜(요일)을 구해주는 함수                   |
| to_char(날짜, '날짜형식')         | 날짜 형식에 맞춰 문자열로 날짜를 출력해주는 함수    |
| months_between(날짜1, 날짜2)      | 두 날짜 사이의 개월 수를 출력                       |
| last_day()                        | 주어진 날짜가 속한 달의 마지막 날짜를 변환하는 함수 |

##### 2. 문자와 관련된 함수들

| 함수                                                  | 설명                                       |
| ----------------------------------------------------- | ------------------------------------------ |
| concat()                                              | 문자열 결합                                |
| upper()                                               | 소문자를 대문자로 변경                     |
| lower()                                               | 대문자를 소문자로 변경                     |
| substr('문자열', x, y)                                | 문자열을 x부터 y길이 만큼 추출해 내는 함수 |
| lpad('문자열','전체자릿수','늘어난 자릿수')           | 왼쪽자릿수를 늘려주는 함수                 |
| rpad()                                                | 오른쪽 문자를 지워주는 함수                |
| ltrim()                                               | 왼쪽 문자를 지워주는 함수                  |
| rtrim()                                               | 오른쪽 문자를 지원주는 함수                |
| replace('원본문자열','교체될 문자열','새로운 문자열') | 문자열을 교체해주는 함수                   |

##### 3. 숫자와 관련된 함수들

| 함수                                | 설명                                                         |
| ----------------------------------- | ------------------------------------------------------------ |
| abs(정수)                           | 절대값을 구하는 함수                                         |
| sign(정수)                          | 양수(1), 음수(-1), 0을 반환해주는 함수                       |
| round(실수(필수), 반올림위치(선택)) | 음수값을 지정하면 자연수(정수) 쪽으로 한자리씩 위로 반올림함 |
| truc(숫자(필수), 버릴위치(선택))    | 소수점 이하 자릿수를 삭제                                    |
| ceil()                              | 무조건 올림을 해주는 함수                                    |
| power()                             | 제곱을 구해주는 함수                                         |
| mod(나눗셈될 숫자, 나눌숫자)        | 나머지를 구해주는 함수                                       |
| sqrt()                              | 제곱근을 구해주는 함수                                       |

#### 예시

##### 1. 날짜와 관련된 함수들

        select sysdate as today -- 2022/08/08
            , add_months(sysdate,3) as after_3Month -- 2022/11/08
            , next_day(sysdate,'fri') as dateOfFri -- 2022/08/12
            , next_day(sysdate,'mon') as dateOfFri -- 2022/08/15
            , to_char(sysdate,'yy-mm-dd') as today_txt -- 22-08-08
            , round(months_between('2022/12/31',sysdate)) as rest_Month -- -5 현재날짜로부터 12.31일까지 남은 개월수
            , last_day(sysdate) as lastday -- 2022/08/31
        from dual;

##### 2. 문자와 관련된 함수들

        select concat('안녕', '하세요') as concat1         -- 안녕하세요
            , 'hello' || ' world' as concat2           -- hello world
            , upper('happy') as upper                  -- HAPPY
            , lower('APPLE') as lower                  -- apple
            , substr('abcdefg',3,2) as substr1         -- cd
            , substr('abcdefg',-3,2) as substr2        -- ef (-붙을경우 뒤에서부터 n번째 자리부터)
            , lpad('abcdefg',15,'*') as lpad           -- ********abcdefg
            , rpad('abcdefg',15,'*') as rpad           -- abcdefg********
            , ltrim('abcdefg','a') as ltrim            -- bcdefg
            , rtrim('abcdefg','g') as rtrim            -- abcdef
            , replace('java program','java','jsp')     -- jsp grogram
        from dual;

##### 3. 숫자와 관련된 함수들

        select abs(-23) as abs                                              -- 23
            , sign(15)|| ',' || sign(-15)|| ',' || sign(0) as sign         -- 1, -1, 0
            , round(1.4)|| ',' ||round(1.5) as round1                      -- 1,2
            , round(1.104556,2) as round2                                  -- 1.1 소수점 두번째 자리에서 반올림
            , round(123.4567,-1) as round3                                 -- 120 양수값 첫번째 자리에서 반올림
            , trunc(1234.5678,0) as trunc1                                 -- 1234
            , trunc(1234.5678,2) || ',' || trunc(1234.5678,-2) as trunc2   -- 1234.56, 1200
            , ceil(22.1) as ceil                                           -- 23
            , power(4,3) as power                                          -- 64
            , mod(17,7) as mod                                             -- 3
            , round(sqrt(3),3) as sqrt                                     -- 1.732
        from dual;

### 4. 서브쿼리

- 하나의 쿼리문 안에 포함되어 있는 또 하나의 쿼리문을 말한다.
- 쿼리문 안에 또 다른 쿼리문이 존재하는 것을 말한다.
- 서브쿼리는 메인쿼리가 서브쿼리를 포함하는 종속 관계이다.
- 여러번 쿼리를 실행해서 얻을 수 있는 결과를 하나의 중첩된 쿼리 문장으로 결과를 얻을 수 있다.

  - 주의사항

  * 서브쿼리는 괄호로 묶어서 사용해야한다.
  * 서브쿼리 안에는 Order by 절 사용할 수 없다.

- 사용방법

  - 안쪽에 쿼리문 실행후 그 결과 값을 가지고 바깥 쿼리문 실행

- 중첩서브쿼리, 인라인뷰, 스칼라 서브쿼리

      select (select
                from
                where ) -- 스칼라 서브쿼리
        from (select
                from
                where )  - 인라인뷰
        where (select
                from
                where )  - 중첩 서브쿼리
        group by
        having
        order by

### 5. group by 절

- 특정 컬럼이나 값을 기준으로 해당 레코드를 묶어서 자료를 관리할 때 사용함
- 특정 컬럼을 기준으로 집계를 구하는데 많이 사용된다.
- 그룹함수와 함께 사용 된다.
  - 그룹함수란 ? max(), min(), sum()

#### 예시

[문제] <br>
emp 테이블에서 부서별로 그룹을 지어서 <br>
부서별 급여합계, 인원수, 최대 급여, 최소급여를 구하여 화면에 출력 <br>
[조건] 급여 합계 기준으로 내림차순 <br>

    select e.deptno
         , d.dname
         , sum(e.sal), count(e.deptno), max(e.sal), min(e.sal)
     from emp e
     join dept d
       on e.deptno = d.deptno
    group by e.deptno, d.dname
    order by sum(e.sal) desc;

### 예제

[문제16] <br>
products 테이블에 있는 판매 가격에서 평균 가격 이상의 <br>
상품 목록을 구하되, 평균을 구할 때 가격이 가장 큰 금액인 상품을 <br>
제외하고 평균을 구하여 화면에 보여주세요.

    select products_name, output_price
      from products
      where (select avg(output_price)
              from products
              where (select max(output_price)
                      from products) != output_price) < output_price;

    -- 최대값을 제외한 가격의 평균 -- 382,000
        select avg(output_price)
          from products
          where (select max(output_price)
                  from products) != output_price;

        select avg(output_price)
          from products
          where output_price not in (select max(output_price)
                                      from products);
