## day17_스레드(Thread)

### - 프로세스(process) ?
- 현재 APU에 의해서 처리되는 프로그램
- 운영체제로부터 메모리를 할당 받는다.
- 자바에서는 하나의 클래스를 말한다.
- 무한반복을 가진 프로세스를 실행할 경우
- CPU가 해당 프로세스를 놓지 않기 때문에 다음 프로세스를 실행 할 수가 없게 된다.
- 이러한 문제점들을 해결하기 위해 Thread 라는 개념이 도입되었다.

### -스레드(Thread)? 
- process를 작은 단위로 쪼개어 놓은 작업단위
- 실제 프로그램이 수행되는 작업의 최소 단위
- 스레드는 병행 처리를 지원한다.(멀티태스킹)
- 응용분야 : 게임, 채팅 등등

### 스레드 클래스 작성하는 방법 - 2가지
1. Thread 라는 클래스를 상속(extends)하여 사용하는 방법
2. Runnable 인터페이스를 구현(implements)하여 사용하는 방법
3. 무명클래스

### 1. Thread 라는 클래스를 상속(extends)하여 사용하는 방법
1. Thread 클래스를 상속(extends) 받음
2. run() 메서드 재정의 - 스레드 구형
3. 구현클래스
    1. 스레드 클래스 객체 생성
    2. .start() 메서드 호출 -> run()메서드 실행

            참조변수.start();

#### - Thread 예시
- 코드

        // Thread 클래스 상속 받을 클래스 생성
        class Thread1 extends Thread{
            @Override
            public void run() {
                int i = 1;
                
                while(true) {
                    System.out.println("i >>> " + i);
                    i++;
                }
            }
        }

        // Thread 클래스 상속 받을 클래스 생성
        class Thread2 extends Thread{
            public void run() {
                int j = 1;
                
                while(true) {
                    System.out.println("j >>> " + j);
                    j++;
                }
            }; 
        }

        // Thread 클래스 상속 받은 클래스 객체 생성 및 출력
        public class Ex02_Thread  {

            public static void main(String[] args) {

                Thread1 th1 = new Thread1();
                Thread2 th2 = new Thread2();
                
                // 3-2) 참조변수.start() 메서드 호출 -> run() 메서드 실행
                th1.start();
                th2.start();
            }

        }

- 결과
- 번갈아 나오는 규칙 없이 랜덤으로 i, j 값이 나온다.

        i >>> 83213
        i >>> 83214
        i >>> 83215
        i >>> 83216
        i >>> 83217
        i >>> 83218
        i >>> 83219
        i >>> 83220
        i >>> 83221
        i >>> 83222
        i >>> 83223
        i >>> 83224
        i >>> 83225
        i >>> 83226
        i >>> 83227
        i >>> 83228
        i >>> 83229
        i >>> 83230
        j >>> 91946
        j >>> 91947
        j >>> 91948



### 2. Runnable 인터페이스를 구현(implements) 하여 사용하는 방법
1. 클래스에 Runnable 인터페이스를 구현(implements)
2. 인터페이스 상속받은 클래스에 run() 추상메서드를 재정의
3. Runnable 인터페이스를 상속받은 클래스(Thread 클래스(자식클래스))를 구현 클래스에 객체 생성
4. 구현클래스 
    1. Runnable 인터페이스를 상속받은 클래스 객체 생성
  	2. Thread 클래스 객체생성 
        - 생성자의 인자에 자식클래스의 참조변수 기재
    3. 객체생성한 Thread 클래스의 참조변수.start()메서드 호출

#### - Runnable 예시
- 코드

        class Runnable1 implements Runnable{ // 1. 인터페이스 구현

            @Override
            public void run() { // 2. 추상메서드 재정의
                int i = 1;
                while(true) {
                    System.out.println("i >>> " + i);
                    i++;
                }
            }
        }

        class Runnable2 implements Runnable{

            @Override
            public void run() {
                int j = 1;
                while(true) {
                    System.out.println("j >>> " + j);
                    j++;
                }		
            }
        }

        public class Ex03_Runnable {

            public static void main(String[] args) {
                // 3. 자식클래스 객체 생성
                Runnable1 r1 = new Runnable1(); 
                Runnable2 r2 = new Runnable2();
                
                // 4. Thread 클래스 객체생성
                Thread t1 = new Thread(r1);
                Thread t2 = new Thread(r2);
                
                // 5. Thread 클래스의 참조변수.start()메서드 호출
                t1.start();
                t2.start();
            }
        }
	
- 결과

        i >>> 217218
        i >>> 217219
        i >>> 217220
        i >>> 217221
        j >>> 195483
        j >>> 195484
        j >>> 195485
        j >>> 195486

### 3. 무명클래스(anonymous class)를 이용한 스레드 생성
- 코드의 집중화로 가독성이 높아진다.
- 별도의 상속과정이 필요가 없어진다.
- 한번만 사용된다.

#### - 무명클래스 예시
- 1. 메서드안에 Thread 클래스의 생성자 호출
- 2. 생성자 중괄호 안에 Thread 클래스의 run 메서드 오버라이딩

