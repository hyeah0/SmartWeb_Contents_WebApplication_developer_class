## mybatis에서 sql foreach 사용하기(반복)

- foreach : 반복적인 SQL 구문을 작성할 때 사용

- &lt;foreach&gt;의 6가지 속성
  | 속성명 | 설명 |
  |---|---|
  |collection | 전달받은 인자를 속성값으로 삽입<br>. Map, Array, List, Set 등과 같은 반복 가능한 객체를 전달 가능 |
  |item | collection속성에서 전달받은 collection 인자값을 대체할 '이름'값 지정 |
  |open | 구문이 시작될때 삽입할 문자열 |
  |close | 구문이 종료될때 삽입할 문자열 |
  |separator | 반복되는 구문 사이에 삽입할 문자열|
  |index | index값을 부를 일종의 변수명을 속성값 <br>태그 내에 #{index}를 통해 호출할 때 0부터 반환됩니다.|

### 일반 select 사용

```
<foreach collection="list" item="item" separator="," open="(" close=")">
    ${item}
</foreach>

>>> ( item, item, item ...)
```

### 다중 insert

```
<foreach collection="list" item="item" separator=" " open="insert all" close="select * from dual">
    into coffee_order values('${item.order_num}', ${item.order_row}, ${item.order_cnt}, ${item.order_price}, to_date('${item.order_date}','yyyyMMddhhmiss'),
    ${item.beans_num}, '${item.beans_name}', ${item.beans_price}, '${item.beans_taste}', ${item.cart_weight}, ${item.cart_grind}, ${item.member_num}, ${item.use_point}, default)
</foreach>

>>> insert all into coffee_order values('${item.order_num}', ${item.order_row}, ${item.order_cnt}, ${item.order_price}, to_date('${item.order_date}','yyyyMMddhhmiss'),
    ${item.beans_num}, '${item.beans_name}', ${item.beans_price}, '${item.beans_taste}', ${item.cart_weight}, ${item.cart_grind}, ${item.member_num}, ${item.use_point}, default)

    select * from dual
```

### 다중 update

```
<foreach collection="list" item="item" separator=";" open="declare begin" close="; end;">
    update coffee_beans set beans_count = beans_count - (${item.order_cnt}*(${item.cart_weight}/100)) where beans_num = ${item.beans_num}
</foreach>

>>> declare begin update coffee_beans set beans_count = beans_count - (${item.order_cnt}*(${item.cart_weight}/100)) where beans_num = ${item.beans_num}; end;
```

1. declare begin end - PL/SQL 기본으로 쿼리, 문법을 실행
2. declare [선언부] - 변수, 상수를 선언
3. begin [실행부] - 제어, 반복문, 함수 등 다양한 로직 기술을 실행
4. end [종료부] - 실행된 로직의 종료를 선언

### 다중 delete

```
<foreach collection="list" item="item" separator=";" open="declare begin" close="; end;">
    delete from coffee_cart where cart_num = ${item.cart_num}
</foreach>
```

### 예시 코드

[coffeeOrder.xml](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/6_Spring_Project_%EC%9B%90%EB%91%90%EC%87%BC%ED%95%91%EB%AA%B0/spring/Final_Coffee_CuppACoffee/src/main/resources/mapper/coffeeOrder.xml)

```
<!-- 장바구니 리스트(주문전 수량, 그람 확정) -->
<select id="getCartListFin" parameterType="java.util.List" resultType="coffeeOrderDTO">
    select ca.cart_num
        , ca.cart_cnt  as order_cnt
        , be.beans_price * ca.cart_cnt * (ca.cart_weight/100) as order_price
        , ca.beans_num
        , be.beans_name
        , be.beans_price
        , be.beans_taste
        , be.beans_img
        , ca.cart_weight
        , ca.cart_grind
        , ca.member_num
    from coffee_cart ca
    join coffee_beans be
    on ca.beans_num = be.beans_num
    where ca.cart_num in
    <foreach collection="list" item="item" separator="," open="(" close=")">
        ${item}
    </foreach>
    and be.beans_count not in(0)
    order by ca.cart_num desc
</select>

<!-- 장바구니 통해서 주문(상품 여러개 주문) -->
<update id="insertOrder" parameterType="java.util.List">
    <foreach collection="list" item="item" separator=" " open="insert all" close="select * from dual">
        into coffee_order values('${item.order_num}', ${item.order_row}, ${item.order_cnt}, ${item.order_price}, to_date('${item.order_date}','yyyyMMddhhmiss'),
        ${item.beans_num}, '${item.beans_name}', ${item.beans_price}, '${item.beans_taste}', ${item.cart_weight}, ${item.cart_grind}, ${item.member_num}, ${item.use_point}, default)
    </foreach>
</update>

<update id="updateBeanCnt" parameterType="java.util.List">
    <foreach collection="list" item="item" separator=";" open="declare begin" close="; end;">
        update coffee_beans set beans_count = beans_count - (${item.order_cnt}*(${item.cart_weight}/100)) where beans_num = ${item.beans_num}
    </foreach>
</update>

<!-- 장바구니 삭제 -->
<delete id="deleteCart" parameterType="java.util.List">
    <foreach collection="list" item="item" separator=";" open="declare begin" close="; end;">
        delete from coffee_cart where cart_num = ${item.cart_num}
    </foreach>
</delete>
```
