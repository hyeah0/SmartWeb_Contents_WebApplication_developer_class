## Control(제어문)

1. 조건문
   - if문, if~else문, 다중 if~else문
   - switch~case문
2. 반복문
   - while문, do~while문
   - for문

[Java 제어문](<https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/1_Java/day02~04_%EC%A0%9C%EC%96%B4%EB%AC%B8(Control).md>)

### 1. 조건문

#### 1. if

[if 참고자료](https://github.com/hyeah0/Javascript/blob/master/Javascript_udemy/6_If/index6_If.js)

#### 2. switch

- 다중 if else 문과 유사한 구조
- 다중 if else 문을 switch case 문으로 변경할 수 있는 경우는 <br>
  조건식이 특정한 값과 일치되는 경우(==) 만 switch case 문으로 변경 가능하다.
- 즉, 조건식이 == 인 경우를 제외하고 나머지 관계연산자(>=, >, <=, <, !=)와
  같은 비교연산자를 사용한 경우에는 switch case 문으로 변경할 수 없다.

[switch 참고자료](https://github.com/hyeah0/Javascript/blob/master/Javascript_udemy/8_Switch/index8_Switch.js)

### 2. 반복문

[for while 참고자료](https://github.com/hyeah0/Javascript/blob/master/Javascript_udemy/9_For_While/index9_For_While.js)

#### 1. while

- 1~100 사이의 숫자 중에서 홀수인 경우에는 글자를 빨간색으로,<br>
  짝수인 경우에는 글자를 파란색으로 화면에 출력

  ```
  let num2 = 1;
          while(num2 <= 100){
              if(num2%2 != 0){
                  document.write("<p style='color : red'>"+num2 +" <<< 홀수입니다.</p>");
              }else{
                  document.write("<font color = 'blue'>"+num2 +" <<< 짝수입니다.</font>");
              }
              num2++;
          }
  ```

#### 2. for

##### - 예시

###### - 문제

- 하단과 같이 출력
  - 첫번째
    <table border="1" cellspacing ="0" width ="150px">
      <tr> 
        <td> 1 </td> <td> 2 </td> <td> 3 </td> <td> 4 </td> 
      </tr>
      <tr> 
        <td> 5 </td> <td> 6 </td> <td> 7 </td> <td> 8 </td> 
      </tr>
      <tr> 
        <td> 9 </td> <td> 10 </td> <td> 11 </td> <td> 12 </td> 
      </tr>
      <tr> 
        <td> 13 </td> <td> 14 </td> <td> 15 </td> <td> 16 </td> 
      </tr>
    </table>
  - 두번째
    <table border="1" cellspacing ="0" width ="150px">
      <tr> 
        <td> 1 </td> <td> 5 </td> <td> 9 </td> <td> 13 </td> 
      </tr>
      <tr> 
        <td> 2 </td> <td> 6 </td> <td> 10 </td> <td> 14 </td> 
      </tr>
      <tr> 
        <td> 3 </td> <td> 7 </td> <td> 11 </td> <td> 15 </td> 
      </tr>
      <tr> 
        <td> 4 </td> <td> 8 </td> <td> 12 </td> <td> 16 </td> 
      </tr>
    </table>

###### - 풀이

- 첫번째

  - row(행), colum(열), 값이 들어갈 변수 지정
  - 테이블을 만들 HTML 값을 따로 변수로 지정하지 않음

  ```
  let row = 4;
  let colum = 4;
  let count =1;
  document.write("<table border='1' cellspacing ='0' width ='150px'");

    for(let i=1; i<=row; i++){ // 행
        document.write("<tr>");
            for(let j=1; j<=colum; j++){ // 열
                document.write("<td align ='right'>" + count + "</td>");
                count++;
            }
        document.write("</tr>");
    }

  document.write("</table>");
  ```

- 두번째

  - row(행), colum(열), 값이 들어갈 변수 지정
  - 테이블을 만들 HTML 값을 따로 변수로 지정, 마지막줄에 document.write(테이블변수명)

  ```
  let row = 4;
  let colum = 4;

  let table = "<table border='1' cellspacing='0' width='150px'>";
  for(let i=1; i<=row; i++){    // 행
      table += "<tr>";
          for(let j=0; j<colum; j++){
              table += "<td align = 'center'>" + (j*row+i)+ "</td>";
          }
      table += "</tr>";
  }
  table += "</table>";

  document.write(table);
  ```

- 행부분 계산식

  - (j \* 전체행갯수 + i)

        i => 크게 한번 돌아야하는 횟수
        j => i가 한번 돌때 돌아야하는 횟수

        row = 4, colum = 4;
        for(let i=1; i<=row; i++) ==> 4번 돌아야한다. (1,2,3,4)
        for(let j=0; j<colum; j++) ==> i가 한번 돌때 4번 돌아야한다, 돌때마다 j 초기화 값 : 0 (0,1,2,3)

    <table border="1" cellspacing ="0" width ="150px">
          <tr> 
            <th> i가 n번째 돌때 </th> <td> j * 총row + i = 값 </td> <td> j * 총row + i = 값  </td> <td> j * 총row + i = 값 </td> <td> j * 총row + i = 값</td> 
          </tr> 
          <tr> 
            <th> i가 첫번째 돌때 </th> <td> 0 * 4 + 1 = 1 </td> <td> 1 * 4 + 1 = 5  </td> <td> 2 * 4 + 1 = 9 </td> <td> 3 * 4 + 1 = 13 </td> 
          </tr>
          <tr> 
            <th> i가 두번째 돌때 </th> <td> 0 * 4 + 2 = 2 </td> <td> 1 * 4 + 2 = 6  </td> <td> 2 * 4 + 2 = 10 </td> <td> 3 * 4 + 1 = 14 </td> 
          </tr>
          <tr> 
            <th> i가 세번째 돌때 </th> <td> 0 * 4 + 3 = 3 </td> <td> 1 * 4 + 3 = 7  </td> <td> 2 * 4 + 3 = 11 </td> <td> 3 * 4 + 3 = 15 </td> 
          </tr>
          <tr> 
            <th> i가 네번째 돌때 </th> <td> 0 * 4 + 4 = 4 </td> <td> 1 * 4 + 4 = 8  </td> <td> 2 * 4 + 4 = 12 </td> <td> 3 * 4 + 4 = 16 </td> 
          </tr>
    </table>
