/*
    day04_20220809
        1. view
        2. transaction
        3. savepoint
        4. PL/SQL(Procedual Language /SQL)
        
        5. 조건제어문
        6. 반복제어문
*/

/*
    View
        - 물리적인 테이블에 근거한 논리적인 가상의 테이블을 말한다.
        - view는 실질적으로 데이터를 저장하고 있지 않다.
        - view를 만들면 데이터베이스에 질의시 실제 테이블에 접근하려 데이터를 불러오게 된다.
        - 간단하게 필요한 내용들만 추출해서 사용할 때 많이 사용한다
        - 주로 데이터를 조회(select)할때 가장 많이 사용된가
        - view는 테이블과 유사하며, 테이블처럼 사용이 가능하다
        - view는 테이블에 저장하기 위한 물리적인 공간이 필요가 없다
        - 테이블과 마찬가지로 insert, update, delete 명령에 가능하다
        - view 를 사용하는이유
            - 보안관리를 워해 사용한다
                - 보안등급에 맞추어 컬럼의 범위를 정해서 조회사 가능하도록 할 수 있다.
            - 사용자의 편의성 제공
        - 형식)
            create view 뷰이름 
            as 쿼리문
*/

    -- 인사뷰 view
        -- 컬럼에 sal(급여), comm(보너스) 컬럼 제외
        create view emp_insa
            as
        select empno, ename, job, hiredate, deptno
          from emp;
    
        /* 
            뷰수정
            create or replace view
            - 같은 이름의 view 가잇는 경우에는 
            기존의 view 는 삭제하고 새로 view 를 생성
        */
        
        create or replace view emp_insa
            as
        select empno, ename, job, mgr, hiredate, deptno
          from emp
          with read only;
    
    -- 영업부 view
        -- 컬럼에 sal(급여) 컬럼은 제외
        create view emp_sales
            as
        select empno, ename, job, mgr, hiredate, comm, deptno
          from emp;
     
    -- 회계부 view 
        -- 컬럼에 모든 컬럼 반영
        create view emp_acount
            as
        select *
          from emp;
          
        -- insert : view 에 insert시 emp 테이블에서도 확인이 가능하다.
        -- view 에서 insert 가능하나 MAC 안됨
        insert into emp_account 
             values(9000, 'ANGEL', 'SALESMAN', 7698, sysdate, 1300, 100, 30);
     
        insert into emp
             values (9000, 'ANGEL', 'SALESMAN', 7689, sysdate, 1300, 100, 30);
     
     /*
     -- view 에서 데이터 추가하는 것을 지양한다.
     -- view를 읽기 전용으로 만들면 데이터 추가가 안된다.
     -- 읽기 전용 만드는 방법
        - with read only 추가
           create view emp_acount
                as
            select *
              from emp;
              with read only 
     */
     
        create view emp_view1
            as
        select * 
          from emp
          with read only;
        
     -- emp_view1 은 read only로 insert 불가하다.   
        insert into emp_view1
             values(9000, 'ANGEL', 'SALESMAN', 7698, sysdate, 1300, 100, 30);
             
    -- 컬럼을 연산하여 새로운 열 추가가 가능하다.         
        create or replace view emp_read(empno, ename, annual_sal)
            as
        select empno, ename
             , (sal * 12 + nvl2(comm,comm, 0))  as "연봉"
          from emp
          with read only;
        
        select *
          from emp_read;
       
    -- [문제] 부서별로 부서별 급여 합계, 부서별 급여 평균을 구한 view 만들어 화면에 출력
    -- [주의] view 생성할때 그룹함수 이용할 경우 컬럼에 별칭을 설정해주어야 한다.
        create or replace view d_sal
            as
        select e1.deptno
             , sum(e1.sal) as sal_sum
             , round(avg(e1.sal)) as sal_avg
          from emp e1
         group by e1.deptno
      -- order by sum(sal) desc
          with read only;
    
    -- [문제] emp 테이블을 이용하여 부서번호가 20번에 속한 사원들의
    --       사번, 이름, 담당업무, 관리자, 부서번호만 화면에 출력
    -- [조건] view 명 : emp_dept20
        create or replace view emp_dept20
            as
        select empno, ename, job, mgr, deptno
          from emp
         where deptno = 20
          with read only;
        
    -- [문제] emp 테이블에서 각 부서별 최대급여와 최소급여를 보여주는 view 생성
    -- [조건] view 명 : sal_view 
        create view sal_view
            as
        select deptno
             , max(sal) as sal_max
             , min(sal) as sal_min 
          from emp
         group by deptno
          with read only;
    
    -- [문제] 담당없무가 'SALESMAN' 인 
    --       사원의 사번, 이름, 담당업무, 입사일, 부서번호를 컬럼으로 하는 view 생성
    -- [조건] view 명 : emp_sale
        create view emp_sale
            as
        select empno, ename, job, hiredate, deptno
          from emp
         where job = 'SALESMAN'
          with read only;
    
    -- 데이터가 없이 컬럼만 있는 view 생성
    --   - where 절에서 말이 안되는 조건식을 작성하면 된다.
        create or replace view emp_view2
            as
        select *
          from emp
         where deptno = 1  -- deptno 에 1이 없다.
          with read only;
          
          
