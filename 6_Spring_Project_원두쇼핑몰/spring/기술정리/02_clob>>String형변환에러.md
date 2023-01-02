## DB 자료형 clob >>> String 으로 데이터 가져오기 xml

- [coffeeTest.xml](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/6_Spring_Project_%EC%9B%90%EB%91%90%EC%87%BC%ED%95%91%EB%AA%B0/spring/Final_Coffee_CuppACoffee/src/main/resources/mapper/coffeeTest.xml)

## 형변환 에러 clob >>> String

## 에러 해결방법

- xml ResultMap을 사용
  - myBatis에서 제공
  - 자동 매핑으로 해결이 어려운 경우를 위해 구조를 설계할 수 있도록 만들어진 도구

## ResultMap 사용법

```
<resultMap type="클래스명" id="외부에지정할이름">

    <result property="클래스내 저장할 변수명 또는 키명" column="DB컬럼명" />
    <result property="클래스내 저장할 변수명 또는 키명" column="DB컬럼명" jdbcType="컬럼 자료형" javaType="자바 자료형" />

</resultMap>
```

## ResultMap 사용예시

```
2.
<!-- clob 데이터 가져오기 -->
<resultMap type="HashMap" id="getClobTest">

    <result property="test_type_num" column="test_type_num" />
    <result property="test_type_name" column="test_type_name" />
    <result property="test_type_img" column="test_type_img" jdbcType="CLOB" javaType="java.lang.String" />

</resultMap>

1.
<select id="getBrewTest" resultMap="getClobTest">
    select brew_num as test_type_num
            , brew_type as test_type_name
            , brew_img as test_type_img
        from coffee_brew
</select>

1. coffee_brew 테이블에서 자료를 가져온다.
2. result_map 타입으로 변환

```
