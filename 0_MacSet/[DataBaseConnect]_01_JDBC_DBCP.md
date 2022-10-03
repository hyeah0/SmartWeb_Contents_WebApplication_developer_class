## 데이터 베이스 연결

- JDBC 방식

  - [예시 코드(오라클)](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/oracle/00_%EC%98%A4%EB%9D%BC%ED%81%B4%EC%9D%B4%ED%81%B4%EB%A6%BD%EC%8A%A4%EC%97%B0%EA%B2%B0%EC%98%88%EC%8B%9C.md)
  - [예시 코드(mysql)](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mysql/00_mysql%EC%9D%B4%ED%81%B4%EB%A6%BD%EC%8A%A4%EC%97%B0%EA%B2%B0%EC%98%88%EC%8B%9C.md)

- DBCP 방식

## 1. JDBC(Java DataBase Connecitivity) 방식

- JDBC 방식

  - 기본생성자

    1. 드라이버 로딩
    2. 데이터 베이스 연결

  - 자바와 데이터베이스 간의 연결
  - 데이터베이스에 연결하려면 드라이버(driver) 연결 하고 커넥션(Connection) 객체를 받아와야 한다.
  - JDBC 방식을 사용하면 사용자가 요청할 때마다 매번 드라이버를 로딩하고,<br>
    데이터 베이스에서 커넥션 객체를 생성하여 연결하고 사용 후 종료 하기 때문에 비효율 적이고 데이터베이스에 부하가 많이 생기는 단점이 있다.
  - 커넥션을 생성하고 사용후 닫는데 시간이 소요되기 때문에 <br>
    동시접속자가 많은 웹 사이트에서는 전체적인 성능이 낮아진다.

## 2. DBCP(DataBase Connection Pool) 방식

- 데이터베이스와 Connection을 맺고 있는 객체를 관리하기 위한 방법
  - JDBC의 단점을 극복하기 위해 사용된다.
  - Was(Web Application Server_tomcat)에 connection 객체 공간 (풀(pool))을 따로 만들어 놓는다.
  - 데이터베이스와 연결된 커넥션(Connection)을 미리 생성해서 풀(pool) 속에 저장해 두고 있다가 필요할 때마다 가져다가 사용하고 반납한다.
  - 미리 생성해 두기 때문에 데이터베이스의 부하를 줄여주고, 유동적으로 연결을 관리 할 수 있다.
  - 커넥션 풀을 사용하면 커넥션을 생성해도 닫는데 시간이 소모되지 않기 때문에 애플리케이션의 실행 속도가 빨라진다.
  - 한번에 생성될 수 있는 커넥션 수를 제어하기 때문에 동시 접속자 수가 몰려도 웹 어플리케이션은 쉽게 다운 되지 않는다.
  - 따라서 커넥션 풀을 사용하면 전체적인 웹 애플리케이션의 성능과 처리량이 향상되므로 많은 웹 애플리케이션이 커넥션 풀을 기본으로 사용하고 있다.

## JNDI(Java Naming DIrectory Interface)

- 커넥션 풀에 접근하려면 JNDI 서비스를 이용해야한다.
- JNDI는 서버에서 관리하고 있는 리소스에 대한 정보를 알고 있는 특정한 리소스를 찾아서 사용할 수 있도록 객체를 반환해 준다.
- 디렉토리 서비스에 접근하는데 필요한 API이며, 이 API를 이용하여 서버의 자원을 찾을 수 있다.
- 자원이란 데이터베이스 서버 등을 의미하는데 이런 다른 시스템과 연결을 제공하는 객체이다.
- 자원을 서버에 등록할 때는 고유한 JNDI 이름을 붙여 사용한다.
- 톰캣 서버에서 이 자원을 관리하는 가상의 디렉토리는 "java:comp/env" 이다.
- 해당 디렉토리에 고유한 JNDI 이름을 붙여 해당 자원을 찾게 된다.
- 찾을 때는 lookup() 메서드를 이용하여 자원을 찾고, 찾은 객체의 타입은 Object 타입이다.
- 따라서 원래 리소스 타입으로 형변환이 필요하다.

## 커넥션 풀을 사용하기 위해 필요한 라이브러리

- commons-connection-3.2.1.jar
- commons-dbcp-1.4.jar
- commons-pool-1.6.jar
