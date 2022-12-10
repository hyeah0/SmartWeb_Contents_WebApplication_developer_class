-- 사용 sql 문
----- 특정 멤버넘의 장바구니 리스트 가져오기(정렬은 가장 최근 장바구니에 담은 것부터)
select *
  from coffee_cart
 where member_num = 1
 order by cart_num desc; 
 
----- 이미 장바구니에 있는 상품인지 확인
select cart_num
  from coffee_cart
 where member_num = 1
   and beans_num = 3;

------ 장바구니 데이터가 아예 없을경우
select nvl(max(cart_num),0) as cart_num
  from coffee_cart;
  
 where member_num = 1
   and beans_num = 10
   and cart_grind = 0;

  
------ 상품이 장바구니에 없을경우 0 값
select nvl(max(cart_num),0) as cart_num
     , nvl(max(cart_cnt),0) as cart_cnt
     , nvl(max(cart_weight),0) as cart_weight
     , nvl(max(cart_grind),0) as cart_grind 
  from coffee_cart
 where member_num = 1
   and beans_num = 10
   and cart_grind = 0;
   
--- 장바구니 가져오기
select ca.cart_num
     , ca.beans_num
     , ca.cart_cnt
     , ca.cart_weight
     , ca.cart_grind
     , be.beans_name
     , be.beans_price
     , be.beans_taste
     , be.beans_img
     , be.beans_url
     , case when ms.coffee_heart is null then 0 else ms.coffee_heart end as coffee_heart
  from coffee_cart ca
  join coffee_beans be
    on ca.beans_num = be.beans_num
  left join member_star ms
    on ca.member_num = ms.member_num
   and ca.beans_num = ms.beans_num
 where ca.member_num = 1
 order by ca.cart_num desc; 
  
-- 추천 상품
-- 기준 : 
-- 1. 장바구니에 가장 많이 담은 taste 순서대로 의 주문건 상의 탑 10 (장바구니 수량 카운팅)_ 10건이 안될경우 가장 많이 판매된 원두랑 합치기
-- 2. 장바구니에 담은 상품이 없을 경우 가장 많이 주문한 taste 의 주문건 상의 탑 10 _ 10건이 안될경우 가장 많이 판매된 원두랑 합치기

-- 1. 장바구니에 가장 많이 담은 taste 의 주문건 상의 탑 10 _ 10건이 안될경우 가장 많이 판매된 원두랑 합치기
-- , RANK() OVER (PARTITION BY DEPT ORDER BY SAL DESC, COMM DESC) RANK
--  RANK() OVER (PARTITION BY beans_taste ORDER BY cart_cnt) AS RANKING 
-- 참고. 장바구니 + 상품 테이블
select *
  from coffee_cart cc
 where member_num = 1;

-- 맛별 장바구니 수량
select beans_taste
     , sum(cart_cnt) as cart_cnt
  from coffee_cart cc
  join coffee_beans cb
    on cc.beans_num = cb.beans_num
 where member_num = 1
 group by beans_taste
 order by cart_cnt desc;
 
 -- 별점(평점) 총평점수/ 평점을 준 사람
 select beans_num 
      , count(beans_num) as cnt_people
      , sum(coffee_star) as sum_star
      , sum(coffee_star)/ count(beans_num) as avg_star
   from member_star
  where coffee_star not in(0)
  group by beans_num;
 
-- 1. 장바구니에 가장 많이 담은 taste 의 주문건 상의 탑 10 _ 10건이 안될경우 가장 많이 판매된 원두랑 합치기 
with max_cart_taste as (  
                select beans_taste
                     , sum(cart_cnt) as cart_cnt
                  from coffee_cart cc
                  join coffee_beans cb
                    on cc.beans_num = cb.beans_num
                 where member_num = 1
                 group by beans_taste
                 order by cart_cnt desc         
), recog_priority_row as (
                 select row_number() OVER (order by mct.cart_cnt desc)||'_'||beans_taste AS recog_priority_row
                       , beans_taste
                       , cart_cnt
                    from max_cart_taste mct
                    order by recog_priority_row               
), order_row as (
                select beans_num
                     , sum(order_cnt) as order_cnt
                  from coffee_order
                  group by beans_num
), star_avg_row as (
                select beans_num 
                      , count(beans_num) as people_cnt
                      , sum(coffee_star) as sum_star
                      , sum(coffee_star)/ count(beans_num) as avg_star
                    from member_star
                    where coffee_star not in(0)
                    group by beans_num
), star_add_order_row as (
                select cb.beans_num
                     , beans_name
                     , beans_price
                     , beans_taste
                     , beans_img
                     , case when ord.order_cnt is null then 0 else ord.order_cnt end order_cnt
                     , case when ar.people_cnt is null then 0 else ar.people_cnt end people_cnt
                     , case when ar.avg_star is null then 0 else ar.avg_star end avg_star
                  from coffee_beans cb
                  left join order_row ord
                    on cb.beans_num = ord.beans_num
                  left join star_avg_row ar
                    on cb.beans_num = ar.beans_num
                 where beans_count >0
                   order by beans_taste, order_cnt desc
) select rec.recog_priority_row
       , sta.beans_num
       , sta.beans_name
       , sta.order_cnt
       , sta.people_cnt
       , sta.avg_star
       , sta.beans_price
       , sta.beans_taste
       , sta.beans_img
    from star_add_order_row sta
    left join recog_priority_row rec
      on sta.beans_taste = rec.beans_taste
   order by rec.recog_priority_row, sta.order_cnt desc;

  
