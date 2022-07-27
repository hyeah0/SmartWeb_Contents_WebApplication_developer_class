package exam8;

import java.util.Scanner;

public class Ex8_1_Employee {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("고용형태 - 정규직<p>, 임시직<t>를 입력하세요 >> ");
		String choose = sc.next();
		
		if(choose.equalsIgnoreCase("p")) {
			System.out.println("이름, 기본급, 보너스 입력하세요.");
			Permanent permanent = new Permanent(sc.next(),sc.nextInt(),sc.nextInt());
			
			System.out.println("=============================");
			System.out.println("고용형태 : 정규직");
			System.out.println("이   름 : " + permanent.getName());
			permanent.getPays();
			
		}else if(choose.equalsIgnoreCase("t")) {
			System.out.println("이름, 작업시간, 시간당 급여 입력하세요.");
			Temporary temporary = new Temporary(sc.next(),sc.nextInt(),sc.nextInt());
			
			System.out.println("=============================");
			System.out.println("고용형태 : 임시직");
			System.out.println("이   름 : " + temporary.getName());
			temporary.getPays();
			
		}else {
			System.out.println("잘못입력하셨습니다.");
		}
		
		sc.close();
		
	}

}
