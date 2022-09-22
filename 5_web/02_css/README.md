## CSS

- Cascading Style Sheet
  - HTML 문서에 스타일(디자인)을 적용하는 언어</li>
  - CSS 사용 방법
    1. 인라인 방식(태그에 직접 적용),
    2. head 영역
    3. 외부 파일(\*.css)

### CSS 형식

### 1. 인라인 방식

```
<tag style="back.. "></tag>
```


### 2. head영역

  - &lt;head&gt; 태그 안쪽 &lt;title&gt; 태그 아래에 기재
```
 <style type="text/css"> </style>
```
### 3. 외부파일

  - &lt;head&gt; 태그 안쪽 &lt;title&gt; 태그 아래에 기재
```
<link rel="stylesheet" href="css/style.css">
```

  - link
    - 현재 문서와 외부 리소스(\*.css) 파일과의 관계를 명시하는 선언
  - rel="stylesheet"
    - &lt;link&gt; 태그로 연결하는 파일이 외부에 있는 스타일시트 파일이라는 뜻을 가지고 있음.
  - href
    - 이 속성은 링크된 리소스의 url 경로를 참조함.
    - 외부에 스타일시트 파일을 선언하고 사용하는 이유.
    - 모든 HTML 파일에 동일하게 스타일을 적용할 수 있다는 장점이 있다.

```
<style type="text/css">
        태그명 {
            속성 : 값;
        }

    /* 여러태그 속성 지정시(그룹선택자) */
        태그명,
        태그명,
        태그명 {
            속성 : 값;
        }

    /* 부모의 자식에 속성지정(추가자식을 포함한 자손에 속성 지정) */
        부모태그명 자식태그명{
            속성 : 값;
        }

    /* 부모의 자식에 속성지정 */
        부모태그명 > 자식태그명{
            속성 : 값;
        }
</style>
```
