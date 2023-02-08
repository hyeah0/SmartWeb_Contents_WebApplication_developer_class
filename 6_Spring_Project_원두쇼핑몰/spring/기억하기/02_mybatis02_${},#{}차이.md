## mybatis에서 #{}, ${}차이

- [coffeeOrder.xml](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/6_Spring_Project_%EC%9B%90%EB%91%90%EC%87%BC%ED%95%91%EB%AA%B0/spring/FinalProject/src/main/resources/mapper/coffeeOrder.xml)

## #{}

- 파라매터가 String으로 들어온다.
- DB상 id컬럼의 데이터가 abc일경우 쿼리상으로는 id = 'abc'로 된다.
- 쿼리 주입을 예방하여 보안측면에서 유리

## ${}

- 파라매터가 바로 출력
- 컬럼의 자료형에 맞춰 파라매터의 자료형이 변경
- 쿼리 주입을 예방할 수 없어 보안측면에서 불리
- 테이블, 컬럼명을 바로 파라메터로 전달하고 싶을때 사용
