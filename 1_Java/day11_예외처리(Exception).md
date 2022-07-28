## day11_예외처리(Exception)

### - 에러(error)
- 하드웨어의 오동작 또는 고장으로 인한 오류
- 에러가 발생하면 프로그램 종료
- 정상 실행 상태로 돌아갈 수 없다.

### - 예외(exception)
- 사용자의 잘못된 조작 또는 개발자의 잘못된 코딩으로 인한 오류
- 예외가 발생하면 프로그램 종료
- 예외 처리를 추가해 주면 정상 실행 상태로 돌아갈 수 있음
- 프로그램을 위한 보험 처리. 위험한 상황에서 다른 코드를 보호하는

#### - 예외의 종류
1. 일반(컴파일)예외
	  - 예외처리코드가 없다면 컴파일이 되지 않는 예외
2. 실행 예외
    - 예외 처리 코드를 생략하더라도 컴파일이 되는 예외
        - 즉, 컴파일 하는 과정에서 예외 처리 코드를 검사하지 않는 예외를 말한다.
    - 경험에 따라 예외 처리 코드를 작성할 필요가 업다.

#### - 예외 처리의 목적
- 프로그램을 실행시 발생할 수 있는 상황들을 미리 정해놓고, 예외가 발생했을 경우에 대비하는 코드를 작성하여 프로그램이 정상적으로 작동하도록 하기 위한다.

#### - 예외 종류 예시
- 예외의 종류는 다양하다

        - 예시) 0으로 나누는 런타임 예외
        int num1 = 10, num2 = 0;
		
		//런타임 예외 ( 컴파일예외는 에러나면 빨간줄 ) 
		int result = num1/num2; 
		System.out.println("result >>> " + result);

### - 예외 처리
- 실행 시간에서 발생한 예외(오류)를 프로그램으로 처리한다는 의미

#### - 예외 처리 방법
1. try ~ catch ~ finally 블럭
2. throws 키워드(예외 던지기)

##### 1. try ~ catch ~ finally 블럭

형식) 

		try{
			예외가 발생할 가능성이 있는 코드;

		}catch(예외클래스 참조변수){
			예외가 발생한 경우 실행되는 코드
			참조변수 : 예외와 관련된 정보를 넘겨받는 
            
		}finally{
			//생략 가능하다.
			예외와 상관없이 실행되어야하는 코드
		}

- 예외클래스
    - Exception
        - InterruptedException 	
    	- CloneNotSupportedException
    	- ReflectiveOperationException
            - ClassNotFoundException
            - IllegalAccessException
            - InstantiationException
            - NoSuchFieldException
            - NoSuchMethodException
        - RuntimeException
            - ArithmeticException : 0으로 나눔
            - IndexOutOfBoundsException : 배열 범위 벗어남
                - ArrayIndexOutOfBoundsException
                - StringIndexOutOfBoundsException
            - ArrayStoreException
            - ClassCastException : 형변환 예외
            - EnumConstantNotPresentException
            - IllegalArgumentException 
            	- IllegalThreadStateException
            	- NumberFormatException  	
            - IllegalMonitorStateException
            - IllegalStateException
            - NegativeArraySizeException
            - NullPointerException : null 값
            - SecurityException
            - TypeNotPresentException
            - UnsupportedOperationException 
            - InputMismatchException : 자료형 

