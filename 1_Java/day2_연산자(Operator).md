## day2_연산자(Operator)
### 연산자

연산 : 주어진 식을 계산하여 결과를 얻어내는 과정
- 피연산자 : 연산자의 작업 대상
 
 ( 예 : 20 +10 ==> 20,10 을 피연산자라 한다)

### 연산자 종류
1. 산술연산자
2. 관계연산자(비교연산자)
3. 논리연산자
4. 단항연산자 / 3항연산자		ex) a>b ? a : b
5. 배정연산자 / 단축배정연산자
6. 비트연산자
7. 쉬프트연산자

#### 1. 산술연산자
- 덧셈(+), 뺄셈(-), 곱셈(*), 나눗셈(/), 나머지(%)
	- 나눗셈(/) : 몫 
	- 나머지(%) : 나머지
        - 홀/짝 판별시 사용
        - 배수 판별시 사용

##### 산술연산자 예시코드

        public class Ex01 {

            public static void main(String[] args) {

                int su1 = 13, su2 = 4; 
                
                //덧셈연산
                System.out.println("su1 + su2 = " + (su1 + su2)); //su1 + su2 = 17
                
                //뺄셈연산
                System.out.println("su1 - su2 = " + (su1 - su2)); //su1 - su2 = 9
                
                //곱셈연산
                System.out.println("su1su2 = " + (su1 * su2)); //su1 * su2 = 52
                
                //나눗셈연산
                System.out.println("su1 / su2 = " + (su1 / su2)); //su1 / su2 = 3
                
                //나머지연산
                System.out.println("su1 % su2 = " + (su1 % su2)); //su1 % su2 = 1
            }
            
        }

#### 2. 관계연산자(비교연산자)
- \>= , > , <= , <, ==
    - \>=(크거나 같은지), >(큰지)
    - <=(작거나 같은지), <(작은지)
    - ==(같은지), !=(같지않은지)
- boolean형으로 결과가 나옴 ==> true/false
- 관계연산자는 제어문(조건문)에서 가장 많이 사용되는 연산자

##### 관계연산자(비교연산자) 예시코드

- 예시

        public class Ex02 {

            public static void main(String[] args) {

                int su1 = 10, su2 =5;
                System.out.println("su1 >= su2 >>> " + (su1>=su2)); //true
                System.out.println("su1 > su2 >>> " + (su1>su2)); //true
                System.out.println("su1 <= su2 >>> " + (su1<=su2)); //false
                System.out.println("su1 < su2 >>> " + (su1<su2)); //false
                System.out.println("su1 == su2 >>> " + (su1==su2)); //false
                System.out.println("su1 != su2 >>> " + (su1!=su2)); //true	
            }
        }

#### 3. 논리연산자
- 논리곱(and, &&) 
    - 주어진 조건이 모두 참일때 true, 조건 중 하나라도 참이 아닐때 false
- 논리합(or, ||) 
    - 주어진 조건 중 한개이상 참일때 true, 조건 모두 참이 아닐때 false
- 부정(!) 
    - true -> false 가 되고 false -> true 가 된다.

- 논리연산자는 우선적으로 관계연산자를 실행한 후에 그 결과값을 가지고 논리연산을 수행한다.

##### 논리연산자 예시코드
- 예시

        public class Ex03 {

            public static void main(String[] args) {

                int su1 = 10, su2 = 7;
                
                //논리곱
                boolean andTest1 = (su1 >= su2) && (su1 >= 5); // t || t
                System.out.println("(su1 >= su2) && (su1 >= 5) = " + andTest1); //true

                boolean andTest2 = (su1 >= su2) && (su1 <= 5); // f || f
                System.out.println("(su1 >= su2) && (su1 <= 5) = " + andTest2); //false
                
                //논리합 : 앞에 조건이 참인경우 바로 참으로 반환(뒤 조건 확인 하지 x)
                boolean orTest1 = (su1 >= su2) || (su1 >= 5); // t || t
                System.out.println("(su1 >= su2) || (su1 <= 5) = " + orTest1); //true
                
                boolean orTest2 = (su1 >= su2) || (su1 <= 5); // t || f
                System.out.println("(su1 >= su2) || (su1 <= 5) = " + orTest2); //true
                
                boolean orTest3 = (su1 <= su2) || (su1 <= 5); // f || f
                System.out.println("(su1 <= su2) || (su1 <= 5) = " + orTest3); //true
                
            }

        }

#### 4. 단항연산자 / 3항연산자	

