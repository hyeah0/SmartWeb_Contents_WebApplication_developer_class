## Class(클래스)

- es6 이후

- 클래스안에 하단 리스트가 들어갈수있다.

  1. 변수 (static, public, private)
  2. object(객체)
  3. methods(getter/ setters/ static)

- 객체를 상속받을 수도 있다. (extends)

- ☆ \`${key명 또는 변수명} 텍스트\` = 변수명 + "텍스트"

  - 기존 변수와 텍스트 혼합사용시 '+' 로 구분했던 것을 <br> 변수를 ${} 기호 안에 넣고 `` 으로 묶는다.

- [참고 코드](https://replit.com/@hyeah0/Class)

### 형태

```
// 1. 클래스 선언
  class 클래스명{

      // object 생성시 constructor(생성자) 사용한다.
      constructor(key1, key2){
          this.key1 = key1;
          this.key2 = key2;
      }

      // 메서드
      메서드명(){
          console.log(`${this.name} hi`);
      }

  }

// 지정
  const 변수명 = new 클래스명(key1 value, key2 value);
  let 변수명 = new 클래스명(key1 value, key2 value);

// 출력
// 1. 변수 출력
  console.log(변수명.key1);
  document.write(변수명.key1);

// 2. 메서드 실행
   변수명.메서드명();
```
