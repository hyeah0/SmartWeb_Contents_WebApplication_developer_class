## JOptionPane 클래스

### JOptionPane.메서드종류

1. showMessageDialog : 단순한 정보성 팝업
2. showConfirmDialog : 선택지 옵션(버튼) 팝업
3. showInputDialog : 입력값 또는 드롭다운 팝업
4. showOptionDialog : 선택값 모두 확인 가능 팝업

#### 1. showMessageDialog : 단순한 정보성 팝업

- 형식 ) JOptionPane.showMessageDialog(parentComponent,message,title,messageType);

  - parentComponent : 주로 null, 부모컴포넌트 지정으로 팝업 활성화 제어 가능
  - message : 팝업 텍스트
  - title: 팝업 상자에 상단에 표시될 타이틀
  - messageType : 팝업 아이콘
    - ERROR_MESSAGE : X표시 아이콘
    - INFORMATION_MESSAGE : i표시 아이콘
    - QUESTION_MESSAGE : ?표시 아이콘
    - WARNING_MESSAGE : !표시 아이콘
    - JOptionPane.PLAIN_MESSAGE : 아이콘 X (기본)

#### 2. showMessageDialog : 선택지 옵션

- 형식 ) JOptionPane.showMessageDialog(parentComponent,message,title,JOptionPane.optionType,JOptionPane.messageType);

- parentComponent : 주로 null, 부모컴포넌트 지정으로 팝업 활성화 제어 가능
- message : 팝업 텍스트
- title: 팝업 상자에 상단에 표시될 타이틀
- optionType : 옵션 종류

  - DEFAULT_OPTION : ok button only
  - OK_CANCEL_OPTION : ok and cancel button
  - YES_NO_OPTION : yes and no button
  - YES_NO_CENCEL_OPTION : yes, no and cancel button

- 리턴값

  - ok == 0
  - yes == 0
  - no == 1
  - cancel == 2
  - x(팝업종료) == -1

- messageType : 팝업 아이콘

#### 3. showInputDialog

##### 1. 입력값 받는 팝업

- 형식1 ) JOptionPane.showInputDialog(parentComponent,message,JOptionPane.initialmessage);
- 형식2 ) JOptionPane.showInputDialog(parentComponent,message,title,JOptionPane.messageType);

  - parentComponent : 주로 null, 부모컴포넌트 지정으로 팝업 활성화 제어 가능
  - message : 팝업 텍스트
  - title: 팝업 상자에 상단에 표시될 타이틀
  - initialmessage : 팝업 상자 입력창에 임시로 적어놓는 내용
  - messageType : 팝업 아이콘

##### 2. 드롭다운으로 입력받는 형태

- 형식 ) JOptionPane.showInputDialog(parentComponent,message,title,messageType,icon,value[],JOptionPane.initialmessage);

  - parentComponent : 주로 null, 부모컴포넌트 지정으로 팝업 활성화 제어 가능
  - message : 팝업 텍스트
  - title: 팝업 상자에 상단에 표시될 타이틀
  - messageType : 팝업 아이콘
  - icon : 아이콘 이미지를 직접 지정 가능
  - value[] : 드롭다운에 입력될 옵션 배열 지정
  - initialValue : 정해준 옵션에서 기본적으로 표시하고 있을 내용

- 예시코드)

  - 옵션 선택후 ok시 object 형으로 전달되어 예시 코드와 같이 문자열(String)로 형변환 필요하다.

        String[] fruits = {"키위","포도","사과"};
        String ch_fruit = (String) JOptionPane.showInputDialog(null,"선호과일","과일",JOptionPane.PLAIN_MESSAGE,fruits,fruits[0]);

### 4. showOptionDialog : 선택값 모두 확인 가능 팝업

- 형식 ) JOptionPane.showInputDialog(parentComponent,message,title, optionType,messageType,icon,value[],JOptionPane.initialmessage);

  - parentComponent : 주로 null, 부모컴포넌트 지정으로 팝업 활성화 제어 가능
  - message : 팝업 텍스트
  - title: 팝업 상자에 상단에 표시될 타이틀
  - optionType : 옵션 종류
  - messageType : 팝업 아이콘
  - icon : 아이콘 이미지를 직접 지정 가능
  - value[] : 드롭다운에 입력될 옵션 배열 지정
  - initialValue : 정해준 옵션에서 기본적으로 표시하고 있을 내용

- 옵션 선택시 배열 인덱스를 전달
