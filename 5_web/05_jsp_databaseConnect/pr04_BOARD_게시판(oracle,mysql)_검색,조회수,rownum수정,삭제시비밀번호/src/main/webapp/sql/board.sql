-- create table

create table board(
	  board_no number(5) primary key		-- 게시판 글 번호
	, board_writer varchar2(30) not null	-- 게시판 글 작성자
	, board_title varchar2(200) not null	-- 게시판 글 제목
	, board_cont varchar2(1000) 			-- 게시판 글 내용
	, board_pwd varchar2(30) not null		-- 게시판 글 비밀번호
	, board_hit number(5) default 0			-- 게시판 글 조회수
	, board_date date						-- 게시판 글 작성일
	, board_update date						-- 게시판 글 수정일
);

-- insert data
insert into board values(1,'쿠팡플레이','6월 신작','안나 개봉!','1111',default, sysdate, '');
insert into board values(2,'디즈니','7월 신작','토르 개봉!','2222',default, sysdate, '');
insert into board values(3,'넷플릭스','9월 신작','it cloud 개봉!','3333',default, sysdate, '');


-- mysql

show databases;
use board;
use mysql;

-- create table

create table board(
	  board_no int auto_increment 		
	, board_writer varchar(30) not null	
	, board_title varchar(200) not null
	, board_cont varchar(1000) 			
	, board_pwd varchar(30) not null	
	, board_hit int default 0			
	, board_date date						
	, board_update date	
	, primary key(board_no)
)


-- insert data
-- 현재 날짜 : sysdate 대신 CURRENT_TIMESTAMP () 또는 now ()를 사용
 
insert into board values(1,'쿠팡플레이','6월 신작','안나 개봉!','1111',default, now() , now());

insert into board values(2,'디즈니','7월 신작','토르 개봉!','2222',default, now(), now());

insert into board values(3,'넷플릭스','9월 신작','it cloud 개봉!','3333',default, now(), now());

-- 테이블 확인
select *
  from board b ;