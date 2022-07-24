package exam_3;

import java.util.Scanner;

/*
 * [문제]
 * 최대값 최소값
 * 키보드로 배열의 크기를 입력받아 생성된 배열요소 만큼 임의의 정수를 입력받은 후 
 * 그 중 최대값과 최소값을 구하세요
 */

public class Exam1_arrayMax {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		System.out.print("배열크기:");
		int[] arr = new int[sc.nextInt()];
		int max = 0;
		
		
		// 1. 배열 데이터 등록
		for(int i=0; i<arr.length; i++) {
			System.out.print((i+1) + " 번째 값 입력 : ");
			arr[i] = sc.nextInt();
		}
		
		// 2. 최대값
		for(int i=0; i<arr.length; i++) {
			if(max<arr[i]) {
				max = arr[i];
			}
		}
		
		// 3. 최소값
		int min = arr[1];
		for(int i=1; i<arr.length; i++) {
			if(min>arr[i]) {
				min = arr[i];
			}
		}
		
		System.out.printf("max : %d, min: %d", max, min);
		
		sc.close();
	}

}
