## day7_객체(class&method)_클래스

### - 객체(object)?
- 실 세계에서 우리 주변에 있는 모든 것이 객체이다.
	- 예시) tv, 컴퓨터, 책, 건물, 의자, 사람 등등
- 실 세계의 객체들은 자신만의 고유한 특성(속성)과 행동(기능)을 가지고 있다.
    1. 서로 상호작용 
        
        - 객체들은 다른 객체들에게 행동을 요청하거나 정보를 주고 받는 등 상호 작용을 하면서 존재한다.
        
                예시) 사람은 전자계산기의 기능을 이용하게 되고, 
                    전자계산기는 계산결과를 사람에게 알려주는 상호작용을 하게 된다.

    2. 속성과 기능(동작)

        - 객체는 속성과 기능(동작)으로 구성되어 있다.

                예시) 사람은 이름,나이 등의 속성이 있고, 걷다, 쓰다, 달리다 등의 동작이 있다.
                    자동차의 경우에는 색상, 모델명 등이 속성에 해당하고, 달린다, 멈춘다 등의 동작이 있다.

    3. 다른 객체와의 관계 (집합관계, 사용관계, 상속관계)

        - 객체는 개별적으로 사용이 될 수도 있지만, 대부분 다른 객체와 관계를 맺고 있게 됨.
        * 중요! 이러한 관계의 종류에는 집합관계, 사용관계, 상속관계가 있다.

            - 집합관계
                - 객체는 하나의 부품이고, 하나의 완성품에 해당이 된다.

                        예시) 자동차는 엔진,타이어, 핸들 등으로 구성이 되므로 이 부품들을 집합관계라고 볼 수 있다.
            
            - 사용관계
                - 객체 간의 상호작용을 말함. 다른 객체의 메서드를 호출하여 원하는 결과를 얻어내는 것을 말한다.

                        예시) 사람은 자동차를 사용하므로 사람과 자동차는 사용의 관계라고 볼 수 있다.
                            사람은 자동차를 사용할 때 달린다, 멈춘다 등의 메서드를 호출한다.
            
            - 상속관계
                - 상위(부모) 객체를 기반으로 하위(자식) 객체를 생성하는 관계를 말한다.
                
                - 일반적으로 상위객체는 종류를 의미하고 하위 객체는 구체적인 사물에 해당이 된다.
                
                        예시) 독수리는 새의 종류이다.  
                            새(상위) - 독수리(하위) 상속관계에 있다고 볼 수 있음.
    
- 객체지향 프로그래밍(OOP : Object Oriented Programming)
    - 만들고자 하는 완성품인 객체를 모델링하고, 집합관계에 있는 부품 객체와 사용 관계에 있는 객체를 하나씩 설계한 후 조립하는 방식으로 프로그램을 개발하는 기법이다.
 

### - 클래스(Class)?

- 현실에서 객체는 갑자기 만들어지는 것이 아니라, 설계도를 바탕으로 만들어진다.

	     예시) 사람들이 자동차를 이용하기 위해서는 공장에서 설계도를 보고 자동차를 만들어야 한다.
		       객체지향 프로그래밍도 동일하게 메모리에서 사용하고 싶은 객체가 있다면 우선 설계도로 해당하는 객체를 만드는 작업이 필요하다.
               ※ 자바에서는 클래스(class)가 설계도에 해당한다.

- 클래스는 객체를 만들기 위한 설계도(틀, 도면)이다.
- 자바는 클래스 단위로 프로그래밍 하며 클래스를 구성하는 것을 멤버(member)라고 한다.
		
		 멤버 = 속성(멤버변수) + 기능(멤버메서드)
		 ==> 속성 : 멤버변수 - 클래스의 특징 ==> 명사적 개념
		 ==> 기능 : 멤버메서드 - 클래스의 행위(동작) ==> 동사적 개념

#### - 클래스 구성 : 클래스 헤더, 멤버변수, 멤버메서드, 생성자

- 클래스 형식

        [접근제한] class 클래스이름{
                    멤버변수;
                    생성자();
                    멤버메서드();
        }
    
        - 클래스 이름 : 반드시 대문자로 시작(식별자)
        - 멤버변수는 초기값을 설정하지 않으면 JVM이 객체 생성 시점에 해당 데이터 타입(자료형)에 맞게 알아서 
        - 해당 자료형의 default 값을 설정
	
- 접근제한자 public > protected > (defalut) > private
	- 접근제한없음 > 같은패키지 + 자손(다른패키지) > 같은패키지 > 같은 클래스

	|     | 구분      | 클래스 | 패키지 | 자손클래스 | 전체 |
	| --- | --------- | ------ | ------ | ---------- | ---- |
	| +   | public    | O      | O      | O          | O    |
	| #   | protected | O      | O      | O          |      |
	| ~   | (default) | O      | O      |            |      |
	| -   | private   | O      |        |            |      |

