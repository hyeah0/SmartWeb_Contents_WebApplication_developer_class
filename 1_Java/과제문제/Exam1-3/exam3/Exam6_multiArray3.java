package exam_3;

/*
 *[문제]
 *아래와 같은 결과가 나타나도록 코딩해보세요
	1	
	2	3	
	4	5	6	
	7	8	9	10	
	11	12	13	14	15	
 */

public class Exam6_multiArray3 {

	public static void main(String[] args) {

		int count = 1;
		int[][] arr = new int[5][];
		arr[0] = new int[1];
		arr[1] = new int[2];
		arr[2] = new int[3];
		arr[3] = new int[4];
		arr[4] = new int[5];
		
		for(int i=0; i<arr.length; i++) {
			for(int j=0; j<arr[i].length; j++) {
				arr[i][j] = count;
				System.out.print(count + "\t");
				count++;
			}
			System.out.println();
		}
		
	}

}
