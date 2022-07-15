### 1. 문제
> 1~99 사이 숫자중 랜덤수를 받아 입력한 값이 정답인지 up down 게임을 만들어 보세요

### 2. 코드

        public class Ex25_upDownGame {

            public static void main(String[] args) {

                Scanner sc = new Scanner(System.in);
                
                System.out.println(" *** UP/DOWN Game! *** ");
                
                int ran = (int) (Math.random()*99) + 1;
                System.out.println("정답 : " + ran);
                System.out.println(":::::::::::::::::::::::::::::");
                
                System.out.println("1~99 사이 숫자중에서 하나의 숫자를 맞춰 주세요!");
                
                int input = 0; // 입력한 숫자
                int count = 0; // 몇 번만에 숫자를 맞추는지 
                
                while(input != ran) { //랜덤 값과 작성값이 같으면 while 문 종료
                    
                    System.out.print("숫자를 입력해 주세요 >> ");
                    input = sc.nextInt(); // 입력한 숫자
                    
                    // 유효성검사
                    if(input<0 || input>99) {
                        System.out.println("1~99 사이의 숫자를 입력해 주세요!");
                        continue;
			        }

                    if(input > ran) {
                        System.out.println("-----down-----");
                    }else if(input < ran) {
                        System.out.println("-----up-----");
                    }
            
                    count++;

                }
                
                System.out.println(":::::::::::::::::::::::::::::");
                System.out.println("-----정답입니다!-----");
                System.out.println("정답 : " + ran);
                System.out.println("정답 소요 횟수 : " + count);

                sc.close();   
            }

        }

### 3. 결과

         *** UP/DOWN Game! *** 
        정답 : 41
        :::::::::::::::::::::::::::::
        1~99 사이 숫자중에서 하나의 숫자를 맞춰 주세요!
        숫자를 입력해 주세요 >> -1
        1~99 사이의 숫자를 입력해 주세요!
        숫자를 입력해 주세요 >> 103
        1~99 사이의 숫자를 입력해 주세요!
        숫자를 입력해 주세요 >> 44
        -----down-----
        숫자를 입력해 주세요 >> 25
        -----up-----
        숫자를 입력해 주세요 >> 32
        -----up-----
        숫자를 입력해 주세요 >> 41
        :::::::::::::::::::::::::::::
        -----정답입니다!-----
        정답 : 41
        정답 소요 횟수 : 4