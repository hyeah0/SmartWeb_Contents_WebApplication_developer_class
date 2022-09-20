## JavaScript 에서 HTML 태그 생성하기

| 소속               | 사용                                   | 설명                                                 |
| ------------------ | -------------------------------------- | ---------------------------------------------------- |
| HTML DOM Documents | createElement(tagName);                | 생성할 태그                                          |
| HTML DOM Documents | createTextNode(text);                  | 태그안에 들어갈 텍스트                               |
| HTML DOM Elements  | 부모.appendChild(변수명)               | 부모object에 가로 더할 태그 변수명을 자식요소로 추가 |
| HTML DOM Element   | 더할태그.setAttribute("속성명", "값"); | 속성을 더할 태그의 변수명에 속성 추가                |

## - 순서

1. 요소(태그) 를 만든다. (안에 들어갈 텍스트도 있다면 텍스트도 만든다.)
2. 텍스트를 만들었다면 요소(태그) 자식 요소로 추가한다. (appendChild)
3. 만든 요소(태그)를 body태그의 자식요소로 추가한다.

   - 꼭 body에 추가하지 않아도 된다.
   - 다른 object에 추가해도 된다. (예시 document.getElementById("myList"))

   ```
   // 1. 요소(태그) 만들기
   let h1_element = document.createElement("h1");
   let text = document.createTextNode("Hello! DOM");

   // 2. 텍스트 노드를 h1 노드의 자식요소로 추가
   h1_element.appendChild(text);

   // 3. h1태그를 문서의 body 태그에 추가해 주여야 한다.
   document.body.appendChild(h1_element);

   // ** HTML에서 확인가능한 태그 ** //
   <h1>Hello! DOM</h1>
   ```

## - 태그에 속성을 지정해야할 경우(&lt;a href = "" &gt; &lt;img src = "" &gt; .. etc )

1. 방법1 : 변수명.속성명

```

ex) img_element.src = "";

```

2. 방법2 : setAttribute("속성명", "값");

```

ex) img_element.setAttribute("height","200")

```

- 예시 코드

```

onload = () => {
            //1. 이미지 태그 생성
            let img_element = document.createElement("img");

            //2. 속성지정
            // 방법1 : 변수명.속성명
            // 방법2 : setAttribute("속성명", "값");
            img_element.setAttribute("src","../images/beauty.jpg");
            img_element.setAttribute("width","200");
            img_element.setAttribute("height","200")

            //3. body태그 안에서 실행
            document.body.appendChild(img_element);
        }

```
