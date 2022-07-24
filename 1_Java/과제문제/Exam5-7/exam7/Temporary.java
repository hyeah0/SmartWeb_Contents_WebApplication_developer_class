package exam7;

public class Temporary extends Employee{

	//부모변수 : name
	//멤버변수
	int time = 0;
	int pay = 0;  //시급

	//기본생성자
	Temporary(){};
	
	//인자생성자
	Temporary(String name, int time, int pay){
		this.name = name;
		this.time = time;
		this.pay = pay;
	}
	
	//멤버메서드
	@Override
	void getPays() {
		System.out.println("고용형태 : 임시직");
		System.out.println("이름 : " + name);
		System.out.printf("급여 : %,d원\n", (time*pay));
	}

}
