package exam_1;

import java.util.Scanner;

/*
 * [문제]
 * 키보드로 금액과 상품단가, 수량을 입력하면
 * 부가세, 상품총액 거스름돈을 화면에 보여주는 프로그램을 완성해 보세요
 * * 부가세 : (상품단가*수량)의 10%
 * * 상품총액 : (상품단가*수량) + 부가세
 */

public class Exam3_vat {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		System.out.print("지불한 금액 : ");
		int pay = sc.nextInt();
		System.out.print("제품단가 : ");
		int price = sc.nextInt();
		System.out.print("수량 : ");
		int count = sc.nextInt();
		
		int sp = price * count; // 공급가액 supply price
		double vat = sp * 0.1;
		double total = sp + vat;
		
		System.out.println();
		System.out.printf("지불한 금액 : %,d원\n" , pay);
		System.out.printf("제품단가 : %,d원\n" , price);
		System.out.printf("수량 : : %,d\n" ,count);
		System.out.printf("부가세 : %,.0f원\n"  , vat);
		System.out.printf("상품총액 : %,.0f원\n" , total);
		System.out.printf("거스름 돈 : %,.0f원\n" , (pay - total));
		
		sc.close();
		
	}

}
