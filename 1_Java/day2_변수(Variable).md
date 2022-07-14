## day2 - 변수(Variable)
### 변수란?
- 프로그래밍에서 가장 기본적인 동작은 데이터를 저장하고, 
  저장된 데이터 값을 읽어오는 것
- 데이터를 저장하려면 메모리에 값을 저장할 공간을 생성하고 이름을 부여해야함 
- 변수는 하나의 데이터(값)을 저장할 수 있는 메모리 공간을 의미함
- 변수는 여러개의 값을 저장할 수 없고, 오직 하나의 값만을 저장 할 수 있음
- 필요한 데이터를 저장할 곳을 미리 선언해 두고, 나중에 계속해서 사용하기 위해 변수를 만듬
- 데이터를 저장하기 위해 생성되는 메모리 공간은 목적에 따라 크기와 특징이 다른데, 이를 자료형이라 함
- 즉, 메모리 공간의 자료형에 따라 저장할 수 있는 값의 종류와 크기가 결정이 됨

### 변수를 선언하는 방법
- 형식) 자료형 변수명;

    - 자료형 : 자바의 기본 자료형(8가지)
    - 변수명 : 사용자가 임의로 만들 수 있음


#### 자바에서의 기본 자료형(8가지)
|자료형             |   형태                            |
|----            |                        ----   |
| 정수형(정수자료형) | byte(1바이트), short(2바이트), int(4바이트-기본자료형), long(8바이트) |
| 실수형(실수자료형) | float(4바이트), double(8바이트-기본자료형) |
| 단일문자형        | char(2~3바이트)                |
| 논리형(논리자료형) | boolean(true/false)  

- ***  String 은 기본자료형이 아니다. (기본자료형과 형변환 안됨)
- 나머지 자료형은 참조 자료형

- float : 소수점 6자리까지 나옴 
- double : 소수점 16자리까지 나옴

- byte
    - 1byte = 8 bit
    - 1byte => oooooooo - "o" 1개에 0,1로 구분(2개) 
                    - "o" 첫번째는 부호비트 (부호비트 + 7비트) 
- 1byte => -2의 7승(-128) ~ 2의 7승-1(127)
- 2byte => -2의 15승(-32,768) ~ 2의 15승-1(32,767)
- bit (정보의 최소단위)

#### 변수 사용 절차
1. 변수 선언 - 자료형 변수명 ex) int a;
2. 변수 초기화 - 변수에 값을 저장(=기호사용) ex) a = 1;
3. 변수 이용- 연산 및 출력 ex) System.out.println(a) // 1 

> 변수 선언 및 초기화 한번에 가능 
>> ex) int su = 10;

#### 변수명(식별자) 만드는 작성 규칙
- 변수명, 메서드명, 클래스명 등의 이름을 지정할 때 사용함.

1. 예약어(키워드-문법적으로 사용되는 단어) 사용 불가
2. 영문자 또는 특수문자( _ or $ ) 로 시작
3. 숫자로 시작하면 안됨 ex) 1sum(X)
4. 대소문자는 구분함 - sum과 SUM은 다른 변수
5. 변수명은 의미있게!

#### 정수형 예시코드
- 예시1 
    
    변수 선언과 변수 초기화를 따로

        public class Ex01 {

            public static void main(String[] args) {
                
                //1. 변수 선언
                byte su; 
                
                //2. 변수 초기화 : 변수값을 저장하는 방법(=기호사용)
                su = 100;
                
                //3. 변수 이용- 연산 및 출력
                System.out.println(su); //100
                System.out.println(su+10); //110
                
                //4. 변수값 수정
                su = 30;
        		su = su + 35; --> 에러 
                System.out.println(su); //30
            }
        }

- 예시2 
    
    변수 선언과 변수 초기화를 같이

        //1. 변수 선언 및 초기화
		int su = 10;
		
		//2. 변수 출력
		System.out.println(su); //10
		
		//3. 변수 수정
		su = su + 3800;
		
		//2. 변수 출력
		System.out.println(su); //3810
		
		int su1 = 379;
		
		//4. 변수 와 변수 연산
		System.out.println("su + su1 = " + (su+su1)); //4189

### 형변환 

형변환(casting) : 해당 데이터 값의 자료형을 다른 타입의 자료형으로 변환하는 것을 말함
- 형변환은 boolean 형을 제외한 7가지 자료형은 서로 형변환이 가능하다
		
    1. 묵시적 형변환
        - 자료형의 크기가 작은 데이터를 큰 자료형의 데이터에 저장
        - 이때는 형변환 표시를 따로 안해주어도 된다.
            
    2. 명시적 형변환
        - 자료형의 크기가 큰 데이터를 작은 자료형의 데이터에 저장.
        - 이때는 반드시 형변환 표시를 해야한다.
        - 형변환 작업시 자료의 손실이 발생

