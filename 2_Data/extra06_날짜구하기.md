```
from dual;
```

<table>
  <tr>
    <th>특정 날짜 형식(date 타입)</th>
    <td>to_date(sysdate, 'yyyy-mm-dd')</td>
  </tr>
  <tr>
    <th>특정 날짜 형식(date 타입)</th>
    <td>to_char(sysdate,'yyy-mm-dd')</td>
  </tr>
  <tr>
    <th>월 첫번째일자</th>
    <td>trunc(sysdate,'mm')</td>
  </tr>
   <tr>
    <th>월 마지막일자</th>
    <td>last_day(to_date(sysdate,'yyyy-mm-dd'))</td>
  </tr>
   <tr>
    <th>지난달 구하기</th>
    <td>to_char(add_months(sysdate, -1),'yyyymm')</td>
  </tr>
   <tr>
    <th>다음달 구하기</th>
    <td>to_char(add_months(sysdate, 1),'yyyymm')</td>
  </tr>
</table>
