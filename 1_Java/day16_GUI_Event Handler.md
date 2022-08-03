## day14_java GUI(Graphic User Interface)\_Event Handler

### - Event Handler?

- 각 컴포넌트에 대하여 특정 행위를 했을때 그 행위에 대한 작업을 처리할 수 있도록 하는것이다.
- 사용자 또는 프로그램에 의해 발생할 수 있는 하나의 사건
- 이벤트를 처리하는 자바 프로그램 코드로써 클래스를 만든다.
- 이벤트 리스너는 인터페이스를 제공, 개발자는 이 인터페이스를 상속 받아 추상메서드를 구현하여 이벤트 리스너를 작성한다.
- 현재 발생한 이벤트에 관한 정보를 가진 객체를 말한다. 이벤트 리스너에게 전달 된다.
- 각 컴포넌트별 이벤트 처리 메서드 : add로 시작하여 \_\_Listener로 끝나는 메서드

### - 이벤트 관련 클래스

- Listener 인터페이스
- Adapter 클래스
- Event 클래스

- 이벤트 리스너는 모두 인터페이스이다( \_\_Listener)
  - 이벤트 리스너는 이벤트를 처리하는 프로그램 코드를 말한다.
  - 이벤트 리스너는 컴포넌트에 연결되어 있어야 작동한다.
  - 즉, 화면에 구성된 컴포넌트들은 이벤트 리스너를 하나씩 가지고 있다.
- 컴포넌트와 이벤트 리스너를 연결 시키는 메서드

  - add\_\_\_\_Listener()
  - \_\_\_\_ 에는 리스너 이름이 들어간다.

- 이벤트 리스너 작성과정
  1. 이벤트와 이벤트 리스너 선택
     - 목적에 적합한 이벤트와 리스너 인터페이스선택
  2. 이벤트와 리스너 클래스 작성
     - 리스너 인터페이스를 상속받은 클래스를 작성하고 추상메서드를 모두 구현
  3. 이벤트 리스너 등록
     - 이벤트를 받을 컴포넌트에 이벤트 리스너 등록

### - Event Handler 클래스 생성 방법 - 4가지

1. Listener 인터페이스를 구현하는 방법
2. Adapter 클래스를 구현하는 방법
3. Frame 클래스에 Listener 구현하는 방법 - 가장 많이 사용.
4. 익명 클래스를 이용하는 방법 - 많이 사용이 됨.

### 1. Listener 인터페이스 구현

        interface : ActionListner
        method  : actionPerformed(ActionEvent e)

        exit.addActionListener(new A());

- "ActionListener" interface 안에 <br>
  actionPerformed 메서드를 오버라이딩한 뒤 <br>
  지정한 컴포넌트(Component)의 액션 발생할 경우 <br>
  actionPerformed 메서드의 실행코드가 실행된다.

#### - 예시코드

[Listener 인터페이스](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/tree/main/1_Java/2.%20GUI%EC%9D%91%EC%9A%A9)

### 2. Adapter 클래스 구현

       adater  : MouseAdapter
       method  : mouseClicked(MouseEvent e)

       exit.addMouseListener(new B());

#### - 예시코드

[Adapter 클래스]()

### 3. Frame 클래스 구현

- Frame 클래스를 상속받은 클래스에 Listener 인터페이스 같이 상속

        interface : MouseListner

        예시)
        public class Ex29_Event extends JFrame implements MouseListener

#### - 예시코드

[Frame 클래스]()

### 4. 익명클래스 이용

- Frame 클래스를 상속받은 클래스, 이벤트 처리할 컴포넌트에 메서드를 적용한다.

        exit >> 버튼 컴포넌트 참조변수명
        exit 컴포넌트에 이벤트 ,
        ActionListener 인터페이스를 무명 클래스로 객체 생성
        (new ActionListener())

        exit.addActionListener(new ActionListener() {

                    @Override
                    public void actionPerformed(ActionEvent e) {
                        JOptionPane.showMessageDialog(null, "시스템 종료");

                        System.exit(0);   // 시스템을 종료시키는 메서드.

                    }
                });

#### - 예시코드

[익명 클래스](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/1_Java/2.%20GUI%EC%9D%91%EC%9A%A9/Ex30_Event_Anonymous.java)

### 리스너 인터페이스 정리

| 이벤트      | 이벤트리스너   | 설명                               |
| ----------- | -------------- | ---------------------------------- |
| ActionEvent | ActionListener | 컴포넌트별 특정 행동에 따른 이벤트 |
| WindowEvent | WindowListener | GUI프레임창 관련 이벤트
| AdjustMentEvent | AdjustmenListner | 스크롤바 이벤트 | 
| TextEvent | TextLisner | 텍스트 관련 컴포넌트 문자 편집 이벤트 |
| ItemEvent | ItemListner | 선택 관련 이벤트 |
| MouseEvent | MouseListner | 마우스 관련 이벤트 |
| MouseEvent | MouseMothionListner | 마우스 움직임 관련 이벤트 |