/*
    트랜잭선(transaction)
    
    - 데이터 처리의 한단위를 말한다.
    - 오라클에서 발생하는 여러개의 sql 명령문들을 하나의 논리적인 작업단위로 처리
    - all or nothing 방식으로 처리
    - ** 명령어 여러개의 집합이 정상적으로 처리가 되면 종료하고,
      여러개의 명령어 중에서 하나의 명령이라도 잘못되면 전체 취소 한다. 

    - 트랜잭션 사용 이유 
      - 데이터의 일관성을 유지하면서 데이터의 안정성을 보장하기 위해 사용
    
    - 트랜잭션 사용시 트랜잭션을 제어하기 위한 명령어 
      1. commit 
        - 모든 작업을 정상적으로 처리 후 확정하는 명령어
        - 트랜젝션(insert, update, delete) 작업의 내용을 실제 db에 반영하여
          이전에 있던 데이터에 update 현상이 발생한다.
        - 모든 사용자가 변경된 데이터를 볼수 있다.
      
      2. rollback 
        - 작업중 문제 발생시 트랜잭션 처리 과정에서 발생한 변경 사항을 취소하여 이전상태로 되돌리는 명령어
        - 트랜젝션(insert, update, delete) 작업의 내용을 취소한다.
        - 이전 commit 한 곳 까지 복구가 된다.
*/

    -- 1. dept 테이블을 복사하여 dept_02 테이블 생성
        create table dept_02
            as
        select *
          from dept;
          
    -- 2. dept_02 테이블에서 40번 부서를 삭제한 후에 commit 
    --    - 형식) delect from 테이블명 where 조건식;
    --    - where 절에 나오는 컬럼은 기본키(PK)를 작성한다.
        delete from dept_02 
              where deptno = 40;
              
    -- 3. dept_02 테이블의 내용 전체 삭제 
        delete from dept_02;
        
    -- 4. dept_02 테이블에서 20번 부서만 삭제 해야할 것을 전체 삭제시
    --    복원 필요
        rollback;
    
    -- 5. 20번 부서 삭제
        delete from dept_02
              where deptno = 20;
    
    -- 6. 데이터베이스에 완전 적용 
        commit;
        
/*
    savepoint
        - 트랜잭션을 작게 분할하는 것
        - 사용자가 트랜잭션 중간 단계에서 포인트를 지정하여 
          트랜잭션 내의 특정 savepoint 까지 rollback 할 수 있게 하는 것을 말한다.      
*/

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
        
        
    create table student(
            hakbun varchar2(20) primary key,
            name varchar2(20) not null,
            major varchar2(30),
            age number(3),
            phone varchar2(20) not null,
            addr varchar2(20) not null,
            regdate date not null
    );
    
    -- 테이블 삭제
    drop table student purge;
    
    -- 테이블 데이터 입력
    insert into student values('2022_001', '김ㅇㅇ', '수학과', '27', '010-1412-1134','서울시 광진구', sysdate);
    insert into student values('2022_002', '배ㅇㅇ', '화학과', '27', '010-1114-1264','서울시 마포구', sysdate);
    insert into student values('2022_003', '홍ㅇㅇ', '국어국문학과', '22', '010-3111-1734','서울시 광진구', sysdate);
    insert into student values('2022_004', '동ㅇㅇ', '영어영문학과', '25', '010-1141-1504','서울시 은평구', sysdate);
    insert into student values('2022_005', '서ㅇㅇ', '원예디자인과', '30', '010-1211-1232','서울시 종로구', sysdate);
    
    -- student 테이블의 특정 레코드 수정
    -- 형식 
    --     update 테이블명 
    --        set 수정할 컬럼이름 = 수정될 컬럼 내용,
    --            수정할 컬럼이름 = 수정될 컬럼 내용
    --              ...
    --      where primary key로 설정된 컬럼명 = 값;
    
    update student
       set major = '경제학과'
         , age = '20'
         , addr = '서울시 중구'
     where hakbun = '2022_002';
     
     
     -- student 테이블의 특정 레코드를 삭제하는 방법
     -- 형식 ) 
     --     delete from 테이블이름
     --           where primary key 로 설정된 컬럼명 = 값;
     delete from student where hakbun = '2022_005';
     
