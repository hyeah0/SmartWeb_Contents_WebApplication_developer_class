# compass

- 몽고디비 관리 도구
- GUI를 통해 데이터를 시각적으로 관리 할 수 있다.

1. compass 설치하기
2. 커넥션 생성하기
3. 데이터베이스 생성하기

## 1. compass 설치하기

- [홈페이지 compass 다운](https://www.mongodb.com/try/download/compass)

- homebrew 방식
  ```
  brew install --cask mongodb-compass-community
  ```

## 2. 커넥션 생성하기

1. 몽고디비 실행하기

   ```
   brew services start mongodb-community
   ...
   mongosh admin -u name -p password
   ```

2. MongoDB Compass Community 실행

   - <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mongoDB/img/create_connection.png" width="100%">

   - Advanced Connection Options 클릭

   - <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mongoDB/img/create_connection2.png" width="100%">
   - Authentication 을 Username/Password로 변경
   - 몽고디비 계정이름과 비밀번호 입력
   - Connect 버튼 클릭 > localhost:27017로 접속

## 3. 데이터베이스 생성하기

1. localhost 화면에서 createdatabase 클릭

- <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mongoDB/img/create_database01.png" width="100%">

2. 데이터베이스 생성

- <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mongoDB/img/create_database02.png" width="100%">
- <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mongoDB/img/create_database03.png" width="100%">
