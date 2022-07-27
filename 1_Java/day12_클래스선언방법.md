## 클래스 선언 방법
1. 일반적인 선언
    - 하나의 java 파일에 class 키워드 작성
2. 무명클래스(anonymous class) 선언
    - 이름이 없는 클래스 선언
    - interface는 객체생성이 안되지만, 무명클래스를 이용하면 가능하다.
3. 중첩(inner class) 선언
    - 클래스 안에 또 다른 클래스 선언

### - 중첩클래스(Inner Class)
1. 클래스 내부에 또 다른 클래스 선언.
    - 두 클래스가 서로 긴밀한 관계로 연결되어 있는 경우 사용
    - 두 클래스 멤버간에 쉽게 접근할 수 있는 장점이 있다.
2. 내부클래스를 하나의 멤버로 사용할 수 있다.
3. 클래스 멤버 : 멤버변수, 멤버메서드, 외부클래스, 내부클래스
4. 내부 클래스 객체 생성 방법
   - ※ 외부클래스 객체 먼저 생성이 되어야 한다.

    -  형식) 

            외부클래스명.내부클래스명 참조변수 = 외부클래스참조변수.new 내부클래스();

#### - 내부클래스의 특징
- 내부 클래스는 외부 클래스의 멤버를 마치 자기 자신처럼 사용이 가능하다.
 - 데이터 값을 변경시킬 수도 있다.
 - 외부 클래스의 멤버의 접근지정자가 private 접근지정자 라도 접근이 가능하다.
 - final 변수는 접근이 안된다.
- 내부클래스의 접근은 반드시 외부클래스를 통하여 접근해야한다.

### - 클래스 선언 방법별 예시
#### - 1. 일반적선언, 무명클래스 선언 예시

- 인터페이스 

        public interface Inter {
            
            // 추상메서드(상속받은 곳에서 return 값 필수)
            int sum(int n1, int n2);
            int minus(int n1, int n2);

        }

- 인터페이스 상속받은 클래스

        public class Sub implements Inter{

            @Override
            public int sum(int n1, int n2) {
                return n1 + n2;
            }

            @Override
            public int minus(int n1, int n2) {
                return n1 - n2;
            }
        }

- 클래스 객체 선언

        public class Ex01_Inter {

            public static void main(String[] args) {

                // 1. 일반적인 선언
                Sub sub = new Sub();
                System.out.println(sub.sum(1, 3));
                System.out.println(sub.minus(1, 3));
                
                // 2. 무명클래스 선언
                // inter interface 사용 
                Inter inter = new Inter() {
                    
                    @Override
                    public int sum(int n1, int n2) {
                        return n1 + n2;
                    }
                    
                    @Override
                    public int minus(int n1, int n2) {
                        return n1 - n2;
                    }
                };
                
                System.out.println(inter.sum(1, 3));
                System.out.println(inter.minus(1, 3));
            }

        }

- 결과

        4
        -2
        4
        -2

#### - 2. 중첩클래스
- 코드

        // 외부클래스
        class Outer{ 
            final int SU = 100;
            int su1 = 50;
            private int su2 = 33;
            
            
            public int getSu2() {
                return su2;
            }

            public void setSu2(int su2) {
                this.su2 = su2;
            }

            // 내부클래스
            class Inner{ 
                
                void output() {
                    // SU = 130; // final 변수는 내부클래스에서 접근이 안된다.
                    su1 = 137; //외부클래스의 멤버변수는 내부클래스에 있는 메서드에서 접근이 가능하다.
                    su2 = 150;
                    System.out.println("su1 >>> " + su1);
                    System.out.println("su2 >>> " + su2);
                }
            }
        }

- 결과

        su1 >>> 137
        su2 >>> 150
        외부클래스 su1 >>> 137
        외부클래스 su2 >>> 150