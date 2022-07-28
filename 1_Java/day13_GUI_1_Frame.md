## day13_java GUI(Graphic User Interface)_Frame

### - Frame

        - java.lang.Object
            - java.awt.Component
                - java.awt.Container
                    - java.awt.Window
                        - java.awt.Frame

### 예시
#### 1. 클래스 상속
- 코드

        import java.awt.Frame;

        public class Ex01_Frame extends Frame{
            
            //기본생성자
            public Ex01_Frame() {
                
                // 1. 프레임 제목 설정(왼쪽 상단 타이틀)
                super("첫번째 예제");
                
                // 2. 프레임 위치 설정(px 픽셀단위)
                setLocation(300, 300);
                
                // 3. 프레임 크기 설정
                setSize(300, 300);
                
                // 4. 프레임 화면 출력
                setVisible(true); // default값 false > true 변경해야 화면 출력
            }
            
            public static void main(String[] args) {
                
                new Ex01_Frame();
                
            }
        }

#### 2. 객체 생성
- 코드 

        import java.awt.Frame;
        
        public class Ex02_Fram {

            public static void main(String[] args) {

                Frame frame = new Frame();
                
                // 1. 프레임 제목 설정
                frame.setTitle("두번째 예제");
                
                // 2. 프레임 위치 설정
                // frame.setLocation(x축, y축);
                frame.setLocation(100, 200);
                
                // 3. 프레임 크기 설정
                // frame.setSize(가로, 세로);
                frame.setSize(300, 500);
                
                // 2,3 프레임 위치, 크기 동시 설정
                frame.setBounds(100, 300, 800, 200);
                
                // 4. 프레임 화면 출력
                frame.setVisible(true);
            }

        }
