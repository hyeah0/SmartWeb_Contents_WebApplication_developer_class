## day4_배열(Array)

### - 배열(array)
- 하나의 이름으로 동일한 자료형의 데이터를 여러개 연속적으로 저장할 수 있는 메모리 공간을 할당 받음
- 변수는 하나의 값만 저장하지만, 배열은 여러개의 값을 저장 할 수 있다.
	- 같은 자료형의 데이터들이 순차적으로 저장된다.
	- 만약, 다른 자료형의 데이터를 저장하려면 타입 불일치 컴파일 오류 발생
- 배열은 0이라는 인덱스 부터 시작한다 (0,1,2,3,4,5 ...)
- 배열의 단점 : 한번 크기가 정해지면 크기를 수정할 수 없다.

#### - 배열 사용법
- 1단계 : 배열 선언
	- 형식) 
		
        > 자료형[] 배열명(배열이름) 또는 자료형 배열명[]
- 2단계 : 배열 메모리 생성(메모리 할당)
	- 형식)
		
        > 배열명 = new 자료형[배열의 크기]
- 3단계 : 배열 초기화 
	- 할당된 메모리 영역에 데이터 저장
- 4단계 : 배열 이용
	- 데이터 처리(연산, 출력 등)

#### - 배열 생성법 - 2가지
1. new 키워드를 사용하여 배열 생성
    > 자료형[] 배열명 = new 자료형 [배열크기]
        > int[] arr = new int[3]

2. 배열의 초기값을 이용하여 배열 생성
    > 자료형[] 배열명 = { , , ,}
        > int[] arr1 = {1,2,3,4,5,6,7,8,9};

#### - 배열 예시

        public class Ex01 {

            public static void main(String[] args) {

                // 1. 배열 선언
                // 2. 배열 메모리 생성
                // int[] arr;
                // arr = new int[5];
                
                //1~2단계 합쳐서 배열 선언과 메모리 동시 생성
                int[] arr = new int[5];
                
                System.out.println("arr 배열의 주소값 : " + arr);
                System.out.println("arr[0] : " + arr[0]); // 0 :따로 데이터를 할당하지 않으면 0 이다.
                
                // 3. 배열 초기화 - 할당된 메모리 영영에 데이터 할당
                arr[0] = 10;
                arr[1] = 20;
                arr[2] = 30;
                arr[3] = 40;
                arr[4] = 50;
                System.out.println("arr[0] : " + arr[0]); // 10
            
                // 4. 배열 출력 
                System.out.println("arr[1] : " + arr[1]);
                
                // 5. 배열 수정(크기x)
                arr[2] = arr[2] + 100;
                System.out.println("arr[2] : " + arr[2]);
                

                //반복문을 이용하여 배열 출력
                for(int i=0; i<arr.length; i++) {
                    System.out.println("arr[" + i + "] = " + arr[i]);
		        }

                //개선된 for문 예시(배열 출력시 사용)
                for(int arr1 :arr) {
			        System.out.println(arr1);
		        }
            }

        }

- 결과

        arr 배열의 주소값 : [I@7d6f77cc
        arr[0] : 0
        arr[0] : 10
        arr[1] : 20
        arr[2] : 130

        arr[0] = 10
        arr[1] = 20
        arr[2] = 130
        arr[3] = 40
        arr[4] = 50

        1
        2
        3
        4
        5

### - 단축 for문

- for 반복문 단축시키는 반복문 ==> 단축 for문(개선된 for문)
    - java jdk 1.5 버전부터 추가됨
    - 주로 배열의 요소(값)를 처리(출력)할 때 사용 
    - 형식)
            for(자료형 변수명 : 배열명){
                반복 실행문;
        }
		 
#### - 실행방법

- 배열의 첫번째[0]에 있는 데이터를 좌변의 변수명에 저장을 하여 출력을 해줌
- 데이터 수만큼 자동으로 반복하여 출력

#### - 주의
- 우변에 있는 배열명의 자료형과 좌변에 있는 변수명의 자료형이 반드시 일치해야함
- 만약 일치하지 않을 경우 error 발생

#### - 배열 예시

- 배열의 초기값을 이용하여 배열 생성
- 단축 for문을 이용하여 배열 0~n 까지 출력

        public class Ex04 {

            public static void main(String[] args) {

                int[] arr1 = {1,2,3,4,5,6,7,8,9};
                
                for(int arr:arr1) {
                    System.out.print(arr);
                }
            }

        }
	
### - length 속성
- 배열의 크기(길이)를 정수값으로 알려주는 명령어
- 형식) 

        배열명.length
        예) int size = arr.length