#### - 예시
- 예시코드

        public class Ex01_Class {

            // 멤버변수 = 전역변수
            int num;    
            String str; 
            
            //멤버메서드
            void display() { 
                
                int su =10; // 지역변수
                System.out.println("멤버변수(num) >>> " + num);
                System.out.println("멤버변수(str) >>> " + str);
                System.out.println("지역변수(su) >>> " + su);
                
            }
            
            public static void main(String[] args) {	
            
                // 클래스를 대상으로 객체를 만드는 과정이 필요하다.
                // 클래스를 메모리에 올려야 객체가 된다.
                
                // 1단계 : 클래스 선언
                // 		  형식) 클래스이름 참조변수;
                //			   Ex01_Class ex;
                
                // 2단계 : 클래스를 메모리(Heap)에 생성
                //		  형식) 참조변수 = new 생성자=클래스이름과 동일함();
                //				ex    = new Ex01_Class();
                
                // 1단계와 2단계를 합쳐서 사용하기도 한다. (클래스 선언 및 메모리 생성)
                Ex01_Class ex = new Ex01_Class();
                
                System.out.println("ex의 주소값 : " + ex); 
                
                // 3단계 : 참조변수를 이용하여 객체에 접근
                //        객체에 접근시 .(도트) 연산자를 이용하여 접근한다.
                //        .(도트) 연산자로 멤버변수, 멤버메서드에 접근이 가능하다. (지역변수 접근 안됨)
                ex.display();
                
                System.out.println();
                ex.num = 100; // num 변수값 수정
                ex.str = "홍길동";
                ex.display();
                
                System.out.println();
                
                // ※새로운 객체 생성 (다른 힙 메모리 공간에 새로운 객체가 만들어짐)
                // 따라서 ex의 주소값과 ex1의 주소값은 상이하다
                Ex01_Class ex1 = new Ex01_Class();
                System.out.println("ex의 주소값 : " + ex1); //
                
                ex1.num = 235;
                ex1.str = "김태리";
                ex1.display();
            }

        }

- 결과

        ex의 주소값 : Class.Ex01_Class@7d6f77cc
        멤버변수(num) >>> 0
        멤버변수(str) >>> null
        지역변수(su) >>> 10

        멤버변수(num) >>> 100
        멤버변수(str) >>> 홍길동
        지역변수(su) >>> 10

        ex의 주소값 : Class.Ex01_Class@5aaa6d82
        멤버변수(num) >>> 235
        멤버변수(str) >>> 김태리
        지역변수(su) >>> 10

### - 클래스(Class) 와 객체(Object)
- 클래스 : 객체를 정의해 놓은 것(추상화)
- 객체 : 클래스에 의해 만들어진 결과물(실제화)
    - 객체를 인스턴스라고도 한다.
 		
        예시) 제품설계도(클래스) ==> 제품(객체)

- 인스턴스화 : 클래스를 이용하여 객체를 만들어 가는 과정
- 클래스(1) : 객체(N) 
    - 1개 클래스는 여러개의 객체를 만들 수 있다.

#### - 예시
- 예시 코드

        public class Ex02_TV {

            //멤버변수
            String color;	// tv 색상
            boolean power;	// tv 전원
            int channel;	// tv 채널
            
            //멤버메서드
            void power() {  	// tv 전원을 누르는 메서드
                power = !power; // power가 false 일때 true로 / true일때 false 로 변경 
            }
            
            void channelUp() {	// tv 채널 up 메서드
                if(power) { 	// power가 true일때 channel 업 
                    channel++;
                }
            }
            
            void channelDown() {	// tv 채널 down 메서드
                if(power) { 		// power가 true일때 channel 다운
                    channel--;
                }
            }
            
            void display() {	// tv 상태값 메서드
                String status = "";
                if(power) {
                    status = "전원 On";
                }else {
                    status = "전원 Off";
                }
                
                System.out.println("TV 색상 >>> " + color); //멤버변수는 파란색
                System.out.println("TV 전원 >>> " + status); //지역변수는 어두운 갈색
                System.out.println("TV 채널 >>> " + channel);
            }
            
            
            public static void main(String[] args) {

                Ex02_TV tv = new Ex02_TV();
                tv.display();
                
                System.out.println();
                
                tv.power();
                tv.color = "pink";
                tv.channelUp();
                tv.display();
                
                System.out.println();
                tv.power();
                tv.color = "black";
                tv.channelUp(); // power가 false 라 채널이 올라가지 않는다.
                tv.display();
                
            }

        }

- 결과

        TV 색상 >>> null
        TV 전원 >>> 전원 Off
        TV 채널 >>> 0

        TV 색상 >>> pink
        TV 전원 >>> 전원 On
        TV 채널 >>> 1

        TV 색상 >>> black
        TV 전원 >>> 전원 Off
        TV 채널 >>> 1

