## Screen 객체의 주요 속성

- 사용자의 모니터 정보(속성)를 제공해주는 객체

  | 메서드      | 사용              | 설명                                        |
  | ----------- | ----------------- | ------------------------------------------- |
  | width       | screen.width      | 화면의 너비값을 반환                        |
  | height      | screen.height     | 화면의 높이값을 반환                        |
  | availWidth  | screen.availWidth | 작업표시줄을 제외한 화면의 너비값 반환      |
  | availHeight | screen.availHeigt | 작업표시줄을 제외한 화면의 높이값 반환      |
  | colorDepth  | screen.colorDepth | 사용자 모니터가 표현 가능한 컬러 bit를 반환 |

## - 예시

```
document.write("화면 너비 >>> " + screen.width + "<br>");
document.write("화면 높이 >>> " + screen.height + "<br>");
document.write("작업표시줄을 제외한 화면 너비 >>> " + screen.availWidth + "<br>");
document.write("작업표시줄을 제외한 화면 높이 >>> " + screen.availHeight + "<br>");
document.write("표현 가능한 컬러 >>> " + screen.colorDepth + "<br>");
```
