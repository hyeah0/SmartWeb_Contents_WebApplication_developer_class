package exam_2_2;

import java.util.Scanner;

/*
 * [문제]
 * coffee 메뉴를 키보드로 입력받고 주문수량과 입금액을 입력하면 하단과 같이
 * 출력되게 하세요
 * * 총금액에는 부가세가 포함된 금액이 나와야 합니다.
 * 
 * ** coffee 메뉴 ***
 * 1. 아메리카노 - 3,000원
 * 2. 카페라떼 - 4,000원
 * 3. 마키아또 - 4,500원
 * 4. 바닐라라떼 - 4,500원
 * 위 메뉴중 하나를 선택하세요. : 2
 * 주문수량 >> 4
 * 입금액 >> 20000
 * 
 * 주문한 메뉴 : 카페라떼
 * 커피단가 : 4,000원
 * 주문수량 : 4
 * 입금액 : 20,000원
 * 총금액 : 17,600원
 * 거스름 돈 :  2,400원
 *
 */

public class Exam2_order {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		int ame = 3000;
		int latte = 4000;
		int macchiato = 4500;
		int vanilla = 4500;
		int menuCharge = 0;
		
		System.out.println("** coffee 메뉴 ***");
		System.out.printf("1. 아메리카노 - %,d원\n" , ame);
		System.out.printf("2. 카페라떼 - %,d원\n" ,  latte);
		System.out.printf("3. 마키아또 - %,d원\n" , macchiato);
		System.out.printf("4. 바닐라라떼 - %,d원\n" , vanilla);
		
		System.out.print("위 메뉴중 하나를 선택하세요. : ");
		int inputMenu = sc.nextInt();
		System.out.print("주문수량 >> ");
		int orderCnt = sc.nextInt();
		System.out.print("입금액 >> ");
		int pay = sc.nextInt();
		
		System.out.println();
		// 1. 주문메뉴
		switch(inputMenu) {
			case 1 : 
				System.out.println("주문한 메뉴 : 아메리카노");
				menuCharge = ame;
				break;
			case 2 : 
				System.out.println("주문한 메뉴 : 카페라떼");
				menuCharge = latte;
				break;
			case 3 : 
				System.out.println("주문한 메뉴 : 마키아또");
				menuCharge = macchiato;
				break;
			case 4 : 
				System.out.println("주문한 메뉴 : 바닐라라떼");
				menuCharge = vanilla;
				break;
			}
        
		// 2. 커피단가, 주문수량, 입금액
		System.out.printf("커피단가 : %,d원\n", menuCharge);
		System.out.printf("주문수량 : %,d\n", orderCnt);
		System.out.printf("입금액 : %,d원\n", pay);
		
		// 3. 총금액
		double vat = (orderCnt * menuCharge) * 0.1;
		double total = (menuCharge * orderCnt) + vat;
		System.out.printf("총금액 : %,.0f원\n", total);
		
		// 4. 거스름돈
		double change = pay - total;
		System.out.printf("거스름 돈 :  %,.0f원\n", change);
		
		sc.close();
	}
				
}

