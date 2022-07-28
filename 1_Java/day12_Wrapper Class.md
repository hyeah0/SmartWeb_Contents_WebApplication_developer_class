## day12_Wrapper class
- wrap : 감싸다, 포장하다.
- 기본자료형을 클래스 타입으로 포장해 놓는 클래스
- 기본자료형을 객체로 저장하기 때문에 좀더 다양한 기능을 제공하기 위해 사용한다.
- 기본 타입의 값을 내부에 두고 포장하기 때문에 포장(wrapper)클래스를 라고 한다.

    | 기본자료형 | wrapper class |
    | ----- | -----|
    | byte | Byte |
    | short | Short|
    |long | Long|
    | float | Float|
    | double | Double|
    | char | Character |
    | int | Integer |

### - wrapper class 사용이유

1. 매개변수로 객체가 요구될 때
2. 기본형 값이 아니라 객체로 저장해야 할때
3. 객체간 비교가 필요할 때
4. 형변환이 자유롭다는 특징이 있다. (★★★) 
5. 제네릭

### - wrapper class _ 클래스 자료형
- 박싱(boxing)하다 
    - 기본형 자료형 -> 클래스 자료형으로 변경
    - 클래스 자료형 박스에 기본자료형을 안에 넣기 때문이다.
- 언박싱(unboxing)하다
    - 클래스자료형 -> 기본자료형

### - 숫자 -> 문자 / 문자 -> 숫자 
1. 숫자를 문자로 변경 방법
    1. toString() 메서드 사용
        > 참고 [toString](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/1_Java/0.%20%EC%A3%BC%EC%9A%94%ED%81%B4%EB%9E%98%EC%8A%A4/08_Object.md)
    2. String.valuOf(숫자)

2. 문자를 숫자로 변경 방법
    1. Integer.parseInt("숫자");
    2. Integer.valuOf("숫자");

> 참고 [valuOf/ parseInt](https://github.com/hyeah0/Java/blob/main/%EC%9E%90%EB%B0%94%EC%9D%98%20%EC%A0%95%EC%84%9D%20chapter/chapter9_java.lang/wrapper%20class%20%ED%83%80%EC%9E%85%EB%B3%80%ED%99%98/wrapper%20class_%20parse_valueOf.md)

### - wrapper class 예시

- 코드

        public class Ex01 {

            public static void main(String[] args) {

                // 기본자료형 : 단순연산을 위한 용도
                int su1 = 150, su2 =35;
                System.out.println("su1 + su2 = " + (su1 + su2) + "\n");
            
                // 클래스 자료형 
                // su1변수를 클래스화(객체화) 시킴 -> 형변환이 자유롭다.
                // int1 는 참조변수명
                Integer int1 = new Integer(su1);
                Integer int2 = new Integer(su2);
                String str = "12";
                
                System.out.println("int1 >>> " + int1);
                System.out.println("int2 >>> " + int2);
            
                // 형변환
                // 현 int1 는 Integer 자료형 -> double 형으로 형변환
                // 기본자료형에서 기본자료형으로 형변환시 데이터 누락의 가능성이 있지만, wrapper 클래스 이용시 데이터 누락의 경우가 없다.
                System.out.println("double 형으로 형변환 >>> " + int1.doubleValue());
            
                // 숫자 -> 문자열 변경 방법
                // 1. toString() 
                // 2. String.valueOf(숫자)
                System.out.println("String 형으로 형변환 >>> " + int1.toString());
                System.out.println("String 형으로 형변환 >>> " + (int1.toString() + 35) + "\n");
                
                System.out.println("숫자 -> 문자형(toString()) >>> " + int1.toString());
                System.out.println("숫자 -> 문자형(String.valueOf(숫자)) >>> " + String.valueOf(int1));
            
                // 문자열 -> 숫자형 변경 방법
                // 1. Integer.parseInt(문자열)
                System.out.println("문자열 -> 숫자형 >>> " + (Integer.parseInt("12")+2));
                System.out.println("문자열 -> 숫자형 >>> " + (Integer.parseInt(str)+2));
                System.out.println("문자열 -> 숫자형 >>> " + (Integer.valueOf(str)+2));
            }
        }

- 결과

        su1 + su2 = 185

        int1 >>> 150
        int2 >>> 35
        double 형으로 형변환 >>> 150.0
        String 형으로 형변환 >>> 150
        String 형으로 형변환 >>> 15035

        숫자 -> 문자형(toString()) >>> 150
        숫자 -> 문자형(String.valueOf(숫자)) >>> 150
        문자열 -> 숫자형 >>> 14
        문자열 -> 숫자형 >>> 14
        문자열 -> 숫자형 >>> 14
