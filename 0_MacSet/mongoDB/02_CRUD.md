# 목차

0. 자료형
1. CRUD

## 0. 자료형

- 컬렉션에 컬럼을 정의하지 않아도 된다.
  > 컬렉션 >> 테이블
- 자바스크립트의 자료형을 따른다.
- Date 와 같이 자바스크립트 객체도 자료형으로 사용 가능하다.
- 자주 사용하는 추가 자료형 종류
    <table>
        <tr>
            <td><b>Binary Data</b></td>
            <td>2진수 데이터를 저장하는데 사용</td>
        </tr>
        <tr>
            <td><b>Timestamp</b></td>
            <td>문서가 수정되거나 추가될때 기록</td>
        </tr>
        <tr>
            <td><b>ObjectId</b></td>
            <td>고유값을 가진 값(MySQL 에서 id와 비슷하다)
            <br>기본키
            </td>
        </tr>
    </table>

## 1. CRUD

### CRUD 하기전

```
brew services start mongodb-community   // 몽고디비 실행
mongosh             // 몽고 프롬프트 접속
use 데이터베이스명      // 데이터베이스 사용 또는 생성
```

### CRUD 예시

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mongoDB/img/CRUD.png" width="100%">

- 컬렉션명(테이블명) : users
    <table>
        <tr>
            <th>CRUD</th>
            <th>예시</th>
        </tr>
        <tr>
            <td>Create</td>
            <td><b>db.users.insertOne</b>({ name: 'Kim', age: 24, married : false, comment:'hi', createAt: new Date()});</td>
        </tr>
        <tr>
            <td>find</td>
            <td><b>db.users.find</b>({ age: {$gte: 24} }).sort({age:-1}).limit(1).skip(0);</td>
        </tr>
        <tr>
            <td>Update</td>
            <td><b>db.users.updateOne</b>({ name: 'Kim'}, {$set : {comment : '코멘트를 수정합니다.'} });</td>
        </tr>
        <tr>
            <td>Delete</td>
            <td><b>db.users.deleteOne</b>({ name: 'Kim' });</td>
        </tr>
    </table>

### Create

- <b>insertOne</b>
  ```
  db.컬렉션명.insertOne({컬럼명: '컬럼데이터', 컬럼명: 12, 컬럼명:'컬럼데이터', ... , createAt: new Date()});
  ```

### Read

- <b>find</b>

  #### - 조건이 없을경우

  ```
  db.컬렉션명.find();
  ```

  #### - 조건이 있을 경우

  ```
  db.컬렉션명.find({조건컬럼: '조건'}, {조건컬럼: 조건});
  ```

  - `select * from 테이블명 where 컬럼명 = 조건 and 컬럼명 = 조건;`
  - 테이블명은 컬럭션 명이다.

  - 조건이 이상, 이하, 초과, 미만, 또는, in 일경우

    - ex)

      - sql : where 컬럼명 > 30
      - mongodb: ({조건컬럼: { <b>$gt</b>: 30}});

    - 연산자 종류
      <table>
          <tr>
              <td>$gt / $gte</td>
              <td>초과/이상</td>
          </tr>
          <tr>
              <td>$lt / $lte</td>
              <td>미만/이하</td>
          </tr>
          <tr>
              <td>$ne</td>
              <td>같지 않음</td>
          </tr>
          <tr>
              <td>$or</td>
              <td>또는</td>
          </tr>
          <tr>
              <td>$in</td>
              <td>배열 요소중 하나</td>
          </tr>
      </table>

  #### - 내림차순, 오름차순

  - sort

    - -1 : 내림차순
    - 1 : 오름차순

      ```
      db.컬렉션명.find({조건컬럼: '조건'}).sort({컬럼명: -1});
      ```

  #### - n번째에서 n개까지

  - limit, skip

    - limit : n개까지
    - skip : n번째 row부터 출력

      > MySQL : [LIMIT, OFFSET](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mysql/03_%ED%85%8C%EC%9D%B4%EB%B8%94READ_%ED%8E%98%EC%9D%B4%EC%A7%95%EC%8B%9C.md)

      ```
      db.컬렉션명.find({조건컬럼: '조건'}).limit(1).skip(1);
      ```

      조건컬럼의 데이터가 조건과 같을때 2번째 행부터 1줄만

### Update

- <b>updateOne .. $set</b>

  ```
  db.컬렉션명.updateOne({컬럼명1: '값'}, { $set: {컬럼명2: '수정값'} });
  ```

- sql
  ```
  update 테이블명           >>> 컬렉션명
     set 컬럼명 = '수정값'   >>> 컬럼명2 = '수정값'
   where 기본키컬럼명 = 값;   >>> 컬럼명1 = '값'
  ```

### Delete

- <b>deleteOne</b>

  ```
  deleteOne({ 컬럼명: '값' });
  ```
