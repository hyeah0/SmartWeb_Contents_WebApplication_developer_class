## - LIMIT, OFFSET (페이징처리시 사용)

### - LIMIT N : N만큼 행 출력

```
Select \* from 테이블명 orders LIMIT N;


Ex) 10행 출력
select \* from member ORDERS LIMIT 10;
```

### - LIMIT N OFFSET N : offset N 부터 limit N까지 출력

```
Select \* from 테이블명 orders LIMIT N OFFSET N;

LIMIT 숫자 : 출력할 행의 수
OFFSET 숫자 : 몇번째 row부터 출력할 지. (1번째 row면 0)

Ex) 10행씩 출력

1페이지
select \* from member ORDERS LIMIT 10 OFFSET 0;

2페이지
select \* from member ORDERS LIMIT 10 OFFSET 10;

```

### - LIMIT N1, N2 : N1 row 부터 N2개의 row 출력

```
Select \* from 테이블명 orders LIMIT N1, N2;


N1 : N1번째 row부터 출력
N2 : N2개의 행 출력

Ex) 10행씩 출력

1페이지
select \* from member ORDERS LIMIT 0, 10;

2페이지
select \* from member ORDERS LIMIT 10, 10;
```
