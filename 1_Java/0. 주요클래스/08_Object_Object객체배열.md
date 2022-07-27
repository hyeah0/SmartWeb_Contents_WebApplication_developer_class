# Object 객체배열   
- 기본자료형 또는 String 객체 배열 생성시 해당 자료형만 배열값으로 들어가야한다.
- Object 배열은 자료형 전체 다 사용이 가능하다.

## - Object 객체배열 예시

- 코드

        public class Ex03_ObjectArr {

            public static void main(String[] args) {
                // String 배열 객체 생성
                // String 배열로 String 이 아닌 값은 에러 발생
                String[] strArr = new String[4];
                strArr[0] = "홍길동";
                strArr[1] = "hong";
                strArr[2] = "서울시 중구 남대문로";
                strArr[3] = "010-1111-1234"; 
                
                for(String s : strArr) {
                    System.out.println("str 배열 요소 >>> " + s);
                }
                
                System.out.println();
                
                // Object 배열 객체 생성
                // Object 배열은 자료형 전체값 적용 가능하다.
                Object[] obj = new Object[5];
                obj[0] = "홍길동";	// String
                obj[1] = 180;		// int
                obj[2] = 1.45;		// double
                obj[3] = true;		// boolean
                obj[4] = 'c';		// char
                
                for(Object o : obj) {
                    System.out.println("obj 배열 요소 >>> " + o);
                }	
            }
        }

- 결과

        str 배열 요소 >>> 홍길동
        str 배열 요소 >>> hong
        str 배열 요소 >>> 서울시 중구 남대문로
        str 배열 요소 >>> 010-1111-1234

        obj 배열 요소 >>> 홍길동
        obj 배열 요소 >>> 180
        obj 배열 요소 >>> 1.45
        obj 배열 요소 >>> true
        obj 배열 요소 >>> c

