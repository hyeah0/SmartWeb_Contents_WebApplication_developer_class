## day12_제네릭(Generic)

### - 제네릭이란?

- 포괄적인, 총괄적인
- 특정한 클래스에 원하는 객체 타입을 지정하여 지정된 객체만 저장하게 하는 자바 문법
- 다양한 타입의 객체들을 다루는 메서드나 다음에 학습할 컬렉션에서 컴파일할 때 타입을 확인해 주는 기능
  - 즉, 다루어질 객체의 타입을 미리 명시해 줌을로써, 번거로운 형변환 작업을 줄여 준다는 장점이 있다.
  - 또한 객체의 타입을 컴파일 시에 체크하여 주기 때문에 객체의 타입 안정성을 높여주는 장점이 있다.
- 여기서의 타입의 안정성을 높여준다는 것은 의도하지 않은 타입의 객체가 저장되는 것을 막고
  , 저장된 객체를 꺼냈을 때 원래의 타입과 다른 타입으로 잘못 형변환되어 발생할 수 있는 오류를 줄여준다는 것이다.
- jdk 1.5 버전부터 추가된 기능
  - 클래스 내부에서 사용할 데이터를 외부에서 지정하는 방법
  - 데이터의 명확성과 안정성을 보장해 준다.
  - 다른 데이터 타입의 데이터가 들어올 경우 컴파일 시점에서 error 발생
  - 자료형이 자유롭게 저장되는 object 타입에는 지네릭클래스가 도입
    - 예시> ArrayList 자료형이 자유롭게 저장되는 object 
        
          - 기존 : ArrayList list = new ArrayList();
          - 변경 : ArrayList<Object> list = new ArrayList<Object>()  
          ※ 기존방식으로도 코드 작성이 가능하나 변경된 방법으로 작성 권장

- ArrayList 참고 [ArrayList](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/1_Java/day13_%EC%BB%AC%EB%A0%89%EC%85%98(Collection)_1_List_1_ArrayList.md) 

### - 제네릭 적용 전 예시

- 만약 String 배열, 변수 또는 기본자료형 배열, 변수 생성을 원할경우 각자료형에 맞게 하나씩 코드를 작성해야한다. (상세 예시 참고)

- 코드

        class StringType{

            String[] str;
            String var;

            void setStr(String[] str) {
                this.str = str;
            }

            void setVar(String var) {
                this.var = var;
            }

            void output() {
                for(String s : str) {
                    System.out.println("str 배열요소 >>> " + s);
                }

                System.out.println("var >>> " + var +"\n");
            }
        }

        class IntegerType{

            Integer[] iarr;
            Integer ivar;

            void setStr(Integer[] iarr) {
                this.iarr = iarr;
            }

            void setVar(Integer ivar) {
                this.ivar = ivar;
            }

            void output() {
                for(Integer i : iarr) {
                    System.out.println("iarr 배열요소 >>> " + i);
                }

                System.out.println("ivar >>> " + ivar +"\n");
            }
        }

        public class Ex02 {
            public static void main(String[] args) {
                // StringType 클래스 객체생성
                StringType stringType = new StringType();
                String[] str = {"홍","김","조"};
                String var = "김연아";

                stringType.setStr(str);
                stringType.setVar(var);
                stringType.output();

                IntegerType it = new IntegerType();
                Integer[] ir = {10,20,30,40,50};
                Integer iv = 500;

                it.setStr(ir);
                it.setVar(iv);
                it.output();

            }
        }

- 결과

        str 배열요소 >>> 홍
        str 배열요소 >>> 김
        str 배열요소 >>> 조
        var >>> 김연아

        iarr 배열요소 >>> 10
        iarr 배열요소 >>> 20
        iarr 배열요소 >>> 30
        iarr 배열요소 >>> 40
        iarr 배열요소 >>> 50
        ivar >>> 500

### - 제네릭 예시

#### - 제네릭 클래스

- 형식

        class Box<T>

        Box<T> : 제네릭 클래스(t의 박스, t box 라 읽는다.)
        T : 타입변수 또는 매개변수
        Box : 원시타입

- 상단의 예시 코드를 제네릭을 클래스를 사용해서 코드작성

- 코드

        class Generic<T>{
            T[] arr;
            T var;

            void setArr(T[] arr) {
                this.arr = arr;
            }

            void setVar(T var) {
                this.var = var;
            }

            void output() {
                for(T k : arr) {
                    System.out.println("arr 배열 >>> " + k);
                }

                System.out.println("var >>> " + var);
            }
        }

        public class Ex03 {

            public static void main(String[] args) {

                //String 타입의 클래스 객체 생성원할경우
                Generic<String> gs = new Generic<String>();
                String[] str = {"배","홍","동"};
                String var = "김연아";

                gs.setArr(str);
                gs.setVar(var);
                gs.output();

                //Integer 타입의 클래스 객체 생성 원할경우
                Generic<Integer> gi = new Generic<Integer>();
                Integer[] ir = {10,20,30,40,50};
                Integer iv = 500;

                gi.setArr(ir);
                gi.setVar(iv);
                gi.output();
            }
        }

- 결과

        arr 배열 >>> 배
        arr 배열 >>> 홍
        arr 배열 >>> 동
        var >>> 김연아
        arr 배열 >>> 10
        arr 배열 >>> 20
        arr 배열 >>> 30
        arr 배열 >>> 40
        arr 배열 >>> 50
        var >>> 500
