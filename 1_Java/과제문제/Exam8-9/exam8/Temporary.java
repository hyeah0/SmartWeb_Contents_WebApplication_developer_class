package exam8;

public class Temporary extends Employee{

	// 멤버변수
	int time = 0;
	int pay = 0;

	// 기본생성자
		Temporary(){}
		
	// 인자생성자
		Temporary(String name, int time, int pay){
			this.setName(name);
			this.time = time;
			this.pay = pay;
		}
			
	// 멤버메서드
	@Override
	void getPays() {
		System.out.printf("급   여 : %,d원\n", time*pay);
	}

}
	

