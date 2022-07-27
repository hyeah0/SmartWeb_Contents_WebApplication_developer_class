package exam8;

public class Circle implements Shape{
	// 멤버변수
	final static double PI = 3.14;
	int radius;  // radius 반지름
	
	// 기본생성자
	Circle(){}
	
	// 인자생성자
	Circle(int radius){
		this.radius = radius;
	}
	
	// 멤버메서드
	// 추상메서드 오버라이딩
	// 면적 메서드
	@Override
	public double findArea() {
		return PI * radius * radius;
	}

}
