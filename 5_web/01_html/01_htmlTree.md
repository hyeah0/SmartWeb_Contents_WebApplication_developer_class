## HTML TREE

- HTML 주석 : command + / -->

```
    HTML 트리구조

                HTML
            _____ㅣ______
            |           |
        head       body
    _____ㅣ_____
    |          |
    meta       title
```

1.  HTML(HyperText Markup Language)

    - HTML은 웹 페이지를 만드는데 사용되는 언어이며, 매우 쉽게 배울수 있는 장점이 있다.
    - 모든 태그는 미리 정의가 되어있어 각각의 태그와 속성을 사용하면 된다.

2.  HTML 용어

    - 요소(elements)

      - HTML에서 시작태그와 종료태그로 이루어진 모든 명령어들을 의미한다.

    - 태그(tag)

      - 요소(elements)의 일부로 시작태그와 종료태그 두 종류가 있다.

             예시)

             <시작태그> 텍스트(내용) </종료태그>
             시작태그와 종료태그는 같다.

             < 입력하면 여러 태그들을 볼 수 있다.

    - 속성(attributes)
      - 요소의 시작태그 안에서 사용되는 것
      - 좀 더 구체화된 명령어 체계를 의미한다.

```

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
</head>
<body>

</body>
</html>
```

```
<!DOCTYPE html>            ---> HTML 문서의 형식 : html 버전 1,2,3,4,5
<html lang="en">           ---> 웹문서 시작

<head>                     ---> 머릿말 태그(meta, title)
                        문서의 정보, 웹 문서에 필요한 외부 파일과 옵션을 설정하는 공간
	<meta charset="UTF-8"> ---> meta 태그 : 기타정보 - 문서타입, 문자 인코딩 설정
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title> ---> title 태그 : 문서 제목 태그 - 웹브라우저의 제목 표시줄에 나타난다
</head>
<body>                      ---> body 태그 : 문서의 본문 태그 - 웹브라우저에 보여질 내용

</body>
</html>
```
