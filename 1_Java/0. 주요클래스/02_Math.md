# Math class

        - java.lang.Object
	        - java.lang.Math  

## - Math 클래스란?
- 수학과 관련된 메서드를 제공해주는 클래스
- 형식) 

        Math.메서드명();
        
### - Math 예시
- 코드

        public class Ex02_Math {

            public static void main(String[] args) {

                // 최대값, 최소값 
                // 1. max(변수명, 변수명) : 두수를 비교해서 최대값 구해주는 메서드
                // 2. min(변수명, 변수명) : 두수를 비교해서 최소값 구해주는 메서드 
                
                int num1 = 78, num2 = 91;
                System.out.println("max() 최대값 >>> " + Math.max(num1, num2));
                System.out.println("min() 최소값 >>> " + Math.min(num1, num2) + "\n");
                
                // 반올림, 올림
                // round() : 반올림적용
                // ceil() : 무조건 올림
                double dou = 125.4124;
                System.out.println("round() 반올림 적용 전 : " + dou );
                System.out.println("round() 반올림 적용 후 : " + Math.round(dou));
                System.out.println("ceil() 올림 적용 후 : " + (int)(Math.ceil(dou)) + "\n");
                
                // 절대값
                // abs() : 절대값 (음수도 양수로 변경)
                System.out.println("abs() 절대값 변경 전 : " + (-124.34));
                System.out.println("abs() 절대값 변경 전 : " + Math.abs(-124.34)+ "\n");
                
            }

        }

- 결과

        max() 최대값 >>> 91
        min() 최소값 >>> 78

        round() 반올림 적용 전 : 125.4124
        round() 반올림 적용 후 : 125
        ceil() 올림 적용 후 : 126

        abs() 절대값 변경 전 : -124.34
        abs() 절대값 변경 전 : 124.34