| 연산자 | 수행 | 기호 |
| ---- | ---- | ---- |
| 단항연산자 | 1개의 항을 대상으로 연산 수행 | ++ , -- |
| 이항연산자 | 2개의 항을 대상으로 연산 수행 |
| 3항연산자 | 3개의 항을 대상으로 연산 수행 | (조건) ? 참일때 수행문 : 거짓일때 수행문 | 


- 단항연산자
    - 전위연산자(변수명 앞에 ++, --) : 변수값 하나 증가 또는 감소 후 출력
    - 후위연산자(변수명 뒤에 ++, --) : 변수값 출력 후 증가 또는 감소
        

- 3항연산자
    - 형식
    - (조건) ? 수식1 : 수식2;
        - 수식1 : 조건이 참 인경우 실행
        - 수식2 : 조건이 거짓 인경우 실행
            
                int a = 1, b =3;
                (a>b)? a : b     
            

##### 연산자 예시코드 

        public class Ex04 {

            public static void main(String[] args) {

                //단항연산자(++,--)
                int su1 =10, su2 =10;

                System.out.println("su1 = " + su1); // 10
                System.out.println("su1++ = " + su1++); // 10
                System.out.println("su1 = " + su1); // 11
                
                System.out.println("su2 = " + su2); // 10
                System.out.println("++su2 = " + ++su2); // 11
                
                //단항연산자(++,--) : 전위연산자, 후위연산자 복합
                int su3 =10, su4 = 20;
                
                System.out.println("int su3 =10, su4 = 20;");
                System.out.println("++su3 + su4++ = " + (++su3 + su4++) ); // 31
                System.out.println("su3 = " +su3); // 11 
                System.out.println("su4 = " +su4); // 21 
                System.out.println((++su3)%3 + (su3 * ++su4)); 264
                
                //삼항연산자( (조건식) ? 수행문1 : 수행문2 )
                int a = 1, b =3;

                String result = (a>b) ?  "참 : " + a : "거짓 : " + b ;
                System.out.println(result); // 거짓 : 3  
                
                
                System.out.print("(a<b) && (a!=b)? a : b = " );
                System.out.println((a<b) && (a!=b)? a : b);  // 1
            }

        }

#### 5. 배정연산자(=) / 단축배정연산자(+=,-=)

- 배정연산자(=) : 할당
    - 형식) 변수 = 값 or 변수명 or 수식
        - 좌변에는 항상 변수명
        - 우변에는 값, 변수명, 수식

        
                // 형식1) 변수 = 값(데이터)
                int su1 = 10, su2 = 28, result = 0;

                // 형식2) 변수 = 변수
                su1 = su2;

                 // 형식3) 변수 = 수식
                su1 = su2 + 27;

- 단축배정연산자(+= , -=)
    - 배정연산자를 간편하게 사용하는 연산자

            result += 10;
            // = result = result +10;


##### 배정연산자 & 단축배정연산자 예시 코드

        public class Ex05 {

            public static void main(String[] args) {

                // 배정연산자
                // 형식1) 변수 = 값(데이터)
                int su1 = 10, su2 = 28, result = 0;
                
                System.out.println("형식1) 변수 = 값(데이터)");
                System.out.println("su1 = " + su1); // 10
                System.out.println("su2 = " + su2); // 28	
                
                // 형식2) 변수 = 변수
                su1 = su2;
                
                System.out.println("형식2) 변수 = 변수");
                System.out.println("su1 = " + su1); // 28
                System.out.println("su2 = " + su2); // 28

                
                // 형식3) 변수 = 수식
                su1 = su2 + 27;
                
                System.out.println("형식3) 변수 = 수식");
                System.out.println("su1 = " + su1); // 55
                System.out.println("su2 = " + su2); // 28
                
                
                // 단축배정연산자(+=) : 누적값이 있을경우
                
                result += 10;
                // = result = result +10;
                System.out.println("result = " + result + "\n"); // 10
                
                int su3 = 0;
                su3 += 1;
                System.out.println("su3 += 1 = " + su3 + "\n"); // 1
                
                int su4 = 0;
                for(int i = 1; i<=7; i++) {
                    su4 += i;
                    System.out.println("su4 += " + i + " = " + su4);
                }
                System.out.println(su4); //28
                System.out.println();
                
                int su5 = 15;
                System.out.println("su5 >>> " + su5);
                System.out.println("su5 += 5 >>> " + (su5 += 5)); // 20
                System.out.println("su5 -= 5 >>> " + (su5 -= 5)); // 15
                System.out.println("su5 *= 5 >>> " + (su5 *= 5)); // 75 
                System.out.println("su5 /= 5 >>> " + (su5 /= 5)); // 15
                System.out.println("su5 %= 5 >>> " + (su5 %= 5)); // 0
            }

        }

