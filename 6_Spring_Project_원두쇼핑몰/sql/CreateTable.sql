-- coffee_test --
drop table coffee_brew purge;
drop table coffee_add purge;
drop table coffee_decaff purge;
drop table coffee_taste_acid purge;
drop table coffee_taste purge;
drop table coffee_grind purge;

-- cart_order --
drop table coffee_cart purge;
drop table coffee_order purge;

-- product --
drop table member_star purge;
drop table coffee_write purge;
drop table coffee_beans purge;

-- board_write --
drop table admin_reply purge;
drop table member_board purge;

-- member --
drop table final_admin purge;
drop table final_member purge;

-- coffee_result -- 
drop table coffee_test purge;
drop table coffee_match purge;
drop table coffee_test_result purge;

---------------- test_result(테스트 결과_경우의 수)----------------
create table coffee_test_result(
    test_rs_brew number(5) ,
    test_rs_add number(5), 
    test_rs_decaff number(5), 
    test_rs_taste_acid number(5), 
    test_rs_taste  number(5), 
    test_num number(10), 
    test_name varchar2(100)
);

---------------- coffee_match(테스트 결과에 맞는 커피)----------------
create table coffee_match(
    match_num number(5) PRIMARY Key,
    match_name varchar2(100),
    match_info varchar2(1000)
);

---------------- coffee_test(테스트결과)----------------
create table coffee_test(
    test_num number(5) PRIMARY Key,
    test_name varchar2(100),
    test_full_name varchar2(300),
    test_info varchar2(1000),
    match_num number(5),
    test_match_coffee varchar2(1000),
    test_mate varchar2(1000),
    test_img varchar2(1000)
);

---------------- final_member(사용자) ----------------
create table final_member(
    member_num number(10) PRIMARY Key,
    member_id varchar2(100) UNIQUE,
    member_pwd varchar2(100),
    member_name varchar2(100),
    member_birth date,
    member_email varchar2(100),
    member_phone varchar2(100),
    member_date date,
    member_addr VARCHAR2(100) DEFAULT '주소를 넣어주세요',
    member_addr2 VARCHAR2(100) DEFAULT '주소를 넣어주세요',
    member_addr3 VARCHAR2(100) DEFAULT '주소를 넣어주세요',
    member_addr4 VARCHAR2(100) DEFAULT '주소를 넣어주세요',
    member_addr5 VARCHAR2(100) DEFAULT '주소를 넣어주세요',
    member_img varchar2(1000),
    member_point number(10) DEFAULT 0,
    test_num number REFERENCES coffee_test(test_num) on delete cascade
);

insert into final_member values(1, 'test1', '1234', '일길동', '2011-11-11', 'hong@naver.com','010-1111-1111',sysdate, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT,'이미지1', 0, '');
insert into final_member values(2, 'test2', '1234', '이길동', '2011-11-11', 'hong@naver.com','010-1111-1111',sysdate,DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT,'이미지2', 0, '');
insert into final_member values(3, 'test3', '1234', '삼길동', '2011-11-11', 'hong@naver.com','010-1111-1111',sysdate,DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT,'이미지3', 0, '');

---------------- final_admin(관리자) ----------------
create table final_admin(
    admin_num number(10) PRIMARY Key,
    admin_id varchar2(100) UNIQUE,
    admin_pwd varchar2(100),
    admin_name varchar2(100),
    admin_email varchar2(100),
    admin_phone varchar2(100),
    admin_date date
);

insert into final_admin values(1, 'admin', 'admin1234', '관리자', 'hwan_hing@naver.com','010-1111-1111',sysdate);

---------------- member_board(고객센터) ----------------
create table member_board(
    board_num number(10) PRIMARY Key,
    board_title varchar2(100),
    board_cont varchar2(4000),
    board_file varchar2(100),
    board_date date,
    board_reply number(5),
    member_num number(10) REFERENCES final_member(member_num) on delete cascade
);

