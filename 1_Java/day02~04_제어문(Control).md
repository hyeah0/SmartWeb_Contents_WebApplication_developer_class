## day2~4_제어문(Control)
### - 제어문이란?
- 프로그램의 흐름을 제어하는 명령문
- 원래는 main() 메서드의 시작 중괄호에서 부터 ~ 끝 중괄호까지
  위에서 아래로 순차적으로 실행하는 흐름을 가지고 있음
- 제어문은 이러한 흐름을 개발자가 원하는 방향으로 바꿀 수 있도록 해주는 것을 말함
- 모든 제어문의 실행결과는 boolean(true/false) 로 나온다


### - 제어문의 종류
1. 분기문(조건문)
    - if문, if else문, 다중 if else문
    - switch case문
2. 반복문
    - while문, do while문, for문
3. 기타(보조제어문)
    - break, continue명령어

### 1. 분기문

#### 1-1. if
- 조건이 참이면 실행, 거짓일때 무시
- 조건식의 결과값은 boolean 형만 올 수 있다
- 실행문이 한줄이면 {} (중괄호) 생략가능
    - 실행문 두줄이상일 경우 {} (중괄호) 필수 작성 
    - 만약 실행문이 두줄이상이나 중괄호가 생략되었을경우 참일경우 첫번째 실행문을 거짓일경우 가장하단 실행문을 실행한다.  

- 형식)

        if(조건식){
                조건식이 참일 경우 실행문
        }

##### if 예시 코드

###### 1. if 예시 코드

        public class Ex01 {

            public static void main(String[] args) {

                System.out.println("---------프로그램 시작---------");
                
                int su = 25;
                
                //삼항연산자
                String result = (su>10) ? "su는 10보다 큽니다.":"su는 10보다 크지 않습니다.";
                System.out.println(result);
                
                //if문
                //예시1
                if(su>10) 
                    System.out.println("su = 10 이며 su>10 인 조건식이 참입니다.");
                
                //예시2
                if(su<10) 
                    System.out.println("su = 10 이며 su>10 인 조건식이 참입니다.");
                    System.out.println("su = 10 이며 su<10 인 조건식이 참이 아닙니다.");
                
                
                // 실행문이 한줄이라 중괄호 생략했으나, 읽기 편하도록 중괄호는 포함하도록 한다.
                // 만약 실행문이 두줄이상이나 중괄호가 생략되었을경우 참일경우 첫번째 실행문을 거짓일경우 가장하단 실행문을 실행한다. 
                
                //예시3
                if(su<10) {
                    System.out.println("su = 10 이며 su<10 인 조건식이 참입니다.");
                }
                else {
                    System.out.println("su = 10 이며 su<10 인 조건식이 참이 아닙니다.");
                }
                
                
                System.out.println("---------프로그램 종료---------");
            }

        }

###### 2. if 예시코드_값을 입력받아 조건식에 따른 실행문 
  
1. 예시 2-1 (main 메서드에서 값을 입력 받음)

        public class Ex02 {

            public static void main(String[] args) {

                System.out.println("---------프로그램 시작---------");
                
                //int intNum = 92;
                int intNum = Integer.parseInt(args[0]);
                
                if(intNum >= 90) {
                    System.out.println("점수가 90점 이상입니다.");
                    System.out.println("A학점입니다");
                }
                else {
                    System.out.println("점수가 90점 이하입니다.");
                }
                
            
                System.out.println("---------프로그램 종료---------");
            }

        }

2. 예시 2-2 팝업창 (JOptionPane.showInputDialog())

    - [문제] 
    
        키보드로 입력받은 정수가 5로 나누어 떨어지면 "이 정수는 5의 배수입니다" 라는 메세지를 화면에 출력하세요

            public class Ex03 {

                public static void main(String[] args) {

                    int num = Integer.parseInt(JOptionPane.showInputDialog("정수를 입력하세요"));
                    
                   if((num%5) == 0) {
                        System.out.println("입력받은 값은 " + num + "이며, 이 정수는 5의 배수입니다.");
                    }
                    else {
                        System.out.println("입력받은 값은 " + num + "이며, 이 정수는 5의 배수가 아닙니다.");
		            }
                    
                }

            }

