-- 상품 정보 테이블을 만들어 보자.
create table products(
    pnum number(11) primary key,                   -- 제품 번호
    category_fk varchar2(8) not null,              -- 카테고리 코드
    products_name varchar2(50) not null,           -- 제품명
    ep_code_fk varchar2(5) not null,               -- 제품 코드
    input_price number(10) default 0 not null,     -- 제품 입고 가격
    output_price number(10) default 0 not null,    -- 제품 출고 가격
    trans_cost number(5) default 0 not null,       -- 제품 배송비
    mileage number(6) default 0 not null,          -- 제품 마일리지
    company varchar2(30)                           -- 제품 제조사
);

-- 제품 데이터를 저장해 보자.
insert into products
   values(1, '00010001', 'S 벽걸이 TV', '00001', 5000000, 8000000, 0, 100000, '삼성');
insert into products
   values(2, '00010001', 'D TV', '00002', 300000, 400000, 0, 50000, '대우');
insert into products
   values(3, '00010004', 'S 에어컨', '00001', 1000000, 1100000, 5000, 100000, '삼성');
insert into products
   values(4, '00010000', 'C 밥솥', '00003', 200000, 220000, 5500, 0, '쿠쿠');
insert into products
   values(5, '00010004', 'L 에어컨', '00003', 1200000, 1300000, 0, 0, 'LG');
insert into products
   values(6, '00020001', '남성난방', '00002', 100000, 150000, 2500, 0, '');
insert into products
   values(7, '00020001', '여성난방', '00002', 120000, 200000, 0, 0, '');
insert into products
   values(8, '00020002', '사각팬티', '00002', 10000, 20000, 0, 0, '보디가드');
insert into products
   values(9, '00020003', '멜빵바지', '00002', 15000, 18000, 0, 0, '');
insert into products
   values(10, '00030001', '무따기 시리즈', '00001', 25000, 30000, 2000, 0, '길벗');
   
-- DEPT 테이블 생성
create table dept( 
  deptno     number(2,0), 
  dname      varchar2(14), 
  loc        varchar2(13), 
  constraint pk_dept primary key (deptno) 
);

-- EMP 테이블 생성
-- Create the EMP table which has a foreign key reference to the DEPT table.
-- The foreign key will require that the DEPTNO in the EMP table exist in the DEPTNO column in the DEPT table.

create table emp( 
  empno    number(4,0), 
  ename    varchar2(10), 
  job      varchar2(9), 
  mgr      number(4,0), 
  hiredate date, 
  sal      number(7,2), 
  comm     number(7,2), 
  deptno   number(2,0), 
  constraint pk_emp primary key (empno), 
  constraint fk_deptno foreign key (deptno) references dept (deptno) 
);

-- DEPT 테이블에 데이터 추가
insert into DEPT (DEPTNO, DNAME, LOC)
	values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept 
	values(20, 'RESEARCH', 'DALLAS');
insert into dept 
	values(30, 'SALES', 'CHICAGO');
insert into dept 
	values(40, 'OPERATIONS', 'BOSTON');

-- EMP 테이블에 데이터 추가
insert into emp 
	values(7839, 'KING', 'PRESIDENT', null, to_date('17-11-1981','dd-mm-yyyy'), 5000, null, 10);

insert into emp 
	values(7698, 'BLAKE', 'MANAGER', 7839, to_date('1-5-1981','dd-mm-yyyy'), 2850, null, 30);

insert into emp 
	values(7782, 'CLARK', 'MANAGER', 7839, to_date('9-6-1981','dd-mm-yyyy'), 2450, null, 10);

insert into emp 
	values(7566, 'JONES', 'MANAGER', 7839, to_date('2-4-1981','dd-mm-yyyy'), 2975, null, 20);

insert into emp 
	values(7788, 'SCOTT', 'ANALYST', 7566, to_date('13-07-1987','dd-mm-yyyy') - 85, 3000, null, 20);

insert into emp 
	values(7902, 'FORD', 'ANALYST', 7566, to_date('3-12-1981','dd-mm-yyyy'), 3000, null, 20);

