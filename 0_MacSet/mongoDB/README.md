# 몽고디비

- 자바스크립트 문법을 사용하는 NoSQL

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

#### 1. ~2. 계정 생성

```
test> use admin
...
admin> db.createUser({user: 'name', pwd: 'password', roles: ['root']})
...
```

- roles : root -> 모든 권한부여

-

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
