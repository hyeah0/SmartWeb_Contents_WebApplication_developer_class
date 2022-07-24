package exam4;

import java.util.Scanner;

public class Exam4_StudentsList {

	public static String end(Scanner sc) {
		// 5. 프로그램 종료
		String result = sc.next();
		return result;
	}

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("전체 학생 수는 ? >>> ");

		StudentsList[] list = new StudentsList[sc.nextInt()];
		String result = "";

		while (true) {
			System.out.println("***  학생 관리 프로그램  ***");
			System.out.println("***  1.   학생 등록    ***");
			System.out.println("***  2.   전체 출력    ***");
			System.out.println("***  3.   학생 조회    ***");
			System.out.println("***  4.   정보 수정    ***");
			System.out.println("***  5.  프로그램 종료  ***");
			System.out.println("************************\n");

			System.out.print("실행 메뉴 >>> ");
			int choose = sc.nextInt();

			switch (choose) {

				case 1:
					System.out.println("***                          1.   학생 등록                            ***");
					for (int i = 0; i < list.length; i++) {
						System.out.println("ㄴ 학번, 이름, 학과, 연락처를 적어주세요 ");
						list[i] = new StudentsList(sc.nextInt(), sc.next(), sc.next(), sc.next());
					}
					System.out.println();
					break;

				case 2:
					System.out.println("***                          2.   전체 출력                            ***");
					System.out.printf("%8s\t%8s\t%8s\t%8s\n", "학번", "이름", "학과", "연락처");
					for (int i = 0; i < list.length; i++) {
						list[i].info();
					}
					System.out.println();
					break;

				case 3:
					System.out.println("***                          3.   학생 조회                            ***");
					System.out.print("ㄴ 학번을 입력해주세요 :  ");
					int hakbun = sc.nextInt();
					System.out.printf("%8s\t%8s\t%8s\t%8s\n", "학번", "이름", "학과", "연락처");
					for (int i = 0; i < list.length; i++) {
						if (list[i].hakbun == hakbun) {
							list[i].info();
						}
					}
					System.out.println();
					break;

				case 4:
					System.out.println("***                      4.   정보 수정                        ***");
					System.out.print("ㄴ 수정 할 학번을 입력해주세요 :  ");
					hakbun = sc.nextInt();
					for (int i = 0; i < list.length; i++) {
						if (list[i].hakbun == hakbun) {
							list[i].changeInfo();
							list[i].info();
						}
					}
					System.out.println();
					break;

				case 5:
					System.out.println("***                    5.   프로그램 종료                      ***");
					System.out.print("ㄴ프로그램을 종료하시겠습니까? (y : 종료 / n : 계속) >>> ");
					result = end(sc);
					System.out.println();
					break;

				default:
					System.out.println("번호를 다시 입력해주세요.");
			}

			if (result.equalsIgnoreCase("y")) {
				break;
			}
		}
		System.out.println("프로그램이 종료되었습니다.");
	}

}