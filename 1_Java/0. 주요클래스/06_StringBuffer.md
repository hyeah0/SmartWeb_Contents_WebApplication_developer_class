# StringBuffer class

        - java.lang.Object
            - java.util.Random  

## - StringBuffer 클래스란?
- String 클래스의 메모리를 많이 차지하는 단점을 개선한 클래스

- 형식) 

        StringBuffer 참조변수명 = new StringBuffer("텍스트");
        StringBuffer sb = new StringBuffer("java");

- String 클래스 : [String](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/1_Java/0.%20%EC%A3%BC%EC%9A%94%ED%81%B4%EB%9E%98%EC%8A%A4/05_String.md)
- StringBuffer 클래스 : [StringBuffer](https://github.com/hyeah0/Java/blob/main/%EC%9E%90%EB%B0%94%EC%9D%98%20%EC%A0%95%EC%84%9D%20chapter/chapter9_java.lang/stringBuffer%20class/2.stringBuffer%ED%81%B4%EB%9E%98%EC%8A%A4%EC%9D%98%EC%83%9D%EC%84%B1%EC%9E%90%EC%99%80%EB%A9%94%EC%84%9C%EB%93%9C.md)

## - StringBuffer 메서드
- 형식 

        StringBuffer 참조변수명 = new StringBuffer("텍스트");
        sb.메서드명();
        
        StringBuffer sb = new StringBuffer("java");
        sb.append("program");

1. append() : 문자열 추가
   - append("추가할 문자열")

2. replace() : 문자열 추가 
   - replace(시작 index, 끝(-1) index, 교체할 데이터)

3. substring() : 문자열을 추출
   - 1. substring(시작인덱스) 
        - 시작인덱스부터 문자열 끝까지
   - 2. substring(시작인덱스, 종료인덱스) 
        - 시작인덱스부터 종료인덱스 -1 까지
        - 시작인덱스 <= x < 종료인덱스

4. delete() : 문자열 삭제

### - StringBuffer 메서드 예시
- 코드

                public class Ex04 {

                        public static void main(String[] args) {

                                StringBuffer sb = new StringBuffer("java");
                                System.out.println("sb >>> " + sb);
                                
                                // 1. append() : 문자열 추가
                                sb.append(" program");
                                System.out.println("문자열 추가후 >>> " + sb);
                                
                                // 2. replace() : 문자열 추가
                                //    replace(시작 index, 끝(-1) index, 교체할 데이터); 
                                sb.replace(0, 4, "apple"); // 0<= x <4
                                System.out.println("인덱스 0~3까지 문자 apple로 수정 >>> " + sb);;
                                
                                // 3. substring : 문자열을 추출하는 메서드
                                //	형식1) substring(시작인덱스) _ 시작인덱스부터 끝까지
                                // 	형식2) substring(시작인덱스,종료인덱스) _ 시작인덱스 <=   < 종료인덱스 까지
                                StringBuffer sb2 = new StringBuffer("2022/07/26 16:31");
                                System.out.println("오늘날짜 >>> " + sb2.substring(0,10));
                                
                                // delete() : 문자 삭제
                                
                        }

                }

- 결과

                sb >>> java
                문자열 추가후 >>> java program
                인덱스 0~3까지 문자 apple로 수정 >>> apple program
                오늘날짜 >>> 2022/07/26

