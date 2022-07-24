package exam_2_1;

/*
 * [문제]
 * 다중 for문 응용
 * 다음과 같은 출력결과가 나타나도록 하시오
 *  ABCDEFGHIJKLMNOPQRSTUVWXYZ
	ABCDEFGHIJKLMNOPQRSTUVWXY
	ABCDEFGHIJKLMNOPQRSTUVWX
	ABCDEFGHIJKLMNOPQRSTUVW
	ABCDEFGHIJKLMNOPQRSTUV
	ABCDEFGHIJKLMNOPQRSTU
	ABCDEFGHIJKLMNOPQRST
	ABCDEFGHIJKLMNOPQRS
	ABCDEFGHIJKLMNOPQR
	ABCDEFGHIJKLMNOPQ
	ABCDEFGHIJKLMNOP
	ABCDEFGHIJKLMNO
	ABCDEFGHIJKLMN
	ABCDEFGHIJKLM
	ABCDEFGHIJKL
	ABCDEFGHIJK
	ABCDEFGHIJ
	ABCDEFGHI
	ABCDEFGH
	ABCDEFG
	ABCDEF
	ABCDE
	ABCD
	ABC
	AB
	A
 */

public class Exam4_abc_ab_a {

	public static void main(String[] args) {

		for(char i='Z'; i>='A'; i--) {
			for(char j='A'; j<=i; j++) {
				System.out.print(j);
			}
			System.out.println();
		}
			
	}	
}


