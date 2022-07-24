package exam_3;

/*
 *[문제]
 *아래와 같은 결과가 나타나도록 코딩해보세요
	1	6	11	16	21	
	2	7	12	17	22	
	3	8	13	18	23	
	4	9	14	19	24	
	5	10	15	20	25	
 */

public class Exam5_multiArray2 {

	public static void main(String[] args) {
		int[][] arr = new int[5][5];
		int count = 1;
		
		//1. 배열에 데이터 할당 및 반환
		for(int i=0; i<arr.length; i++) {
			count = i + 1;
			for(int j=0; j<arr[i].length; j++) {
				arr[i][j] = count;
				System.out.print(count + "\t");
				count += 5;
			}
			System.out.println();
		}
		
	}

}
