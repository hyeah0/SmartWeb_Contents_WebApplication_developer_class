### 1. 문제
> while 문을 이용하여 1부터 입력받은 값 까지의 홀수의 합과 짝수의 누적 합을 구하세요

> even : 짝수
>
> odd : 홀수

### 2. 코드

        import java.util.Scanner;
        public class Ex22 {

            public static void main(String[] args) {

                System.out.println("입력받은 범위에서 홀수의 합과 짝수의 합을 구하세요");
                
                Scanner sc = new Scanner(System.in);
                System.out.print("범위 1부터 ~ 범위의 끝을 입력해주세요 >>>  ");
                int endNum = sc.nextInt();
                
                int num = 1;
                int oddSum = 0; //홀수
                int evenSum = 0; //짝수
                
                
                while(num<=endNum) {
                    if((num%2) == 1) {
                        oddSum += num;
                    }else {
                        evenSum += num;
                    }
                    num++;
                }
                
                System.out.println();
                System.out.println("1부터 ~ " + endNum + "까지의");
                System.out.println("홀수의 합은 : " + oddSum);
                System.out.println("짝수의 합은 : " + evenSum);
            }

            sc.close();
        }