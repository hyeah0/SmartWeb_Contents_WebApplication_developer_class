package exam_2_1;

import java.util.Scanner;

/*
 * [문제]
 * 지방(fat), 탄수화물(carbohydrate), 단백질(protein) 
 * 칼로리의 합계를 계산하는 프로그램
 * - 지방, 탄수화물, 단백질의 그램을 키보드로 입력
 * - 총 칼로리 구하기
 * 		지방 1g = 9 cal
 * 		단백질, 탄수화물 1g = 4 cal
 * 		총 칼로리 = 지방 * 9 + 단백질 * 4 + 탄수화물 * 4  
 */

public class Exam1_cal {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("지방의 그램을 입력하세요 : ");
		int fat = sc.nextInt();
		System.out.print("탄수화물의 그램을 입력하세요 : ");
		int car = sc.nextInt();
		System.out.print("단백질의 그램을 입력하세요 : ");
		int pro = sc.nextInt();
		int totalCal = (fat*9) + (car*4) + (pro*4);
		
		System.out.println();
		System.out.println("지방의 그램을 입력하세요 : " + fat);
		System.out.println("탄수화물의 그램을 입력하세요 : " + car);
		System.out.println("단백질의 그램을 입력하세요 : " + pro);
		System.out.printf("총칼로리 : %,d cal" , totalCal);
		
		sc.close();
	}

}
