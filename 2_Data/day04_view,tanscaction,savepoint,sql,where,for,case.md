## day04_20220809

1. view
2. transaction
3. savepoint
4. PL/SQL(Procedual Language /SQL)

5. 조건제어문
6. 반복제어문

### 1. View

- 물리적인 테이블에 근거한 논리적인 가상의 테이블을 말한다.
- view는 실질적으로 데이터를 저장하고 있지 않다.
- view를 만들면 데이터베이스에 질의시 실제 테이블에 접근하려 데이터를 불러오게 된다.
- 간단하게 필요한 내용들만 추출해서 사용할 때 많이 사용한다
- 주로 데이터를 조회(select)할때 가장 많이 사용된다.
- view는 테이블과 유사하며, 테이블처럼 사용이 가능하다
- view는 테이블에 저장하기 위한 물리적인 공간이 필요가 없다
- 테이블과 마찬가지로 insert, update, delete 명령에 가능하다

#### - view 를 사용하는이유

1. 보안관리를 워해 사용한다
   - 보안등급에 맞추어 컬럼의 범위를 정해서 조회사 가능하도록 할 수 있다.
2. 사용자의 편의성 제공

#### -- view 생성

        create view 뷰이름
            as
        select
          from
          ...
        having

#### -- view 수정

        create or replace view 뷰이름
            as
        select
          from
          ...
        having

- 같은 이름의 view 가잇는 경우에는 <br>
  기존의 view 는 삭제하고 새로 view 를 생성

#### -- view 읽기 전용(값 입력 제어)

- 문장 가장 하단에 with read only; 입력

        create or replace view 뷰이름
            as
        select
          from
          ...
        having
          with read only;

- view에서 데이터 추가하는 것이 가능하지만 지양한다.

#### - view 예시

- 뷰생성

        -- 인사뷰 view
        -- 컬럼에 sal(급여), comm(보너스) 컬럼 제외
        create view emp_insa
            as
        select empno, ename, job, hiredate, deptno
          from emp;

- 뷰수정

        create or replace view emp_insa
            as
        select empno, ename, job, mgr, hiredate, deptno
          from emp
          with read only;

### 2. 트랜잭션(transaction)

- 데이터 처리의 한단위를 말한다.
- 오라클에서 발생하는 여러개의 sql 명령문들을 하나의 논리적인 작업단위로 처리
- all or nothing 방식으로 처리
- 중요! 명령어 여러개의 집합이 정상적으로 처리가 되면 종료하고,
  여러개의 명령어 중에서 하나의 명령이라도 잘못되면 전체 취소 한다.

#### - 트랜잭션 사용 이유

- 데이터의 일관성을 유지하면서 데이터의 안정성을 보장하기 위해 사용

#### - 트랜잭션 사용시 트랜잭션을 제어하기 위한 명령어

##### 1. commit

- 모든 작업을 정상적으로 처리 후 확정하는 명령어
- 트랜젝션(insert, update, delete) 작업의 내용을 실제 db에 반영하여 <br>
  이전에 있던 데이터에 update 현상이 발생한다.
- 모든 사용자가 변경된 데이터를 볼수 있다.

##### 2. rollback

- 작업중 문제 발생시 트랜잭션 처리 과정에서 발생한 변경 사항을 취소하여 이전상태로 되돌리는 명령어
- 트랜젝션(insert, update, delete) 작업의 내용을 취소한다.
- 이전 commit 한 곳 까지 복구가 된다.

### 3. savepoint

        rollback 세이브포인트;

- 트랜잭션을 작게 분할하는 것
- 사용자가 트랜잭션 중간 단계에서 포인트를 지정하여 <br>
  트랜잭션 내의 특정 savepoint 까지 rollback 할 수 있게 하는 것을 말한다.

#### 2~3 commit, rollback, savepoint 예시

- [테이블 복사 참고](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/2_Data/day01_oracle%EC%8B%9C%EC%9E%91%ED%95%98%EA%B8%B0.md)
- dept_03 테이블 deptno(pk) 값 : 10,20,30,40

        -- 1. dept 테이블을 복사하여 dept_03 테이블을 생성
            create table dept_03
                as
            select *
              from dept;

        -- 2. dept_03 테이블에서 40번 부서를 삭제후 commit
            delete from dept_03
                  where deptno =40;
            commit;

        -- 3. dept_03 테이블에서 30번 부서를 삭제
            delete from dept_03
                  where deptno =30;

        -- 4. savepoint sql 설정
            savepoint sp1;

        -- 5. 부서번호가 20번인 부서를 삭제
            delete from dept_03 where deptno =20;

        -- 6. savepoint sp2 설정
            savepoint sp2;

        -- 7. 부서번호가 10번인 부서 삭제
            delete from dept_03 where deptno =10;

        -- 8. 부서번호가 20번 부서를 삭제하기 바로 전으로 되돌리기
        --    rollback 을 이용하여 특정 지점으로 이동
        --    30번 부서는 삭제후 commit 을 안하여 데이터에 확인 가능하다.
            rollback sp1;