#### - length 속성 예시
##### - 배열의 크기를 입력받은 값으로 지정 

        public class Ex05 {

            public static void main(String[] args) {
                Scanner sc = new Scanner(System.in);
                int[] arr = new int[3];
                System.out.println("arr 배열의 크기는 ? >>> " + arr.length );

                for(int i=0; i<arr.length; i++) {
                    System.out.print( i + "번째 정수 입력 >>> ");
                    arr[i] = sc.nextInt();
                }
                
                System.out.println(Arrays.toString(arr));
                sc.close();	
            }
        }

        - 결과
        arr 배열의 크기는 ? >>> 3
        0번째 정수 입력 >>> 1
        1번째 정수 입력 >>> 2
        2번째 정수 입력 >>> 3
        [1, 2, 3]

##### - 배열의 크기를 입력받은 값으로 지정, 배열에 저장된 문자열 검색

        public class Ex06 {

            public static void main(String[] args) {

                Scanner sc = new Scanner(System.in);
            
                // 배열크기를 입력받은값으로 지정
                // 첫번째 방법(효율적인 방법)
                System.out.print("arr 배열의 크기를 입력해 주세요 >>> ");
                String[] arr = new String[sc.nextInt()];
                
                // 두번째 방법
                // System.out.print("str 배열의 크기를 입력해 주세요 >>> ");
                // int size = sc.nextInt();
                // String[] str = new String[size];
                
                System.out.println("arr 배열의 크기는 ? " + arr.length);
            
                for(int i=0; i<arr.length; i++) {
                    System.out.print((i+1) + "번째 문자열 입력 >>> ");
                    arr[i] = sc.next();	
                }
                
                System.out.println();
                System.out.println(Arrays.toString(arr));
                
                for(int i=0; i<arr.length; i++) {
                    System.out.println("arr[" + i + "] = " + arr[i]);
                }
                
                System.out.println();
                
                // 배열에 저장된 문자열 검색
                System.out.print("검색할 문자열 입력하세요. >>> ");
                String search = sc.next();
                
                for(int i=0; i<arr.length; i++) {
                    if(search.equals(arr[i])) {
                        System.out.println("찾은 문자열 >>> " + arr[i]);
                        System.out.println("찾은 인덱스 >>> arr[" + i + "]");
                    }else {
                    System.out.println("검색한 문자열이 없습니다.");
                    break;
                    }
                }
                
                sc.close();
            }

        }

        - 결과

        arr 배열의 크기를 입력해 주세요 >>> 3
        arr 배열의 크기는 ? 3
        1번째 문자열 입력 >>> 사과
        2번째 문자열 입력 >>> 포도
        3번째 문자열 입력 >>> 오렌지

        [사과, 포도, 오렌지]
        arr[0] = 사과
        arr[1] = 포도
        arr[2] = 오렌지

        검색할 문자열 입력하세요. >>> 오렌지
        찾은 문자열 >>> 오렌지
        찾은 인덱스 >>> arr[2]
	
	검색할 문자열 입력하세요. >>> 키위
	검색한 문자열이 없습니다.

### - 주소값 복사
- strCopy 에 str 주소값 복사
- 주소값을 복사하면 strCopy 에서 데이터 입력시
str 배열에도 동일하게 데이터가 입력된다.

        String[] str = new String[sc.nextInt()];
        String[] strCopy = str; 
		
#### - 주소값 복사 예시

        import java.util.Arrays;
        import java.util.Scanner;

        public class Ex07 {

            public static void main(String[] args) {
                
                Scanner sc = new Scanner(System.in);
                
                System.out.print("문자열 배열의 크기 입력 : ");
                String[] str = new String[sc.nextInt()];
                String[] strCopy = str; //******************
                //ㄴ strCopy 에 str 주소값 복사
                
                System.out.println("str 주소값 : " + str); // str 주소값 : [Ljava.lang.String;@66d33a
                System.out.println("strCopy 주소값 : " + strCopy); //strCopy 주소값 : [Ljava.lang.String;@66d33a
                
                
                
                /*
                * String[] strCopy = str;
                * strCopy 배열명에 str 배열 주소값을 복사
                * 배열의 이름은 heap 영역의 시작 주소값을 저장하고 있기 때문데 
                * 시작 주소값을 다른 배열의 배열명에 복사해주는 명령문, 
                * 즉, 배열의 공유가 이뤄진다.
                */
                
                //strCopy 배열에 초기값 할당
                for(int i=0; i<strCopy.length; i++) {
                    System.out.print((i+1) + "번째 문자입력 >>> ");
                    strCopy[i] = sc.next();
                }
                
                for(int i=0; i<str.length; i++) {
                    System.out.println("str[" + i + "] >>> " + str[i]);
                }
                
                System.out.println(Arrays.toString(str));
                System.out.println(Arrays.toString(strCopy));
                
                
                sc.close();
            }

        }

        - 결과

        문자열 배열의 크기 입력 : 3
        str 주소값 : [Ljava.lang.String;@66d33a
        strCopy 주소값 : [Ljava.lang.String;@66d33a
        1번째 문자입력 >>> aaa
        2번째 문자입력 >>> bbb
        3번째 문자입력 >>> ccc
        str[0] >>> aaa
        str[1] >>> bbb
        str[2] >>> ccc
        [aaa, bbb, ccc]
        [aaa, bbb, ccc]
