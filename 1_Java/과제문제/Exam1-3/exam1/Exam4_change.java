package exam_1;

import java.util.Scanner;

/*
 * [문제]
 * 키보드로 임의의 숫자 4자리 입력 받는다
 * 오천원 몇장, 천원 몇장, 오백원 몇개, 백원 몇개
 * 오십원 몇개, 십원 몇개, 일원 몇개로 구성되어 있는지 화면에 출력
 * 예시 ) 3781 = 천원 3장, 오백원 1개, 백원 2개, 오십원 1개, 십원 3개, 일원 1개
 * 
 */

public class Exam4_change {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		System.out.print("입력받은 숫자 ==> ");
		int num = sc.nextInt();
		int[] moneyUnit = {5000,1000,500,100,50,10,1};
		
		for(int i=0; i<moneyUnit.length; i++) {
			if(moneyUnit[i]>=1000) {
				System.out.println(moneyUnit[i] + "원 지폐 : " + num/moneyUnit[i] + "장");
			}else {
				System.out.println(moneyUnit[i] + "원 동전 : " + num/moneyUnit[i] + "개");
			}
			num %= moneyUnit[i];	
		}
		
		sc.close();
	}

}

//참고 링크 : https://kutar37.tistory.com/entry/%EC%9E%90%EB%B0%94Java-%EA%B1%B0%EC%8A%A4%EB%A6%84%EB%8F%88-%EA%B3%84%EC%82%B0


