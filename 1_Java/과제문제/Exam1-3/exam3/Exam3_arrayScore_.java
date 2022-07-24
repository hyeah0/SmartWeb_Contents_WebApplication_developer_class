package exam_3;

//import java.util.Arrays;
import java.util.Scanner;

/*
 * [문제]
 * 키보드로 학생수와 이름, 국어, 영어, 수학 배열에 저장후 총점, 평균, 학점, 석차 배열에
 * 성적을 처리한후 화면에 아래와 같이 출력되도록 하세요
 * 학생 수를 입력하세요. : 3
	이름 입력 : aaa
	국어점수 입력 : 99
	영어점수 입력 : 88
	수학점수 입력 : 77
	이름 입력 : bbb
	국어점수 입력 : 95
	영어점수 입력 : 82
	수학점수 입력 : 90
	이름 입력 : ccc
	국어점수 입력 : 97
	영어점수 입력 : 97
	수학점수 입력 : 92
	:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	이름 : aaa	총점 : 264점	평균 : 88.00점	학점 : B학점
	:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	이름 : bbb	총점 : 267점	평균 : 89.00점	학점 : B학점
	:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	이름 : ccc	총점 : 286점	평균 : 95.33점	학점 : A학점
 */

public class Exam3_arrayScore_ {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		System.out.print("학생 수를 입력하세요. : ");
		int students = sc.nextInt(); // 학생수
		String[] name = new String[students];
		int[] kor = new int[students];
		int[] eng = new int[students];
		int[] mat = new int[students];
		int[] total = new int[students];
		double[] avg = new double[students];
		String[] studentGrade = new String[students];
		
		//1. 이름, 점수 입력
		for(int i=0; i<name.length; i++) {
			System.out.print("이름 입력 : ");
			name[i] = sc.next();
			System.out.print("국어점수 입력 : ");
			kor[i] = sc.nextInt();
			System.out.print("영어점수 입력 : ");
			eng[i] =  sc.nextInt();
			System.out.print("수학점수 입력 : ");
			mat[i] =  sc.nextInt();
		}
		
		//2. 총합, 평균, 학점
		for(int i=0; i<name.length; i++) {
			total[i] = kor[i]+eng[i]+mat[i];
			avg[i] = total[i]/3.0;

		  	if(avg[i]>=90) {
		  		studentGrade[i] = "A";
            }else if(avg[i]>=80) {
            	studentGrade[i] = "B";
            }else if(avg[i]>=70) {
            	studentGrade[i] = "C";
            }else if(avg[i]>=60) {
            	studentGrade[i] = "D";
            }else {
            	studentGrade[i] = "F";
            }		
		}
		
		//3. 랭킹
        //for(int )
		
		//4. 반환
		for(int i=0; i<name.length; i++) {
			System.out.println(":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::");
			System.out.printf("이름 : %s\t", name[i]);
			System.out.printf("총점 : %d점\t", total[i]);
			System.out.printf("평균 : %.2f점\t", avg[i]);
			System.out.printf("학점 : %s학점\n", studentGrade[i]);
		}
			
		System.out.println();
		sc.close();
	
	}
}	



