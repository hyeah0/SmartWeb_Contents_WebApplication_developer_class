## day5_객체(class&method)

### 메서드(Method)?
1. c언어에서의 함수(function)과 같음
2. 기능을 정의하는 단위(예 : 덧셈기능, 뺄셈기능 등등)
3. 하나의 기능만을 정의하는 것이 좋음
4. 자주 반복되는 내용을 정의해 놓고, 필요할 때 호출하여 사용함

- 형식)

        [접근제한] 반환형 메서드이름(매개변수 혹은 인자){
                    메서드 호출시 실행될 문장;
        }

- 접근제한 : public > protected > default > private
	
		(클래스, 메서드, 변수 앞에 사용됨)

- 반환형 
    - 메서드를 실행하고 특정 타입의 결과를 반환해 주겠다고 선언하는 것을 반환형(리턴타입)이라고 한다.
    - 메서드에서 실행된 결과값을 돌려주는 자료형으로 생략 불가능
    - 해당 메서드가 어떤 동작이나 기능을 실행한 후 결과를 알려주는 자료형
    - 만약 결과를 되돌려줄 필요가 없는 경우에는 void라는 키워드 작성
    - 반환형이 void 인 경우를 제외하고 결과를 되돌려주어야 할 때 메서드 명령문 맨 마지막에 return이라는 키워드 작성후, 앞에 선언한 반환형과 같은 자료형으로 결과를 되돌려준다.
    - void, String, int ... 	
- 메서드 이름 
    - 식별자, 소문자로 시작
    - 두 개의 단어가 결합된 경우에는 두번째 글자의 첫글자는 대문자로 작성하는 것이 관례(Camelcase)
- 매개변수 
    - 외부에서 값을 넘겨받는 변수, 생략가능
    - 메서드 호출시 전달되는 값의 저장을 위한 용도로 사용
    - 메서드 호출시 전달되는 값의 자료형과 매개변수의 자료형은 반드시 일치해야한다.
- 메서드 실행문 
    -해당 메서드가 호출된 경우에만 실행된다.
 
#### 예시코드

        import java.util.Scanner;

        public class Ex02 {

            public static void add() {
                Scanner sc = new Scanner(System.in);
                System.out.println("1 부터 ~ __ 까지 합을 구하세요 ");
                System.out.print("종료 숫자를 입력해주세요 >> ");
                int end = sc.nextInt();
                int sum = 0;
                
                for(int i=1; i<=end; i++) {
                    sum += i;
                }
                System.out.println("1 부터 ~ " + end + " 까지 합은 : " + sum + " 입니다.");
                
                sc.close();
            }
            
            public static void main(String[] args) {

                System.out.println("프로그램 시작");
                
                //[문제]
                //1부터 키보드로 받은 수까지의 합을 구하는 메서드를 호출해보세요
                add();

                System.out.println("프로그램 종료");
                
            }

        }

        - 결과

        프로그램 시작
        1 부터 ~ __ 까지 합을 구하세요 
        종료 숫자를 입력해주세요 >> 5
        1 부터 ~ 5 까지 합은 : 15 입니다.
        프로그램 종료


### 매개변수가 있는 메서드 정의
- 형식) 

        [접근제한] 반환형 메서드이름(type 변수1, type 변수2){
                    메서드 호출시 실행문장;
        }

- 실인수와 가인수
    - 실인수 : 매개변수에 전달할 실제 값 ==> 메서드 호출시 사용함
    - 가인수 : 매개변수(가인수) ==> 메서드에 정의
    - 실인수와 가인수는 반드시 type, 순서, 갯수가 일치해야한다.(중요!)

#### 예시코드

        public class Ex03 {

            public static void total(int a, int b, int c) { //가로안에 있는 매개변수 가인수(지역변수이다)_ 자료형 생략 불가
                System.out.println("sum >>> " + (a+b+c));
            }
            
            public static void main(String[] args) {

                total(95,88,92); // 가로안에있는 매개변수 실인수이다.
            }

        }

        - 결과

        sum >>> 275


 
### 메소드 호출 방식 - 2가지 ★★★★★★★★
1. call by value 방식
	- 값을 전달하여 호출하는 방식
	- 매개변수가 기본자료형(int, double, char ...) 사용
 
