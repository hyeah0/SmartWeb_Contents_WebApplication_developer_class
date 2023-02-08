## mybatis에서 sql with절 사용하기

- &lt;sql id="sql조각 이름설정"/&gt; : 다른 구문에서 재사용하기 위한 SQL 조각
- &lt;include refid="sql조각 이름"/&gt; : SQL 조각 이름

[coffeeCart.xml](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/6_Spring_Project_%EC%9B%90%EB%91%90%EC%87%BC%ED%95%91%EB%AA%B0/spring/FinalProject/src/main/resources/mapper/coffeeCart.xml)

```
<!-- 1-1. 가장 많이 주문한 상품 맛 -->
<sql id="max_cart">
    select beans_taste
                , sum(cart_cnt) as cart_cnt
            from coffee_cart cc
            join coffee_beans cb
                on cc.beans_num = cb.beans_num
            where member_num = #{member_num}
            group by beans_taste
            order by cart_cnt desc
</sql>

<!-- 1-2. 가장 많이 주문한 상품 맛 순서대로 넘버링 -->
<sql id="recog_priority">
    select row_number() OVER (order by mct.cart_cnt desc)||'_'||beans_taste AS recog_priority_row
            , beans_taste
            , cart_cnt
        from max_cart_taste mct
        order by recog_priority_row
</sql>

<!-- 2-1. 상품 넘버별 주문 수량 합계 -->
<sql id="order_row_all">
    select beans_num
        , sum(order_cnt) as order_cnt
        from coffee_order
        group by beans_num
</sql>

<!-- 2-2. 상품 평점 -->
<sql id="star_avg">
    select beans_num
            , count(beans_num) as people_cnt
            , sum(coffee_star) as sum_star
            , sum(coffee_star)/ count(beans_num) as avg_star
            from member_star
            where coffee_star not in(0)
            group by beans_num
</sql>

<!-- 2-3. 2-1과 2-2를 합침(상품의 주문수량 , 평점 테이블) -->
<sql id="star_add">
        <![CDATA[ select cb.beans_num
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
            order by beans_taste, order_cnt desc]]>
</sql>

<!-- 3. 1, 2의 결과를 합침 (장바구니에 가장 많이 담겨져있는 상품의 주문량, 별점) -->
<sql id="fin">
        select row_number() over(order by rec.recog_priority_row, sta.order_cnt desc) as row_pri
            , rec.recog_priority_row
            , sta.*
        from star_add_order_row sta
        left join recog_priority_row rec
            on sta.beans_taste = rec.beans_taste
        order by rec.recog_priority_row, sta.order_cnt desc
</sql>

<!-- 장바구니에 상품이 있을 경우 -->
<select id="getRecListCart" parameterType="int" resultType="coffeeCartDTO">

    with max_cart_taste as (  <include refid="max_cart"/>

    ), recog_priority_row as (  <include refid="recog_priority"/>

    ), order_row as (  <include refid="order_row_all"/>

    ), star_avg_row as (  <include refid="star_avg"/>

    ), star_add_order_row as (  <include refid="star_add"/>

    ), fin as(	<include refid="fin"/>

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
        where row_pri between 1 and 8
</select>

```
