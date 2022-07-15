### 1. 문제
> for 문을 이용하여 1부터 100까지의 홀수의 합과 짝수의 누적 합을 구하세요

> odd : 홀수
>
> even : 짝수

### 2. 코드

        public class Ex27 {

            public static void main(String[] args) {
                
                //전역변수 
                int oddSum = 0; //홀수
                int evenSum = 0; //짝수
                
                for(int i=1; i<=100; i++) {
                    //지역변수 : 블럭안에서의 변수, for 블럭이 종료되면 사라진다.
                    if((i%2) == 1) {
                        oddSum += i;
                    }else {
                        evenSum += i;
                    }	
                }
                
                System.out.println("1부터 100까지");
                System.out.println("홀수 합 : " + oddSum);
                System.out.println("짝수 합 : " + evenSum);

            }

        }

### 3. 결과

        1부터 100까지
        홀수 합 : 2500
        짝수 합 : 2550