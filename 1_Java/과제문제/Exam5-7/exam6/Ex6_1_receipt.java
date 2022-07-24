package exam6;

import java.util.Scanner;

public class Ex6_1_receipt {

	public static void main(String[] args) {

		int allTotal = 0;	//총금액 = 금액합계 
		
	//1. 객체 배열 생성
		System.out.print("주문한 메뉴종류의 갯수를 입력하세요 >>> ");
		Scanner sc = new Scanner(System.in);
		Menu[] menu = new Menu[sc.nextInt()];
		
	//2. 배열에 메뉴명, 단가, 수량 입력
		for(int i=0; i<menu.length; i++) {
			System.out.println("** 주문한 메뉴명, 단가, 주문수량을 입력해주세요 **");
			menu[i] = new Menu(sc.next(),sc.nextInt(),sc.nextInt());
		}
		
	//3. 출력문
		System.out.println("  품명\t  단가\t 수량\t 금액 ");
		System.out.println("---------------------------------");
		
		//3-1 메뉴상세
			for(int i=0; i<menu.length; i++) {
				menu[i].outputMenu();						
				allTotal += (menu[i].price * menu[i].cnt);
			}
			System.out.println("---------------------------------");
			
		//3-2 세액
			//공급가액
			int vos = (int)(allTotal/1.1);	//공급가액 = 총금액/부가세율  ... 부가세율 = 1.1
			System.out.printf(" 공급가액\t\t\t%,6d원\n",vos);
			
			//부가세
			int vat = allTotal-vos;			//부가세 = 총금액 - 공급가액
			System.out.printf(" 부가세\t\t\t%,6d원\n",vat);
			System.out.println("---------------------------------");
			
		//3-3 청구금액
			int endPrice = vos+vat;			//청구금액 = 공급가액 + 부가세
			System.out.printf(" 청구금액\t\t\t%,6d원\n",endPrice);
		
		sc.close();
	}
}
