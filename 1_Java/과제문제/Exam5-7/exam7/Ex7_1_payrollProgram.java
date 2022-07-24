package exam7;

import java.util.Scanner;

/*
 * 부모클래스 : Employee
 * 자식클래스 : Permanent, Temporary
 */

public class Ex7_1_payrollProgram {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		String contract = "";
		Permanent permanent = new Permanent();
		Temporary temporary = new Temporary();
		
		while(true) {
		// 입력
			System.out.print("고용형태(p:정규직/t:임시직) 입력해주세요 >>> ");
			contract = sc.next();
			
		// 입력값에 따라 클래스 반환
			if(contract.equalsIgnoreCase("p")) {
				System.out.println("이름,기본급,보너스를 입력하세요.");
				permanent = new Permanent(sc.next(), sc.nextInt(), sc.nextInt());
				
			}else if(contract.equalsIgnoreCase("t")) {
				System.out.println("이름,작업시간,시간당 급여를 입력하세요.");
				temporary = new Temporary(sc.next(), sc.nextInt(), sc.nextInt());
				
			}else {
				System.out.println("잘못입력하셨습니다.\n");
				continue;
			}
			
		// 출력
			System.out.println("=========================");
			if(contract.equalsIgnoreCase("p")) {
				permanent.getPays();
			}else{
				temporary.getPays();
			}
			System.out.println("=========================");
			
			System.out.print("프로그램을 종료하시겠습니까? (y:종료/n:계속) >>> ");
			String end = sc.next();
			if(end.equalsIgnoreCase("y")) {
				break;
			}
		}
		System.out.print("프로그램이 종료되었습니다.");
		sc.close();	
	}
}
