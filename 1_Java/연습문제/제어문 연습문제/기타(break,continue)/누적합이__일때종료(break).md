### 1. 문제
> 1~100 까지의 합을 구하는데 합이 200이 되는 순간까지만 합을 구하여 화면에 출력해보세요

### 2. 코드

        public class Ex33 {

            public static void main(String[] args) {

                int sum = 0 ;
                int i;
                for(i=1; i<=100; i++) {
                    sum+=i;
                    if(sum>=200) {
                        break;
                    }
                }
                
                System.out.println("1부터 " + i + "까지 누적합 : " + sum );
            }

        }


### 3. 결과

        1부터 20까지 누적합 : 210

