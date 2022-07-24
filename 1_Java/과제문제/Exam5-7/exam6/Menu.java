package exam6;

public class Menu {

	//멤버변수
	String menu;		//메뉴명
	int price;			//단가
	int cnt;			//수량
	int total;			//금액 = 단가 * 수량
	
	//기본생성자
	Menu(){}
	
	//인자생성자
	Menu(String menu, int price, int cnt){
		this.menu = menu;
		this.price = price;
		this.cnt = cnt;
	}
	
	//멤버메서드
	//1.메뉴출력
	void outputMenu() {
		total = price * cnt;
		System.out.printf(" %s\t %,5d\t %,2d\t %,5d원\n",menu,price,cnt,total);
	}
	
}