insert into emp 
	values(7369, 'SMITH', 'CLERK', 7902, to_date('17-12-1980','dd-mm-yyyy'), 800, null, 20);

insert into emp 
	values(7499, 'ALLEN', 'SALESMAN', 7698, to_date('20-2-1981','dd-mm-yyyy'), 1600, 300, 30);

insert into emp 
	values(7521, 'WARD', 'SALESMAN', 7698, to_date('22-2-1981','dd-mm-yyyy'), 1250, 500, 30);

insert into emp 
	values(7654, 'MARTIN', 'SALESMAN', 7698, to_date('28-9-1981','dd-mm-yyyy'), 1250, 1400, 30);

insert into emp 
	values(7844, 'TURNER', 'SALESMAN', 7698, to_date('8-9-1981','dd-mm-yyyy'), 1500, 0, 30);

insert into emp 
	values(7876, 'ADAMS', 'CLERK', 7788, to_date('13-07-1987', 'dd-mm-yyyy') - 51, 1100, null, 20);

insert into emp 
	values(7900, 'JAMES', 'CLERK', 7698, to_date('3-12-1981','dd-mm-yyyy'), 950, null, 30);

insert into emp 
	values(7934, 'MILLER', 'CLERK', 7782, to_date('23-1-1982','dd-mm-yyyy'), 1300, null, 10);

-- member10 이라는 테이블을 만들어 보자.
create table member10(
    num number(7) primary key,         -- 회원 번호
    memid varchar2(20) not null,       -- 회원 아이디
    memname varchar2(20) not null,     -- 회원 이름
    pwd varchar2(20) not null,         -- 회원 비밀번호
    age number(3),                     -- 회원 나이
    mileage number(5) not null,        -- 회원 마일리지
    job varchar2(30),                  -- 회원 직업
    addr varchar2(200),                -- 회원 주소
    regdate date not null              -- 회원 가입일
);

insert into member10
    values(1, 'id1', '홍길동', '1111', 25, 0, '학생',
    '부산시 동래구', '2013-08-08');
insert into member10
values(2, 'kimkd', '김길동', '2222', 30, 1500, '직장인',
'서울시 강남구', '2013-09-15');
insert into member10
values(3, 'id3', '공성현', '3333', 33, 10000, '직장인',
'부산시 중구', '2013-09-09');
insert into member10
values(4, 'kimyh', '김영희', '4444', 18, 3000, '학생',
'경상남도 마산시', '2012-01-01');
insert into member10
values(5, 'id5', '박말자', '5555', 45, 5000, '주부',
'경기도 남양주시', '2013-05-23');
insert into member10
values(6, 'id6', '김철수', '6666', 55, 0, '교수',
'제주도 서귀포시', '2013-01-10');
insert into member10
values(7, 'hong', '홍길동', '7777', 14, 0, '학생',
'경상북도 경주시', '2012-12-25');
insert into member10
values(8, 'id8', '김상현', '8888', 31, 0, '무직',
'서울시 마포구', '2013-04-18');
insert into member10
values(9, 'id9', '이지연', '9999', 25, 0, '학생',
'강원도 강릉시', '2013-02-06');
insert into member10
values(10, 'id10', '홍길동', '1010', 52, 10000, '주부',
'서울시 강북구', '2013-09-15');

create table category(
    cnum number(5),                        
    category_code varchar2(8) not null,   
    category_name varchar2(30) not null,  
    primary key(cnum)
);

insert into category values(1, '0001000', '전자제품');
insert into category values(2, '0001001', 'tv');
insert into category values(3, '0001002', '컴퓨터');
insert into category values(4, '0001003', '에어컨');
insert into category values(5, '0001004', '전자렌지');
insert into category values(6, '0002000', '도서');
insert into category values(7, '0002001', 'sf');
insert into category values(8, '0002002', '자격증');
insert into category values(9, '0002003', '어학');
insert into category values(10, '0030001', '의류');
insert into category values(11, '0030002', '바지');
insert into category values(12, '0030003', '티셔츠');