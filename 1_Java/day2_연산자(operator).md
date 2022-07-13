## day2_연산자(operator)
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

#### 산술연산자
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

#### 관계연산자(비교연산자)
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

#### 논리연산자
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