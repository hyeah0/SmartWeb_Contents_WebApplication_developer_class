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
-- 1. 장바구니에 가장 많이 담은 taste 의 주문건 상의 탑 10 (장바구니 수량 카운팅)_ 10건이 안될경우 가장 많이 판매된 원두랑 합치기
-- 2. 장바구니에 담은 상품이 없을 경우 가장 많이 주문한 taste 의 주문건 상의 탑 10
-- 3. 장바구니에 담은 상품도 없고 주문한 상품도 없을경우 가장 많이 판매된 원두

-- 1. 장바구니에 가장 많이 담은 taste 의 주문건 상의 탑 10 _ 10건이 안될경우 가장 많이 판매된 원두랑 합치기
-- , RANK() OVER (PARTITION BY DEPT ORDER BY SAL DESC, COMM DESC) RANK
-- 참고. 장바구니 + 상품 테이블
select *
  from coffee_cart cc
  join coffee_beans cb
    on cc.beans_num = cb.beans_num
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
 
 
with maxCartTaste as (select max(beans_taste) as max_taste
                        from coffee_cart cc
                        join coffee_beans cb
                          on cc.beans_num = cb.beans_num
                       where member_num = 1
),maxOrderTaste as ( select co.beans_num
                          --, max(co.beans_taste) as taste
                          , count(co.beans_num) as cnt
                          , case when ma.max_taste = co.beans_taste then 1 else 2 end as priority_row
                       from maxCartTaste ma
                       right join coffee_order co 
                         on ma.max_taste = co.beans_taste
                      group by beans_num, case when ma.max_taste = co.beans_taste then 1 else 2 end
                      order by priority_row, cnt desc
)select rownum
      , mot.priority_row 
      , mot.beans_num
      , cb.beans_name
      , cb.beans_taste
      , mot.cnt as order_cnt
      , cb.beans_price
      , cb.beans_img
   from maxOrderTaste mot
   join coffee_beans cb
     on mot.beans_num = cb.beans_num
  where beans_count>0
    and rownum<=10;
                 
-- 2. 장바구니에 담은 상품이 없을 경우 가장 많이 주문한 taste 의 주문건 상의 탑 10
-- 참고 :주문 내역
select *
  from coffee_order
  where member_num = 1;
  
select beans_taste
     , count(beans_taste)
  from coffee_order
 where member_num = 1
 group by beans_taste, beans_num;
  
  
-- 3. 장바구니에 담은 상품도 없고 주문한 상품도 없을경우 가장 많이 판매된 원두
select 

-- 찜 확인
select nvl(max(COFFEE_STAR),0) as COFFEE_STAR
     , nvl(max(COFFEE_HEART),0) as COFFEE_HEART
     , nvl(max(MEMBER_NUM),0) as MEMBER_NUM
     , nvl(max(BEANS_NUM),0) as BEANS_NUM
  from member_star
 where member_num = 1
   and beans_num = 8;
   


-------------------------------------------------------------------------

--- 멤버 테스트 결과 포함
select fm.*
    , ct.*
 from final_member fm
 join coffee_test ct
   on fm.test_num = ct.test_num
 where member_num='1' and member_pwd='1234';
 
-- 찜 목록확인 
-- 커피빈 전체
select ms.*
     , cb.*
 from member_star ms
 join coffee_beans cb
   on ms.beans_num = cb.beans_num
where ms.member_num = 1;