### 6. 비트연산자

- 비트(0,1)를 이용하여 연산

| 연산자 | 내용 | 
| ---- | ---- | 
| &(and) | 두 비트의 조건이 참(1)인 경우 1, 거짓인경우 0 반환 |
| \|(or) | 두 비트 중 하나 이상 조건이 참(1)인 경우 1, 거짓인경우 0 반환 |
| ^(xor) | 두 비트 중 서로 다른 경우에만 참(1) 반환, 서로 같을경우 0 반환 |

> ^(xor) 예시 : t f => 1 / t t => 0 / f f => 0 
- 비트 연산하기위해 십진수를 이진수로 변환 필요

##### 비트연산자 예시 코드
- 예시

        public class Ex06 {

            public static void main(String[] args) {

                int num1 = 10, num2 = 5, result;
                
                // 십진수를 이진수로 변환(정수를 2로 나눈 나머지값 0또는 1)
                // num1 = 1010, num2 = 0101
                
                // and연산
                result = num1 & num2 ; // 1010 & 0101 ==> 0000
                System.out.println("and result >>> " + result);
                
                // or연산
                result = num1 | num2 ; // 1010 | 0101 ==> 1111
                System.out.println("or result >>> " + result);
                
                // xor연산
                num2 = 8;
                result = num1 ^ num2 ; // 1010 ^ 1000 ==> 0010
                System.out.println("xor result >>> " + result);

            }

        }

#### 7. 쉬프트연산자
- 비트를 대상으로 왼쪽/ 오른쪽 으로 비트를 밀어서 연산을 수행
- 왼쪽쉬프트 (<<) : 왼쪽으로 비트수만큼 이동
    > 오른쪽에 비어있는 빈 칸(비트)은 0으로 채워짐
- 부호 있는 오른쪽쉬프트 (>>) : 오른쪽으로 비트수만큼 이동
	> 왼쪽에 비어있는 빈 칸(비트)은 부호비트로 채워짐
- 부호 없는 오른쪽쉬프트(>>>) : 오른쪽으로 비트수만큼 이동
	> 왼쪽에 비어있는 빈 칸(비트)는 무조건 0으로 채워짐

##### 쉬프트연산자 예시 코드
- 예시

        public class Ex07 {

            public static void main(String[] args) {

                int num1 = 10, num2 =5 ; // 10의 이진수 = 1010, 5의 이진수 = 0101
                
                System.out.println(num1 << 2); // 40 왼쪽쉬프트 2의 5승
                System.out.println(num2 >> 1); // 2 
                
            }

        }

### 두 수 입력받아 연산
#### 1. 메인 메서드 안에 인수에서 받기 --> main(String[] args)
    1. main 메서드 안의 배열 인수를 할당
    2. 재생버튼 > run configurations > arguments > program arguments 에 원하는 인수 작성 > apply 
    3. 배열에 할당된 문자를 숫자로 변경 (Integer.parseInt() 또는 Integer.valueOf() 사용) 
    4. 기호에 따라 연산

##### 예시 코드

        public class Ex08 {

            public static void main(String[] args) {

            //1. 메인 메서드 안에 인수에서 받기 --> main(String[] args)
                String su0 = args[0];
                String su1 = args[1];
                
                // 재생버튼 > run configurations > arguments > program arguments 에 10 20 작성
                System.out.println(su0); // 10
                System.out.println(su1); // 20
                System.out.println(su0+su1); // 1020
                
                //Integer.parseInt(su0); 문자열을 숫자로 변경
                int num0 = Integer.parseInt(su0);
                int num1 = Integer.parseInt(su1);
                // 또는 int num1 = Integer.valueOf(su1);
                
                System.out.println(num0); // 10
                System.out.println(num1); // 20
                System.out.println(num0+num1); // 30
                
            }

        }

##### 문제 풀기

    [문제] 

    키보드로부터 두개의 정수를 입력 받기
    입력받은 두 수를 이용하여 산술연산을 진행해 보자

- 결과

        num1 : 5
        num2 : 8
        num1 + num2 = 13
        num1 - num2 = -3
        num1 / num2 = 0
        num1 % num2 = 5

