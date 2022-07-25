package exam5;

import java.util.Scanner;

class Temporary{
	//멤버변수
	String name;
	int time;
	int pay;	//시급
// 	int total;
// 	int tax;
	//= (int) (total * 0.03);
	
	//기본생성자
	Temporary(){}
	
	//인자생성자
	Temporary(String name, int time, int pay){
		this.name = name;
		this.time = time;
		this.pay = pay;
	}
	
	//멤버메서드
	//1. 총급여액
// 	void outputTotal() {
// 		total = time*pay;
// 		System.out.printf("총급여 : %,d원\n", total);
// 	}
	
	//2. 공제액
// 	void outputTax() {
// 		tax = (int)(total*0.03);
// 		System.out.printf("공제액 : %,d원\n", tax);
// 	}
	
	//3. 실지급액
// 	void outputPayroll() {
// 		System.out.printf("실지급액 : %,d원\n", (total-tax));
// 	}
	
	// 이름,총급여액,공제액,실지급액
	void payroll() {
		int total = time * pay;
		int tax = (int)(total * 0.03);
		System.out.println("이름 : " + name);
		System.out.printf("총급여 : %,10d원\n", total);
		System.out.printf("공제액 : %,10d원\n", tax);
		System.out.printf("실지급액 : %,10d원\n", (total-tax));
	}
}

public class Ex5_4_Temporary {

	public static void main(String[] args) {
		System.out.println("이름,작업시간,시간당 급여를 입력하세요.");
		Scanner sc = new Scanner(System.in);
		Temporary temporary = new Temporary(sc.next(),sc.nextInt(),sc.nextInt());
		
		System.out.println("===============================");
// 		System.out.println("이름 : " + temporary.name);
// 		temporary.outputTotal();
// 		temporary.outputTax();
// 		temporary.outputPayroll();
		temporary.payroll();
		
		sc.close();
	}
}
