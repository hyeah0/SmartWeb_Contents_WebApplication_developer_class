package exam8;

public abstract class Employee {
	// 멤버변수
	private String name;
	
	// 일반생성자
	Employee(){}
	
	// 인자생성자
	Employee(String name){
		this.name = name;
	}
	
	// 멤버메서드
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	// 추상메서드
	abstract void getPays();

	
}
