## day8_객체(class&method)_클래스_변수

### 자바에서 사용되는 용어들_변수
1. 변수 : 프로그램이 끝날 때까지 언제든지 변할 수 있는 속성(데이터)
		
    ==> 소문자로 시작 

2. 상수 : 프로그램이 끝날 때까지 절대 변하지 않는 속성(데이터)
	
    ==> 모든 글자가 대문자

3. instance(인스턴스) 변수 / 메서드
	- 객체의 생성과 동시에 만들어 지는 변수 / 메서드
	- 객체는 heap 메모리 공간에 만들어진다
	- 반드시 객체 생성 후에 사용이 가능하다
	- 호출 방법
        
            참조변수.멤버변수 / 참조변수.멤버메서드 (참조변수 = 주소값)

4. static(스태틱, 정적) 변수 / 메서드 
	- 객체의 생성과 상관없이 별도로 만들어지는 변수 / 메서드
	- static 메모리(method 영역)에서 별도로 만들어진다
	- 공통으로 사용되는 변수/ 메서드
    - 공용 데이터 아니면 객체 생성해서 사용하는 것을 권한다.
	- 객체를 생성하지 않아도 어느 클래스나 접근 가능
	- 접근하는 방법이 쉬우나 실제로 항상 메모리에 상주하게 되어 메모리 회수가 안되는 단점이 있다.
    - 시스템이 며칠, 몇주 혹은 몇달 정도 가동이 되면 점점 느려지는 현상 발생
    - 호출방법 
    
            클래스이름.멤버변수 / 클래스이름.멤버메서드

#### 참고 링크 : [변수](https://github.com/hyeah0/Java/blob/main/%E1%84%8C%E1%85%A1%E1%84%87%E1%85%A1%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%85%E1%85%B5(%E1%84%80%E1%85%AE%E1%86%A8%E1%84%87%E1%85%B5%E1%84%89%E1%85%AE%E1%84%8B%E1%85%A5%E1%86%B8%E1%84%8C%E1%85%A5%E1%86%AB)/%EA%B0%9D%EC%B2%B4/8.%EB%B3%80%EC%88%98.md)
#### 참고 링크 : [메서드예약어](https://github.com/hyeah0/Java/blob/main/%E1%84%8C%E1%85%A1%E1%84%87%E1%85%A1%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%85%E1%85%B5(%E1%84%80%E1%85%AE%E1%86%A8%E1%84%87%E1%85%B5%E1%84%89%E1%85%AE%E1%84%8B%E1%85%A5%E1%86%B8%E1%84%8C%E1%85%A5%E1%86%AB)/%EA%B0%9D%EC%B2%B4/6-1.%EB%A9%94%EC%86%8C%EB%93%9C.md#%EB%A9%94%EC%84%9C%EB%93%9C-%EC%98%88%EC%95%BD%EC%96%B4)

#### 예시
- 클래스 코드

        public class Static {
            // 멤버변수
            int insV1 = 200;		//인스턴스 변수
            int insV2 = 100;		//인스턴스 변수
            static int staV1 = 500; //static(정적) 변수
            
            //멤버메서드
            void sumIns() { //인스턴스 메서드
                System.out.println("sum >>> " + (insV1+insV2));
            }
            
            static int adder(int n1, int n2) { //static(정적) 메서드
                return n1 + n2;
            }
        }

- 클래스 호출 코드

        public class Ex07_Static {

            public static void main(String[] args) {
                
                // 객체를 생성 안해도 static 변수나, static 메서드 사용가능
                // 스태틱 호출방법 : 클래스이름.멤버변수 / 클래스이름.멤버메서드
                System.out.println("static num >>> " + Static.staV1);
                
                System.out.println("static adder() 메서드 호출 >>> " + Static.adder(150, 36));
            
                // 객체생성
                // 인스턴스 호출방법 : 참조변수.멤버변수 / 참조변수.멤버메서드
                Static static1 = new Static();
                System.out.println("인스턴스 insV1 >>> "+static1.insV1);
                System.out.println("인스턴스 insV2 >>> "+static1.insV2);
                static1.sumIns();
            }

        }

- 결과

        static num >>> 500
        static adder() 메서드 호출 >>> 186
        인스턴스 insV1 >>> 200
        인스턴스 insV2 >>> 100
        sum >>> 300