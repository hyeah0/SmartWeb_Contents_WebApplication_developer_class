### 1. 문제
> 1~100까지의 홀수합 , 짝수합을 구하세요(continue를 사용)

### 2. 코드

        public class Ex34 {

            public static void main(String[] args) {
                
                //continue를 이용한 홀수의 합
                int oddSum= 0;
                for(int i=1; i<=100; i++) {
                    if((i%2)==0) { //짝수일경우 실행 x
                        continue;
                    }
                    oddSum += i;
                }
                System.out.println("홀수의 합 >>> " + oddSum);
                
                //continue를 이용한 짝수의 합
                int evenSum = 0;
                for(int i=1; i<=100; i++) {
                    if((i%2)==1) { //홀수일경우 실행 x
                        continue;
                    }
                    evenSum += i;
                }
                System.out.println("짝수의 합 >>> " + evenSum);

            }

        }

### 3. 결과

        홀수의 합 >>> 2500
        짝수의 합 >>> 2550