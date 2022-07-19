### 1. 문제

1. 하단과 같이 출력해주세요
       
        *
        **
        ***
        ****
        *****
        ******
        *****
        ****
        ***
        **
        *

2. 상단과 같은 모양으로 별이 가장 많은 곳의 별의 갯수를 입력받아 입력값에 따라 모양을 출력해주세요
    
        별의 최대갯수를 작성해 주세요 : 4
        *
        **
        ***
        ****
        ***
        **
        *

### 2. 코드
#### 1. 

        public class Exam2_3_star {

            public static void main(String[] args) {

                int row = 6;
                //직삼각형
                for(int i=0; i<row; i++) { //행의 갯수
                    for(int j=0; j<=i; j++) {
                        System.out.print("*");
                    }
                    System.out.println();
                }
                //상하반전 직삼각형
                for(int i=5; i>=1; i--) {
                    for(int j=1; j<=i; j++) {
                        System.out.print("*");
                    }
                    System.out.println();
                }
                sc.close();
            }

        }

#### 2. 입력값에 따라 상이

        public class Exam2_3_star {

            public static void main(String[] args) {

                Scanner sc = new Scanner(System.in);
		        // 방법1
                int max = sc.nextInt();
            
                for(int i=0; i<max; i++) {
                    for(int j=0; j<=i; j++) {
                        System.out.print("*");
                    }
                    System.out.println();
                }
                
                for(int i=max-1; i>=1; i--) {
                    for(int j=1; j<=i; j++) {
                        System.out.print("*");
                    }
                    System.out.println();
                }
		
                // 방법2 : 키보드로 입력받은 수가 별의 최대 갯수
                System.out.println();
                System.out.print("별의 최대갯수를 작성해 주세요 : ");
                int starCount = sc.nextInt();
                for(int i=1; i<=(starCount*2)-1; i++) {
                    int line = (i<=starCount)? i : (starCount*2 -i);
                    
                    for(int j=1; j<=line; j++) {
                        System.out.print("*");
                    }
                    System.out.println();
                }
                
                sc.close();
            }
        }

                

### 3. 결과
#### 1.

        *
        **
        ***
        ****
        *****
        ******
        *****
        ****
        ***
        **
        *

#### 2.

        별의 최대갯수를 작성해 주세요 : 4
        *
        **
        ***
        ****
        ***
        **
        *

#### 추가

        다음과 같은 출력결과가 나타나도록 하시오
            ABCDEFGHIJKLMNOPQRSTUVWXYZ
            ABCDEFGHIJKLMNOPQRSTUVWXY
            ABCDEFGHIJKLMNOPQRSTUVWX
            ABCDEFGHIJKLMNOPQRSTUVW
            ABCDEFGHIJKLMNOPQRSTUV
            ABCDEFGHIJKLMNOPQRSTU
            ABCDEFGHIJKLMNOPQRST
            ABCDEFGHIJKLMNOPQRS
            ABCDEFGHIJKLMNOPQR
            ABCDEFGHIJKLMNOPQ
            ABCDEFGHIJKLMNOP
            ABCDEFGHIJKLMNO
            ABCDEFGHIJKLMN
            ABCDEFGHIJKLM
            ABCDEFGHIJKL
            ABCDEFGHIJK
            ABCDEFGHIJ
            ABCDEFGHI
            ABCDEFGH
            ABCDEFG
            ABCDEF
            ABCDE
            ABCD
            ABC
            AB
            A


##### 코드

        public class Exam4_abc_ab_a {

            public static void main(String[] args) {

                for(char i='Z'; i>='A'; i--) {
                    for(char j='A'; j<=i; j++) {
                        System.out.print(j);
                    }
                    System.out.println();
                }
                    
            }	
        }