- [자바 api](https://docs.oracle.com/javase/8/docs/api/)

- [참고 예외](https://github.com/hyeah0/Java/blob/main/%EC%9E%90%EB%B0%94%EC%9D%98%20%EC%A0%95%EC%84%9D%20chapter/chapter8_%EC%98%88%EC%99%B8/1.%EC%98%88%EC%99%B8.md)

###### - try ~ catch ~ finally 예시
- InputMismatchException : int 자료형에 정수가 아닌값을 입력

        public class Ex06 {

            public static void main(String[] args) {

                System.out.println("프로그램 시작");
                
                Scanner sc = new Scanner(System.in);
                System.out.print("정수를 입력하세요 : ");
                int su = 0;
                
                try {
                    su = sc.nextInt();
                    System.out.println("입력받은 수 >>> " + su);
                }catch(InputMismatchException ime) {
                    System.out.println("예외가 발생했습니다 \n"
                                    + "정수를 입력해주세요.");
                    System.out.println("예외 정보 : " + ime);
                    System.out.println("예외 메세지 : " + ime.getMessage());
                }finally {
                    
                    //입출력과 관련된 데이터를 처리
                    System.out.println("프로그램 종료");
                    sc.close();
                }
            }
        }

- 결과

        프로그램 시작
        정수를 입력하세요 : ㅇ
        예외가 발생했습니다 
        정수를 입력해주세요.
        예외 정보 : java.util.InputMismatchException
        예외 메세지 : null
        프로그램 종료

##### 1. 다중 try ~ catch ~ finally 블럭
- catch 문을 여러개 사용하여 처리하는 방식
- catch 문은 순차적으로 위에서 아래로 실행이 된다.
- 주의) 
    - 예외를 처리하는 가장 최상위 Exception 클래스는 가장 하단줄에 나와야 한다.
    - 만약, 여러 예외처리중 Exception 클래스가 맨 첫줄에 나오는 경우 error 발생 한다.

###### - 다중 try ~ catch ~ finally 예시

        public class Ex07_multiCatch {

            public static void main(String[] args) {

                System.out.println("프로그램 시작");
                
                Scanner sc = new Scanner(System.in);
                
                int num = 0; 
                String str = null;
                int[] arr = {10,20,30,40,50};
                
                
                try {
                    //예외1_ 정수 외 다른값 입력
                    num = sc.nextInt(); 
                    System.out.println("str문자열의 길이 : " + str.length());
                    arr[5] = 100;
                    
                }catch(InputMismatchException ime){
                    System.out.println("정수만 입력해주세요.");
                    System.out.println("예외정보 >>> " + ime);
                    
                }catch(NullPointerException npe) {
                    System.out.println("str값은 null 입니다.");
                    System.out.println("예외정보 >>> " + npe);
                
                }catch(Exception e) {
                    System.out.println("모르는 예외 발생");
                    System.out.println("예외정보 >>> " + e);
                    
                }finally {
                    System.out.println("프로그램 종료");
                }
            }
        }

- 결과

        정수만 입력해주세요.
        예외정보 >>> java.util.InputMismatchException
        프로그램 종료

##### - printStackTrace()
- 에러메세지의 발생 근원을 찾아 단계별로 에러문 출력

###### - printStackTrace() 예시
-코드

        public class Ex08 {

            void exception1() {
                String str1 = "java";
                String str2 = null;
                
                System.out.println("--- exception1 프로그램 시작 --- ");
                try {
                    System.out.println("str1 문자열 길이 : " + str1.length());
                    System.out.println("str2 문자열 길이 : " + str2.length());
                }catch(Exception e) {
                    e.printStackTrace();
                }finally {
                    System.out.println("--- exception1 프로그램 종료 ---\n ");
                }
                    
                /*
               printStackTrace();
                * - 에러 메세지의 발생 근원을 찾아서 단계별로 에러를 출력해주는 메서드
                */
            }
            
            void exception2() {
                int num1 = 15;
                int num2 = 0;
                int result = 0;
                
                System.out.println("--- exception2 프로그램 시작 --- ");
                try {
                    result = num1 / num2;
                }catch(Exception e) {
                    e.printStackTrace();
                }
                
                System.out.println("--- exception2 프로그램 종료 ---");
            }
            
            public static void main(String[] args) {

                Ex08 ex08 = new Ex08(); 
                ex08.exception1();
                ex08.exception2();
            }
        }

- 결과

        --- exception1 프로그램 시작 --- 
        str1 문자열 길이 : 4
        java.lang.NullPointerException
            at khie.Ex08.exception1(Ex08.java:12)
            at khie.Ex08.main(Ex08.java:43)
        --- exception1 프로그램 종료 ---
        
        --- exception2 프로그램 시작 --- 
        java.lang.ArithmeticException: / by zero
            at khie.Ex08.exception2(Ex08.java:32)
            at khie.Ex08.main(Ex08.java:44)
        --- exception2 프로그램 종료 ---

##### 2. throws 키워드(예외던지기)
- 예외 처리를 위임시키는 명령어

- 형식)

		메서드명 throws 예외처리클래스 {}

- throws 로 지정된 메서드를 호출 시, 메서드 내에서 예외가 발생이 되면 해당 예외를 메서드를 호출한 곳으로 위임 시켜 예외를 처리하는 방법

###### - throws 키워드 예시
- 코드
- 예외처리된 exception2 메서드를 Exception 클래스가 처리하도록 위임

        public class Ex09 {

            void exception1() {
                String str1 = "java";
                String str2 = null;
                
                System.out.println("--- exception1 프로그램 시작 --- ");
                try {
                    System.out.println("str1 문자열 길이 : " + str1.length());
                    System.out.println("str2 문자열 길이 : " + str2.length());
                }catch(Exception e) {
                    e.printStackTrace();
                }finally {
                    System.out.println("--- exception1 프로그램 종료 ---\n ");
                }                    
            }
            
            void exception2() throws Exception{
                int num1 = 15;
                int num2 = 0;
                
                
                System.out.println("--- exception2 프로그램 시작 --- ");
                int result = num1 / num2;
                System.out.println("--- exception2 프로그램 종료 ---");
            }
            
            
        //	public static void main(String[] args) throws Exception {
        //		Ex09 ex09 = new Ex09();
        //		ex09.exception1();
        //		ex09.exception2();
        //	}
            
            public static void main(String[] args) {
                Ex09 ex09 = new Ex09();
                try{
                    ex09.exception1();
                    ex09.exception2();
                }catch(Exception e) {
                    System.out.println("예외");
                }
                
            }
        }

- 결과

        --- exception1 프로그램 시작 --- 
        str1 문자열 길이 : 4
        java.lang.NullPointerException
            at khie.Ex09.exception1(Ex09.java:24)
            at khie.Ex09.main(Ex09.java:57)
        --- exception1 프로그램 종료 ---
        
        --- exception2 프로그램 시작 --- 
        예외