2. call by reference 방식 ** 
	- JAVA에서 많이 사용하는 방식(중요!)
	- 주소값을 전달하여 호출
	- 매개변수가 참조자료형(배열, 클래스) 사용

#### 예시
#### 1. call by value 방식

        public class Ex05 {
            
            public static void call(int num) {
                num = 100;
                System.out.println("num = " + num);
            }

            public static void main(String[] args) {

                //1. call by value 방식
                int num = 200;
                
                System.out.println("메서드 호출 전 .........");
                System.out.println("num = " + num);
                System.out.println("메서드 호출 후.........");
                System.out.println("num = " + num); // 200 메서드를 통해 num 변수가 호출된게 아니라 값이 변하지 않는다.
                
                call(num);
                
            }

        }

        - 결과

        메서드 호출 전 .........
        num = 200
        메서드 호출 후.........
        num = 200
        num = 
        
#### 2. call by reference 방식

        public class Ex06 {

            public static void change(int[] array) { // 배열 복사(주소값 넘어감)
                System.out.println("arr 배열주소값 >>> " + array);
                
                for(int i=0; i<array.length; i++) {
                    array[i] *= 100;
                }
                
            }
            
            public static void main(String[] args) {
                
                //2. call by reference 방식
                int[] arr = new int[3];
                arr[0] = 10; 
                arr[1] = 20;
                arr[2] = 30;
                
                System.out.println("arr 배열주소값 : " + arr);
                
                System.out.println("change() 메서드 호출전 ... ");
            
                for(int i=0; i<arr.length; i++) {
                    System.out.println("arr[i] >>> " + arr[i]);
                }
                change(arr);
                
                System.out.println("change() 메서드 호출후 ... ");
                
                for(int i=0; i<arr.length; i++) {
                    System.out.println("arr[i] >>> " + arr[i]);
                }
                
            }

        }

        - 결과

        arr 배열주소값 : [I@7d6f77cc
        change() 메서드 호출전 ... 
        arr[i] >>> 10
        arr[i] >>> 20
        arr[i] >>> 30
        arr 배열주소값 >>> [I@7d6f77cc
        change() 메서드 호출후 ... 
        arr[i] >>> 1000
        arr[i] >>> 2000
        arr[i] >>> 3000

### 메서드 호출시 반환형 

- 메서드 형태

    [접근제한] 반환형 메서드이름(매개변수 혹은 인자){
                     메서드 호출시 실행될 문장;
                     return ;
            }

- 반환형에 void가 아닌 int, String .. 을 사용했을 경우
    - return 작성 필
    - return 작성시 
        1. 값을 작성 가능
        2. 변수명 작성 가능
        3. 수식 작성가능
    - return 에 작성된 값, 변수, 수식은 반환형에 작성한 형식이여야 한다.

        예시) 반환형에 int 작성시에 return int 값이여야한다.

#### 예시

        public class Ex07 {

            //return에 값이 반환되는경우 
            public static int method1() {
                return 10; // 반환형이 void가 아니라 return 꼭 작성, 
                        //return 이후 값은 void 대신 쓴 반환형 형식으로 작성 필(값 또는 변수명 가능)
            }
            
            //return에 변수명이 반환되는경우 
            public static int method2(int num1, int num2) {
                int sum = (num1 * 2) + (num2 * 2);
                return sum; 
            }
            
            //return에 수식이 반환되는경우 
            public static int method3(int num1, int num2) {
                
                return num1 + num2; 
            }
            
            public static void main(String[] args) {
                
                int su = method1();
                System.out.println("method1() 메서드 호출 후 반환된 값 >>> " + su);
                // = 
                System.out.println("method1() 메서드 호출 후 반환된 값 >>> " + method1());
                
                System.out.println("method2() 메서드 호출 후 반환된 값 >>> " + method2(145,200));
                System.out.println("method3() 메서드 호출 후 반환된 값 >>> " + method3(145,200));
            }

        }

        - 결과

        method1() 메서드 호출 후 반환된 값 >>> 10
        method1() 메서드 호출 후 반환된 값 >>> 10
        method2() 메서드 호출 후 반환된 값 >>> 690
        method3() 메서드 호출 후 반환된 값 >>> 345
