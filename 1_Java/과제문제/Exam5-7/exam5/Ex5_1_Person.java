package exam5;

import java.util.Scanner;

class Person {

	//멤버변수
	String name;
	String m_f;
	int age;
	
	//기본생성자
	public Person() {}
	
	//인자생성자
	public Person(String name, String m_f, int age) {
		this.name = name;
		this.m_f = m_f;
		this.age = age;
	}
	
	//멤버메서드
	void output() {
		System.out.println("이름 : " + name);
		System.out.println("성별 : " + m_f);
		System.out.println("나이 : " + age + "세");
	}
}

public class Ex5_1_Person {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		System.out.println("이름, 성별(male/female),나이를 입력하세요.");
		Person person = new Person(sc.next(),sc.next(),sc.nextInt());
		
		System.out.println("====================================");
		person.output();
		
		sc.close();
	}
}
