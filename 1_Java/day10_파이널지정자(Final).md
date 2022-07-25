## day10_final지정자
### - final 지정자란?
- 클래스나 멤버변수, 멤버메서드에 적용해서 사용한다.
1. final 클래스 
    - 변경할 수 없는 클래스, 확장될 수 없는 클래스
    - final로 지정된 클래스는 다른 클래스의 조상 클래스(부모클래스)가 될 수 없다.

2. final 멤버변수 
    - 변수명 앞에 final 이라는 키워드가 붙으면 변경 불가능 하다. ==> 상수화
    - final 멤버변수일 경우 변수명을 대문자로 작성한다.

3. final 멤버메서드 
    - 변경될 수 없는 메서드
    - final로 선언된 메서드는 오버라이딩을 통해서 재정의 할 수 없다.


- 대표적인 final 클래스는 String 클래스와 Math 클래스가 있다.

### - final 예시

        class AA{
            // final 멤버변수
            final int SU = 235; //상수 => 값 변경 불가
            
            // final 멤버메서드
            final void output() {
                System.out.println("final output() 메서드 호출");
            }
        }

        class BB extends AA{
            // 상수로 값변경 안됨
            // SU = 125;

            // final 멤버메서드는 상속안된다.
            // 상속해서 사용하고 싶을 경우 조상메서드에서 final 제거
            // @Override
            // void output() {
            // 		System.out.println("");
            // }
        }

        // final 클래스는 조상클래스(부모클래스)가 될 수 없다
        // final class CC{	}
        // class DD extends CC{	}

        public class Ex01 {

            public static void main(String[] args) {

                BB bb = new BB();
                System.out.println(bb.SU);
                
            }

        }