## day14_java GUI(Graphic User Interface)_컴포넌트정리

- 프레임 > 컨테이너 > 컴포넌트 

1. 컴포넌트 
    - 버튼, 텍스트상자, 레이블 상자, 옵션박스, 체크박스, 라디오버튼 등을 말한다.

### 컴포넌트 종류
- 컴포넌트 종류 이름 앞에 J를 붙이면 javax.swing 패키지 이용

|   종류                    |   기능                            | 예시 링크                                   |         특이사항                                     |
|   ---                     |   ---                             |  ---                                  | ---                                                   |
| Button                    |   버튼                            |  | java.awt 패키지 button 윈도우에서 한글 깨짐(맥 이슈 없음) |
| CheckBox                  |  체크박스                         |  | true 를 넣으면 체크가 된상태로 초기화                  |
| ImageIcon                 | 이미지 삽입                       | | 
| CheckBoxMenuItem          | 이미지가 포함된 체크박스          |  |
| RadioButton               |  1개만 선택가능한 선택지          |   | 라디오 버튼 ButtonGroup에 올려야지 한개만 선택 가능하다. ButtonGroup bGroup = new ButtonGroup(); bGroup.add(radioBtn1); | 
| ToggleButton              |  스위치 (on, off)                 | | |
| ComboBox                  |  드롭다운                           |  | 배열을 먼저 생성후 콤보박스 객체 생성 필요 |
| .setSelectedIndex(인덱스)  | 콤보박스 인덱스 값을 통해 초기값 설정 |    |   |
| .setSelectedItem("배열값") | 값을 통해 초기값 설정                |              |   |   
| List                      |  선택가능 리스트          |   | 배열먼저 생성 후 리스트 객체 생성 필요 String[] kimbap = {"삼각김밥", "원조김밥", "야채김밥", "참치김밥", "멸치김밥"}; 
| Label                     |  text~ , ~field와 같이 사용  |  |   |   
| TextField                 |  텍스트입력_input |  |  |
| PasswordField             |  텍스트입력_input_입력값 ●●● 보호처리 | |
| TextArea                  |  텍스트입력_input_여러줄 작성가능 | ||
| .setLineWrap()            | JTextArea 컴포넌트에서 자동으로 줄바꿈 기능을 제공 메서드 / boolean 타입 / default false|
| Table                     |  표   | | 컴포넌트에서 바로 프레임에 담을 수 있다. 헤더 배열과, 콘텐츠 배열생성후 테이블 객체 생성 필요, 콘텐츠배열은 이차배열 |
| JScrollPane               | 스크롤바  | |  |
| TabbedPane                | 인덱스 인덱스를 누를때마다 해당하는 페이지로 이동 | |  1. 컨테이너 -> 탭 (ex: tab.add("버튼 탭", container1) ) 2. 탭-> 프레임 |
| MenuBar                   | 메뉴바        | | [메뉴바예시]()|
| Menu                      | 메뉴바에 들어갈 메뉴 | 
| JMenuItem                 | 메뉴바에 들어간 메뉴에 들어갈 아이템  | 
| .addSeparator()           | 구분선    |  |


####