## - 자바스크립트 함수의 종류

1. 사용자 정의 함수 : 사용자가 직접 만들어 놓은 함수
2. 내장함수 : 자바스크립트에서 자체적으로 제공해 주는 함수

## -- 1. 사용자 정의 함수

1. 매개변수를 받지않는 함수
2. 매개변수를 받는 함수
3. 무명함수().. 화살표함수
4. 리턴값이 있는 함수
5. 콜백 함수

### 1. 매개변수를 받지않는 함수

- 형태

  ```
  function 함수명(){
              함수 호출 시 실행될 문장;
      }

  함수명();  // 함수실행
  ```

- 예시

  - function onclick 포함

  ```
  <script>
  function divClick(){
              console.log("divClick 실행!");
          }
  divClick();
  // ㄴ div를 클릭하지않아도 실행이 먼저 된다.
  // ㄴ 액션하지 않아도 함수가 실행되길 원하면 함수를 호출하면된다.

  function hello(){
              document.write("<h4>버튼 클릭</h4>")
          }

  </script>
  <body>
      <div onclick="divClick()">
      <input type="button" onclick="hello()" value="버튼 클릭">
  </body>
  ```

### 2. 매개변수를 받는 함수

- 형태
  ```
  function 함수이름(매개변수1, 매개변수2){
      함수 호출 시 실행될 문장;
  }
  ```
- 예시

  - 두수를 입력받아 더한다.

    ```
    let num1 = Number(prompt("숫자를 입력하세요.."));
    let num2 = Number(prompt("숫자를 입력하세요.."));

    // 인자함수
    function plus(num1, num2){
                document.write("두 수의 덧셈은? >>> " + (num1+num2) + "<br>");
            }

    // 함수실행
    plus(num1,num2);
    ```

### 3. 무명함수()

- 무명함수
  - 이름이 없는 함수
  - 이벤트 처리에 자주 사용이 된다.
  - 무명함수는 주로 재사용 하지 않는 경우에 사용이 된다.
  - 호출시에 변수값에 함수를 저장후에 변수명() 호출하면 된다.
- 형태

  ```
  let 변수명 = function(){
    함수 호출 시 실행될 문장;
  }
  변수명();
  ```

- 예시

  ```
  let numbering = function(){
                            for(let i=1; i<=10; i++){
                                document.write("i >>> " + i + "<br>");
                            }
                }
  numbering();
  ```

### -- 화살표함수

- 형태

  - function 생략, {} 생략 (function만 생략하는 경우도 있다.)

    ```
    1. 인자 x
    let 변수명 = () => 함수 호출 시 실행될 문장;
    변수명();

    2. 인자 o
    let 변수명 = (매개변수1, 매개변수2) => 매개변수1, 매개변수2 로 실행할 문장;
    ```

- 예시

  ```
  const dontUseArrow = function(){
                  console.log('do not use arrow function!');
          }
  dontUseArrow();

  // 화살표 함수 사용
  const useArrow = () => console.log('use arrow function!');
  useArrow();

  // 인자함수
  const add1 = (e,f) => e + f;
  const add2 = (e,f) => {
      return e + f;
  };
  ```

### 4. 리턴값이 있는 함수

- 함수실행시 리턴될 값을 지정한다.

- 형태

  ```
  // 매개변수는 생략가능
  function 함수명(매개변수1, 매개변수2){
       return 함수실행시 값으로 들어갈 값
  }
  let 변수명 = 함수명(매개변수1, 매개변수2); // let 변수명에는 return값이 들어가있다.
  ```

- 예시

  ```
  let num1 = 8, num2 =2;
  function sum(num1, num2){
        return num1 + num2;
  }
  let testSum = sum(num1,num2);
  document.write(testSum);          // 10
  ```

### 5. 콜백 함수

- 함수 호출시 매개변수로 넘어가는 값이 함수인 경우를 말한다.(함수가 인자로 넘어감)
- 형태

  ```
  // 함수1
  let 변수명 = function 함수명1{
        함수 호출 시 실행될 문장;
  }

  // 함수2
  function 함수명2(함수명1){
        함수명1로 실행할 문장;
  }

  함수명2(함수명1);
  ```

- 예시

  ```
  // 함수1
  let call = () => alert("함수 호출!");

  // 함수2
  function callTenTimes(call){
      for(let i=1; i<=10; i++){
          call();
      }
  }

  // callTenTimes 함수의 인자로 call 함수가 들어갔다.
  callTenTimes(call);

   ** -------- 결과 -------- **
   alert이 10번 호출된다.
  ```
