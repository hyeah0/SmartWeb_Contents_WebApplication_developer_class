package exam_2_2;

/*
 * [문제]
 * 제어문과 반복문
 * 1 -2 + 3 -4 + 5 ... -100 ==> hap -50
 */

public class Exam1_1_2_3 {

	public static void main(String[] args) {

		int hap = 0;

		for(int i=1; i<=100; i++) {
			
			if((i%2)==0) {
				hap -= i; 
			}else {
				hap += i; 
			}			
			
		}
		
		System.out.println("hap ==> " + hap);
	}

}
