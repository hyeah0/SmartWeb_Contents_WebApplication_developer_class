# Arrays class

        -java.lang.Object
	        -java.util.Arrays 

## - Arrays 클래스란?
- 배열
- 형식) 

        Arrays.메서드(참조변수명);

- Arrays.toString(배열1) 
  - 배열 한번에 보기

- Arrays.fill(배열1,"값") 
  - 배열의 요소를 특정한 값(데이터)로 채우는 메서드
  - Arrays.fill(배열 참조변수명, "특정값");

- Arrays.equals(배열1, 배열2) 
  - 두 객체의 내용(데이터)이 같은지 비교하는 
  - 반환타입 boolean

- Arrays.sort(배열1) 
  - 배열의 원소(데이터)를 정렬(오름차순)하는 메서드   

### - Arrays 예시
- 코드

                public class Ex04_Arrays {

                        public static void main(String[] args) {

                                String[] str = {"홍길동", "이순신", "유관순"};
                                // 단축for문
                                for(String k : str) {
                                        System.out.println("str 배열 요소 >>> " + k );
                                }
                                System.out.println();
                                
                                // 0. toString() 
                                System.out.println(Arrays.toString(str) + "\n");
                                
                                // 1. fill() 
                                Arrays.fill(str, "김유신");
                                System.out.println(Arrays.toString(str)+ "\n");
                                
                                // 2. equals(객체, 객체) 
                                String[] str2 = {"조유신", "김유신", "김유신"};
                                if(Arrays.equals(str, str2)) {
                                        System.out.println("str, str2 배열의 내용(데이터)는 같습니다.\n");
                                }else {
                                        System.out.println("str, str2 배열의 내용(데이터)는 같지않습니다.\n");
                                }
                                
                                // 3. sort() 
                                int[] arr = {54,67,13,97,41};
                                for(int k : arr) {
                                        System.out.print(k +"\t");
                                }
                                
                                System.out.println("\n------------오름차순 정렬");
                                Arrays.sort(arr);
                                System.out.println(Arrays.toString(arr));	
                        }
                }

- 결과

                str 배열 요소 >>> 홍길동
                str 배열 요소 >>> 이순신
                str 배열 요소 >>> 유관순

                [홍길동, 이순신, 유관순]

                [김유신, 김유신, 김유신]

                str, str2 배열의 내용(데이터)는 같지않습니다.

                54	67	13	97	41	
                ------------오름차순 정렬
                [13, 41, 54, 67, 97]

- 참고

- [단축 for문](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/1_Java/day4~5_%EB%B0%B0%EC%97%B4(Array).md)