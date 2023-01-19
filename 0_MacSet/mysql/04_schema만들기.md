## schema 만들기

- schema : 데이터베이스의 구조와 제약조건에 관한 전반적인 명세를 기술한 것이다.

### 순서

0. mysql workbench를 실행

1. schema 클릭 > 이미지 분홍 부분에 마우스 오른쪽 클릭 > Create Schema

   - <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mysql/image/make_schema/01.png" width="100%">

2. Schema Name 작성후 하단 [Apply] 버튼 클릭

   - <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mysql/image/make_schema/02.png" width="100%">

3. [Apply] 클릭 > [Close] 클릭

   - <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mysql/image/make_schema/03.png" width="100%">

   - <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mysql/image/make_schema/04.png" width="100%">

4. 프로젝트 이름 클릭 > Tables 클릭 > Create Table 클릭

   - <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mysql/image/make_schema/05.png" width="100%">

5. colum 생성 후 [apply] 버튼 클릭
   - <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mysql/image/make_schema/06.png" width="100%">
   - <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mysql/image/make_schema/07.png" width="100%">
   - <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mysql/image/make_schema/08.png" width="100%">
   - <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mysql/image/make_schema/09.png" width="100%">

<table>
    <tr>
        <th>PK</th>
        <td>Preimary Key</td>
        <td>기본키</td>
    </tr>
    <tr>
        <th>NN</th>
        <td>Not NULL</td>
        <td>null 값이 들어오지 못하게 설정</td>
    </tr>
    <tr>
        <th>UQ</th>
        <td>Unique</td>
        <td>중복값이 들어오지 못하게 설정</td>
    </tr>
    <tr>
        <th>B</th>
        <td>Binary</td>
        <td></td>
    </tr>
    <tr>
        <th>UN</th>
        <td>Unisigned</td>
        <td>정수인지(int 형을 사용하면서 조금 더 큰 범위의 수를 사용하고 싶을 때 사용)</td>
    </tr>
    <tr>
        <th>ZF</th>
        <td>ZeroFill</td>
        <td></td>
    </tr>
    <tr>
        <th>AI</th>
        <td>Auto Incerement</td>
        <td>자동으로 증가</td>
    </tr>
    <tr>
        <th>G</th>
        <td>Generated</td>
        <td></td>
    </tr>
</table>

## 외래키 설정

```
user(부모테이블) id -|-----> tweet(자식테이블) userid
```

1. [Foreign Keys] 클릭
2. 외래키 작성
3. on update, on delete : 부모의 컬럼이 업데이트 되거나, 삭제되었을때 연결된 자식테이블의 컬럼의 수정 옵션 설정
4. [apply] 버튼 클릭

| 옵션 종류 | 설명                                                                                                   |
| --------- | ------------------------------------------------------------------------------------------------------ |
| RESTRICT  | 개체를 변경/삭제할 때 다른 개체가 변경/삭제할 개체를 참조하고 있을 경우 변경/삭제가 취소(제한)         |
| CASCADE   | 개체를 변경/삭제할 때 다른 개체가 변경/삭제할 개체를 참조하고 있을 경우 함께 변경/삭제                 |
| NO ACTION | MYSQL에서는 RESTRICT와 동일                                                                            |
| SET NULL  | 개체를 변경/삭제할 때 다른 개체가 변경/삭제할 개체를 참조하고 있을 경우 참조하고 있는 값은 NULL로 세팅 |

- <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mysql/image/make_schema/10.png" width="100%">
- <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mysql/image/make_schema/11.png" width="100%">
- <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mysql/image/make_schema/12.png" width="100%">

## 테이블 수정

- 하단 이미지에서 빨간 네모칸 클릭시 테이블 수정 가능
- <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mysql/image/make_schema/13.png" width="100%">

## 테이블 쿼리 작성

- 하단 이미지에서 빨간 네모칸 클릭시 테이블 확인 및 쿼리 작성 가능
- <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mysql/image/make_schema/14.png" width="100%">