#### 1-1. if else
- if else 
    - 조건식이 참이면 if문 실행문장을 실행하고
    거짓일 경우 else 실행문을 실행한다
    
    - 형식)

            if(조건식){
                조건식이 참인 경우에 실행
            }
            else{
                조건식이 거짓인 경우에 실행
            }   

##### if else 예시코드

        public class Ex06 {

            public static void main(String[] args) {

                int su = 57;
                if(su >= 50) {
                    //조건식이 참인경우 실행 
                    System.out.println("입력 받은 수는 50 이상입니다.");
                }
                else {
                    //조건식이 거짓인 경우
                    System.out.println("입력 받은 수는 50 미만입니다.");
                }
                
            }

        }

#### 1-1. 다중 if else
- 다중 if else 문
    - 여러개의 조건 중에 맞는 조건에 해당하는 문장 실행

- 형식)

        if(조건식1){
            조건식1이 참인경우 실행	
        } else if(조건식2){
            조건식1 false
            조건식2 true 일때 실행문장
        } else if(조건식3){
            조건식1 false
            조건식2 false
            조건식3 true 일때 실행 문장
        } else{
            조건식1 false
            조건식2 false
            조건식3 false 일때 실행 문장
        }

        // === 

        if(조건식1){
            조건식1이 참인경우 실행 문장
        } else {
            if(조건식2){
                조건식1 false
                조건식2 true 일때 실행문장
            } else{
                if(조건식3){
                    조건식1 false
                    조건식2 false
                    조건식3 true 일때 실행 문장
                } else{
                    조건식1 false
                    조건식2 false
                    조건식3 false 일때 실행 문장
                {
            }

##### 다중 if else 예시

        import java.util.Scanner;
        public class Ex11 {

            public static void main(String[] args) {

                Scanner sc = new Scanner(System.in);
                System.out.print("1~3 사이의 숫자중 하나 선택 >>> ");
                int num = sc.nextInt();
                
                if(num == 1) {
                    System.out.println("입력받은 숫자는 1 입니다.");
                }else if(num == 2) {
                    System.out.println("입력받은 숫자는 2 입니다.");
                }else if(num == 3) {
                    System.out.println("입력받은 숫자는 3 입니다.");
                }else {
                    System.out.println("입력받은 숫자는 1~3 이외의 숫자입니다.");
                }
            
                sc.close();
            }

        }

#### 1-2. switch case
- switch case문
    - 식(정수 또는 char)를 사용해서 다중 분기하는 명령문
    - jdk 1.7버전부터는 식에 String 사용이 가능함

- 형식)

        switch(식 또는 변수 또는 값){
                case 값1 :
                            값이 1일때 실행문 ;
                            break; //switch case 블럭 탈출!
                case 값2 :
                            값이 1일때 실행문 ;
                            break; //switch case 블럭 탈출!
                case 값3 :
                            값이 1일때 실행문 ;
                            break; //switch case 블럭 탈출!
                default : 
                            값1~3 외의 값이 들어온 경우 실행문;
                            //default 값은 생략 가능
            }

##### switch case 예시
###### 1. num 값 

    import java.util.Scanner;
    public class Ex15 {

        public static void main(String[] args) {
            
            Scanner sc = new Scanner(System.in);
            System.out.print("1~3 사이의 숫자를 입력하세요 : ");
            int num = sc.nextInt();
            
            switch(num) {
            
                case 1 : System.out.println("1를 작성했습니다.");
                        break;
                case 2 : System.out.println("2를 작성했습니다.");
                        break;
                case 3 : System.out.println("3을 작성했습니다.");
                    
            }	 		 break;
                default : System.out.println("1~3 외의 숫자를 작성했습니다.");
                
            
            sc.close();
        
        }

    }

###### 2. String 값

        import java.util.Scanner;
        public class Ex15 {

            public static void main(String[] args) {
                
                Scanner sc = new Scanner(System.in);
            
                System.out.print("금, 은, 동 중 하나를 선택해 주세요");
                String medal = sc.next();
                
                switch(medal) {
                    case "금" :
                        System.out.println("금메달 입니다.");
                        break;
                    case "은" :
                        System.out.println("은메달 입니다.");
                        break;
                    case "동" :
                        System.out.println("동메달 입니다.");
                        break;
                    default : 
                        System.out.println("메달이 없습니다.");
                        break;
                }
        
                sc.close();

            }

        }

### 2. 반복문
- 반복해서 실행할 때 사용하는 문장
- 반복문의 종류 
    1. while문
        - while문
        - do while문
    2. for문

#### 2-1. while
- 조건식을 비교하여 참인 경우 계속해서 반복 실행문을 실행하고, 거짓인 경우에는 반복문을 빠져 나간다.
- while 반복문은 반복문의 횟수를 알 수 없는 경우에 사용
- 반복문에는 반드시 초기식, 조건식, 증감식이 존재해야 한다.

- 형식)
- 
        1. 초기식 
            while(2.조건식){
                            3.반복실행 문장(실행문);
                            4.증감식
            }
		    
    1. 반복문 초기식
    2. 반복문 조건식(조건식에 true가 들어갈 경우 무한반복)
    3. 참일때 실행문
    4. 반복문 증감식


##### while 예시
###### 1. 1~10까지 출력

        public class Ex18 {

            public static void main(String[] args) {

                //1~10 까지 출력
                //1. 반복문 초기식
                int num = 1;
                
                //2. 반복문 조건
                while (num<=10) {
                    //3.조건이 참일때 실행문
                    System.out.println("num값은 : " + num + "이다.");
                    //4.반복문에서 증감식
                    num++;
                }
                
            }

        }

###### 2. 1~10까지 누적합계
- 코드

        public class Ex19 {

            public static void main(String[] args) {
                
                //1. 초기 변수 설정
                //1-1 반복초기식
                //1-2 결과값
                int num = 1;
                int sum =0;
                
                //2. 조건문 실행
                while(num<=10) {
                    //int tmpN = num;
                    //int tmpS = sum;
                    
                    sum += num;
                    num++;
                    
                    //System.out.println(tmpS + "+" + tmpN + "=" +  sum);
                }
                
                System.out.println("1~10까지 누적 합계 값은 : " + sum + "이다.");
            }

        }

- 결과 

        1~10까지 누적 값은 : 55이다.

- 참고

        sum = sum + num
        0+1=1
        1+2=3
        3+3=6
        6+4=10
        10+5=15
        15+6=21
        21+7=28
        28+8=36
        36+9=45
        45+10=55

#### 2-1. do while
- 먼저 반복실행문을 실행하고 조건식을 비교함
- 1번은 꼭 실행함

- 형식)

		do{

			반복 실행문 실행;
			while문 참일경우 종료

		} while(조건식);

