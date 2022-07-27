package exam8;

/*
 * 인터페이스 : Shape
 * 자식클래스 : Circle, Rectangle 
 */

import java.util.Scanner;

public class Ex8_2_Shape {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("도형을 선택하세요 (1.원형, 2.사각형)");
		System.out.print("도형 선택 >>> ");
		int shapeNum = sc.nextInt();
		
		switch(shapeNum) {
			case 1 :
				System.out.print("반지름 입력 >>> ");
				// 다형성을 이용한 메서드 출력
				Shape c = new Circle(sc.nextInt());
				//Circle c = new Circle(sc.nextInt());
				
				System.out.println("=======================");
				System.out.printf("원의 면적 : %.1f\n", c.findArea());
				//System.out.println("원의 면적 : " + c.findArea());
				break;
				
			case 2 :
				System.out.print("가로 >>> ");
				int width = sc.nextInt();
				System.out.print("세로 >>> ");
				int height = sc.nextInt();
				// 다형성을 이용한 메서드 출력
				Shape r = new Rectangle(width,height);
				//Rectangle r = new Rectangle(width,height);
				
				System.out.println("=======================");
				System.out.printf("사각형의 면적 : %.1f\n", r.findArea());
				//System.out.println("사각형의 면적 : " + r.findArea());
				break;
				
			default : 
				System.out.println("잘못입력하셨습니다.");
		}
		
		sc.close();
	}
}