#### 예시코드
    
- 예시    
    변수와 변수 연산시 각 변수의 자료형 상이
    
    (형변환 : casting)


        public class Ex04 {

            public static void main(String[] args) {
                //변수 선언 및 변수 초기화
                byte su = 127;
                System.out.println("su >>> " + su);
                
                //값 복사
                int su1 = su;
                System.out.println("int su1 = su >>> " + su1);
                
                int su2 = 150;
                System.out.println("su2 >>> " + su2);
                
                //byte su3 = su2; 
                /* 에러사유
                * byte 와 int 타입이 다름 타입 형변환(casting) 필요
                * byte < short < int < long 
                * 큰 자료형에 작은 자료형을 초기화시 따로 형변환 표시 안해도 되지만, 
                * 작은 자료형에 큰 자료형을 초기화시 명시적 형변환 필요
                */

                byte su3 = (byte) su2; 
                System.out.println(su3); //-106
            }
        }

        
		su3 변수 값이 -106 나온 이유
		    - byte 자료형의 범위(-128~127)를 벗어났기 때문에 -106 출력

### 자료형 - 실수형


실수자료형 : 소수점이 존재하는 자료형
- float : 소수점 이하 6~7자리까지 표현가능
- double(기본형) : 소수점 이하 15~16개 자리까지 표현이 가능
- float 자료형의 변수에 상수값을 저장시 반드시 실수값 뒤에 f를 붙여줘야 한다.
    - 생략시 error발생
    - 오류발생이유 : 실수형 기본자료형은 double 이기 때문
- 실수자료형에서 명시적 형변환을 진행하더라도 자료의 손실이 거의 발생하지 않는다.
 

#### 실수형 예시코드
- 예시

        public class Ex05 {

            public static void main(String[] args) {

                double dNum = 123.45666;
                System.out.println("dNum >>> " + dNum); //123.45666;
                
                //float fNum = 123.45666;
                //에러 발생 초기화시 값 뒤에 f 붙이지 않음
                
                float fNum = 123.45666f;
                // 또는 float fNum = (float) 123.45666;
                System.out.println("fNum >>> " + fNum);	
            }
        }

### 자료형 - 단일문자형

단일문자형 : char형(0~65535) ==> 2byte 로 처리
- 자바에서는 유니코드(UTF-8) 체계로 단일문자 처리됨
- 홑따옴표사용 ex) char ch = 'd';


#### 단일문자형 예시코드

-예시

        public class Ex06 {

            public static void main(String[] args) {
                
                char ch = 'A';
                System.out.println("ch >>> " + ch); // ch >>> A
                System.out.println(ch + 1); // 66
                
                System.out.println("ch >>> " + ch); // ch >>> A
                System.out.println((char)(ch + 1)); // B
                
                char ch1 = 'a';
                System.out.println("ch1 >>> " + ch1); // ch >>> a
                System.out.println(ch1 + 1); //98
                
                System.out.println("ch1 >>> " + ch1); // ch >>> a
                System.out.println((char)(ch1 + 1)); //b
            }
        }

### 자료형 - 논리자료형(boolean형)
 논리자료형 : 참이나 거짓을 처리하는 자료형
    - true : 참인 값
    - false : 거짓인 값 
- boolean형의 기본값은 false 이다.
- True/False(X) ==> 반드시 소문자로 작성해야함

#### 논리자료형 예시코드

-예시

        public class Ex07 {

            public static void main(String[] args) {
            
                boolean test = true;
                System.out.println("test >>> " + test); // test >>> true
            }

        }

### 두 변수 값 교환

두 변수 외 임의 변수 생성


- 예시

        public class Ex08 {

            public static void main(String[] args) {

                //변수 선언 및 변수 초기화
                //int su1 = 47;
                //int su2 = 82;
                // 또는 
                int su1 = 47, su2 = 82;

                System.out.println("변경전 ...");
                System.out.println("su1 >>> " + su1); // su1 >>> 47
                System.out.println("su2 >>> " + su2); // su2 >>> 82
            
                System.out.println();
                
                int tmp = su1;
                su1 = su2;
                su2 = tmp;
                
                System.out.println("변경후 ...");
                System.out.println("su1 >>> " + su1); // su1 >>> 82
                System.out.println("su2 >>> " + su2); // su2 >>> 47

                // 방법2
                // int tmp = su2;
                // su2 = su1;
                // su1 = tmp;
                
                // System.out.println("변경후 ...");
                // System.out.println("su1 >>> " + su1); // su1 >>> 82
                // System.out.println("su2 >>> " + su2); // su2 >>> 47

            }
        }