##### do while 예시

        public class Ex18_while {

            public static void main(String[] args) {

                //do while 이용하여 1~10까지 출력
                int num1 = 1;
                do {
                    System.out.println("num1 >>> " + num1 );
                    num1++;
                } while(num1 >= 10); 
            }

        }



#### 2-2. for (***중요***)
- 변수의 값을 이용하여 반복 실행 하는 명령문
- 일정 횟수에 대한 반복 구현시 사용되는 반복문
- 즉, 반복해야하는 횟수를 알고 있을 경우에 사용
#### 형식) 
		for(1.초기식 ; 2.조건식 ; 4.증감식){
					 3.실행문(반복실행문장)
		}

#### for 반복문 실행 순서
1. 초기식 : 처음에 한번만 실행 됨(변수 선언 및 초기화)
2. 조건식 : 조건이 참이면 반복 실행, 거짓이면 종료
3. 실행문 : 조건이 참일때 반복 대상인 반복 실행문이 실행 
4. 증감식 : 변수를 대상으로 증가 또는 감소(++, --);

##### for 예시
###### while문과 for문 비교 예시

        public class Ex26_for {
        
            public static void main(String[] args) {
                
                // while 
                //1. 초기식
                int num = 1;
                
                //2. 조건식
                while (num <=10) {
                    //3. 실행문
                    System.out.println("while문 num >>> " + num);
                    //4. 증감식
                    num++;
                }
                        
                //for
                //1. 초기식 ; 2. 조건식 ; 4. 증감식 
                for(int i=0; i<=10; i++ ) {
                    //3. 실행문
                    System.out.println("for문 i >>> " + i);
                }
                    
            }
        }

