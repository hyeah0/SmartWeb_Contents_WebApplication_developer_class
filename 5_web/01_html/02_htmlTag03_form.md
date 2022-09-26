## form tag

```
<form method="get/post" action="서블릿이름/파일이름">
<form method="get/post" action="ForwardServlet/forward/Ex03.jsp">
```

- 사용자에게 입력을 받을 데이터 양식을 설정하는 태그

  | 속성    | 설명                                                          |
  | ------- | ------------------------------------------------------------- |
  | method  | 어떤메서드로 값을 받을지                                      |
  | ㄴ get  | 입력받은 값 url에 보인다.<br>따로 설정안할경우 자동 설정된다. |
  | ㄴ post | 입력받은 값 url에서 확인할 수 없다.                           |
  | action  | 입력받은 값을 어디로 전달해야하는지                           |

  -[servlet](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp/01_servlet.md)

### - 태그종류

- &lt; label &gt;
- &lt; input &gt;
- &lt; select &gt;
- &lt; datalist &gt;
- &lt; option &gt;
- &lt; button &gt;
- &lt; taxtarea &gt;
- &lt; output &gt;

```
<form> ------------------------------------------------------------------- > 사용자에게 입력을 받을때
    <fieldset> ----------------------------------------------------------- > 여러 컨트롤과 레이블(<label>)을 묶을 때
        <legend> </legend> ----------------------------------------------- > 제목을 부여하는 태그

            ** label, input **
            <label for="input id값과 동일하게"> </label> --------------------- > input 연결 (label 클릭시 input 작성가능)
            <input type="" id="" name="변수이름" value="변수에 저장될 값"><br/> - > 사용자에게 데이터를 입력받을 값

            ** select, option **
            <select> ------------------------------------------------------ > 드롭다운
                <optgroup> ------------------------------------------------ > option 그룹
                    <option></option> ------------------------------------- > 드롭다운에 들어갈 값
                </optgroup>
            </select>

            ** input, datalist, option **
            <input type="text" list="listname">
                <datalist id="listname"> ----------------------------------- > 리스트
                    <option value="option1"> ------------------------------- > 리스트값
                    <option value="option2">
                </datalist>

            ** button **
            <button> 버튼! </button> --------------------------------------- > 버튼

            ** textarea **
            <textarea rows="5" cols="30"> </textarea> --------------------- > 긴 텍스트

            ** output **
            <form oninput="x.value=parseInt(a.value)+parseInt(b.value)> --- > oninput = "결과값 = 계산식 "
                ( 0 <input type="range" id="a" name="a" value="50" max="200"> 200 ) --> input 으로 사용자로부터 값 받음
                +
                <input type="number" id="b" value="25">                             --> input 으로 사용자로부터 값 받음
                =
                <output name="x" for="a b"></output>                                --> input 계산된 값
                <input type="submit">
            </form>
            --- HTML5 / not supported in Edge12

    </fieldset>
</form>
```

#### - select / datalist 차이점

- datalist

  - &lt;input&gt; 태그를 사용함으로서 입력창을 만들고 datalist를 연결한다음
  - &lt;datalist&gt; 태그를 사용하고 자식 요소로 &lt;option&gt; 태그들을 만든다.
  - 자동완성 기능을 제공
  - option에 없는 데이터 처리도 가능(미리 입력된 값 외에 사용자가 임의로 입력한 변수값도 데이터 입력 받을수 있다.)

- select
  - 따로 &lt;input&gt; 태그를 사용하지 않아도 된다.

### - input 태그 타입 종류

```
<input type="타입종류">
```

| 타입 종류 | 설명                                                                                          |
| --------- | --------------------------------------------------------------------------------------------- |
| text      | 일반 텍스트 입력 가능                                                                         |
| number    | 숫자 선택 ==> IE 지원불가                                                                     |
| password  | 비밀번호 입력가능<br>입력된 내용이 안보이게 입력된다                                          |
| tel       | 전화번호 입력 가능                                                                            |
| url       | 절대 url 입력 가능                                                                            |
| color     | 색상 선택 ==> IE 지원불가                                                                     |
| date      | 날짜 선택 ==> IE 지원불가                                                                     |
| email     | 이메일 선택                                                                                   |
| file      | 파일 선택                                                                                     |
| hidden    | 보이지 않지만 전송할 양식 설정 <br> 양식에는 보이지 않지만 값이 전달 될 때 같이 전달되는 양식 |
| image     | 이미지 제출 버튼                                                                              |
| checkbox  | 체크박스 <br>여러개 동시선택, 비선택 가능, 배열로 값 전달된다.                                |
| radio     | 라디오버튼<br>여러개 선택 불가능                                                              |
| range     | 범위 컨트롤 지정, max, min, step, value(기본값) 속성 사용가능                                 |
| search    | 검색 기능 제공                                                                                |
| button    | 일반버튼 <br>onClick 속성을 이용하여 자바스크립트 함수를 호출시 사용                          |
| submit    | 제출 버튼 기능<br> from 태그 속성 중 action 페이지로 값들을 전송                              |
| reset     | 초기화 하는 버튼<br> 해당 form 의 모든 양식값이 초기화 된다.                                  |

### - input 태그 속성

```
<input type="타입종류" 속성종류>
```

| 속성종류     | 설명                                                                                                                        |
| ------------ | --------------------------------------------------------------------------------------------------------------------------- |
| autocomplate | 자동완성기능 <br>사용자가 이전에 입력한 값으로 자동완성기능을 사용할 것인지 여부 설정 <br>- on(default), off                |
| autofocus    | 페이지가 로드될 때 자동으로 포커스 지정                                                                                     |
| checked      | 양식이 선택되었음을 표시할 지 여부 지정<br>type 속성값이 radio, checkbox인 경우에만 사용가능                                |
| disabled     | 양식을 비활성할지 여부 지정                                                                                                 |
| max          | 지정 가능한 최대값 설정<br>- type 속성 값이 number인 경우만 사용 가능 <br>- min 속성 보다 큰 값만 허용                      |
| min          | 지정 가능한 최소값 설정<br>- type 속성값이 number인 경우만 사용가능<br>- max 속성 보다 작은 값만 허용                       |
| maxlength    | 입력가능한 최대 문자수 지정<br>- type 속성 값이 text, email, password, tel, url 인 경우만 허용                              |
| multiple     | 둘 이상의 값을 입력할 수 있는지 여부 지정<br>- type 속성 값이 email, file 이면 가능<br>- email 인 경우에는 , (콤마) 로 구분 |
| name         | 양식의 이름을 지정                                                                                                          |
| placeholder  | 사용자가 입력할 값의 양식을 지정<br>- type 속성 값이 text, email, password, tel, url 인 경우만 허용                         |
| readonly     | 수정 불가능한 읽기 전용 지정                                                                                                |
| step         | 유효한 증감 숫자 간격의 지정<br>- type 속성 값이 number, range인 경우에만 사용가능                                          |
| src          | 이미지의 url 지정<br>- type 속성 값이 image인 경우에만 허용                                                                 |
| alt          | 이미지 대체 텍스트 지정<br>- type 속성 값이 image인 경우만 허용                                                             |
| type         | 입력받은 데이의 종류지정<br>- type 속성 값이 type인 경우만 허용                                                             |
| value        | 양식의 초기값 지정                                                                                                          |
