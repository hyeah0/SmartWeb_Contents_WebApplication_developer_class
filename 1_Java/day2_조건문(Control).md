## day2_제어문(Control)
### 제어문이란?
- 프로그램의 흐름을 제어하는 명령문
- 원래는 main() 메서드의 시작 중괄호에서 부터 ~ 끝 중괄호까지
  위에서 아래로 순차적으로 실행하는 흐름을 가지고 있음
- 제어문은 이러한 흐름을 개발자가 원하는 방향으로 바꿀 수 있도록 해주는 것을 말함
- 모든 제어문의 실행결과는 boolean(true/false) 로 나온다


 
### 제어문의 종류
1. 분기문(조건문)
    - if문, if else문, 다중 if else문
    - switch case문
2. 반복문
    - while문, do while문, for문
3. 기타(보조제어문)
    - break, continue명령어

#### 1. 분기문 - if
- 조건이 참이면 실행, 거짓일때 무시
- 조건식의 결과값은 boolean 형만 올 수 있다
- 실행문이 한줄이면 {} (중괄호) 생략가능
    - 실행문 두줄이상일 경우 {} (중괄호) 필수 작성 
    - 만약 실행문이 두줄이상이나 중괄호가 생략되었을경우 참일경우 첫번째 실행문을 거짓일경우 가장하단 실행문을 실행한다.  

- 형식)

        if(조건식){
                조건식이 참일 경우 실행문
        }

##### 1. 분기문 - if 예시 코드

###### 1. if 예시 코드

        public class Ex01 {

            public static void main(String[] args) {

                System.out.println("---------프로그램 시작---------");
                
                int su = 25;
                
                //삼항연산자
                String result = (su>10) ? "su는 10보다 큽니다.":"su는 10보다 크지 않습니다.";
                System.out.println(result);
                
                //if문
                //예시1
                if(su>10) 
                    System.out.println("su = 10 이며 su>10 인 조건식이 참입니다.");
                
                //예시2
                if(su<10) 
                    System.out.println("su = 10 이며 su>10 인 조건식이 참입니다.");
                    System.out.println("su = 10 이며 su<10 인 조건식이 참이 아닙니다.");
                
                
                // 실행문이 한줄이라 중괄호 생략했으나, 읽기 편하도록 중괄호는 포함하도록 한다.
                // 만약 실행문이 두줄이상이나 중괄호가 생략되었을경우 참일경우 첫번째 실행문을 거짓일경우 가장하단 실행문을 실행한다. 
                
                //예시3
                if(su<10) {
                    System.out.println("su = 10 이며 su<10 인 조건식이 참입니다.");
                }
                else {
                    System.out.println("su = 10 이며 su<10 인 조건식이 참이 아닙니다.");
                }
                
                
                System.out.println("---------프로그램 종료---------");
            }

        }

###### 2. if 예시코드_값을 입력받아 조건식에 따른 실행문 
  
1. 예시 2-1 (main 메서드에서 값을 입력 받음)

        public class Ex02 {

            public static void main(String[] args) {

                System.out.println("---------프로그램 시작---------");
                
                //int intNum = 92;
                int intNum = Integer.parseInt(args[0]);
                
                if(intNum >= 90) {
                    System.out.println("점수가 90점 이상입니다.");
                    System.out.println("A학점입니다");
                }
                else {
                    System.out.println("점수가 90점 이하입니다.");
                }
                
            
                System.out.println("---------프로그램 종료---------");
            }

        }

2. 예시 2-2 팝업창 (JOptionPane.showInputDialog())

    - [문제] 
    
        키보드로 입력받은 정수가 5로 나누어 떨어지면 "이 정수는 5의 배수입니다" 라는 메세지를 화면에 출력하세요

            public class Ex03 {

                public static void main(String[] args) {

                    int num = Integer.parseInt(JOptionPane.showInputDialog("정수를 입력하세요"));
                    
                   if((num%5) == 0) {
                        System.out.println("입력받은 값은 " + num + "이며, 이 정수는 5의 배수입니다.");
                    }
                    else {
                        System.out.println("입력받은 값은 " + num + "이며, 이 정수는 5의 배수가 아닙니다.");
		            }
                    
                }

            }