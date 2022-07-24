package exam_1;

import java.util.Scanner;

/*
 * [문제]
 * 국어, 영어, 수학, 자바 변수 만들고
 * 변수에 점수 입력후 총점, 평균을 구하시오
 * 조건) 평균은 소숫점 이하 2자리 까지만 출력
 */

public class Exam1_varScore {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
	
		System.out.print("국어 점수를 입력하세요 : ");
		int kor = sc.nextInt();
		System.out.print("영어 점수를 입력하세요 : ");
		int eng = sc.nextInt();
		System.out.print("수학 점수를 입력하세요 : ");
		int mat = sc.nextInt();
		System.out.print("자바 점수를 입력하세요 : ");
		int java = sc.nextInt();
		
		int total = kor+eng+mat+java;
		double avg = total/4.0; 
		
		System.out.println();
		System.out.println("국어점수 : " + kor + "점");
		System.out.println("영어점수 : " + eng + "점");
		System.out.println("수학점수 : " + mat + "점");
		System.out.println("자바점수 : " + java + "점");
		System.out.println("총   점 : " + total + "점");
		System.out.printf("평  균 : %.2f점", avg );
		
		sc.close();
	}

}
