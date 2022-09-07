## 변수와 상수

- 변수
  - 데이터를 저장하는 공간(데이터가 변할 수 있다.)
  - 물건을 보관했다 꺼내는 창고의 개념과 비슷하다. (물건 = 데이터)
  - 특히 자바스크립트는 변수에 숫자, 문자, 함수, 클래스까지 저장이 가능하다.
- 상수
  - 데이터를 저장하는 공간
  - 데이터가 변할 수 없다.

### - 변수를 선언하는 방법

- 형식)

        var 변수명 = 값; --> 변수, 상수 구분없이 변수 선언 (ECMA5 까지 사용)
        let 변수명 = 값; --> 변수만 선언 (ECMA6 이후부터 사용)
        const 상수명 = 값; --> 상수만 선언

- var

  - var는 동일한 변수명을 만들 수 있어 혼동될 확률이 높고, 변수와 상수 구분이 되지않아 불편한 점을
  - 동일한 변수명을 만들 수 없는 <b>let</b> 과 상수를 뜻하는 <b>const<b>가 ECMA6부터 사용된다.

  - 예시

        case1 : 동일한 이름의 var / var 변수
        var a;
        var a; (가능)

        case2 : 동일한 이름의 var / let 변수
        var a;
        let a; (불가능)

        case3 : 동일한 이름의 let / let 변수
        let a;
        let a; (불가능)

### - 변수명 작성 규칙

- 영문 대/소문자, 숫자, \_ 또는 $만을 사용할 수 있다.
- 변수명의 첫글자로 숫자가 오면 안된다.
- 변수명은 대소문자를 구별한다.
  - sum 과 SUM은 다른 변수명으로 인식
- 변수명 작성시 소문자로 시작
- 공백이 들어가면 안된다.
- 변수명을 사용시 되도록 의미를 부여해서 작성하는 것이 좋다.
- 자바스크립트 예약어 사용할 수 없다.
  - 예시)document, do, for, var...
- 두단어 이상 결합해서 변수명 사용시 낙타봉 표기법(CamelCase)를 권장한다.

### - 변수 값으로 들어갈 수 있는것

- number
- string
- boolean
- typeof 연산자

- undefined
- null
- NaN

- array(배열)
- object(객체)
- function(함수형)
- class(클래스)

-[변수 참고자료](https://github.com/hyeah0/Javascript/blob/master/Javacript_nomad/d1-4_JS_basic/d1_1.html)

    - let/const(18) , undefined/null 차이(67)
    - array(86), object(105)

### 1. number(숫자형)

    - 숫자를 표현하는 자료형
    - 정수와 실수를 모두 총괄하는 자료형이다.
    - 십진수와 실수형은 일반적으로 사용하는 숫자이나,
        16진수는 글자색이나 배경색을 나타낼때 사용한다.
        예시) var age = 17;
            var color = 0xF00; (빨강색)

### 2. string(문자형)

    - 홑따옴표 또는 쌍따옴표를 양 끝에 두고, 그안에 한글자 이상의 문자가 있는 자료형을 문자형이라 한다.
    - 예시) var name = "홍길동";

### 3. boolean(논리형)

    - true/false(참/거짓) 두가지 값을 가지는 자료형

### 4. typeof 연산자

    - 해당 변수의 자료형을 알려주는 연산자

### 5. undefined

    - 변수를 만든 후 초기화 하지 않은 상태를 말한다.
    - 예시) var data;
            alert("data >>> " + data);

### 6. null

    - 아무것도 참조하고 있지 않다는 의미
    - 비어있는, 존재하지 않는 값을 의미한다.
    - 객체를 담을 변수를 초기화시 많이 사용된다.

### 7. NaN : Not a Number

    - 숫자가 아닌 데이터를 숫자처럼 사용할 때 나타나는 자료형

#### - undefined/null 차이

- undefined - 데이터타입(텍스트x), 변수는 정의했지만 값을 할당하지 않음
- null - 데이터타입(텍스트x) , 변수에 null이 할당됨

  ```
  // undefined
  let amIRich;
  console.log(amIRich);
  undefined

  // null
  const money = null;
  console.log(money);
  null
  ```

### 8. array(배열)

    - 예시)

            const fruits = ['사과', '배', '포도', '복숭아', '키위'];

### 9. object(객체)

- 한 데이터에 많은 정보가 필요할때

  - 예시)

  ```
  const loginData = {
                      loginID : "kkk",
                      passward : "aaa",
                      email : "bbb@email.com",
                      fat: true
                      }
  ```

### 10. function(함수형)

### 11. class(클래스)

### - 예시

#### - 상수

- 상수값을 변경하려 할때 에러가 생긴다.
- Uncaught TypeError: Assignment to constant variable. at 에러위치

  ```
  const cnst = 100;
  console.log(cnst);

  /*
      cnst = "홍길동";
      console.log(cnst);
      Ex01.html:140 Uncaught TypeError: Assignment to constant variable. at Ex01.html:140:8
  */

  ```
