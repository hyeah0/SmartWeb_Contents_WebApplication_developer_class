package exam_3;

/*
 * [문제]
 * 임의의 숫자 5개를 키보드로 입력받아 내림차순으로 정렬하여 출력하세요
 */

import java.util.Scanner;

public class Exam2_arrayDESC {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		int[] arr = new int[5];
		int tmp = 0;
		
		//1. 배열 데이터 등록
		System.out.println("5개의 숫자를 입력하세요");
		for(int i=0; i<arr.length; i++) {
			arr[i] = sc.nextInt();
		}
		
		//2. 내림차순
		for(int i=0; i<arr.length; i++) {
			for(int j=i+1; j<arr.length; j++) {
				if(arr[i]<arr[j]) {
					tmp = arr[i];
					arr[i] = arr[j];
					arr[j] = tmp;
				}
			}
		}
		
		//3. 반환
		System.out.println("===내림차순으로 정렬===");
		for(int i=0; i<arr.length; i++) {
			System.out.print(arr[i] + "\t");
		}	
		
		sc.close();
	}
	
}

