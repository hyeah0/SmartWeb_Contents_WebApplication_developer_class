# Random class

        - java.lang.Object
            - java.util.Random  

## - Random 클래스란?
- 지정된 범위 내에서 임의의 난수를 발생시키는 클래스
- 활동 분야 : 게임, 확률
- 형식) 

        Random random = new Random();
        random.nextInt(가장 큰수) + 시작수
        
### - Random 예시
- 코드

        public class Ex01_Random {

            public static void main(String[] args) {
                
                Random random = new Random();
                int su =0;
                
                // 중복값 포함됨
                for(int i=0; i<6; i++){
                    su = random.nextInt(45) + 1;
                    System.out.print( su+"\t");
                }
                
                System.out.println("\n");
                
                // 중복값이 포함되지 않는 로또 배열 ** 수정 필요
                int[] lotto = new int[6];
                for(int i=0; i<lotto.length; i++) {
                    lotto[i] = random.nextInt(45) + 1;
                    if(i>0) {
                        for(int j=0; j<lotto.length; j++) {
                            if(lotto[i] == lotto[j]) { //중복인 경우
                                lotto[i] = random.nextInt(45)+1;
                                j = -1;
                                break;
                            }
                        }
                    }
                    System.out.print(lotto[i] + "\t");
                }
            }
        }


- 결과

        45	45	20	38	21	31	

        24	12	28	23	11	3	

