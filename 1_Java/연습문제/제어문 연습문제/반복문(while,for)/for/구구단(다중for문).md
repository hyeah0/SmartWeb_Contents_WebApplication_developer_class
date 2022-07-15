### 1. 문제
> for문을 이용하여 구구단 만들기
> 1. 세로형
> 2. 가로형

### 2. 코드
#### 1. 세로형 구구단

public class Ex30 {

	public static void main(String[] args) {

		for(int dan=2; dan<=9; dan++) {
			System.out.println(dan +"단");
			for(int j=1; j<=9; j++) {
				System.out.println(dan + " X " + j + " = " + (dan * j));
			}
			System.out.println();
		}
	}

}

#### 2. 가로형 구구단

public class Ex30 {

	public static void main(String[] args) {

		for(int su=1; su<=9; su++) {
			
			for(int dan=2; dan<=9; dan++) {
				//System.out.print(dan + " X " + su + " = " + (dan*su) + "   "); 
				System.out.printf("%dX%d=%d\t",dan, su, dan*su);	
			}
			
			System.out.println();
		}
	}

}

### 3. 결과
#### 1. 세로형 결과

        2단
        2 X 1 = 2
        2 X 2 = 4
        2 X 3 = 6
        2 X 4 = 8
        2 X 5 = 10
        2 X 6 = 12
        2 X 7 = 14
        2 X 8 = 16
        2 X 9 = 18

        3단
        3 X 1 = 3
        3 X 2 = 6
        3 X 3 = 9
        3 X 4 = 12
        3 X 5 = 15
        3 X 6 = 18
        3 X 7 = 21
        3 X 8 = 24
        3 X 9 = 27

        4단
        4 X 1 = 4
        4 X 2 = 8
        4 X 3 = 12
        4 X 4 = 16
        4 X 5 = 20
        4 X 6 = 24
        4 X 7 = 28
        4 X 8 = 32
        4 X 9 = 36

        5단
        5 X 1 = 5
        5 X 2 = 10
        5 X 3 = 15
        5 X 4 = 20
        5 X 5 = 25
        5 X 6 = 30
        5 X 7 = 35
        5 X 8 = 40
        5 X 9 = 45

        6단
        6 X 1 = 6
        6 X 2 = 12
        6 X 3 = 18
        6 X 4 = 24
        6 X 5 = 30
        6 X 6 = 36
        6 X 7 = 42
        6 X 8 = 48
        6 X 9 = 54

        7단
        7 X 1 = 7
        7 X 2 = 14
        7 X 3 = 21
        7 X 4 = 28
        7 X 5 = 35
        7 X 6 = 42
        7 X 7 = 49
        7 X 8 = 56
        7 X 9 = 63

        8단
        8 X 1 = 8
        8 X 2 = 16
        8 X 3 = 24
        8 X 4 = 32
        8 X 5 = 40
        8 X 6 = 48
        8 X 7 = 56
        8 X 8 = 64
        8 X 9 = 72

        9단
        9 X 1 = 9
        9 X 2 = 18
        9 X 3 = 27
        9 X 4 = 36
        9 X 5 = 45
        9 X 6 = 54
        9 X 7 = 63
        9 X 8 = 72
        9 X 9 = 81

#### 2. 가로형 결과

        2X1=2	3X1=3	4X1=4	5X1=5	6X1=6	7X1=7	8X1=8	9X1=9	
        2X2=4	3X2=6	4X2=8	5X2=10	6X2=12	7X2=14	8X2=16	9X2=18	
        2X3=6	3X3=9	4X3=12	5X3=15	6X3=18	7X3=21	8X3=24	9X3=27	
        2X4=8	3X4=12	4X4=16	5X4=20	6X4=24	7X4=28	8X4=32	9X4=36	
        2X5=10	3X5=15	4X5=20	5X5=25	6X5=30	7X5=35	8X5=40	9X5=45	
        2X6=12	3X6=18	4X6=24	5X6=30	6X6=36	7X6=42	8X6=48	9X6=54	
        2X7=14	3X7=21	4X7=28	5X7=35	6X7=42	7X7=49	8X7=56	9X7=63	
        2X8=16	3X8=24	4X8=32	5X8=40	6X8=48	7X8=56	8X8=64	9X8=72	
        2X9=18	3X9=27	4X9=36	5X9=45	6X9=54	7X9=63	8X9=72	9X9=81	

### 4. 참고
- 가로형 구구단 출력시 print로 출력할경우 줄맞춤 안됨
- printf를 사용하여 줄맞춤 
- 상단 for에는 고정값, 하단 for에는 변경  
