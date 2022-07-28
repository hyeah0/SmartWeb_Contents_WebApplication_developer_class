## day5_다차원 배열(Array)

### - 이차원 배열
- 1차원 배열이 여러개 묶여있는 형태의 배열
- 행과 열의 개념 적용
- 형식)
       
        int[][] = new int[3][4]
        // 3행, 4열 

#### - 이차원 배열 예시

- 코드

        public class Ex09 {

            public static void main(String[] args) {

                //다차원 배열 선언 및 메모리 생성
                int[][] arr = new int[3][4]; //3행 4열 다차원 배열
                
                int count = 10;
                for(int i=0; i<arr.length; i++) { // arr.length = 배열의 행
                    for(int j=0; j<arr[i].length; j++) {
                        arr[i][j] = count;
                        count += 10;
                    }
                }
                
                // 표현식
                for(int i=0; i<arr.length; i++) {
                    for(int j=0; j<arr[i].length; j++) {
                        System.out.printf("%3d\t",arr[i][j]);
                    }
                    System.out.println();
                }
                System.out.println();
                
                // 참고
		        // for(int i=0; i<arr.length; i++) {
                //	for(int j=0; j<arr[i].length; j++) {
                //		System.out.println("arr[" + i +"]["+j+"] >>> " + arr[i][j]);
                //	}
                //	System.out.println();
                // }
                
            }
            
        }

- 결과

        10	 20	 30	 40	
        50	 60	 70	 80	
        90	100	110	120	

- 참고

        arr[0][0] >>> 10
        arr[0][1] >>> 20
        arr[0][2] >>> 30
        arr[0][3] >>> 40

        arr[1][0] >>> 50
        arr[1][1] >>> 60
        arr[1][2] >>> 70
        arr[1][3] >>> 80

        arr[2][0] >>> 90
        arr[2][1] >>> 100
        arr[2][2] >>> 110
        arr[2][3] >>> 120

### - 가변 배열
- java의 다차원 배열은 행마다 서로 다른 열을 가질 수 있다.
- 행의 크기를 먼저 결정하고, 열의크기는 가변적으로 할당하는 배열
- 가변 배열을 사용하는 이유 : 메모리 손실을 최소화 시켜주기 위함
- 형식) 
 	
        arr2 = new int[2][]; // 행만 설정
        arr2[0] = new int[4]; // 1행의 열은 4개
        arr2[1] = new int[2]; // 2행의 열은 2개

#### - 가변 배열 예시
- 코드

        public class Ex10 {

            public static void main(String[] args) {
                // 1. 다차원 배열의 가변배열 선언 및 메모리 생성
                // 행 : 4행 , 열 : 미지정
                int[][] arr = new int[4][];
                // 2. 열 메모리 생성
                arr[0] = new int[3]; // 1행은 3열 
                arr[1] = new int[2]; // 2행은 2열
                arr[2] = new int[1]; // 3행은 1열 
                arr[3] = new int[4]; // 4행은 4열
                
                int count = 10;
                
                for(int i=0; i<arr.length; i++) {
                    for(int j=0; j<arr[i].length; j++) {
                        arr[i][j] = count;
                        System.out.printf("%d\t",arr[i][j]);
                        count += 10;
                    }
                    System.out.println();
                }
                System.out.println();
                
                count = 10;
                for(int i=0; i<arr.length; i++) {
                    for(int j=0; j<arr[i].length; j++) {
                        arr[i][j] = count;
                        System.out.println("[" + i + "," + j +"] = " + arr[i][j]);
                        count += 10;
                    }
                    System.out.println();
                }	
            
            }

        }

- 결과

        10	20	30	
        40	50	
        60	
        70	80	90	100	

- 참고

        [0,0] = 10
        [0,1] = 20
        [0,2] = 30

        [1,0] = 40
        [1,1] = 50

        [2,0] = 60

        [3,0] = 70
        [3,1] = 80
        [3,2] = 90
        [3,3] = 100
