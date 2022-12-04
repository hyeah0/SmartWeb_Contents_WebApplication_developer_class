## 참고 코드 이미지

- 메인페이지에서 멤버 리스트 전체를 보여주는 코드
<h4>메인페이지</h4>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/06_Spring/00_img/SpringMyBatis/01_member/mybatis04_01.png" width="100%">
<br>
<h4>a 태그 클릭시 member list 를 보여주는 페이지로 이동</h4>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/06_Spring/00_img/SpringMyBatis/01_member/mybatis04_02.png" width="100%">
<br>
<h4>member list</h4>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/06_Spring/00_img/SpringMyBatis/01_member/mybatis04_03.png" width="100%">

## 쿼리문 작성시 조건식 기호(> , <, &) 를 사용 할 때 주의

- xml에서는 이런 기호들을 쿼리문 조건식 기호로 인식하는 것이 아닌 태그로 인식하는 경우가 있다.
  <br> 이런 경우 에러가 발생 하므로, 조건식 기호들을 단순 문자열로 인식 시켜주어야 한다.
- 형식 )

```
<![CDATA[쿼리문]]>

<![CDATA[ select * from 테이블명 where colum1 > 1]]>
```

<h4>참고 코드 이미지</h4>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/06_Spring/00_img/SpringMyBatis/01_member/mybatis06_cdata.png" width="100%">
