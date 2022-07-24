package exam5;

import javax.swing.JOptionPane;

class NameCard{
	//멤버변수
	String name; 
	String tel;
	String addr;
	String cmpRank;
	
	//기본생성자
	public NameCard(){}
	
	//인자생성자
	public NameCard(String name, String tel, String addr, String cmpRank){
		this.name = name;
		this.tel = tel;
		this.addr = addr;
		this.cmpRank = cmpRank;
	}
	
	//멤버메서드
	void outPutNCard() {
		System.out.println("이름 : " + name);
		System.out.println("전화번호 : " + tel);
		System.out.println("주소 : " + addr);
		System.out.println("직급 : " + cmpRank);
	}
}


public class Ex5_3_NameCard {

	public static void main(String[] args) {

		System.out.println("이름,전화번호,주소,직급을 입력하세요.");
		String name = JOptionPane.showInputDialog("이름을 입력하세요");
		String tel = JOptionPane.showInputDialog("전화번호를 입력하세요(형식 010-1234-1234)");
		String addr = JOptionPane.showInputDialog("주소를 입력하세요");
		String cmpRank = JOptionPane.showInputDialog("직급을 입력하세요");
		NameCard nameCard = new NameCard(name,tel,addr,cmpRank);
		
		System.out.println("============================");
		nameCard.outPutNCard();
	}
}
