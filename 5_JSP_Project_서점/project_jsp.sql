---drop------------------------------------------------------------------------- 
drop table member purge;
drop table admin purge;
drop table category purge;
drop table book purge;
drop table book_order purge;
drop table cart purge;
drop table board purge;
drop table board_reply purge;

commit;

delete from book;
delete from board;
---create------------------------------------------------------------------------- 
create table member(
    mem_num number(10) primary key,
    mem_id varchar2(50) unique,
    mem_pwd varchar2(50) not null,
    mem_name varchar2(50) not null,
    mem_phone varchar2(50) not null,
    mem_addr varchar2(200) not null,
    mem_mail varchar2(100) not null,
    mem_card_num varchar2(50) not null,
    mem_car_pwd number(5) not null,
    mem_mileage number(22) default 0 not null
);

CREATE TABLE admin (
  admin_num number(10) primary key,
  admin_id varchar2(50) unique,
  admin_pwd varchar2(100) not null,
  admin_name varchar2(50) not null
);

CREATE TABLE category (
  cgy_num varchar2(10) primary key,
  cgy_name varchar2(100) not null,
  cgy_date date not null
);

CREATE TABLE book (
  book_num number(22) primary key,
  cgy_num varchar2(10) not null,
  constraint cgy_num foreign key(cgy_num) references category(cgy_num) on delete set null,
  book_name varchar2(100) unique,
  book_price number(10) not null,
  book_qty number(10) not null,
  book_img varchar2(1000) not null,
  book_date date not null,
  book_update date default null,
  book_writer varchar2(50) not null,
  book_publisher varchar2(100) not null,
  book_sales number(10) default 0,
  book_page number(5),
  book_regdate date default null,
  book_cont clob,
  book_writer_cont clob,
  book_index clob  
);

CREATE TABLE book_order (
  order_num number(22) primary key,
  book_num number(22) not null,
  constraint book_num foreign key(book_num) references book(book_num) on delete set null,
  mem_num number(10) not null,
  constraint mem_num foreign key(mem_num) references member(mem_num) on delete set null,
  order_qty number(22) not null,
  order_date date not null
);

CREATE TABLE cart (
  cart_num number(22) primary key,
  book_num number(22) not null,
  constraint book_num_cart foreign key(book_num) references book(book_num) on delete set null,
  mem_num number(10) not null,
  constraint mem_num_cart foreign key(mem_num) references member(mem_num) on delete set null,
  cart_qty number(10) not null
);            
commit;

-- board 

CREATE TABLE board_category (
                     board_cgy_num VARCHAR2(100) primary Key,
                     board_cgy_name varchar2(100)    
);

CREATE TABLE board (
                      board_num number(30) primary KEY,
                      board_title VARCHAR2(100),
                      board_cont VARCHAR2(500),
                      board_date date,
                      board_update date default null,
                      board_image VARCHAR2(100),
                      mem_num number(10),
                      board_cgy_num VARCHAR2(100),
                      foreign key(mem_num) references member(mem_num) ON DELETE CASCADE,
                      foreign key(board_cgy_num) references board_category(board_cgy_num) ON DELETE CASCADE
);

CREATE TABLE board_reply(
    reply_num number(30) primary KEY,
    reply_cont VARCHAR2(500),
    reply_date date,
    reply_update date default null,
    board_num number(30),
    foreign key(board_num) references board(board_num) ON DELETE CASCADE
);

--board 테이블에서 board_num 변경시 Board_reply board_num 도 변경
CREATE TRIGGER UPDATE_BOARD_NUM
AFTER UPDATE of board_num ON board FOR EACH ROW
BEGIN
	UPDATE board_reply
	SET board_num = :new.board_num
	WHERE board_num = :old.board_num; 
END;
/
drop trigger UPDATE_BOARD_NUM;

CREATE TABLE banner (
    banner_num VARCHAR2(100) primary key,
    banner_title VARCHAR2(100),
    banner_start date,
    banner_end date,
    banner_img varchar2(100),
    banner_cont varchar2(100),
    banner_event number
);

commit;



-- 배너 ------
-- banner_num : 배너 시퀀스
-- banner_event : 관련 이벤트 번호(책일경우 책 번호)
-- banner_start : 배너 시작일
-- banner_end : 배너 종료일
-- banner_cont : 배너 관련 텍스트
-- banner_img : 이미지 주소 


---alter-------------------------------------------------------------------------
alter table 테이블명 add(컬럼명 데이터타입(크기) 제약조건 )

alter table book drop constraint cgy_num;
alter table book modify cgy_num varchar2(10);
alter table category modify cgy_num varchar2(10);
alter table book add constraint cgy_num foreign key(cgy_num) references category 
(cgy_num);

commit;

alter table book add(BOOK_REGDATE date, BOOK_WRITER_CONT CLOB , BOOK_INDEX CLOB );

alter table book drop column BOOK_CONT;
alter table book add BOOK_CONT clob;
alter table book modify BOOK_CONT clob;
-- 원래 book book_cont : varchar2(3000)

