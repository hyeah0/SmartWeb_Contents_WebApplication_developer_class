## MyBatis 연결

### 1. 라이브러리 설정

- MyBatis
- MyBatis Spring
- [라이브러리](https://mvnrepository.com/)에서 검색 >> 코드 복사 >> pom.xml에 붙여넣기

<img src="https://github.chttps//github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_MyBatis/01_library01.pngom/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_MyBatis/01_library01.png" width="70%">

<div>
<img src="https://github.chttps//github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_MyBatis/01_library01.pngom/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_MyBatis/01_library02.png" width="45%">
<img src="https://github.chttps//github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_MyBatis/01_library01.pngom/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_MyBatis/01_library03.png" width="45%">
<p>1. MyBatis</p>
</div>
<div>
<img src="https://github.chttps//github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_MyBatis/01_library01.pngom/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_MyBatis/01_library04.png" width="45%">
<img src="https://github.chttps//github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_MyBatis/01_library01.pngom/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_MyBatis/01_library05.png" width="45%">
<p>2. MyBatis Spring</p>
</div>

### 2. jdbc, dbcp, lombok 라이브러리 설정

[jdbc, dbcp 설정 방법](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/tree/main/0_MacSet/Spring/06_DB%EC%97%B0%EA%B2%B0)
[lombok 설정 방법](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/tree/main/0_MacSet/Spring/04_lombok%EB%8B%A4%EC%9A%B4%EB%B0%8F%EC%84%A4%EC%A0%95)

### 1. 2 총 필요 라이브러리

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_MyBatis/02_pom.xml_set02.png" width="70%">

### 3. web.xml 한글 인코딩

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_MyBatis/03_web.xml_set01.png" width="70%">

### 4. root-context.xml DB설정

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_MyBatis/04_root-context_set01.png" width="70%">

### 4. servlet-context.xml 설정

- @Controller, @Service, @Component, @repository 애노테이션은 자동으로 빈으로 등록 해주는 태그
- com.spring.mybatis01 >> com.spring
  - 가장 마지막 패키지명은 뺀다.

```
<context:component-scan base-package="com.spring" />
```

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_MyBatis/04_servlet-context_set01.png" width="70%">

### 5. dao, controller 애노테이션 설정

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_MyBatis/04_root-context_set01.png" width="70%">

### 6. sql 문이 들어갈 패키지 생성

- src/main/resources 안에 패키지를 생성한다.
- 파일명은 root-context.xml 파일에서 sqlSessionFactory property value 값으로 지정한 파일명으로 작성 (상세는 이미지 확인)
  <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_MyBatis/06_package_set01.png" width="70%">

### 7. sql 문이 들어갈 패키지 안에 xml 파일 생성 후 서류정보 저장

1. 1번과 같이 서류 정보를 기재한다.
   <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_MyBatis/06_package_set02_mybatis03.png" width="70%">

- 검색창에 mybatis 검색 >> 홈페이지 클릭 >> getting started 클릭 >> Exploring Mapped SQL Statements 코드 참고
<div>
    <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_MyBatis/06_package_set02_mybatis01.png" width="45%">
    <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_MyBatis/06_package_set02_mybatis02.png" width="45%">
</div>

2.  <br>
    <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_MyBatis/06_package_set02_mybatis03.png" width="70%">
