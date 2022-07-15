### 1. 문제
> 1부터 100사이 정수 중 키보드로 5개의 정수를 입력 받아, 
>
> 5개의 정수 중에서 최대값을 화면에 출력해 보세요.


### 2. 코드

        public class Ex24 {

            public static void main(String[] args) {

                Scanner sc = new Scanner(System.in);
                int count = 1;
                int num = 0; //키보드로 입력받을 변수
                int max = 0; //최대값들어갈 변수
                
                while(count <= 5) {
                    System.out.print(count +" 번째 정수 입력 >>> ");
                    
                    num = sc.nextInt();
                    
                    //유효성검사
                    if(num>100) {
                        System.out.println("입력받은 수가 100을 초과했습니다.");
                        continue;
                    }
                    
                    if(num > max) {
                        max = num;
                    }
                    
                    count++;
                }
                
                System.out.println("입력 받은 값의 최대값 : " + max  );
                
                sc.close();
                
            }

        }

### 3. 결과

        1 번째 정수 입력 >>> 55
        2 번째 정수 입력 >>> 89
        3 번째 정수 입력 >>> 45
        4 번째 정수 입력 >>> 12
        5 번째 정수 입력 >>> 88
        입력 받은 값의 최대값 : 89