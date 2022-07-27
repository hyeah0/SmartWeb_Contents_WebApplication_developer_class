package exam8;

public class Rectangle implements Shape{
	// 멤버변수
	int width;  
	int height;
	
	// 기본생성자
	Rectangle(){}
	
	// 인자생성자
	Rectangle(int width, int height){
		this.width = width;
		this.height = height;
	}
	
	// 멤버메서드
	// 추상메서드 오버라이딩
	// 면적 메서드
	@Override
	public double findArea() {
		return width*height;
	}
}
