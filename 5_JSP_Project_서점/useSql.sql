-- 사용 쿼리문 정리
-- 1. 화제의 책
-- 2. 종로 pick
-- 2. 카테고리별 책

-- 화제의 책(한달이내에 주문 량 ,보통 주단위 수정필요)
select book_num
     , sum(order_qty) as order_month
  from book_order
 where sysdate - order_date <30
 group by book_num
 order by order_month desc;

-- 화제의 책(한달이내에 주문량 best 5) json
select rownum 
     , o.book_num
     , order_month
     , b.cgy_num
     , b.book_name
     , b.book_price
     , b.book_qty
     , b.book_cont
     , b.book_img
  from (select book_num
             , sum(order_qty) as order_month
          from book_order
         where sysdate - order_date <30
         group by book_num
         order by order_month desc) o
  join book b 
    on o.book_num = b.book_num
 where rownum >=1 and rownum <=5;

-- 화제의 책(한달이내에 주문량 best 5) json
select o.*
     , b.cgy_num
     , b.book_name
     , b.book_price
     , b.book_cont
     , b.book_img
     , JSON_OBJECT( KEY 'book_num' IS to_char(o.book_num) FORMAT JSON,      
                    KEY 'order_month' IS to_char(o.order_month) FORMAT JSON,
                    KEY 'cgy_num' IS cgy_num FORMAT JSON, 
                    KEY 'book_name' IS book_name FORMAT JSON,
                    KEY 'book_price' IS TO_CHAR(book_price) FORMAT JSON,
                    KEY 'book_qty' IS TO_CHAR(book_qty) FORMAT JSON, 
                    KEY 'book_cont' IS book_cont FORMAT JSON,
                    KEY 'book_img' IS book_img FORMAT JSON
                    ) AS bestBooksBest5Json
  from (select book_num
             , sum(order_qty) as order_month
          from book_order
         where to_date(sysdate,'yyyy-mm-dd') - to_date(order_date,'yyyy-mm-dd') <30
         group by book_num
         order by order_month desc) o
  join book b 
    on o.book_num = b.book_num
 where rownum >=1 and rownum <=5;

-- 화제의 책(한달이내에 주문량 best 5_ ) json
with bestTable as (
    select '"'|| o.book_num || '"' as book_num
         , '"'|| o.order_month || '"' as order_month
         , '"'|| b.cgy_num || '"' as cgy_num
         , '"'|| b.book_name || '"' as book_name
         , '"'||b.book_price || '"' as book_price
         , '"'||b.book_qty || '"' as book_qty
         , '"'||b.book_cont || '"' as book_cont
         , '"'||b.book_img || '"'  as book_img
      from (select book_num
                 , sum(order_qty) as order_month
              from book_order
             where sysdate - order_date <30
             group by book_num
             order by order_month desc) o
      join book b 
        on o.book_num = b.book_num
     where rownum >=1 and rownum <=5
)
select JSON_OBJECT( KEY 'book_num' IS book_num FORMAT JSON,      
                    KEY 'order_month' IS order_month FORMAT JSON,
                    KEY 'cgy_num' IS cgy_num FORMAT JSON, 
                    KEY 'book_name' IS book_name FORMAT JSON,
                    KEY 'book_price' IS book_price FORMAT JSON,
                    KEY 'book_qty' IS book_qty FORMAT JSON, 
                    KEY 'book_cont' IS book_cont FORMAT JSON,
                    KEY 'book_img' IS book_img FORMAT JSON
                    ) AS bestBooksBest5Json
  from bestTable;
 
----------------------------------------------------------------------------------
-- 종로 pick - 1년간 판매된 책 기준
-- 누적 판매량
select b.*
     , o.order_year
  from book b  
   join (select book_num 
              , sum(order_qty) as order_year
           from book_order
          where sysdate - order_date <= 365
          group by book_num
          order by order_year desc) o
     on b.book_num = o.book_num;    -- 까지 누적판매량 일경우(1년기준) _ 판매가 되지 않는 책은 보여주지 않는다. 

-- 최소, 최근 등록
select b.*
  from book b 
   join (select book_num 
              , sum(order_qty) as order_year
           from book_order
          where sysdate - order_date <= 365
          group by book_num) o
     on b.book_num = o.book_num  -- 까지 누적판매량 일경우(1년기준) _ 판매가 되지 않는 책은 보여주지 않는다.
  order by book_price; 

         