- 결과

        while문 num >>> 1
        while문 num >>> 2
        while문 num >>> 3
        while문 num >>> 4
        while문 num >>> 5
        while문 num >>> 6
        while문 num >>> 7
        while문 num >>> 8
        while문 num >>> 9
        while문 num >>> 10
        for문 i >>> 0
        for문 i >>> 1
        for문 i >>> 2
        for문 i >>> 3
        for문 i >>> 4
        for문 i >>> 5
        for문 i >>> 6
        for문 i >>> 7
        for문 i >>> 8
        for문 i >>> 9
        for문 i >>> 10

#### 2-2. 다중 for
- 반복문 안에 또 다른 반복문을 포함하는 형태 (반복문 중첩)
- 외부반복문과 내부 반복문 간의 변수값 변화 주의
- 형식

        for(1.초기식1; 2.조건식1; 9.증감식1){
                    3.실행문1
                for(4.초기식2; 5.조건식2; 7.증감식2){
                    6.실행문2
                }
                    8.실행문1
        }

    - 1번 for문 실행후 -> 2번 for문 실행 
    - 2번 for문 조건 종료후에 다시 1번 for문 실행
    - 2번 for문의 초기식 다시 초기화 및 실행  

###### 다중 for문 예시

        public class Ex29 {

            public static void main(String[] args) {

                for(int i=1; i<=3; i++) {
                    for(int j=1; j<=4; j++) {
                        System.out.println("[ i : " + i + " , j : " + j + "]");
                    }
                    System.out.println();
                }	
            }
        }

-  결과

        [ i : 1 , j : 1]
        [ i : 1 , j : 2]
        [ i : 1 , j : 3]
        [ i : 1 , j : 4]

        [ i : 2 , j : 1]
        [ i : 2 , j : 2]
        [ i : 2 , j : 3]
        [ i : 2 , j : 4]

        [ i : 3 , j : 1]
        [ i : 3 , j : 2]
        [ i : 3 , j : 3]
        [ i : 3 , j : 4]



### 3. 기타(보조제어문)
1. break
2. continue

#### 3-1. break
- break 명령어
- 현재 제어문을 빠져나가는 명령어
- 보통 switch case문과 반복문(while), 유효성검사 에서 사용됨
- 반복문에서 if문 블럭을 제외한 첫번째 블럭에서 빠져나가는 명령어

##### break 예시

        public class Ex32_break_continue {

            public static void main(String[] args) {

                for(int i=1; i<=100; i++) {
                    if(i>10) { // i가 11이 되었을때 for문 종료
                        break; 
                    }
                    System.out.println("i : " + i);
                }
                
            }

        }

- 결과

        i : 1
        i : 2
        i : 3
        i : 4
        i : 5
        i : 6
        i : 7
        i : 8
        i : 9
        i : 10




#### 3-2. continue

- continue 명령어
- 반복문에서만 사용되는 명령어
- 반복문 탈출이아닌 다음 증감식으로 가는 명령어

##### continue 예시

        public class Ex34 {

            public static void main(String[] args) {
                
                // 1부터 10까지 짝수만 반환하세요
                for(int i=1; i<=10; i++) {
                    if((i%2)==1) { //i가 홀수인경우
                        continue; //하단 실행문 실행하지 않고 for문으로 감
                    }
                    System.out.println("i >>> " + i);
                }
                
                //1부터 100까지의 누적 합
                int sum = 0;
                for(int i=1; i<=100; i++) {
                    sum += i;
                }
                System.out.println("sum >>> " + sum);
                
                //continue를 이용한 홀수의 합
                int oddSum= 0;
                for(int i=1; i<=100; i++) {
                    if((i%2)==0) { //짝수일경우 실행 x
                        continue;
                    }
                    oddSum += i;
                }
                System.out.println("홀수의 합 >>> " + oddSum);
                
                //continue를 이용한 짝수의 합
                int evenSum = 0;
                for(int i=1; i<=100; i++) {
                    if((i%2)==1) { //홀수일경우 실행 x
                        continue;
                    }
                    evenSum += i;
                }
                System.out.println("짝수의 합 >>> " + evenSum);

            }

        }

- 결과

        i >>> 2
        i >>> 4
        i >>> 6
        i >>> 8
        i >>> 10
        sum >>> 5050
        홀수의 합 >>> 2500
        짝수의 합 >>> 2550
