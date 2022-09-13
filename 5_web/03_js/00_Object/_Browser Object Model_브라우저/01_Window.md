## window 객체의 주요 메서드

| 메서드        | 사용                             | 설명                                                   |
| ------------- | -------------------------------- | ------------------------------------------------------ |
| open          | open()                           | 새로운 창을 띄울때 사용                                |
| alert         | alert(message)                   | 알림/ 경고 창을 띄울때 사용                            |
| prompt        | prompt(message,defaultValue)     | 질의응답 창을 띄울때 사용                              |
| confirm       | confirm (message)                | 확인/취소 창을 띄울때 사용                             |
| moveTo        | moveTo()                         | 창의 위치를 이동 시킬때 사용                           |
| resizeTo      | resizeTo()                       | 창의 크기를 변경시킬대 사용                            |
| setInterval   | setInterval(function)            | 일정 간격으로 지속적으로 실행문을 실행시 사용          |
| setTimeout    | setTimeout(function, milisecond) | 일정 시간이 되면 한번만 실행문을 실행 시킬때 사용      |
| clearInterval | clearInterval(타이머변수)        | 일정 시간 후에 함수를 한번 실행하는 것을 중지시키는 것 |
| clearTimeout  | clearTimeout(타이머변수)         | 일정 시간 후 함수를 한번 실행하는 것을 중지하는 함수   |

## - setInterval/ setTimeout 예시 코드

```
// 2초마다 시간 변경
let intervalId = setInterval(() => {
                                    document.write("<p>" + new Date() +"</p> ");
                                    }, 2000);


// 1분 후에 clearInterval() 함수를 호출하여 setInterval() 함수를 종료
setTimeout(() => {
    clearInterval(intervalId)
    document.write("1분이 지났습니다.");
}, 60000);

// == 또는
// setTimeout(intervalId,6000);
```
