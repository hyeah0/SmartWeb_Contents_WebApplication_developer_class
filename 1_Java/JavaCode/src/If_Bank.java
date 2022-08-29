import java.util.Scanner;


public class If_Bank {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		String answer;
		int saving;
		int debt;
		int workedYear;
		String name;
		
		System.out.println("\n****ROYAL BANK OF JAVA****");
		System.out.println("Are you here to get a mortgage? (yes or no)");
		
		answer = sc.next();
		
		if(answer.equalsIgnoreCase("yes")) {
			System.out.println("\nGreat! In one line" + 
		                       "\nHow much money do you have in your savings?" +
		                       "\nAnd, how much do you owe in credit card debt?" );
		
			saving = sc.nextInt();
			debt = sc.nextInt();
			System.out.println("How many years have you worked for?");
			workedYear = sc.nextInt();
			
			sc.nextLine();
			System.out.println("What is your name?");
			name = sc.nextLine();
			
			if(saving >= 1000 && debt < 5000 && workedYear > 2) {
				System.out.println("Congratulations " + name + ", you have been approved!");
			}else {
				System.out.println("Sorry, you are not eligible for a mortage.");
			}
		
		}else {
			System.out.println("\nOk. Have a nice day!");
		}
		
		sc.close();
		
	}

}


/*
 * mortgage : 대출
 * saving : 저금, 저축한 돈
 * debt : 빚
 */