- 코드

        public class Ex04_Anonymous {

            public static void main(String[] args) {

                // 1. thread 클래스 생성자 호출
                // 2. 생성자 중괄호 안에 run메서드 오버라이딩
                new Thread() { 
                    @Override
                    public void run() {
                        int i =1; 
                        while(i<=10) {
                            System.out.println("i >>> " + i);
                            i++;
                        }
                    }
                }.start();
                
                
                new Thread(new Runnable() {
                    
                    @Override
                    public void run() {

                        int j = 1;
                        while(j<=10) {
                            System.out.println("j >>> " + j);
                            j++;
                        }				
                    }
                }).start();
                
            }
        }

- 결과

        i >>> 1
        i >>> 2
        i >>> 3
        i >>> 4
        i >>> 5
        i >>> 6
        i >>> 7
        i >>> 8
        i >>> 9
        i >>> 10
        j >>> 1
        j >>> 2
        j >>> 3
        j >>> 4
        j >>> 5
        j >>> 6
        j >>> 7
        j >>> 8
        j >>> 9
        j >>> 10

### - Thread 클래스, Runnable 인터페이스를 구현 예시
       
        [문제]
        * 숫자(1~100)를 생성하는 스레드 클래스와 영문자(A~Z)를 생성하는 스레드 클래스를 각각 정의하고, 스레드가 수행되도록 해보자
        * 숫자 생성 스레드 : NumberThread
                           - Thread 클래스를 상속하여 생성
        * 영문자 생성 스레드 : AlphaThread
         	                - Runnable 인터페이스를 구현하여 생성

- 코드

        // Thread 클래스 상속하여 생성 
        class NumberThread extends Thread{
            
            @Override
            public void run() {
                for(int i=1; i<=100; i++) {
                    System.out.println("i >>> " + i);
                }
            }
        }

        // Runnable 인터페이스를 구현하여 생성
        class AlphaThread implements Runnable{

            @Override
            public void run() {
                for(char j = 'A'; j<='Z'; j++) {
                    System.out.println("j >>> " + j);
                }
            }
            
        }

        public class Ex05 {

            public static void main(String[] args) {

                // Thread 클래스를 상속
                NumberThread t1 = new NumberThread();
                
                // Runnable 인터페이스를 구현
                AlphaThread a1 = new AlphaThread();
                Thread t2 = new Thread(a1);
                
                t1.start();
                t2.start();
                
            }

        }

- 결과

        i >>> 1
        j >>> A
        i >>> 2
        j >>> B
        i >>> 3
        j >>> C
        i >>> 4
        j >>> D
        i >>> 5
        j >>> E
        i >>> 6
        j >>> F
        i >>> 7
        j >>> G
        j >>> H
        j >>> I
        j >>> J
        j >>> K
        j >>> L
        j >>> M
        ....
        j >>> R
        j >>> S
        j >>> T
        j >>> U
        j >>> V
        j >>> W
        j >>> X
        j >>> Y
        j >>> Z
        i >>> 8
        i >>> 9
        i >>> 10
        i >>> 11
        i >>> 12
        i >>> 13
        i >>> 14
        i >>> 15
        i >>> 16
        i >>> 17
        i >>> 18
        ....
        i >>> 80
        i >>> 81
        i >>> 82
        ....
        i >>> 90
        i >>> 91
        i >>> 92
        i >>> 93
        i >>> 94
        i >>> 95
        i >>> 96
        i >>> 97
        i >>> 98
        i >>> 99
        i >>> 100

### - 멀티 스레드 
- 멀티 스레드 : 하나의 스레드 클래스를 대상으로 2개 이상의 스레드 객체 생성하는 기법
- 스레드 이름 지정 : 멀티 스레드에서 생성한 스레드 객체에 이름을 부여하는 과정

	- 형식) super(name);

- 멀티 스레드는 자신의 이름을 가지고 있다.
- 스레드의 이름이 스레드에서 큰 역할을 하지는 않지만, 
- 디버깅 시 어떤 스레드가 실행이 되어 작업하고 있는지를 조사(확인) 할 목적으로 많이 사용된다.
- 동일한 이름의 스레드를 여러개 만드는것
- ※ 디버깅 : 오류체크

#### - 멀티 스레드 예시
- 코드

        class ThreadA extends Thread{

            // 기본생성자
            public ThreadA() {	}
            
            // 인자생성자 (상속받은 Thread 클래스의 생성자를 호출)
            public ThreadA(String name) {
                super(name);
            }
            
            // Thread 클래스 추상 메서드 오버라이딩(메서드 재정의)
            @Override
            public void run() {
                // getName() : 현재 run()메서드를 실행중인 스레드의 이름을 반환해주는 메서드
                System.out.println(this.getName());
                
            }
        }

        public class Ex06_multi {

            public static void main(String[] args) {

                // ThreadA 클래스, 멀티 스레드 생성
                ThreadA t1 = new ThreadA("1 name");
                ThreadA t2 = new ThreadA("2 name");
                ThreadA t3 = new ThreadA("3 name");
                ThreadA t4 = new ThreadA("4 name");
                ThreadA t5 = new ThreadA("5 name");
                ThreadA t6 = new ThreadA("6 name");
                
                t1.start();
                t2.start();
                t3.start();
                t4.start();
                t5.start();
                t6.start();
            }

        }

- 결과

        1 name
        3 name
        2 name
        5 name
        5 name
        4 name
        6 name
