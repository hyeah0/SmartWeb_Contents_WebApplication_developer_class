## 표준 내장 객체

- JavaScript의 모든 표준 내장 객체와 그 메서드 및 속성
- 표준 내장 객체 != 전역객체

  - 표준 내장 객체 : 전역 범위의 여러객체
  - 전역객체

    - 엄격모드x - 전역범위에서 this로 접근
    - 지원 환경 - globalThis 로 접근
    - 전역범위 : 전역객체와 전역 객체가 상속한 속성으로 이루어진다.

      \*\* 엄격모드 : 'use strict';

      - 조용히 무시되던 에러를 확인 할 수있다.
      - ECMAScript의 차기 버전들에서 정의 될 문법을 금지한다.
      - JavaScript 변형이 제한된 환경에서 동작하고 싶을때 사용

## 항목별 표준 객체

<table border="1" cellspacing="0">
<tr> <th> 분류 </th> <th> 속성 </th>  <th> 설명 </th> <th> 참고링크 </th> </tr>
<tr> <td rowspan="2"> 함수속성 </td> <td>  isFinite()   </td>  <td> 함수는 주어진 값이 유한수인지 판별 <br> 필요한 경우 매개변수를 먼저 숫자로 변환    </td><td></td>  </tr>
<tr> <td>  isNaN()   </td>  <td> Not a Number 값인지 판별   </td> <td></td> </tr>
<tr> <td rowspan ="4"> 숫자 및 날짜  </td> <td> Number </td>  <td>   정수,실수를 표현하고 다룰 때 사용하는 원시 래퍼 객체  </td> <td> <a href="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/tree/main/5_web/03_js/00_Object/_Number"> Number 객체 </a>  </td> </tr>
<tr> <td>  BigInt   </td>  <td>  Number보다 큰 정수를 표현할 수 있는 내장객체    </td> <td>   </td> </tr>
<tr> <td>  Math   </td>  <td>  수학적인 상수와 함수를 위한 속성과 메서드를 가진 내장 객체 <br> Number자료형만 지원한다. <br>BigInt지원x   </td> <td> <a href="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/tree/main/5_web/03_js/00_Object/_Math"> Math 객체 </a>  </td> </tr>
<tr> <td>  Date   </td>  <td> 시간의 한 점을 플랫폼에 종속되지 않는 형태    </td> <td>   </td> </tr>
<tr> <td> 텍스트    </td> <td>  String   </td>  <td> String 전역 객체는 문자열(문자의 나열)의 생성자    </td> <td>   </td> </tr>
<tr> <td>  인덱스   </td> <td> Array </td> <td> Array 클래스는 리스트 형태의 고수준 객체인 배열을 생성할 때 사용하는 전역 객체  </td> <td> <a href="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/03_js/07_Array_%EB%B0%B0%EC%97%B4%EB%A9%94%EC%84%9C%EB%93%9C.md"> Array 메서드 </a>       </td> </tr>
<tr> <td rowspan ="2"> 키콜렉션    </td> <td>  Map   </td>  <td> Map 객체는 key-value 값으로 되어있다. object와 비슷한형태   </td> <td>   </td> </tr>
<tr> <td>  Set   </td>  <td> Set 객체는 자료형에 관계 없이 원시 값과 객체 참조 모두 유일한 값을 저장할 수 있다.</td> <td>   </td> </tr>
<tr> <td>  구조화된<br>데이터  </td> <td>  JSON   </td>  <td> JavaScript Object Notation(JSON)을 분석하거나 값을 JSON으로 변환하는 메서드를 가지고 있다.    </td> <td>   </td> </tr>
<tr> <th colspan="4">분류 설명</th> </tr>
<tr> <td>함수속성</td> <td colspan="3">객체에 붙지 않고 전역으로 호출하는 함수로, 반환 값을 호출자에게 바로 반환   </td>  </tr>
<tr> <td>숫자 및 날짜</td><td colspan="3">숫자, 날짜, 수학 계산을 나타내는 기본 객체 </td> </tr>
<tr> <td>텍스트</td><td colspan="3">문자열을 나타내는 객체로 문자열을 조작할 방법도 제공 </td> </tr>
<tr> <td>인덱스</td><td colspan="3">인덱스 값으로 정렬된 데이터의 콜렉션을 나타낸다.<br> 배열(형식배열 포함)과 배열형 객체를 포함. </td> </tr>
<tr> <td>키콜렉션</td><td colspan="3">인덱스 값으로 정렬된 데이터의 콜렉션을 나타낸다.<br> 배열(형식배열 포함)과 배열형 객체를 포함. </td> </tr>
<tr> <td>구조화된 데이터</td><td colspan="3">구조화된 데이터 버퍼 및 JavaScript Object Notation(JSON)을 사용하여 작성한 데이터를 나타내고 상호작용한다.</td> </tr>
</table>

- [추가자료참조](https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects)
