package exam_2_1;

import java.util.Scanner;

/*
 * [문제]
 * for문 응용
 * 1부터 사용자가 입력한 수까지 합 구하기
 * 예) 100입력시 1에서 100까지 홀수합, 짝수합 합계출력
 */

public class Exam2_oddEvenSum {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		System.out.print("수 입력 : ");
		int num = sc.nextInt();
		int oddSum = 0; //홀수합
		int evenSum = 0; //짝수합
	
		for(int i=1; i<=num; i++) {
			if((i%2) == 1) {
				oddSum+=i;
			}else {
				evenSum+=i;
			}
		}
		
		System.out.println("홀수합계 : " + oddSum);
		System.out.println("짝수합계 : " + evenSum);
		
		sc.close();
	}
	

}
