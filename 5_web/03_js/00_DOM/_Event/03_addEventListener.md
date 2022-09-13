## addEventListener(event, function)

- 이벤트 추가
- 사용법

1. document.addEventListener(event, function, Capture)
2. document.addEventListener(event, function(){
   document.getElementById("demo").innerHTML = "Hello World";
   });

- Capture : 생략가능 (default = fasle)
  - 이벤트 수신기의 특징을 지정할 수 있는 객체
  - [특징 상세](https://developer.mozilla.org/ko/docs/Web/API/EventTarget/addEventListener)

## 이벤트 요소

| 이벤트 요소 | 설명                                                           |
| ----------- | -------------------------------------------------------------- |
| click       | 마우스 클릭시 발생하는 이벤트                                  |
| mouseover   | 마우스를 해당요소 위에 올리면 발생하는 이벤트                  |
| mouseout    | 마우스를 해당요소 위에 뒀다가 떼면 발생하는 이벤트             |
| mousedown   | 클릭 하고있는 상태, 드래그 같은거 할 때 발생하는 이벤트        |
| mouseup     | 마우스 버튼을 떼는 순간 발생하는 이벤트                        |
| keypress    | 키를 누르는 순간, 키를 누를 때 계속 발생하는 이벤트            |
| keydown     | 키를 누를 때 발생하는 이벤트                                   |
| load        | 웹페이지에서 사용할 파일이 모두 다운 되었을 때 발생하는 이벤트 |
| scroll      | 스크롤 할 때 발생하는 이벤트                                   |
