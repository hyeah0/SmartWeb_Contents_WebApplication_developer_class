package exam5;

import java.util.Scanner;

class Rectangle{
	//멤버변수
	int width;	//가로
	int height;	//세로
	
	//기본생성자
	public Rectangle() {}
	
	//인자생성자
	public Rectangle(int width, int height) {
		this.width = width;
		this.height = height;
	}
	
	//멤버메서드
	// 1. 사각형의 넓이를 구하는 메서드
	// 사각형의 넓이 : 가로 * 높이 
	void calcArea() {
		int area = width * height;
		System.out.println("사각형의 넓이 : " + area);
	}
	
	// 2. 사각형의 둘레를 구하는 메서드
	// 사각형의 둘레 : （가로의 길이 ＋ 세로의 길이）X 2
	void calcCir() {
		int circumference = (width+height)*2; 		// circumference : 둘레
		System.out.println("사각형의 둘레 : " + circumference);
	}
}

public class Ex5_2_Rectangle {

	public static void main(String[] args) {

		System.out.println("사각형의 가로,세로를 입력하세요.");
		Scanner sc = new Scanner(System.in);
		Rectangle rectangle = new Rectangle(sc.nextInt(),sc.nextInt());
		
		System.out.println("=========================");
		rectangle.calcArea();
		rectangle.calcCir();
		
		sc.close();
	}
}
