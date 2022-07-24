package exam7;

public class Permanent extends Employee{

	//부모변수 : name
	//멤버변수
	int pays = 0;
	int bonus = 0; //보너스 = 기본급 + 보너스
	
	//기본생성자
	Permanent(){};
	
	//인자생성자
	Permanent(String name, int pays, int bonus){
		this.name = name;
		this.pays = pays;
		this.bonus = bonus;
	}
	
	//멤버메서드
	@Override
	public void getPays(){
		System.out.println("고용형태 : 정규직");
		System.out.println("이름 : " + name);
		System.out.printf("급여 : %,d원\n", (pays+bonus));
	}

}
