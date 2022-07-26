# String class

        -java.lang.Object
		    -java.lang.String

## - String 클래스란?
- 문자열 객체를 처리하는 클래스
- 형식) 

        1. 일반 변수 선언방법
        String str1 = "aaa";
        
        2. new 키워드 사용(new 사용시 새로운 주소값 생성)
        String str2 = new String("aaa");
        
1. 일반변수 선언방법
    1. 변수에 값이 결합된다면 주소값이 변경된다.
    2. 다른변수이름이지만 값이 같다면 주소값은 같다.

2. new 키워드 사용
    1. 값이 같다고 해도 주소값이 다르다.

### - String 예시
- 코드

        public class Ex01 {

            public static void main(String[] args) {
                // 1) 일반 변수 선언방법으로 객체 생성
                // heap 메모리에 저장
                // 1-1) 변수에 값이 결합된다면 주소값이 바뀐다.(새로운주소값생성_새로운공간생성)
                String str0 = "java";
                String str2 = "program";
                
                System.out.println("str0 주소 >>> " + System.identityHashCode(str0)); // str0 주소 >>> 2104457164
                
                str0 = str0 + str2;
                System.out.println("str0 주소 >>> " + System.identityHashCode(str0)+"\n"); // str0 주소 >>> 1521118594
                
                // 1-2) 변수명은 다르지만 값이 같다면 주소값이 같다.
                String str1 = "java";
                String str3 = "java";
                
                if(str1==str3) {
                    System.out.println("str1 과 str3의 참조주소가 같다.");
                }else {
                    System.out.println("str1 과 str3의 참조주소가 다르다.");
                }
                
                // 주소값
                System.out.println("str1 주소 >>> " + System.identityHashCode(str1)); // str1 주소 >>> 2104457164
                System.out.println("str3 주소 >>> " + System.identityHashCode(str3) + "\n"); // str3 주소 >>> 2104457164
            
            
                // 2) new 키워드 사용 (new 사용시 객체가 새로 만들어짐)
                // 2-1) 값이 같다고 해도 new 키워드로 새로운 객체를 만들어 주소값은 서로 다르다.
                String str4 = new String("홍길동");
                String str5 = new String("홍길동");
                if(str4==str5) {
                    System.out.println("str4 과 str5의 참조주소가 같다.");
                }else {
                    System.out.println("str4 과 str5의 참조주소가 다르다.");
                }
                
                System.out.println("str4 주소 >>> " + System.identityHashCode(str4)); // str4 주소 >>> 1940030785
                System.out.println("str5 주소 >>> " + System.identityHashCode(str5)); // str5 주소 >>> 1869997857
            }
        }

- 결과

        str0 주소 >>> 2104457164
        str0 주소 >>> 1521118594

        str1 과 str3의 참조주소가 같다.
        str1 주소 >>> 2104457164
        str3 주소 >>> 2104457164

        str4 과 str5의 참조주소가 다르다.
        str4 주소 >>> 1940030785
        str5 주소 >>> 1869997857


## - String 클래스 주요 메서드
- 형태

        String str = "aaa";
        str.메서드명();

- 대소문자
    - toUpperCase() : 소문자 -> 대문자  
    - toLowerCase() : 대문자 -> 소문자

- lenght() : 문자열의 길이를 정수값으로 변경
- concat() : 문자열을 결합하는 메서드
- equalsIgnoreCase() : 대소문자 구분하지 않는 메서드
- charAt(index) : 글자에서 몇번째 글자 확인 

### - string 클래스 예시
- 코드

        public class Ex03 {

            public static void main(String[] args) {

                // 1. toUpperCase() : 소문자 -> 대문자  
                // 2. toLowerCase() : 대문자 -> 소문자
                String str = "java program";
                System.out.println(str.toUpperCase()); // JAVA PROGRAM
                System.out.println(str.toLowerCase() + "\n"); // java program
                
                // 3. lenght() : 문자열의 길이를 정수값으로 변경
                System.out.println(str.length()+ "\n");  // 12
                
                // 4. concat() : 문자열을 결합하는 메서드
                String str1 = "apple";
                String str2 = str1.concat(" pie");
                System.out.println(str2 + "\n"); // apple pie
                
                // 5. equalsIgnoreCase() : 대소문자 구분하지 않는 메서드
                String str3 = "apple";
                if(str1.equalsIgnoreCase(str3)) {
                    System.out.println("str1과 str3의 값은 같습니다 : true\n");
                }
            
                // 6. charAt(index) : 글자에서 몇번째 글자 확인 
                String juminNum = "123456-2345678";
                char gender = juminNum.charAt(7);
                
                if(gender == '1' || gender == '3') {
                    System.out.println("성별이 남자입니다.");
                }else if(gender == '2' || gender == '4') {
                    System.out.println("성별이 여자입니다.");
                }else {
                    System.out.println("외국인 입니다.");
                }
                System.out.println();
            }
        }

- 결과

        JAVA PROGRAM
        java program

        12

        apple pie

        str1과 str3의 값은 같습니다 : true

        성별이 여자입니다.

## - String 클래스 단점
- 빈번하게 문자열 연산을 실행할 경우 메모리(heap)를 많이 차지하게 된다.
- 매번 연산시마다 새로운 객체를 생성하게 된다. ==> 힙(heap) 영역의 과부하가 발생할 가능성이 많다.
- 이러한 단점을 개선한 클래스 : StringBuffer

참고1 : [StringBuffer]()
참고2 : [StringBuffer]()