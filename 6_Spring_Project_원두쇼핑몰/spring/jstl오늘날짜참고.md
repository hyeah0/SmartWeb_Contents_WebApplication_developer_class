```
 <td class="search_date">
    <div class="s_date">

        <c:set var="now" value="<%=new java.util.Date()%>" />
        <c:set var="nowFormat"><fmt:formatDate value="${now}" pattern="yyyy/MM/dd" /></c:set>

        <input type="date" class="start_date" value="${nowFormat }">
        <span>-</span>
        <input type="date" class="end_date" value="${nowFormat}">
    </div>
</td>
```

- jstl로 value 값을 지정할 경우 오늘날짜가 value 값에 들어가지만, 화면에서는 보여지지 않는다.<br>
  화면에도 보여지게 하려면 자바 스크립트를 사용

```
<script>
    document.querySelector('.start_date').value = new Date().toISOString().substring(0, 10);
</script>
```
