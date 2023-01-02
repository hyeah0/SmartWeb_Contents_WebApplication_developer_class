## mybatis에서 if 사용

- 예시

```
<!-- 주문건 수 확인(페이징에 필요_total_record) -->
<select id="getRowCount" parameterType="hashmap" resultType="int">
    select count(distinct order_num) as rowCnt
        from coffee_order
    where member_num = #{member_num}
    <if test="type_num !=null">
        and type_num = #{type_num}
    </if>
    <if test="start !=null">
        and order_date between to_date(#{start},'yyyy-mm-dd hh24:mi:ss') and to_date(#{end},'yyyy-mm-dd hh24:mi:ss')
    </if>
</select>
```

- [if 참고 홈페이지](https://kimvampa.tistory.com/177)
- [coffeeOrder.xml](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/6_Spring_Project_%EC%9B%90%EB%91%90%EC%87%BC%ED%95%91%EB%AA%B0/spring/Final_Coffee_CuppACoffee/src/main/resources/mapper/coffeeOrder.xml)
