## 한글 오류 방지 코드

```
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
```

- servlet에서 사용시 메서드 안 최상단에 작성
- jsp에서 사용시 <% 안에 코드 작성 %>
