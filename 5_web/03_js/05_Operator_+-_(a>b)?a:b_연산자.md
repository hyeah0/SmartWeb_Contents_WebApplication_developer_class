## Operator(연산자)

1. 대입(배정)연산자, 산술연산자(+,-,\*,/,%)
2. 관계(비교)연산자(>=, >, <=, <, !=, ==, ===)
3. 논리연산자(&&, ||, !)
4. 단항(증감)연산자(++,--)
5. 삼항연산자(()? a : b)
6. 복합대입연산자(+=, -=, \*=, /=, %=)

- [연산자 참고](https://github.com/hyeah0/Javascript/blob/master/Javascript_udemy/1_Variable/index1_Variable.js) (22)

### 1. 대입(배정)연산자, 산술연산자(+,-,\*,/,%)

    ```
    let num1 =  , num2 =  , result;
    /*
        ==
        let num1 =  ;
        let num2 =  ;
        let result;
    */

    result = num1 + num2;
    result = num1 - num2;
    result = num1 * num2;
    result = num1 / num2;
    result = num1 % num2;

    ```

### 2. 관계(비교)연산자(>=, >, <=, <, !=, ==, ===)

    ```
    let num1 = 10 ;
    let num2 = "10" ;
    let result;

    console.log( num1 >= num2);     // true
    console.log( num1 > num2);      // false
    console.log( num1 <= num2);     // true
    console.log( num1 < num2);      // false
    console.log( num1 != num2);     // false
    console.log( num1 == num2);     // true
    console.log( num1 === num2);    // false
    ```

#### \* == / === 의 차이

- == (동등연산자)

  - 동등연산자는 비교 대상 값의 자료형이 다른 경우에 강제로 자료형을 변경하여 비교를 한다.
  - 좌항과 우항을 비교하여 값이 자료형과 상관없이 내용이 같으면 true를 반환한다
  - 문자형 == 숫자형 이지만 내용이 같다면 true 값 반환

- === (일치연산자)
  - 좌항과 우항의 내용과 자료형이 모두 같아야 true 값을 반환해준다.
  - 내용이 같아도 자료형이 다르면 false 값 반환

### 3. 논리연산자(&&, ||, !)

- &&(and)

  - true && true ==> true
  - true && false ==> false
  - false && false ===> fasle

- ||(or)

  - true || true ==> true
  - true || false ==> true
  - false || false ==> fasle

- !(not)

  - !true ==> false
  - !false ==> ture

### 4. 단항(증감)연산자(++,--)

```
let testNum1 = 10;
++testNum1;

document.write("testNum1 >>> " + testNum1 + "<br>");    // 11

let testNum2 = 10;
testNum2++;
document.write("testNum2 >>> " + testNum2 + "<br>");   // 11
```

| 증감연산자 | 설명                                           |
| ---------- | ---------------------------------------------- |
| ++n        | 먼저 n 값을 1 증가시킨 후에 연산을 진행        |
| n++        | 먼저 연산을 수행하고 나서, n의 값을 1 증가시킴 |
| --n        | 먼저 n 값을 1 감소시킨 후에 연산을 진행함      |
| n--        | 먼저 연산을 수행하고 나서, n의 값을 1 감소시킴 |

### 5. 삼항연산자(()? a : b)

- (조건)? a : b
- 조건이 참일때 a 실행, 거짓일때 b 실행

### 6. 복합대입연산자(+=, -=, \*=, /=, %=)

- 복합대입연산자는 대입연산자(=)와 다른 연산자를 하나로 묶어 간단하게 표현할때 주로 사용된다.

```
let a =20;

	document.write("a = a + 10 >>> " + (a+=10) + "<br>");       // 30
	document.write("a = a - 10 >>> " + (a-=10) + "<br>");       // 20
	document.write("a = a * 10 >>> " + (a*=10) + "<br>");       // 200
	document.write("a = a / 10 >>> " + (a/=10) + "<br>");       // 20
	document.write("a = a % 10 >>> " + (a%=10) + "<br>");       // 0
```
