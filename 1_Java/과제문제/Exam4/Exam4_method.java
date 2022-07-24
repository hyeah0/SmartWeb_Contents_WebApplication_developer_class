package exam4_method;

//import java.util.Arrays;
import java.util.Scanner;

public class Exam4_method {

	//1. 학생등록
	public static void register(String[] sName, int[] sNum, String[] sMajor, String[] sPhone, Scanner sc) {
		System.out.println(">>>>>>>>>>>>>>>> 학생을 등록합니다.");
		for(int i=0; i<sName.length; i++) {
			 System.out.print("이름을 입력하세요 : ");
			 sName[i] = sc.next();
			 System.out.print("학번을 입력하세요 : ");
			 sNum[i] = sc.nextInt();
			 System.out.print("학과를 입력하세요 : ");
			 sMajor[i] = sc.next();
			 System.out.print("전화번호를 입력하세요 : ");
			 sPhone[i] = sc.next();
		}

	}
	
	//2. 전체출력
	public static void printStudents(String[] sName, int[] sNum, String[] sMajor, String[] sPhone) {
//		System.out.println(">>>>>>>>>>>>>>>> 전체 학생 리스트 입니다. (총 학생수 : " + sName.length + "명");
		
		for(int i=0; i<sName.length; i++) {
			System.out.print(sName[i] + "\t");
			System.out.print(sNum[i] + "\t");
			System.out.print(sMajor[i] + "\t");
			System.out.print(sPhone[i] + "\n");
			System.out.println();
		}
		
	}
	
	//3. 학생조회
	public static void findStudent(String[] sName, int[] sNum, String[] sMajor, String[] sPhone, Scanner sc) {
		//1. 학번 검색
		System.out.println(">>>>>>>>>>>>>>>> 학생을 조회합니다.");
		System.out.print("학번을 입력하세요 : ");
		int wtf = sc.nextInt(); // wantToFind
		
		//2. 찾기
		for(int i=0; i<sName.length ; i++) {
			if(wtf == sNum[i]) {
				System.out.print(sName[i] + "\t");
				System.out.print(sNum[i] + "\t");
				System.out.print(sMajor[i] + "\t");
				System.out.print(sPhone[i] + "\n");
				break;
			}else if(wtf != sNum[i]){
				System.out.println("검색한 학번이 없습니다.");
				break;
			}
			System.out.println();
		}		
	}

	//4. 수정 메서드
	public static void changeValue(String[] sName, int[] sNum, String[] sMajor, String[] sPhone, Scanner sc) {
		//1. 학번 입력
		System.out.println(">>>>>>>>>>>>>>>> 학생의 학과와 전화번호를 수정 합니다.");
		System.out.print("학번을 입력하세요 : ");
		int wtc = sc.nextInt(); // wantToChange
		
		//2.학번을 입력 받아 학과와 전화번호 수정
		for(int i=0; i<sName.length ; i++) {
			if(wtc == sNum[i]) {
				//1. 학과 수정
				System.out.print("수정할 학과를 입력해 주세요 : ");
				sMajor[i] = sc.next();
				System.out.print("수정할 전화번호를 입력해 주세요 : ");
				sPhone[i] = sc.next();
				
				System.out.println("수정이 완료되었습니다.");
				System.out.print(sName[i] + "\t");
				System.out.print(sNum[i] + "\t");
				System.out.print(sMajor[i] + "\t");
				System.out.print(sPhone[i] + "\n");
			}else {
				break;
			}
			System.out.println();
		}	
	}
	
	//5. 프로그램 종료 메서드
	public static void programContinue(Scanner sc) {
		System.out.print(">>>>>>>>>>>>>>>> 프로그램을 종료하시겠습니까? (y/n)");
		String answer = sc.next();
		
		if(answer.equalsIgnoreCase("y")) {
			System.out.println("프로그램을 종료합니다.");
			System.exit(0);
		}
	}
	
	
	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		System.out.print("전체 학생수를 입력해 주세요 : ");
		int studentsTotal = sc.nextInt(); //전체 학생수 
		
		//1. 데이터 배열 
		String[] studentName = new String[studentsTotal]; //이름
		int[] studentNum = new int[studentsTotal]; //학번
		String[] studentMajor = new String[studentsTotal]; //학과
		String[] studentPhone = new String[studentsTotal]; //핸드폰번호
		
		int chooseNum = 0;
		
		while(true) {	
			
			System.out.println("************** 학생관리 프로그램 **************");
			System.out.print("1. 학생등록 \t" );
			System.out.print("2. 전체출력 \t");
			System.out.print("3. 학생조회 \n");
			System.out.print("4. 정보수정 \t");
			System.out.print("5. 프로그램 종료 \n");
			System.out.println("*******************************************");
			
			System.out.print("메뉴를 선택해주세요 : ");
			chooseNum = sc.nextInt();
		
			switch(chooseNum) {
				case 1 :
					register(studentName,studentNum,studentMajor,studentPhone,sc);	
					break;
				case 2 :
					printStudents(studentName,studentNum,studentMajor,studentPhone);
					break;
				case 3 :
					findStudent(studentName,studentNum,studentMajor,studentPhone,sc);
					break;
				case 4 :
					changeValue(studentName,studentNum,studentMajor,studentPhone,sc);
					break;
				case 5 :
					programContinue(sc);
					break;
			}
			
			
		}
//		sc.close();
	}
}
