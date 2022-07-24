package exam_1;

import java.util.Scanner;

/*
 * [문제]
 * 임의의 정수 입력받아 그 수의 제곱근, 세제곱근을 구하시오
 */

public class Exam2_squareRoot {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.print("입력받은 정수 ==> ");
		int num = sc.nextInt();
		int tmp = num;
		
		System.out.println(num + "의 제곱근 ==> " + (num *= num) );
		System.out.println(tmp + "의 세제곱근 ==> " + (num *= tmp) );
		
		sc.close();
	}

}
