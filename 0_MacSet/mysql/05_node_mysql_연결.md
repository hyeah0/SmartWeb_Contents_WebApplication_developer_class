## node.js MySQL연결하기

1. sql언어 직접사용
2. Sequelize 사용

### 1. sql언어 직접사용

### 2. Sequelize 사용

#### - Sequelize 란?

- MySQL 작업을 쉽게 할 수 있도록 도와주는 라이브러리
- [ORM(Object-Relational Mapping)](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mysql/05_ORM(Object Relational Mapping).md)으로 분류된다.
- MariaD , PostgreSQL, SQLite, MSQL 등 다른 데이터 베이스와 같이 쓸 수 있다.
  - 다른 SQL 데이터베이스로 전환시에 편리

#### - Sequelize 사용하기

1. `sequelize`, `sequelize-cli`, `mysql2` 패키지 설치

   - `sequelize-cli` : 시퀄라이즈 명령어를 실행하기 위한 패키지
   - `mysql2` : MySQL과 시퀄라이즈를 이어주는 드라이버

     ```
     npm i sequelize sequelize-cli mysql2
     ```

2. `sequelize init 명령어 호출`

   - 전역 설치 없이 명령어로 사용시 앞에 npx를 붙이면 된다.

     ```
     npx sequelize init
     ```

3. <b>config, models, migrations, seeders</b> 폴더 생성

   - 1. models 폴더 안에 index.js가 생성되었는지 확인
   - 2. index.js 안에 있는 코드 수정

        ```
        const Sequelize = require('sequelize');

        const env = process.env.NODE_ENV || 'development';
        const config = require('../config/config')[env];
        const db = {};

        const sequelize = new Sequelize(config.database, config.username, config.password, config);

        db.seqelize = sequelize;
        module.exports = db;
        ```

        - Sequelize : 시퀄라이즈 패키지이자 생성자