alter table board add board_image VARCHAR2(100);
alter table board rename column board_titile to board_title;
alter table board add board_num number;

commit;

-- 문의글ㅡ 
insert into board values(1,'테스트','테스트 내용',sysdate,'','',1,'c1');
insert into board values(2,'테스트2','테스트 내용',sysdate,'','',2,'c1');
insert into board values(3,'테스트3','테스트 내용',sysdate,'','',1,'c1');
insert into board values(4,'테스트4','테스트 내용',sysdate,'','',1,'c1');
insert into board values(5,'테스트','테스트 내용',sysdate,'','',1,'c2');
insert into board values(6,'테스트','테스트 내용',sysdate,'','',1,'c1');

insert into board_reply values('r001','b002답변', sysdate, '' ,'b002'); 
insert into board_reply values('r002','b004답변', sysdate, '' ,'b004'); 
insert into board_reply values('r003','b005답변', sysdate, '' ,'b005'); 

update board set board_num = 'b003' where board_num = 'b004';

reply_num VARCHAR2(30) primary KEY,
    reply_cont VARCHAR2(500),
    reply_date date,
    reply_update date default null,
    board_num

---insert------------------------------------------------------------------------- 
insert into category values ('n001','소설',sysdate);
insert into category values ('n002','시/에세이',sysdate);
insert into category values ('n003','어린이',sysdate);
insert into category values ('n004','예술/대중문화',sysdate);
insert into category values ('n005','외국어',sysdate);
insert into category values ('n006','여행',sysdate);

commit;

-- book 테이블 컬럼 추가후 ---------------------------------------------------------- 
select * from book;
insert into book (book_cont, book_writer_cont, book_index ) values(EMPTY_CLOB(),EMPTY_CLOB(),EMPTY_CLOB());

