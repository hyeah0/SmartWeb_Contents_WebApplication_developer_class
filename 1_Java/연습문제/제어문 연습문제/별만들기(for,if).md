### 1. 문제
1. 네모
2. 직삼각형 & 반대로
3. 역 직삼각형 & 반대로
4. 피라미드 & 역피라미드
5. 마름모

### 2. 결과

- 네모
    - ooooo
    - ooooo
    - ooooo
    - ooooo

- 직삼각형
    - o
    - oo
    - ooo
    - oooo
    - ooooo

- 직삼각형 반대로
    -      o
    -     oo
    -    ooo
    -   oooo
    -  ooooo

- 역 직삼각형
    - ooooo
    - oooo
    - ooo
    - oo
    - o

- 역 직삼각형 반대로
    - ooooo
    -  oooo
    -   ooo
    -    oo
    -     o

- 피라미드
- ----o
- ---ooo
- --ooooo
- -ooooooo
- ooooooooo

### 3. 코드

        public class Ex31_madeStar {

            public static void main(String[] args) {

                System.out.println("*****별찍기*****");
                
                System.out.println();
                System.out.println("네모");
                for(int row=1; row<=4; row++) {
                    for(int star=1; star<=5; star++) {
                        System.out.print("o");
                    }
                    System.out.println();
                }
                
                System.out.println();
                System.out.println("직삼각형");
                for(int row=1; row<=5; row++) {
                    for(int star=1; star<=row; star++) {
                        System.out.print("o");
                    }
                    
                    System.out.println();
                }
                
                System.out.println();
                System.out.println("직삼각형 반대로");
                for(int row=0; row<5; row++) {
                    for(int star=5; star>=0; star--) {
                        
                        if(row<star) {
                            System.out.print(" ");
                        }else {
                            System.out.print("o");
                        }
                        
                    }
                    System.out.println();
                }
                
                System.out.println();
                System.out.println("역직삼각형");
                for(int row=5; row>=1; row--) {
                    for(int star=1; star<=row; star++) {
                        System.out.print("o");
                    }
                    System.out.println();
                }
                
                System.out.println();
                System.out.println("역직삼각형 반대로");
                for(int row=1; row<=5; row++) {
                    for(int star=1; star<=5; star++) {
                        
                        if(star<row) {
                            System.out.print(" ");
                        }else {
                            System.out.print("o");
                        }
                        
                    }
                    System.out.println();
                }
                
                System.out.println();
                System.out.println("피라미드");
                
                for(int row=0; row<5; row++) {
                    for(int star=4; star>row; star--) {
                        System.out.print("-");
                    }
                    for(int star=1; star<=(row*2)+1; star++) {
                        System.out.print("o");
                    }
                    System.out.println();
                }
                
            }

        }


### 4. 참고