/*
    PL/SQL(Procedual Language /SQL)
        - sql 만으로는 구현이 어렵거나 구현 불가능한 작업을 수행하기 위해
          오라클에서 제공하는 프로그래밍 언어를 말한다.
        - 일반적으로 프로그래밍 언어적인 요소들을 다가지고 있으며,
          데이터베이스 업무를 처리하기 위한 최적화된 언어이다.
        - 변수, 조건처리, 반복처리 등 다양한 기능을 사용할 수 있다.
  
    - 기본구조
        1. 선언부(declare) 
            - 모든 변수나 상수를 선언하는 부분
        2. 실행부(executable ~ begin)
            - 실제 로직이 실행되는 부분
            - 제어문(조건문), 반복문, 함수 정의 등의 로직을 기술
        3. 예외처리부(exception)
            - 실행 도중 예외가 발생시 해결하기 위한 명령들을 기술
    
    - 위 기본 구조 중에서 [선언부]와 [예외처리부]는 생략 가능
      단, [실행부]는 반드시 존재해야 한다.
      
    -  PL/SQL 사용시 주의 사항
        1. 기본구조(declare, begin, exception) 키워드
           뒤에는 세미콜론(;)을 붙이지 않는다.
        2. 블럭의 각 부분에서 실행해야하는 문장 끝에는 반드시 세미콜론(;)을 붙인다.
        3. begin ~ end(실행부) 밑에는 반드시 "/" 를 붙여 주어야 한다.
*/

    -- 1. 화면에 출력기능을 활성화 해야한다.(한번실행하면 계속 사용 가능)
        set serveroutput on;
    
    -- 2. 화면에 출력
        begin
              dbms_output.put_line('HELLO PL/SQL');
          end;
    /
    
/*
    -- 선언부(declare) 영영에 변순 선언
    
         1. 스칼라 자료형
            - 형식) 변수명 자료형(크기);
              예시) num number(3);
                  name varchar2(20);
        
         2. 레퍼런스 자료형
            - 테이블에 정의된 컬럼의 자료형과 크기를 모두 파악하고 있다면 이상 없지만
              그렇지 않을 경우 오라클에서 레퍼런스(reperence) 변수를 따로 제공해준다.
            - 형식) 변수명 테이블명.컬럼명%type;
              예시) num emp.empno%type;
             
         3. rowtype 자료형
            - 테이블의 모든 컬럼을 한꺼번에 저장하기 위한 변수로 선언
            - 형식) e_row emp%rowtype;
            - emp 테이블의 컬럼을 그대로 사용
*/     

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
        
/*
    조건 제어문(조건문)
    
        - 특정 조건식을 통해 상황에 따라 실행할 내용을 달리하는 방식의 명령어
        
        1. if 조건문
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
                end if
                
        2. case 조건문
            - case ~ when ~ then
                - 형식
                    case 비교기준
                        when 값1 then
                            실행문1;
                        when 값2 then
                            실행문2;
                        when 값3 then
                            실행문3;
                    else 
                        실행문4 (값이 모두 아닐경우 실행)
        
        
        --사용법
        CASE WHEN 조건1 THEN 처리문1
             WHEN 조건2 THEN 처리문2 (조건1 거짓)
        ELSE 처리문 END CASE;
*/

-- 1. if ~ then 예제 --
     declare
            e_number number(3) := 77;
       begin 
              if e_number >= 10 then
                 dbms_output.put_line(e_number || '는 10보다 큽니다');
             end if;
        end;
        /
   
-- 2. if ~ then ~ else 예제 --
-- [문제] 입력받은 수에 저장되어 있는 값이 홀수인지 짝수인지 판별하여 화면에 보여주세요
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
    
-- 3. if ~ then ~ elsif 예제 --
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

-- case 예제 

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
        
-- 키보드로 데이터를 입력받는 방법

    declare 
            e_num number(3);
      begin 
            e_num := '&num'; -- & : 입력값
        
            dbms_output.put_line('입력받은 수 >>> ' || e_num);
       end;
    /
    
/*
    반복 제어문
        - 특정 작업을 반복하여 수행하고자 할 때 사용하는 문장
        
        - 반복제어문의 종류
            1. 기본 loop
                - 가장 기본적인 반복문
            2. while loop
                - 특정 조건의 결과를 통해서 반복을 수행
            3. for loop
                - 반복 횟수를 정하여 반복을 수행
        
        - 반복문 종료시키는 명령어
            1. exit
                - 수행중인 반복을 종료시키는 명령어
            2. exit ~ when
                - 반복종료를 위한 조건식을 지정하고 만족하면
                  반복을 종료시키는 명령어
            3. continue
                - 수행중인 반복의 현재 주기를 건너 뛰는 명령어
            4. continue when
                - 특정 조건식을 지정하고 조건식을 만족하면 반복 주기를 건너 뛰는 명령어
*/  

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
            for e_num in 1.. 100 loop
                e_sum := e_sum + e_num;
            end loop;
            dbms_output.put_line('1 ~ 100 까지의 합 >>> ' || e_sum);
        end;
        /
      
    -- test 테이블 생성
    create table test(
        num number(10) primary key,
        name varchar2(20) not null,
        addr varchar2(100) not null 
    );
    
    -- 테이블삭제
    drop table test purge;
    -- 데이터 삭제, 테이블유지
    delete from test;
    
    declare
        -- e_num test.num%type;
        e_name test.name%type;
        e_addr test.addr%type;
    begin
        for e_su in 1 .. 3 loop
            dbms_output.put_line(e_su || '번째 정보');
            e_name := '&name';
            e_addr := '&addr';
            insert into test values(e_su, e_name, e_addr);
        end loop;
    end;
    /