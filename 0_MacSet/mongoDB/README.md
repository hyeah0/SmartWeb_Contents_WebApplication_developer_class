# 몽고디비

- 자바스크립트 문법을 사용하는 NoSQL

- Mongodb는 BSON documents으로 데이터를 저장 (SQL에서 rows)

  > BSON : JSON 형태의 문서를 바이너리 형태로 인코딩한 바이트 문자열
  >
  > > 바이너리 : 0과 1, 두 숫자로만 이루어진 이진법

- document(row)들을 collection이라는 곳에 저장 (SQL에서 table)

- 모든 document들은 \_id라는 field를 필수적으로 갖는다.
- \_id의 값은 각 컬렌션 속에서도 unique하며 불변성을 갖으며, array를 뺀 모든 type가 될 수 있다. (기본키)
- MongoDB에서 알아서 \_id index값을 생성

# 목차

1. Homebrew를 통해 몽고디비를 설치
2. 1. 몽고디비 계정 생성 하기
   2. 권한부여

## 1. Homebrew를 통해 몽고디비를 설치

### 1. 몽고DB 설치

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mongoDB/img/homebrew_mongodb_download.png" width="100%">

```
brew tap mongodb/brew
brew install mongodb-community
brew install mongosh
```

- Mac `/usr/local/var/mongodb`에 데이터가 저장된다.

### 2. 몽고DB 실행

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mongoDB/img/homebrew_mongodb_active1.png" width="100%">

```
brew services start mongodb-community
```

### 3. 몽고DB 프롬프트에 접속

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mongoDB/img/homebrew_mongodb_active2.png" width="100%">

```
mongosh
```

- 프롬프트가 test>로 바뀌면 성공이다.
  > 프롬프트 : 누군가가 특정한 작업을 수행하는 걸 도우려 전달하는 메시지

## 2.

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mongoDB/img/homebrew_mongodb_create1.png" width="100%">

### 1~3. 계정 생성 & 종료

#### 1. ~2. 데이터베이스 사용 혹은 생성

- use [생성할 데이터베이스이름]

  - 생성할 데이터베이스명이 같은게 있다면 사용

    ```
    test> use admin
    ...
    admin> db.createUser({user: 'name', pwd: 'password', roles: ['root']})
    ...
    ```

- roles : root -> 모든 권한부여

#### 3. 프롬프트 종료

```
ctrl+c 누르기
```

#### 4. 몽고디비 서비스 종료

```
brew services stop mongodb-community
```

#### 5. 몽고디비 인증 사용 설정

- 애플 실리콘 맥용(m1, m2..)

  ```
  vim /opt/homebrew/etc/mongod.conf
  ```

- <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mongoDB/img/homebrew_mongodb_create2.png" width="100%">

- <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mongoDB/img/homebrew_mongodb_create3.png" width="100%">

  1.  `a`를 눌러 입력모드로 전환
  2.  인증사용 코드 입력
      ```
      security:
      authorization: enabled
      ```
  3.  `esc`를 눌러 명령어 모드로 전환
  4.  `:wq!`을 입력하여 입력한 코드 저장

#### 6. 생성한 계정으로 접속

##### 1. 몽고DB 실행

```
brew services start mongodb-community
```

##### 2. 새로 만든 계정으로 접속

```
mongosh admin -u name -p password
```
