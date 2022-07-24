package exam4;

import java.util.Scanner;

public class StudentsList {
	Scanner sc = new Scanner(System.in);

	// 멤버변수
	int hakbun = 0;
	String name = "-";
	String major = "-";
	String tel = "-";

	// 기본생성자
	public StudentsList() {

	}

	// 인자생성자
	public StudentsList(int hakbun, String name, String major, String tel) {
		this.hakbun = hakbun;
		this.name = name;
		this.major = major;
		this.tel = tel;
	}

	// 멤버메서드
	// 2. 전체 학생 출력
	void info() {
		System.out.printf("%8d\t%8s\t%8s\t%14s\n", hakbun, name, major, tel);
	}

	// 4. 정보 수정
	void changeInfo() {
		System.out.println("<<                            수정전                            >>");
		System.out.printf("%8s\t%8s\t%8s\t%8s\n", "학번", "이름", "학과", "연락처");
		System.out.printf("%8d\t%8s\t%8s\t%14s\n", hakbun, name, major, tel);
		System.out.println();

		System.out.print("수정 할 학과를 입력하세요 : ");
		major = sc.next();
		System.out.print("수정 할 연락처를 입력하세요 : ");
		tel = sc.next();
		System.out.println("정보가 수정 되었습니다.");
		System.out.println();

		System.out.println("<<                            수정후                            >>");
		System.out.printf("%8s\t%8s\t%8s\t%8s\n", "학번", "이름", "학과", "연락처");
	}

}
