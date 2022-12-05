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
  from coffee_cart
 where member_num = 1
   and beans_num = 2;