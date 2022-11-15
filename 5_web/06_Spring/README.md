## jsp 파일 실행하기

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/06_Spring/00_img/SpringMakeProject/howRunJSP.png" width="70%">
<p>오른쪽 클릭 Run As >> Run on Server</p>

## 한글 깨지지 않게 하기

- jsp 파일 상단에 하단 코드 작성하기

```
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
```

## 서버 포트번호 변경하기

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/06_Spring/00_img/SpringMakeProject/changePortNum.png" width="70%">

## 스프링이란?

- 자바 언어 기반
- 애플리케이션을 제작 시 효율적으로 빠르게 개발할 수 있도록 하는 애플리케이션 프레임워크 (프로그래밍 툴)

## EJB(Enterprise Java Beans)

- Java Beans 이란 자바 객체를 재사용 가능하도록, 컴포넌트화 시킬 수 있는 코딩 방침을 정의한 것
- 서비스가 구현해야 하는 실제 비지니스 로직보다 EJB 컨테이너를 사용하기 위한 상투적인 코드(상속 and 구현 해야하는 클래스) 들이 많다. 당연히 작성된 코드는 EJB 컨테이너가 없다면 사용할 수 없게 된다.
- 이에 2002년 로드 존슨이 특정 클래스를 상속하거나 인터페이스를 구현하지 않는 평범한 자바 클래스(POJO : Plain Old Java Object) 느슨한 Java Bean을 이용하여 단순하지만 EJB에서 제공하는 고급기술을 제공하는 스프링을 창시하게 되었다.

## 스프링 프레임 워크란?

- 스프링은 엔터프라이즈(기업용) 애플리케이션에서 필요로 하는 여러가지 기능들을 제공하는 프레임워크이다.
- 스프링은 Java EE에서 제공하는 기능 외에 DI나 AOP 같은 기능들을 추가적으로 제공함.

### 프레임워크(framework)란?

- 프레임워크(framework)의 사전적 의미는 "어떤 것을 구성하는 구조 또는 뼈대"라는 뜻을 가지고 있음.
- 소프트웨어적인 의미로는 "기능을 미리 클래스나 인터페이스 등으로 만들어 제공하는 반제품"
  정도로 해석을 할 수 있다
- 즉, 어느 정도는 완성된 상태로 제공되는 기능을 말함.

# 스프링 프레임워크의 특징.

- 스프링은 경량의 프레임워크.
  - 자바의 객체를 담고 있는 컨테이너(IoC 컨테이너).
  - 객체의 생성, 관리, 소멸과 같은 생명 주기를 관리함.
- 스프링은 유지보수가 용이함.
- 스프링은 개발 기간을 효율적으로 단축할 수 있음.
