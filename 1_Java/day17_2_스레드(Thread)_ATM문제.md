## day17_스레드(Thread)_ATM

### 1. 문제
> [ATM 클래스 설계서]
- 입금과 출금의 은행거래가 가능한 ATM 공용 클래스 설계
- 계좌 잔액 : private int balance;
- 생성자   : 계좌잔액(balance) 초기화

- deposit() : 외부 클래스에서 입금하는 메서드

        balance = balance + money; // 잔액에 입금액을 더한다.
	    출력문 : 00,000원을 입금하여 00,000원이 남았습니다.

- withdraw() : 외부클래스에서 출금하는 메서드 
	 
        balance = balance - money;  // 잔액에 출금액을 뺀다
	    출력문 : 00,000원을 출금하여 00,000원이 남았습니다.
	    (단, balance < money 인 경우 "잔액이 부족합니다." 메세지 출력)

### 2. 코드

        class ATM { //공용클래스
            // 멤버변수
            private int balance; 	//계좌잔액
            
            // 기본생성자
            public ATM() {	}
            
            // 인자생성자
            public ATM(int balance) {	
                this.balance = balance;
            }

            // 멤버메서드
            // 입금 메서드
            public synchronized void deposit(int money) {
                balance += money;
                System.out.println(Thread.currentThread().getName() + "님이 " +
                        money +"원을 입금하여 " + balance +"원이 남았습니다.");
            }
            
            // 출금 메서드
            public synchronized void withdraw(int money) {
                
                if(balance < money) {
                    System.out.println("잔액이 부족합니다.");
                    return; // 현재 실행중인 메서드 종료
                }
                
                balance -= money;
                System.out.println(Thread.currentThread().getName() + "님이 " +
                        money +"원을 출금하여 " + balance +"원이 남았습니다.");
            }
        }

        // 스레드를 구현할 클래스
        class User extends Thread{

            ATM atm;	// ATM 클래스를 멤버로 받는다.
            
            public User() { 	}
            
            public User(ATM atm, String name) {
                super(name);   	// super는 항상 첫번째에 와야한다.
                this.atm = atm;
            }
            
            @Override
            public void run() {
                this.atm.deposit(20000); 	// 입금메서드 호출
                this.atm.withdraw(30000);	// 출금메서드 호출
            }
        }

        public class Ex07 {

            public static void main(String[] args) {

                // 클래스 객체 생성 >> 주소값
                ATM atm = new ATM(0);
                
                // 유저 클래스를 대상으로 멀티 스레드를 생성
                User user1 = new User(atm,"홍길동");
                User user2 = new User(atm,"김태리");
                User user3 = new User(atm,"박은빈");
                User user4 = new User(atm,"김유신");
                User user5 = new User(atm,"박해일");
                // atm은 동일한 주소값이다.
                
                user1.start();
                user2.start();
                user3.start();
                user4.start();
                user5.start();
            }

        }

### 3. 결과

        홍길동님이 20000원을 입금하여 20000원이 남았습니다.
        박해일님이 20000원을 입금하여 40000원이 남았습니다.
        박해일님이 30000원을 출금하여 10000원이 남았습니다.
        김유신님이 20000원을 입금하여 30000원이 남았습니다.
        김유신님이 30000원을 출금하여 0원이 남았습니다.
        박은빈님이 20000원을 입금하여 20000원이 남았습니다.
        잔액이 부족합니다.
        김태리님이 20000원을 입금하여 40000원이 남았습니다.
        김태리님이 30000원을 출금하여 10000원이 남았습니다.
        잔액이 부족합니다.

### 4. 참고
※ 문제점 : 여러명이 진행시에 다 메서드가 호출되지 않는다.
    문제를 해결하기 위해 synchronized 키워드를 사용한다.

- synchronized
- 스레드 동기화와 관련된 명령어
- 멀티 스레드에 의해서 공유된 메서드나 클래스를 대상으로 임계영역(critical section)을 설정
- 임계 영역으로 설정된 메서드에서는 가장 먼저 도착한 스레드가 완전히 종료될 때까지 나머지 스레드는 대기하는 명령어
- 공유되는 자원은 대부분 static 키워드를 가진 객체를 말한다.
- 먼저 실행된 스레드가 종료될때 까지 나머지 스레드 잠시 대기 한다.