- 결과값

  부서번호가 40 인 데이터는 지워지고 <br>
  부서번호가 10~30 인 데이터는 확인이 가능하다

### 4. PL/SQL(Procedual Language /SQL)

- sql 만으로는 구현이 어렵거나 구현 불가능한 작업을 수행하기 위해 <br>
  오라클에서 제공하는 프로그래밍 언어를 말한다.
- 일반적으로 프로그래밍 언어적인 요소들을 다가지고 있으며, <br>
  데이터베이스 업무를 처리하기 위한 최적화된 언어이다.
- 변수, 조건처리, 반복처리 등 다양한 기능을 사용할 수 있다.

#### - 기본구조

        delare
               선언부
        begin
               실행부
        end;
        /

1. 선언부(declare)
   - 모든 변수나 상수를 선언하는 부분
2. 실행부(executable ~ begin)
   - 실제 로직이 실행되는 부분
   - 제어문(조건문), 반복문, 함수 정의 등의 로직을 기술
3. 예외처리부(exception)
   - 실행 도중 예외가 발생시 해결하기 위한 명령들을 기술

- 위 기본 구조 중에서 [선언부]와 [예외처리부]는 생략 가능 <br>
  단, [실행부]는 반드시 존재해야 한다.

#### - PL/SQL 사용시 주의 사항

1.  기본구조(declare, begin, exception) 키워드 <br>
    뒤에는 세미콜론(;)을 붙이지 않는다.
2.  블럭의 각 부분에서 실행해야하는 문장 끝에는 반드시 세미콜론(;)을 붙인다.
3.  begin ~ end(실행부) 밑에는 반드시 "/" 를 붙여 주어야 한다.

#### - 화면에 출력

1.  화면에 출력시 출력기능 활성화 필요
    한번 실행하면 종료하기 전까지는 사용 가능하다. 매번 구현하지 않아도 된다.

         set serveroutput on;

2.  화면에 표시

        begin
            dbms_output.put_line('Hello world');
        end;

#### - 선언부(declare) 영역 변수선언 방법

##### 1. 스칼라 자료형

            형식) 변수명 자료형(크기);
            예시) num number(3);
                name varchar2(20);

##### 2. 레퍼런스 자료형

- 테이블에 정의된 컬럼의 자료형과 크기를 모두 파악하고 있다면 이상 없지만<br>
  그렇지 않을 경우 오라클에서 레퍼런스(reperence) 변수를 따로 제공해준다.

            형식) 변수명 테이블명.컬럼명%type;
            예시) num emp.empno%type;

##### 3. rowtype 자료형

- 테이블의 모든 컬럼을 한꺼번에 저장하기 위한 변수로 선언

         형식) e_row emp%rowtype;

- emp 테이블의 컬럼을 그대로 사용

#### -- 선언부 예시

        -----------선언부 예시-----------
        ------- 1. 스칼라 자료형 --------
            declare
                    v_empno number(4) := 7799;
                    v_ename varchar2(20);
            begin
                    v_ename := 'ADAMS';
                    dbms_output.put_line('v_empno >>> ' || v_empno);
                    dbms_output.put_line('v_ename >>> ' || v_ename);
                end;
            /

        ------- 2. 레퍼런스 자료형 --------
            declare
                    e_empno emp.empno%type;
                    e_ename emp.ename%type;
            begin
                    e_empno := 7900;
                    e_ename := 'SCOTT';
                    dbms_output.put_line('e_empno >>> ' || e_empno);
                    dbms_output.put_line('e_ename >>> ' || e_ename);
                end;
            /


        ------- 3. rowtype 자료형 --------
            declare
                    emp_row emp%rowtype;
            begin
                    select * into emp_row
                    from emp
                    where empno = 7698;
                    dbms_output.put_line(emp_row.empno || ' ' ||
                                        emp_row.ename || ' ' ||
                                        emp_row.ename || ' ' ||
                                        emp_row.sal   || ' ' ||
                                        emp_row.deptno);
                end;
            /

### - 입력값 받기

실행부에서 변수명 := '&컬럼명'; <br>
컬럼명 앞에 & 기호를 붙여준다.

    e_num := '&num'; -- & : 입력값

### 5. 조건제어문

- 특정 조건식을 통해 상황에 따라 실행할 내용을 달리하는 방식의 명령어
- if then, case when then 이 있다.

#### 1. if 조건문

- if ~ then

  - 특정 조건을 만족하는 경우에 작업수행
  - 형식

          if 조건식 then
             조건식이 참인경우 실행 문장
          end if

- if ~ then ~ else

  - 특정 조건식에 만족하는 경우와 반대의 경우
    각자 지정한 작업을 수행한다.
  - 형식

          if 조건식 then
             실행문
          else 조건식이 거짓일 경우 실행문
          end if

