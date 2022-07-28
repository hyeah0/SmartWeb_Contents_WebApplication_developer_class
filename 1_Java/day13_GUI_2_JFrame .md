## day13_java GUI(Graphic User Interface)_JFrame

### - JFrame

        - java.lang.Object
 	        - java.awt.Component
 		        - java.awt.Container
                    - java.awt.Window
                        - java.awt.Frame
                            - javax.swing.JFrame

### 예시
#### 1. 클래스 상속
- 코드

        import javax.swing.JFrame;

        public class Ex03_JFrame extends JFrame{

            public Ex03_JFrame() {
                
                // 1. 프레임 제목 설정(왼쪽 상단 타이틀)
                super("세번째 예제");
                
                // 2. 프레임 위치 설정(px 픽셀단위)
                // setLocation(300, 300);
                
                // 3. 프레임 크기 설정
                // setSize(300, 300);
                
                // 2,3 프레임 위치, 크기 동시 설정
                setBounds(100, 300, 800, 200);
                
                // 4. 프레임 화면 출력
                setVisible(true); // default값 false > true 변경해야 화면 출력
            }
            
            
            public static void main(String[] args) {
                new Ex03_JFrame();
            }

        }


#### 2. 객체 생성
- 코드 

        import javax.swing.JFrame;
        
        public class Ex04_JFrame {

            public static void main(String[] args) {

                // JFrame jFrame = new JFrame();
                // jFrame.setTitle("네번째예제");
                // 객체 생성 및 title 값 동시생성
                JFrame jFrame = new JFrame("네번째 예제");
                    
                jFrame.setBounds(100, 300, 800, 800);
                jFrame.setVisible(true);
            }

        }