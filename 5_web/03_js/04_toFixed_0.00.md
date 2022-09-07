## .toFixed()

- 소수점 자리를 설정시에 사용된다.
- 나눗셈, 나머지값 확인시에 사용된다.

  ```
    let num1 = parseInt(prompt("숫자1을 입력해주세요."));   // 7
    let num2 = Number(prompt("숫자2를 입력해주세요."));     // 3

    document.write("toFixed 사용전 >>> " + (num1 / num2) + "<br>");
    document.write("toFixed 사용후 >>> " + (num1 / num2).toFixed(2) + "<br>");

    - 결과
    toFixed 사용전 >>> 2.3333333333333335
    toFixed 사용후 >>> 2.33

  ```
