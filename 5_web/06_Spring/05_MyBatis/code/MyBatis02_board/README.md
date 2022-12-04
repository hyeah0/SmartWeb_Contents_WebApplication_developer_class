## DB 연결 방식 - 외부에서 가져오기

- [연결 방식 참고](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/Spring/06_DB%EC%97%B0%EA%B2%B0/01_%EC%99%B8%EB%B6%80%EC%97%90%EC%84%9C%EC%97%B0%EA%B2%B0.md)
- [관련코드]()

## 쿼리문 작성시 조건식 기호(> , <, &) 를 사용 할 때 주의

- xml에서는 이런 기호들을 쿼리문 조건식 기호로 인식하는 것이 아닌 태그로 인식하는 경우가 있다.
  <br> 이런 경우 에러가 발생 하므로, 조건식 기호들을 단순 문자열로 인식 시켜주어야 한다.
- 형식 )

```
<![CDATA[쿼리문]]>

<![CDATA[ select * from 테이블명 where colum1 > 1]]>
```

- [참고 코드](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/06_Spring/05_MyBatis/code/MyBatis02_board/src/main/resources/mapper/board.xml)

<h4>참고 코드 이미지</h4>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/06_Spring/00_img/SpringMyBatis/02_board/mybatis04_cdata.png" width="100%">

## sql 쿼리문 실행 전이나 후에 실행해야하는 증가값 가져오기

- DB작업 시 어떤 값을 가져와서 해당값을 증가시킨 후 입력하거나 입력된 후에 증가값을 가져올 때 사용
- MyBatis에서 제공하는 selectKey 태그를 이용 하면 별도의 쿼리 로직을 사용할 필요 업이 일괄 처리
- keyProperty 속성 : 해당 결과값이 들어갈 DTO 객체의 멤버 변수명이 오면 된다.
- order 속성 : 해당 쿼리문의 실행 순서를 의미한다.
  - BEFORE : 원래 쿼리문 이전에 selectKey 태그가 실행된다.
  - AFTER : 원래 쿼리문 이후에 selectKey 태그가 실행된다.
- 주의사항 : 반드시 멤버 변수에 해당하는 setter()와 getter() 메서드가 존재해야한다.
- [참고 코드](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/06_Spring/05_MyBatis/code/MyBatis02_board/src/main/resources/mapper/board.xml)

```
<insert id="insert" parameterType="boardDto">

		<selectKey resultType="int" keyProperty="board_no" order="BEFORE">
			select max(board_no) from board
		</selectKey>

		insert into board values(
			#{board_no} + 1,
			#{board_writer}, #{board_title}, #{board_cont},
			#{board_pwd}, default, sysdate, ''
		)
	</insert>
```

<h4>참고 코드 이미지</h4>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/06_Spring/00_img/SpringMyBatis/02_board/mybatis02_selectkey.png" width="100%">
