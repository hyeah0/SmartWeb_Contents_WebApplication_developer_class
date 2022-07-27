package exam8;

public class Permanent extends Employee{
	// 멤버변수
		int salary = 0;
		int bonus = 0;
	
	// 기본생성자
		Permanent(){}
		
	// 인자생성자
		Permanent(String name, int salary, int bonus){
			this.setName(name);
			this.salary = salary;
			this.bonus = bonus;
		}
			
	// 멤버메서드
	@Override
	void getPays() {
		System.out.printf("급   여 : %,d원\n", salary+bonus);
	}

}
