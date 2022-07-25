## day10_접근제어자(Access)

### - 접근지정자(접근제어자)란?
- 접근지정자는 클래스, 멤버변수,멤버메서드 앞에 사용이 된다.
- 외부로 부터 접근을 제어한다는 의미를 가지고 있다.
- 접근 지정자가 사용될 수 있는 곳 : 클래스, 멤버변수, 멤버메서드, 생성자 
- 이를 접근지정자 중 protected, private 접근지정자는 클래스 앞에 사용을 못한다.
- 단, Inner Class 앞에는 사용이 가능하다.
  
### - 접근지정자(접근제어자) 종류
- 접근 범위(scope) : public > protected > default > private

1. private 
    - 동일 클래스에서만 접근 가능
    - 외부에서 인스턴스 변수를 바로 접근이 가능하게 제어를 하면 잘못된 데이터를 저장할 수 있는 문제가 발생한다.
    - 따라서 직접 접근을 제어하고 메서드(setter(),getter())를 사용하여 접근하게 한다.

2. default 
    - 동일한 패키지에서만 접근이 가능하다. (키워드는 생략가능)
    - 같은 클래스의 멤버, 같은 패키지 안의 다른 클래스의 멤버까지만 접근이 가능하다.
    - 다른 패키지의 상속 관계에 있는 클래스라도 접근 불가

3. protected 
    - 같은 클래스의 멤버, 같은 패키지 안의 다른 클래스의 멤버, 다른 패키지의 상속 관계에 있는 멤버까지 접근 가능하다.

4. public 
    - 모든 클래스에서 접근 가능하다.
    - 같은 클래스의 멤버, 같은 패키지 안의 다른 클래스의 멤버, 다른 패키지의 상속관계에 있는 멤버, 
    다른 패키지의 상속관계에 있는 멤버, 다른 클래스의 멤버까지 접근이 가능하다.

- 참고 - [접근제어자](https://github.com/hyeah0/Java/blob/main/%E1%84%8C%E1%85%A1%E1%84%87%E1%85%A1%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%85%E1%85%B5(%E1%84%80%E1%85%AE%E1%86%A8%E1%84%87%E1%85%B5%E1%84%89%E1%85%AE%E1%84%8B%E1%85%A5%E1%86%B8%E1%84%8C%E1%85%A5%E1%86%AB)/%EA%B0%9D%EC%B2%B4/6-2.%EC%A0%91%EA%B7%BC%EC%A0%9C%ED%95%9C%EC%9E%90.md)

### - 접근지정자(접근제어자) 예시
- 접근제어자 예시 클래스

        package accessOne;

        public class Super {
            // 멤버변수
            private int num1 = 10;		//접근지정자 : private : 같은 클래스에서만 사용가능
                    int num2 = 20;		//접근지정자 : default : 같은 클래스, 같은 패키지에서 사용가능
            protected int num3 = 30;	//접근지정자 : protected : 같은 클래스, 같은 패키지, 자손 클래스까지 사용가능
            public int num4 = 40;		//접근지정자 : public : 전체 사용가능
            
            // 멤버메서드
            public int getNum1() {
                return num1;
            }
            public void setNum1(int num1) {
                this.num1 = num1;
            }
        }
    
- 다른 패키지에서 Super 클래스 상속

        package accessTwo;

        import accessOne.Super;

        public class Sub extends Super{

            public static void main(String[] args) {

                Sub sub = new Sub();
                // private - 해당 클래스에서만 접근 가능
                System.out.println("  private num1 >>> 접근 불가");
                
                // default - 동일 패키지까지만 접근가능
                System.out.println("  default num2 >>> 접근 불가");
                
                // protected - 자손클래스까지 접근가능
                System.out.println("protected num3 >>> 접근 가능 >>> " + sub.num3);
                
                // public - 전체 접근가능
                System.out.println("   public num4 >>> 접근 가능 >>> " + sub.num4);
            }

        }

- 결과

        private num1 >>> 접근 불가
        default num2 >>> 접근 불가
        protected num3 >>> 접근 가능 >>> 30
        public num4 >>> 접근 가능 >>> 40