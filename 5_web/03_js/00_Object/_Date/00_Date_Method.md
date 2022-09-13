## Date 객체 메서드

1. Date 객체 사용전 데이트 객체 변수 저장
   `let date = new Date();`

2. 생성된 변수로 메서드 실행

| 메서드             | 사용                 | 설명                                                                          |
| ------------------ | -------------------- | ----------------------------------------------------------------------------- |
| getYear            | 날짜변수명.getYear() | 현재년도(기준년도가 1900 년도를 기준) <br> 1900년도 0으로 인식 / 1901년도 = 1 |
| getFullYear        | date.getFullYear()   | 현재년도(따로 1900년을 더하지 않아도 현재 년도를 알 수 있다.)                 |
| getMonth           | date.getMonth()      | 현재 월                                                                       |
| getDate            | date.getDate()       | 현재 일                                                                       |
| getDay             | date.getDay()        | 현재 요일(0 : 일요일 / 6: 토요일)                                             |
| getHours           | date.getHours()      | 현재 시간                                                                     |
| getMinutes         | date.getMinutes()    | 현재 분                                                                       |
| getSeconds         | date.getSeconds()    | 현재 초                                                                       |
| toLocaleDateString | toLocaleDateString() | 현재 날짜 |
| toLocaleTimeString | toLocaleTimeString() | 현재 시간                                                                     |


- 날짜 변수명 : date
  - `let date = new Date();` 로 변수 생성했다 가정

### 예시 코드

    ```
    // Date 객체 : 날짜와 시간과 관련된 정보를 제공해주는 객체
    let date = new Date();

    // 메서드
    // getYear() : 기준년도가 1900 년도를 기준으로 하고 있다.
    //             1900년도 0으로 인식함 / 1901년도 = 1
    // getFullYear() : 따로 1900년을 더하지 않아도 현재 년도를 알 수 있다.
    document.write("현재 년도 :" + date.getYear() + "년<br>");
    document.write("현재 년도 :" + (date.getYear()+1900) + "년<br>");
    document.write("현재 년도 :" + date.getFullYear() + "년<br>");

    // getMonth() : 현재 월
    document.write("현재 월 : " + (date.getMonth() + 1) + "월<br>");

    // getDate() : 현재 일
    document.write("현재 일 : " + date.getDate() + "일<br>");

    // getDay() : 현재 요일, 결과값 정수값으로 반환(0= 일요일 6=토요일)
    let day = date.getDay();
    switch(day){
        case 0 :
                day = "일요일";
                break;
        case 1 :
                day = "월요일";
                break;
        case 2 :
                day = "화요일";
                break;
        case 3 :
                day = "수요일";
                break;
        case 4 :
                day = "목요일";
                break;
        case 5 :
                day = "금요일";
                break;
        case 6 :
                day = "토요일";
                break;
    }

    document.write("현재 요일 : " + day);
    document.write("<hr>");

    // getHours/ getMinutes / getSeconds 현재시간
    document.write("현재 시간 : " + date.getHours() + " : " + date.getMinutes() + " : " + date.getSeconds());
    ```
