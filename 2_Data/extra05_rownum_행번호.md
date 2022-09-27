## 행의 번호 정하기

- rownum : 행의 순번을 정한다.
- 데이터가 만들어진 순서대로 row값이 정해진다.

```
select rownum
     , deptno , dname, loc
  from dept
 order by rownum;
```

- 결과

| rownum | deptno | dname      | loc      |
| ------ | ------ | ---------- | -------- |
| 1      | 10     | ACCOUNTING | NEW YORK |
| 2      | 20     | Mar        | Seoul    |
| 3      | 30     | SALES      | CHICAGO  |
| 4      | 40     | OPERATIONS | BOSTON   |
| 5      | 3      | test03     | test03   |
| 6      | 60     | test01     | test02   |
| 7      | 2      | test02     | l        |
| 8      | 1      | test03     | l        |