insert into book values (1, 'n001',
'불편한 편의점(40만부 기념 벚꽃 에디션)', 14000, 200, 'bookn001convenienceStore.jpeg',
sysdate,'' , '김호연', '나무옆의자', 10, 0, sysdate ,
TO_CLOB('힘겨운 시대를 살아가는 우리들에게 다가온 조금 특별한 편의점 이야기'),
TO_CLOB('영화·만화·소설을 넘나들며 온갖 이야기를 써나가는 전천후 스토리텔러.'), TO_CLOB('--'));
insert into book values (2, 'n001', '파친코1', 15800, 100, 'bookn001pachinko1.jpeg', sysdate, '', '이민진', '인플루엔셜',190,0,sysdate,'“역사는 우리를 저버렸지만, 그래도 상관없다”
역사에 외면당한 재일조선인 가족의 대서사극
전 세계를 감동시킨 이민진 작가 화제작 《파친코》 새롭게 출간!','전 세계에서 뜨거운 관심과 사랑을 받고 있는 한국계 미국인 소설가. 경계인으로서의 날카로운 시선과 공감을 바탕으로 한 통찰력으로 복잡다단한 역사와 인간의 본질을 포착하며 “제인 오스틴, 조지 엘리엇을 잇는 작가”라는 찬사 속에 세계적인 작가로 발돋움했다.
1968년 서울에서 태어난 작가는 일곱 살 때 가족과 함께 미국 뉴욕으로 건너갔다. 예일대학교에서 역사학을 공부한 후 조지타운대학교 로스쿨을 졸업하고 변호사로 일했으나, 건강 문제로 그만두게 되면서 오랜 꿈이었던 글쓰기를 시작했다.
2004년부터 단편소설들을 발표하며 주목을 받기 시작했고, 2008년 미국 이민자의 이야기를 담은 첫 장편소설 《백만장자를 위한 공짜 음식Free Food for Millionaires》으로 작가로서 이름을 알렸다.
두 번째 장편소설 《파친코》는 작가가 역사학과 학생이었던 1989년에 ‘자이니치’라 불리는 재일조선인의 이야기를 써야겠다고 결심한 후 2017년 출간되기까지 30년에 가까운 세월 동안 혼신의 노력을 기울여 집필한 대작이다. 일본계 미국인인 남편과 함께 4년간 일본에 머물며 방대하고 치밀한 조사와 취재 끝에 이 이야기를 완성할 수 있었다. 4대에 걸친 가족사를 일제강점기부터 한국전쟁, 일본 버블경제에 이르기까지의 역사적 흐름 속에서 다룬 이 책은 출간 즉시 미국 사회에 큰 반향을 일으켰다. 《뉴욕타임스》, 《USA투데이》, 아마존, BBC 등 75개가 넘는 주요 매체에서 앞다투어 ‘올해의 책’으로 선정했고, 전미도서상 최종후보에 올랐다. 33개국에 번역 출간되며 세계적인 베스트셀러에 오른 《파친코》는, 2022년 애플TV에서 8부작 드라마로 제작ㆍ방영되어 다시 한번 세계인의 이목을 집중시키며 새로운 역사를 써나가고 있다.
이민진 작가는 현재 뉴욕에 거주하며 ‘한국인 디아스포라 3부작’의 완결작이 될 세 번째 장편소설 집필에 몰두하고 있다.','목차 
한국 독자들에게 
1부 고향 1910-1933 
2부 모국 1939-1962');
--

commit;

insert into book_order values (1,22,1,1,sysdate);
insert into book_order values (2,11,3,2,sysdate);
insert into book_order values (3,18,1,1,sysdate);
insert into book_order values (4,13,2,5,sysdate);
insert into book_order values (5,11,2,1,sysdate);
insert into book_order values (6,4,2,1,sysdate);
insert into book_order values (7,14,3,7,sysdate);
insert into book_order values (8,18,4,1,sysdate);
insert into book_order values (9,13,4,1,sysdate);
insert into book_order values (10,11,4,7,sysdate);
insert into book_order values (11,13,4,1,sysdate);
insert into book_order values (12,6,3,1,sysdate);
insert into book_order values (13,7,2,1,sysdate);
insert into book_order values (14,11,2,1,sysdate);
insert into book_order values (15,17,2,1,sysdate);
insert into book_order values (16,13,2,3,sysdate);
insert into book_order values (17,13,1,1,sysdate);
insert into book_order values (18,22,1,1,sysdate);
insert into book_order values (19,22,6,1,sysdate);
insert into book_order values (20,22,6,1,sysdate);

insert into book_order values (21,13,6,100,sysdate);
insert into book_order values (22,20,1,1,sysdate);
commit;

insert into member values (1,'lee','1234','이아무개','010','경기도','kkk@naver.com','1',2,3);
insert into member values (2,'kim','1234','김아무개','011','서울특별시','lll@naver.com','1',2,3);
insert into member values (3,'hong','1234','홍아무개','012','부산광역시','ddd@naver.com','1',2,3);
insert into member values (4,'dong','1234','동아무개','013','광주광역시','ddd@naver.com','1',2,3);
insert into member values (5,'flower','1234','서아무개','014','제주시','kkk@naver.com','1',2,3);
insert into member values (6,'orange','1234','최아무개','015','경기도','lll@naver.com','1',2,3);
insert into member values (7,'kiwi','1234','위아무개','016','서울특별시','ddd@naver.com','1',2,3);

commit;

-- 게시판 카테고리 코드
insert into board_category values('c1','반품/교환/환불');
insert into board_category values('c2','웹사이트 이용관련');
commit;

-- 배너 
insert into banner values('benb001','하얼빈',to_date('2022-11-02','yyyy-mm-dd'),to_date('2023-11-02','yyyy-mm-dd'),'https://shop-phinf.pstatic.net/20220807_178/16598531380433lGXq_JPEG/BDBDB6F3C0CCB5E54.JPG','하얼빈','');
insert into banner values('benb002','불편한 편의점 가장 사랑받는 소설',to_date('2022-11-02','yyyy-mm-dd'),to_date('2023-11-02','yyyy-mm-dd'),'https://shop-phinf.pstatic.net/20220917_192/1663391387271LJBnC_JPEG/BAD2C6ED.jpg','불편한 편의점',1);
insert into banner values('benb003','파친코1',to_date('2022-11-02','yyyy-mm-dd'),to_date('2023-11-02','yyyy-mm-dd'),'https://shop-phinf.pstatic.net/20220725_170/1658730522575ILazT_JPEG/C6C4C4A3.jpg','파친코1',2);
insert into banner values('benb004','파친코2',to_date('2022-11-02','yyyy-mm-dd'),to_date('2023-11-02','yyyy-mm-dd'),'https://shop-phinf.pstatic.net/20220917_297/1663391599379kbdm6_JPEG/C6C7C4A32.jpg','파친코2',3);
insert into banner values('benb005','헤어질 결심 각본',to_date('2022-11-02','yyyy-mm-dd'),to_date('2023-11-02','yyyy-mm-dd'),'https://shop-phinf.pstatic.net/20220725_57/1658728617428JUu9o_JPEG/C7ECBEEEC1FA.jpg','헤어질 결심','');
insert into banner values('benb006','튜브 손원평의 빛나는 신작',to_date('2022-11-02','yyyy-mm-dd'),to_date('2023-11-02','yyyy-mm-dd'),'https://shop-phinf.pstatic.net/20220725_116/1658729643945pjTdm_JPEG/C6A9BAEA.jpg','튜브','');
insert into banner values('benb007','작별인사',to_date('2022-11-02','yyyy-mm-dd'),to_date('2023-11-02','yyyy-mm-dd'),'https://shop-phinf.pstatic.net/20220806_200/1659766805694zdosI_JPEG/C0DBBAB0.jpg','작별인사','');
insert into banner values('benb008','친절한 이방인',to_date('2022-11-02','yyyy-mm-dd'),to_date('2023-11-02','yyyy-mm-dd'),'https://shop-phinf.pstatic.net/20220807_16/1659853016917K05Tb_JPEG/BDBDB6F3C0CCB5E52.JPG','친절한 이방인','');