-- 날짜계산 참고
select book_num
     , sysdate  ------------
     , sysdate-30
     , sysdate - order_date
     , to_date(sysdate,'yyyy-mm-dd')
     , to_date(sysdate,'yyyy-mm-dd') - to_date(order_date,'yyyy-mm-dd')
  from book_order
 where sysdate - order_date <= 365;   

-- 북 넘버별 총 누적 주문건 
select book_num
     , sum(order_qty)
  from book_order
  group by book_num;

-- 판매된 책
         
----------------------------------------------------------------------------------
-- 카테고리별 이동 
select * from book order by book_sales desc;
-- 카테고리번호에 따른 카테고리 이름
select cgy_num, cgy_name from category where cgy_num = 'n002';

-- 카테고리별 연 주문량 (주문안된 책 포함)
select b.*
      , case when o.order_year is null then 0 else o.order_year end as order_year
  from book b
  left join (select book_num 
                  , sum(order_qty) as order_year
               from book_order
              where sysdate - order_date <= 365
              group by book_num
              order by order_year desc) o
     on b.book_num = o.book_num 
  --where b.cgy_num = 'n001'
  order by order_year desc;

-- 도서 전체보기 누적 판매량
-- 메인 종로 pick 누적 판매량 순과 다른점 
-- 메인 종로 pick = 1년사이에 판매가 안된 책은 보여지지 않는다 
-- 카테고리 누적 판매량 = 1년사이에 판매가 안된 책도 보여진다.
--row_number() 윈도우 함수 참고
(select row_number() over(order by board_no desc) as row_num;

-- 카테고리별 리스트(누적 주문건)
-- order_cnt : 기간 오더수 뽑는 쿼리_ 사용 테이블 book_order
-- order_cnt_num : 기간 동안 오더수 없는 책 포함, 주문건 없을 경우 0으로 변경, 카테고리 선택가능
-- order_cnt_row : 기간 오더수 row
-- 마지막 : 기간 오더수 row 설정(페이징)
with order_cnt as(select book_num   
                      , sum(order_qty) as order_year
                   from book_order
                  where sysdate - order_date <= 365 --기간설정
                  group by book_num
),order_cnt_num as (select b.*
                          , case when o.order_year is null then 0 else o.order_year end as order_year
                      from book b
                      left join order_cnt o
                         on b.book_num = o.book_num 
                     -- where b.cgy_num = 'n001' -- 카테고리 설정
),order_cnt_row as(
                    select ROW_NUMBER() over(order by order_year desc) as row_num
                         , y.*
                      from order_cnt_num y
)
select r.*
   from order_cnt_row r;
--  where r.row_num>=16 and r.row_num<=30;
 
-- 카테고리별 리스트(최소, 최근등록) 
select * from book;

with book_db as (select ROW_NUMBER() over(order by book_date desc, book_num desc) as row_num
                       , b.*
                   from book b
)select * 
   from book_db;
--  where row_num >= 1 and row_num <=5;
  order by row_num;

------------

  
-- 도서 전체 보기 (최소, 최신순)
select book_num , cgy_num, book_name, book_date
  from book
  where cgy_num = 'n001'
  order by book_date desc, book_num desc;
  
 order by book_price;
 
---- 검색 -----------------------------------------------------------------
-- 검색시 검색 결과 갯수
select count(*)
  from book b
  where b.cgy_num = 'n002' -- 카테고리 설정
    and ( book_name like '%검은%' 
     or book_writer like '%검은%'
     or book_publisher like '%검은%'
     or book_cont like '%검은%');

-- 검색시 도서 리스트(누적)

with order_cnt as(select book_num   
                      , sum(order_qty) as order_year
                   from book_order
                  where sysdate - order_date <= 365 --기간설정
                  group by book_num
),order_cnt_num as (select book_name
                         , book_cont
                         , book_writer
                         , book_publisher
                         , case when o.order_year is null then 0 else o.order_year end as order_year
                      from book b
                      left join order_cnt o
                         on b.book_num = o.book_num 
                      where b.cgy_num = 'n001' -- 카테고리 설정
                        and ( book_name like '%검은%' 
                         or book_writer like '%검은%'
                         or book_publisher like '%검은%'
                         or book_cont like '%검은%')
                        
),order_cnt_row as(
                    select ROW_NUMBER() over(order by order_year desc) as row_num
                         , y.*
                      from order_cnt_num y
)
select r.*
   from order_cnt_row r
  where r.row_num>=1 and r.row_num<=30
  order by r.row_num;
  
select '2022-10-20'
     , to_date('20201020','yyyy-mm-dd')
     , to_date('20221101064040', 'yyyyMMddhhmiss')
     , sysdate
 from dual;

-- 게시글 내용 보기 -----------------------------
-- 게시글 번호 가장 끝자리
 select * 
   from (SELECT * FROM board ORDER BY board_NUM DESC);
   
   select max(board_num) from board;


 select b.*
      , bc.board_cgy_name
   from board b
   join board_category bc
     on b.board_cgy_num = bc.board_cgy_num
  where b.mem_num = 1;
  
-- 배너
select * 
  from banner
 where to_date('2022-11-20','yyyy-mm-dd') between banner_start and banner_end;    
   
-- 한달 동안 고객이 가장 많이 구매한 책 카테고리
 select bo.mem_num
      , max(cgy_num) as max_order_cgy
   from book_order bo
   join book b 
     on bo.book_num = b.book_num
  where sysdate - order_date <= 30 --기간설정
    and mem_num = 1
  group by mem_num
  order by mem_num;
  
-- 특정 카테고리 한달 주문건
select b.book_num
      , book_name
      , book_price
      , book_img
  from book b
  join (select book_num 
              , sum(order_qty) as order_year
           from book_order
          where sysdate - order_date <= 30
          group by book_num
          order by order_year desc) o
     on b.book_num = o.book_num 
  where b.cgy_num = 'n002';
  
  order by order_year desc;
  
-- 최근 주문건
select *
  from book_order;


 select bo.*
     , to_char(to_date(order_date, 'yyyy-MM-dd hh:mi:ss'),'yyyymmddhhmiss') || mem_num as orderTmpNum 
     , LISTAGG(order_num, ', ') WITHIN GROUP (ORDER BY order_num) over(partition by to_char(to_date(order_date, 'yyyy-MM-dd hh:mi:ss'),'yyyymmddhhmiss') || mem_num) as ordernum
     , LISTAGG(book_num, ', ') WITHIN GROUP (ORDER BY book_num) over(partition by to_char(to_date(order_date, 'yyyy-MM-dd hh:mi:ss'),'yyyymmddhhmiss')|| mem_num )
  from book_order bo
  join book b
    on bo.book_num = b.book_num
 where sysdate - order_date <= 7; -- 7일이전
   and mem_num = 1;
   
-- 일주일 주문건 정리 그룹 전
   select to_char(to_date(order_date, 'yyyy-MM-dd hh:mi:ss'),'yyyymmddhhmiss') || mem_num as orderTmpNum 
        , order_num
        , order_date
        , bo.book_num
        , bo.mem_num
        , order_qty
        , b.book_Name
        , b.book_price
        , b.book_img   
   from book_order bo
   join book b
     on bo.book_num = b.book_num
  where sysdate - order_date <= 7 -- 7일이전
    order by mem_num , order_num;

-- 일주일 주문건 정리 그룹 후
with ordernum as (select 'b'||to_char(to_date(order_date, 'yyyy-MM-ddhh24:mi:ss'),'yymmddhh24miss')||mem_num as order_tmp_num
                        , order_num
                        , order_date
                        , bo.book_num
                        , bo.mem_num
                        , order_qty
                        , b.book_price
                   from book_order bo
                   join book b
                     on bo.book_num = b.book_num
                  where sysdate - order_date <= 7 -- 7일이전
                    order by mem_num , order_num
),
ordernum2 as ( select order_tmp_num
                     , max(order_date) as order_date
                     , count(order_tmp_num) as order_count
                     , max(mem_num) as mem_num
                     , max(book_num) as repre_book_num
                     , sum(order_qty) as total_order_qty
                     , sum(book_price) as total_order_price
                  from ordernum
                 where mem_num = 1
                group by order_tmp_num
                order by order_tmp_num desc
)
select o.order_tmp_num, o.order_date, o.order_count, o.mem_num, o.total_order_qty, o.total_order_price
     , b.book_num , b.book_name, b.book_img 
  from ordernum2 o
  join book b
    on o.repre_book_num = b.book_num;
    



select LISTAGG(book_num, ', ') WITHIN GROUP (ORDER BY book_num) over(partition by order_date) as orderbooknum
  from book_order;
