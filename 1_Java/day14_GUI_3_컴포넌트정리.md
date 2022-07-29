## day14_java GUI(Graphic User Interface)_컴포넌트정리

- 프레임 > 컨테이너 > 컴포넌트 

### 1. 컴포넌트 
    - 버튼, 텍스트상자, 레이블 상자, 옵션박스, 체크박스, 라디오버튼 등을 말한다.

### 컴포넌트 종류
- 컴포넌트 종류 이름 앞에 J를 붙이면 javax.swing 패키지 이용

| 종류             | 기능                                     | 예시 링크                               |
| ---------------- | -------------------------------------- | ------------------------------------- |
| Button           | 버튼                                    |   [버튼](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/1_Java/2.%20GUI%EC%9D%91%EC%9A%A9/Ex06_JButton.java)                         |
| CheckBox         | 체크박스                                 |    [체크박스](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/1_Java/2.%20GUI%EC%9D%91%EC%9A%A9/Ex07_JCheckBox.java)                        |
| ImageIcon        | 이미지 삽입                               |    [이미지](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/1_Java/2.%20GUI%EC%9D%91%EC%9A%A9/Ex08_JCheckBox.java)                        |
| CheckBoxMenuItem | 이미지가 포함된 체크박스                      |                          |
| RadioButton      | 1개만 선택가능한 선택지                      |     [라디오버튼](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/1_Java/2.%20GUI%EC%9D%91%EC%9A%A9/Ex09_JRadioButton_d14.java)                    |
| ToggleButton     | 스위치 (on, off)                         |    [토글버튼](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/1_Java/2.%20GUI%EC%9D%91%EC%9A%A9/Ex10_JToggleButton.java)                          |
| ComboBox         | 드롭다운                                  |   [메뉴바예시]()                         |
|                  | .setSelectedIndex(인덱스)                 | 콤보박스 인덱스 값을 통해 초기값 설정          |
|                  | .setSelectedItem("배열값")                | 값을 통해 초기값 설정                      |
| List             | 선택가능 리스트                             |   [리스트](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/1_Java/2.%20GUI%EC%9D%91%EC%9A%A9/Ex12_JList.java)                         |
| Label            | text~ , ~field와 같이 사용                 |   [input](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/1_Java/2.%20GUI%EC%9D%91%EC%9A%A9/Ex13_JLabel_JTextField.java)                         |
| TextField        | 텍스트입력\_input                          |                           |
| PasswordField    | 텍스트입력*input*입력값 ●●● 보호처리           |   [패스워드](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/1_Java/2.%20GUI%EC%9D%91%EC%9A%A9/Ex17_ETC.java)                         |
| TextArea         | 텍스트입력*input*여러줄 작성가능               |                          |
|                  | .setLineWrap()                           | 줄바꿈 기능                             |
| Table            | 표                                       |   [표](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/1_Java/2.%20GUI%EC%9D%91%EC%9A%A9/Ex14_JTable.java)                         |
| JScrollPane      | 스크롤바                                   |                          |
| TabbedPane       | 인덱스 인덱스를 누를때마다 해당하는 페이지로 이동    |   [인덱스](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/1_Java/2.%20GUI%EC%9D%91%EC%9A%A9/Ex15_JTabbedPane.java)                         |
| MenuBar          | 메뉴바                                     |  [메뉴](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/1_Java/2.%20GUI%EC%9D%91%EC%9A%A9/Ex16_JMenu.java)                          |
| Menu             | 메뉴바에 들어갈 메뉴                          |                           |
| JMenuItem        | 메뉴바에 들어간 메뉴에 들어갈 아이템              |                       |
|                  | .addSeparator()                          | 구분선                                 |

### 2. 메서드
- pack()
    - JFrame에 올라는 컴포넌트를 알맞게 프레임 크기를 조절해주는 메서드
    - 공백 제거 메서드
 
- setResizable(false); 
    - 창고정 
    - default값 true, false로 할경우 화면창 사이즈 변경 
