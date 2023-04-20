# mongoose 몽구스

- MySQL에 시퀄라이즈가 있으면 몽고디비에는 몽구스가 있다.

- 몽구스는 시퀄라이즈와 달리 ODM(Object Document Mapping)라 불린다.

  - 릴레이션이 아니라 다큐먼트를 사용하기 때문이다.

    - <pre>
       <b>ODM(Object Document Mapping)</b>
         - NoSQL에 연결하는 라이브러리 
       <b>ORM(Object Relational Mapping)</b>
         - SQL에 연결하는 라이브러리
         - 객체 관계 매핑
         - 객체와 데이터베이스의 관계를 매핑해주는 도구
      </pre>

- 몽고디비 자바스크립트인데 왜 몽구스 사용하는지?
  - 몽고디비에 없는 기능을 몽구스가 보완하기 때문에

# 몽구스 특징

1. 스키마가 있다.
   - 몽고디비 테이블이 없어 자유롭데 데이터를 넣을 수 있지만,
     <br> 실수로 잘못된 자료형의 데이터를 넣을 수도 있고
     <br> 다큐먼트에 없는 필드의 데이터를 넣을 수도 있기 때문에
     <br> 몽고디비에 데이터를 넣기 전에 노드 서버단에서 데이터를 한번 필터링 한다.
2. populate 메서드로 MySQL의 Join 기능을 사용할 수 있따.
   - 단, 쿼리 한번에 데이터를 합쳐서 가져오는 것은 아니다.

# 몽구스 연결하기 링크

- [링크]()