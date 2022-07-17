### 1. 문제
1. 네모
2. 직삼각형
3. 직삼각형 상하 반대
4. 직삼각형 좌우 반대
5. 직삼각형 상하좌우 반대
6. 피라미드 & 역피라미드
7. 마름모

### 2. 결과

        네모 만들기
        ooooo
        ooooo
        ooooo
        ooooo
        ooooo

        직삼각형 만들기
        o
        oo
        ooo
        oooo
        ooooo

        직삼각형 상하 반대 만들기
        ooooo
        oooo-
        ooo--
        oo---
        o----

        직삼각형 좌우 반대 만들기
        -----o
        ----oo
        ---ooo
        --oooo
        -ooooo

        직삼각형 상하좌우 반대 만들기
        -ooooo
        --oooo
        ---ooo
        ----oo
        -----o

        피라미드 만들기
        -----o
        ----ooo
        ---ooooo
        --ooooooo
        -ooooooooo

        역 피라미드 만들기
        -ooooooooo
        --ooooooo
        ---ooooo
        ----ooo
        -----o

        마름모 만들기
        ----o
        ---ooo
        --ooooo
        -ooooooo
        ooooooooo
        -ooooooo
        --ooooo
        ---ooo
        ----o



### 3. 코드

            public class Star {

            public static void main(String[] args) {
                int row=5;

                System.out.println("네모 만들기");
                for(int i=0; i<row; i++) {
                    for(int j=0; j<row; j++) {
                        System.out.print("o");
                    }
                    System.out.println();
                }
                System.out.println();

                System.out.println("직삼각형 만들기");
                for(int i=0; i<row; i++) {
                    for(int j=0; j<=i; j++) {
                        System.out.print("o");
                    }
                    System.out.println();
                }
                System.out.println();

                System.out.println("직삼각형 상하 반대 만들기");
                for(int i=0; i<row; i++) {
                    for(int j=row; j>0; j--) {
                        if(j<=i) {
                            System.out.print("-");
                        }else {
                            System.out.print("o");
                        }

                    }
                    System.out.println();
                }
                System.out.println();


                System.out.println("직삼각형 좌우 반대 만들기");
                for(int i=0; i<row; i++) {
                    for(int j=row; j>=0; j--) {
                        if(j>i) {
                            System.out.print("-");
                        }else {
                            System.out.print("o");
                        }

                    }
                    System.out.println();
                }
                System.out.println();

                System.out.println("직삼각형 상하좌우 반대 만들기");
                for(int i=0; i<row; i++) {
                    for(int j=0; j<=row; j++) {
                        if(j<i+1) {
                            System.out.print("-");
                        }else {
                            System.out.print("o");
                        }
                    }
                    System.out.println();
                }
                System.out.println();

                System.out.println("피라미드 만들기");
                for(int i=0; i<row; i++) {
                    for(int j=0; j<row-i; j++) {
                        System.out.print("-");
                    }
                    for(int j=0; j<i*2+1; j++) {
                        System.out.print("o");
                    }
                    System.out.println();
                }
                System.out.println();

                System.out.println("역 피라미드 만들기");
                int tmp = row;
                for(int i=0; i<row; i++) {
                    for(int j=0; j<=i; j++) {
                        System.out.print("-");
                    }
                    for(int j=0; j<tmp*2-1; j++) {
                        System.out.print("o");
                    }
                    tmp--;
                    System.out.println();
                }
                System.out.println();

                System.out.println("마름모 만들기");
                int row1 = 8;
                int halfRow = row1/2;
                int tmp1 = halfRow;
                //1. 피라미드 만들기
                for(int i=0; i<halfRow+1; i++) {
                    for(int j=0; j<halfRow-i; j++) {
                        System.out.print("-");
                    }
                    for(int j=0; j<i*2+1; j++) {
                        System.out.print("o");
                    }
                    System.out.println();
                }

                //2. 역피라미드 만들기
                for(int i=0; i<halfRow; i++) {
                    for(int j=0; j<=i; j++) {
                        System.out.print("-");
                    }
                    for(int j=0; j<tmp1*2-1; j++) {
                        System.out.print("o");
                    }
                    tmp1--;
                    System.out.println();
                }
                System.out.println();

            }

        }

### 4. 참고