- 코드

        public class Ex09 {

            public static void main(String[] args) {
                // 1. 키보드로 부터 두개의 정수를 입력 받기
                // String str1 = args[0]; // 5
                // String str2 = args[1]; // 8
                        
                // 2. 입력받은 문자열을 숫자로 변환
                // int num1 = Integer.parseInt(str1);
                // int num2 = Integer.parseInt(str2);
                        
                // 1,2번 한번에 
                int num1 = Integer.parseInt(args[0]);
                int num2 = Integer.parseInt(args[1]);
                
                System.out.println("num1 : " + num1 );
                System.out.println("num2 : " + num2 );
                System.out.println("num1 + num2 = " + (num1 + num2)); // 13
                System.out.println("num1 - num2 = " + (num1 - num2)); // -3
                System.out.println("num1 * num2 = " + (num1 * num2)); // 40
                System.out.println("num1 / num2 = " + (num1 / num2)); // 0
                System.out.println("num1 % num2 = " + (num1 % num2)); // 5
            }

        }

#### 2. JOptionPane.showInputDialog("첫번째 정수 입력") 사용
JOptionPane 클래스에 있는 showInputDialog() 메서드 사용 
문자열을 입력받을시 scanner 보다 더 자주 사용하는 방법

> JOptionPane.showInputDialog(팝업창에 나타낼 텍스트)

##### 예시 코드

        import javax.swing.JOptionPane;

        public class Ex09 {

            public static void main(String[] args) {
                int popUp = Integer.parseInt(JOptionPane.showInputDialog("첫번째 정수 입력"));
                System.out.println(popUp);
            
                int popUp2 = Integer.parseInt(JOptionPane.showInputDialog("두번째 정수 입력"));
                System.out.println(popUp2);
            }

        }

#### 3. Scanner 사용 
- scanner 사용시 이슈 : next(aaa bbbb) 로 입력 받을 경우 : aaa 만 확인 됨 (예시코드)
- scanner 사용 후 가장 마지막 부분에 __.close(); 입력 (생략가능)

##### Scanner의 입력 메서드 종류
|메서드 | 설명 |
| ---- | ---- | 
|nextByte() | byte형 입력|
|nextShort() |short형 입력 | 
|nextInt() | int형 입력|
|nextLong() |long형 입력 |
|nextFloat() | float형 입력|
|nextDouble() | double형 입력|
|nextBoolean()| boolean형 입력|
|next() | String형 입력 (공백 기준 앞에 문자열만)|
|nextLine() | String형 입력 (공백포함 한줄) |

##### 1. 예시 코드

        import java.util.Scanner;

        public class Ex08 {

            public static void main(String[] args) {

                Scanner sc = new Scanner(System.in);
                System.out.print("정수를 입력하세요 "); // 10
                int a = sc.nextInt();

                System.out.print("문장을 입력하세요 "); // 안녕하세요 자바
                String b = sc.next();
                System.out.print(b); //안녕하세요 만 반환됨   
            }

        }
	
##### 2. 예시 코드 (__.close(); 포함)

	/*
	 * [문제]
	 * 키보드로 입력받은 정수값이 음수이면 "입력받은 정수는 음수입니다" 라는 메세지를 화면에 출력해 보세요
	 * 방법은 scanner 를 사용하시오
	 */ 
	import java.util.Scanner;

	public class Ex04 {

		public static void main(String[] args) {

			//키보드로 입력받는 방법
			//System.out : 표준 출력장치(화면, 콘솔창)
			//System.in : 표준 입력장치(키보드)
			Scanner sc = new Scanner(System.in);
			System.out.print("숫자를 입력하세요(음수,양수포함) >>> ");
			int num = sc.nextInt();
			System.out.println("입력받은 수 >>> " + num);

			if(num<0) {
				System.out.println("입력 받은 "+ num +  "은  음수입니다.");
			}

			sc.close();
		}

	}
	
##### 3. 예시 코드 (JOptionPane, scanner 둘다 사용)

	/*
	 * [문제]
	 * 키보드로부터 입력받은 점수가 60점 이상이면, "합격입니다" 라는 메세지를 화면에 출력해 보세요
	 */

	import java.util.Scanner;

	import javax.swing.JOptionPane;

	public class Ex05 {

		public static void main(String[] args) {

			int num1 = Integer.parseInt(JOptionPane.showInputDialog("점수를 입력하세요"));

			if(num1>=60) {
				System.out.println("점수가 " + num1 + "으로 합격입니다." );
			}
			else {
				System.out.println("점수가 60점 미만으로 불합격입니다" );
			}

			//////////////////////////////////////////////////////////////////////

			Scanner sc = new Scanner(System.in);
			System.out.print("점수를 입력하세요 >>> ");
			int num = sc.nextInt();

			if(num>=60) {
				System.out.println("합격입니다");
			}
			else {
				System.out.println("점수가 60점 미만으로 불합격입니다");
			}

			sc.close();

		}

	}