- if ~ then ~ elsif

  - 여러가지 조건에 따라 각자 지정한 작업을 수행
  - 형식

          if 조건식1 then
              실행문1;
          elsif 조건식2 then
              실행문2 (조건식1 거짓, 조건식2 참);
          elsif 조건식3 then
              실행문3 (조건식1 거짓, 조건식2 거짓, 조건식3 참);
          else 실행문4 (조건식 모두 거짓)
          end if;

#### 2. case 조건문

##### - case ~ when ~ then

- 형식

        case 비교기준
            when 값1 then
                실행문1;
            when 값2 then
                실행문2;
            when 값3 then
                실행문3;
        else
            실행문4 (값이 모두 아닐경우 실행);

- sql 사용

        CASE WHEN 조건1 THEN 처리문1
             WHEN 조건2 THEN 처리문2 (조건1 거짓)
        ELSE 처리문 END CASE;

또는

        CASE 컬럼명1 WHEN 조건1 THEN 처리문1
        CASE 컬럼명1 WHEN 조건2 THEN 처리문2 (조건1 거짓)
        ELSE 처리문 END CASE;

#### 예시

##### 1. if 예제

- 홀수, 짝수

        declare
            e_num number(3) := 88;
        begin
                if mod(e_num, 2) = 1 then
                    dbms_output.put_line(e_num || '는 홀수입니다');
                else
                    dbms_output.put_line(e_num || '는 짝수입니다');
                end if;
            end;
        /

        - 88은 짝수입니다.

- 입력받은수 출력

        declare
                e_num number(3);
        begin
                e_num := '&num'; -- & : 입력값

                dbms_output.put_line('입력받은 수 >>> ' || e_num);
        end;
        /

- 학점(소수점)

        declare
            e_avg number(5,2) := 89.12; -- 전체 5자리, 소수2자리, 정수3자리
        begin
                if e_avg >= 90 then
                    dbms_output.put_line('A학점입니다');
            elsif e_avg >= 80 then
                    dbms_output.put_line('B학점입니다');
            elsif e_avg >= 70 then
                    dbms_output.put_line('C학점입니다');
            elsif e_avg >= 60 then
                    dbms_output.put_line('D학점입니다');
            else
                    dbms_output.put_line('F학점입니다');
            end if;
            end;
        /

        - A학점입니다.

##### 2. case when 예제

        declare
             e_socre number(3) := 93;
        begin
                case trunc(e_socre/10)
                    when 10 then
                            dbms_output.put_line('A학점입니다');
                    when 9 then
                            dbms_output.put_line('A학점입니다');
                    when 8 then
                            dbms_output.put_line('B학점입니다');
                    when 7 then
                            dbms_output.put_line('C학점입니다');
                    when 6 then
                            dbms_output.put_line('D학점입니다');
                else
                            dbms_output.put_line('F학점입니다');
                end case;
            end;
            /

        - A학점입니다.

### 6. 반복제어문

- 특정 작업을 반복하여 수행하고자 할 때 사용하는 문장

#### - 반복제어문의 종류

1. 기본 loop
   - 가장 기본적인 반복문
2. while loop
   - 특정 조건의 결과를 통해서 반복을 수행
3. for loop
   - 반복 횟수를 정하여 반복을 수행

#### - 반복문 종료시키는 명령어

1. exit
   - 수행중인 반복을 종료시키는 명령어
2. exit ~ when
   - 반복종료를 위한 조건식을 지정하고 만족하면 <br>
     반복을 종료시키는 명령어
3. continue
   - 수행중인 반복의 현재 주기를 건너 뛰는 명령어
4. continue when
   - 특정 조건식을 지정하고 조건식을 만족하면 반복 주기를 건너 뛰는 명령어

#### - 예시

      ----- 1. 기본 loop -----
        declare
            e_num number(3) := 1;
        begin
            loop
                dbms_output.put_line('e_numm >>> ' || e_num);
                e_num := e_num +1;
                    if(e_num > 100) then exit;
                    end if;
            end loop;
        end;
        /

    ----- 2. while loop -----
        declare
            e_number number(5) := 1;
            e_sum number(5) := 0;
        begin
            dbms_output.put_line('**** while loop ****');
            while e_number <=100
                loop
                    dbms_output.put_line('e_number >>> ' || e_number);
                    e_sum := e_sum + e_number;
                    e_number := e_number + 1;
                end loop;

            dbms_output.put_line('e_sum >>> ' || e_sum);
        end;
        /

    ----- 3. for loop -----
        declare
            e_sum number(5) := 0;
        begin
            dbms_output.put_line('**** for loop ****');
            for e_num in 1.. 100
                loop
                    e_sum := e_sum + e_num;
                end loop;
            dbms_output.put_line('1 ~ 100 까지의 합 >>> ' || e_sum);
        end;
        /
