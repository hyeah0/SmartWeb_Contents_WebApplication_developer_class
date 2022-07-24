package exam_2_1;

/*
 * [문제]
 * 다중 for문 응용
 * 다중 for문을 적용하여 하단과 같은 출력결과가 나타나도록 하세요 (가장많은 별은 6개) 
 * *
 * **
 * ***
 * ****
 * *****
 * ******
 * *****
 * ****
 * ***
 * **
 * *
 */

public class Exam3_star {

	public static void main(String[] args) {

		int row = 11;
		int halfRow = row/2;
		
		for(int i=0; i<=halfRow; i++) {
			for(int j=0; j<=i; j++) {
				System.out.print("*");
			}
			System.out.println();
		}
		for(int i=0; i<halfRow; i++) {
			for(int j=halfRow; j>i; j--) {
				System.out.print("*");
			}
			System.out.println();
		}
		
		
	}

}