-- 2. 장바구니에 담은 상품이 없을 경우 가장 많이 주문한 taste 의 주문건 상의 탑 10
-- 참고 :주문 내역
select *
  from coffee_order
  where member_num = 1;
-------------------------------------------------------
with max_order_taste as (  
                select beans_taste
                     , sum(order_cnt) as order_cnt
                  from coffee_order
                 where member_num = 1
                 group by beans_taste, member_num           
), recog_priority_row as (
                  select row_number() OVER (order by mot.order_cnt desc)||'_'||beans_taste AS recog_priority_row
                       , beans_taste
                       , order_cnt
                    from max_order_taste mot
                    order by recog_priority_row
), order_row as (
                select beans_num
                     , sum(order_cnt) as order_cnt
                  from coffee_order
                  group by beans_num
), star_avg_row as (
                select beans_num 
                      , count(beans_num) as people_cnt
                      , sum(coffee_star) as sum_star
                      , sum(coffee_star)/ count(beans_num) as avg_star
                    from member_star
                    where coffee_star not in(0)
                    group by beans_num
), star_add_order_row as (
                select cb.beans_num
                     , beans_name
                     , beans_price
                     , beans_taste
                     , beans_img
                     , case when ord.order_cnt is null then 0 else ord.order_cnt end order_cnt
                     , case when ar.people_cnt is null then 0 else ar.people_cnt end people_cnt
                     , case when ar.avg_star is null then 0 else ar.avg_star end avg_star
                  from coffee_beans cb
                  left join order_row ord
                    on cb.beans_num = ord.beans_num
                  left join star_avg_row ar
                    on cb.beans_num = ar.beans_num
                 where beans_count >0
                   order by beans_taste, order_cnt desc
), fin as (select row_number() over(order by rec.recog_priority_row, sta.order_cnt desc) as row_pri
               , rec.recog_priority_row
               , sta.*
            from star_add_order_row sta
            left join recog_priority_row rec
              on sta.beans_taste = rec.beans_taste
           order by rec.recog_priority_row, sta.order_cnt desc
) select recog_priority_row
       , beans_num
       , beans_name
       , order_cnt
       , people_cnt
       , avg_star
       , beans_price
       , beans_taste
       , beans_img
    from fin
   where row_pri between 1 and 10;

----------------------------------
-- 재고가 있는 상품 + 주문건, 평점을 준 회원 수, 평점
with order_row  as (
                    select beans_num
                         , sum(order_cnt) as order_cnt
                      from coffee_order
                      group by beans_num
), avg_row as (
                select beans_num 
                      , count(beans_num) as people_cnt
                      , sum(coffee_star) as sum_star
                      , sum(coffee_star)/ count(beans_num) as avg_star
                    from member_star
                    where coffee_star not in(0)
                    group by beans_num
)
select cb.beans_num
     , beans_name
     , beans_price
     , beans_taste
     , beans_img
     , case when ord.order_cnt is null then 0 else ord.order_cnt end order_cnt
     , case when ar.people_cnt is null then 0 else ar.people_cnt end people_cnt
     , case when ar.avg_star is null then 0 else ar.avg_star end avg_star
  from coffee_beans cb
  left join order_row ord
    on cb.beans_num = ord.beans_num
  left join avg_row ar
    on cb.beans_num = ar.beans_num
 where beans_count >0
   order by beans_taste, order_cnt desc;
-----------------------------------------------------------------------------------------------   
  
-----------------------------------------------------------------------------------------------
-- avg_star : 커피 별점 평균 
select beans_num 
  , count(beans_num) as people_cnt
  , sum(coffee_star) as sum_star
  , sum(coffee_star)/ count(beans_num) as avg_star
from member_star
where coffee_star not in(0)
group by beans_num;  

-- 멤버 정보 가져오기 
select member_name
     , member_email
     , replace(member_phone,'-','')  as member_phone
     , case when replace(member_addr,',','') = '주소를 넣어주세요' then '-' else replace(member_addr,',',' ') end as member_addr 
     , case when replace(member_addr2,',','') = '주소를 넣어주세요' then '-' else replace(member_addr,',',' ') end as member_addr2 
     , case when replace(member_addr3,',','') = '주소를 넣어주세요' then '-' else replace(member_addr,',',' ') end as member_addr3 
     , case when replace(member_addr4,',','') = '주소를 넣어주세요' then '-' else replace(member_addr,',',' ') end as member_addr4 
     , case when replace(member_addr5,',','') = '주소를 넣어주세요' then '-' else replace(member_addr,',',' ') end as member_addr5 
     , member_point
  from final_member
 where member_num = 1;


-- 장바구니 가져오기, 그람, 수량을 합친 금액 까지 , 품절인 상품은 제외
select ca.cart_num
     , ca.beans_num
     , ca.cart_cnt  as order_cnt
     , be.beans_price * ca.cart_cnt * (ca.cart_weight/100) as order_price
     , ca.cart_weight
     , ca.cart_grind 
     , be.beans_name
     , be.beans_price
     , be.beans_taste
     , be.beans_img
     , ca.member_num
  from coffee_cart ca
  join coffee_beans be
    on ca.beans_num = be.beans_num
 where ca.member_num = 1
   and be.beans_count not in(0)
 order by ca.cart_num desc; 