---------------- admin_reply(고객센터 답변) ----------------
create table admin_reply(
    reply_num number(10) PRIMARY Key,
    reply_cont varchar2(4000),
    reply_date date,
    admin_num number(10) REFERENCES final_admin(admin_num) on delete cascade,
    board_num number(10) REFERENCES member_board(board_num) on delete CASCADE
);

---------------- coffee_beans(원두 상품) ----------------
create table coffee_beans(
    beans_num number(10) PRIMARY Key,
    beans_name varchar2(100),
    beans_price number(10),
    beans_count number(10),
    beans_weight number(10),
    beans_taste varchar2(100),
    beans_intro varchar2(4000),
    beans_img varchar2(4000),
    beans_url varchar2(4000)  
);

insert into coffee_beans values(1, '원두1', 10000, 100, 200, '맛1','소개1','이미지1','url_1');
insert into coffee_beans values(2, '원두2', 15000, 100, 100, '맛2','소개2','이미지2','url_2');
insert into coffee_beans values(3, '원두3', 20000, 100, 200, '맛3','소개3','이미지3','url_3');

---------------- coffee_write(후기글) ----------------
create table coffee_write(
    write_num number(10) PRIMARY Key,
    write_cont varchar2(4000),
    write_date date,
    write_img varchar2(1000),
    member_id varchar2(100) REFERENCES final_member(member_id) on delete cascade,
    beans_num number(10) REFERENCES coffee_beans(beans_num) on delete cascade
);

---------------- member_star(별점, 찜) ----------------
create table member_star(
	coffee_star number,
	coffee_heart number(5),
	member_num number(10) REFERENCES final_member(member_num) on delete cascade,
	beans_num number(10) REFERENCES coffee_beans(beans_num) on delete cascade
);

---------------- coffee_order(주문내역) ----------------
create table coffee_order(
     order_num varchar2(200),
     order_row number(10),
     order_cnt number(10), 
     order_price number(10),
     order_date date,
     beans_num number(10), 
     beans_name varchar2(200), 
     beans_price number(10), 
     beans_taste varchar2(300),
     cart_weight number(10), 
     cart_grind number(5),
     member_num number(10),
     constraint member_num foreign key(member_num) references final_member(member_num) on delete cascade
 );

---------------- coffee_cart(장바구니) ----------------
create table coffee_cart(
      cart_num number(10) primary key, 
      beans_num number(10), 
      beans_price number(10),
      cart_cnt number(10), 
      cart_weight number(10), 
      cart_grind number(5),
      member_num number(10),
      constraint beans_num_order foreign key(beans_num) references coffee_beans(beans_num) on delete cascade,
      constraint member_num_order foreign key(member_num) references final_member(member_num) on delete cascade
);

-- 변경 부분 
-- 컬럼명 변경 cart_price ==> beans_price // 상품 단가
-- 컬럼 추가 cart_weight number(10) // 선택한 원두 무게
-- 컬럼 추가 cart_grind number(5)   // 선택한 원두 갈기 

---------------- coffee_brew(드립) ----------------
create table coffee_brew(
    brew_num number(10),
    brew_type varchar2(100),
    brew_img CLOB
);

---------------- coffee_add(재료 추가) __ 기본, 우유, 설탕, 시럽 ----------------
create table coffee_add(
    add_num number(10),
    add_type varchar2(100),
    add_img CLOB
);

---------------- coffee_decaff(디카페인) ----------------
create table coffee_decaff(
    decaf_num number(5),
    decaf_type varchar2(100)
);

---------------- coffee_taste_acid(커피맛 1 - 산미) ----------------
create table coffee_taste_acid(
    acid_num number(10),
    acid_type varchar2(1000),
    acid_info varchar2(1000)
);

---------------- coffee_taste(커피맛 2 - 풍미) ----------------
create table coffee_taste(
    taste_num number(10),
    taste_info varchar2(1000)
);

---------------- coffee_grind(원두 갈기) ----------------
create table coffee_grind(
    grind_num number(5),
    grind_type varchar2(100)
);


commit;