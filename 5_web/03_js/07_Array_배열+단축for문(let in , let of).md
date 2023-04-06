## Array(배열)

- 배열에 모든 자료형을 담을 수 있다 (java의 object 배열과 비슷)

  - 숫자
  - 텍스트
  - 배열
  - 객체

  ```
  let arr = [1, 'text', ['배열1','배열2','배열3'], { 객체key: 객체value} ]
  ```

- [참고 코드](https://replit.com/@hyeah0/Array)

## - 배열 생성방법

- 배열 생성 및 데이터 입력

  1.  let 배열명 = new Array(원소1, 원소2, 원소3, ... 원소n);

            let arrFruit = new Array("포도","사과","오렌지");

  2.  let 배열명 = new Array();

            let arrSubject = new Array();
            arrSubject[0] = "국어";
            arrSubject[1] = "수학";
            arrSubject[2] = "영어";

  3.  let 배열명 = [원소1, 원소2, 원소3, ... 원소n];

            let arrStudent = ["배홍동", "dongdong", 27, true];

- ECAM6 이차원 배열 생성

        const arr1 = Array.from(Array(row), () => new Array(colum))

        // arr[5][2] (빈 배열 생성)
        const arr1 = Array.from(Array(5), () => new Array(2))

        // arr[5][2] (null로 초기화하여 생성)
        const arr2 = Array.from(Array(5), () => Array(2).fill(null))

## - 배열 출력 예시

- 출력배열
  ```
  let arrSubject = new Array();
      arrSubject[0] = "국어";
      arrSubject[1] = "수학";
      arrSubject[2] = "영어";
  ```

1.  전체출력, 일부 출력

    ```
    document.write(배열명);
    document.write(배열명[인덱스]);

    document.write(arrSubject + "<br>");
    document.write(arrSubject[2] + "<br>");

    ** -------- 결과 -------- **
    국어,수학,영어
    영어
    ```

2.  단축for문

    - for(let in)

      - let 인덱스명(원하는거로) in 배열명

      ```
      for(let a in arrSubject){
          document.write(arrSubject[a]+ "<br>");
      }
      ** -------- 결과 -------- **
      국어
      수학
      영어
      ```

    - for(let of)

      - let 변수명(원하는거로) of 배열명

      ```
      for(let subject of arrSubject){
          document.write(subject + "<br>");
      }
      ** -------- 결과 -------- **
      국어
      수학
      영어
      ```

3.  for문
    ```
    for(let j=0; j<arrSubject.length; j++){
        document.write(arrSubject[j]+ "<br>");
    }
    ** -------- 결과 -------- **
    국어
    수학
    영어
    ```
