package khie;

import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;

// JMenu : 메뉴바

// 메모장 만들기
// 1. 메뉴바에 메뉴올리기 (파일, 편집, ... )
public class Ex16_JMenu extends JFrame{

	public Ex16_JMenu() {

		setTitle("JMenu 예제");
		
		// 0. 메뉴바 객체 생성
		JMenuBar bar = new JMenuBar();
		
		// 1. 메뉴생성 (파일, 글자, 도움말)
		JMenu jMenu1 = new JMenu("파일");
		JMenu jMenu2 = new JMenu("글자");
		JMenu jMenu3 = new JMenu("도움말");
		// sub 메뉴 (글자에 들어갈 예정)
		JMenu jMenu4 = new JMenu("글자체"); 
		JMenu jMenu5 = new JMenu("바탕색"); 
		
		// 2.   Menu Item 생성
		// 2-1. "파일" 메뉴에 들어갈 메뉴 아이템 생성
		JMenuItem jmi1 = new JMenuItem("새파일");
		JMenuItem jmi2 = new JMenuItem("열  기");
		JMenuItem jmi3 = new JMenuItem("저  장");
		JMenuItem jmi4 = new JMenuItem("종  료");
		
		// 2-2. "글자" 메뉴에 들어갈 메뉴 아이템 생성
			// 2-2-1. 글자-> 글자체 메뉴에 들어갈 메뉴 아이템
			JMenuItem jmi5 = new JMenuItem("굴림, 기본, 10");
			JMenuItem jmi6 = new JMenuItem("궁서, 기울기, 20");
			JMenuItem jmi7 = new JMenuItem("바른, 굵게, 8");
			
			// 2-2-2. 글자-> 바탕색 메뉴에 들어갈 메뉴 아이템
			JMenuItem jmi8 = new JMenuItem("노란색");
			JMenuItem jmi9 = new JMenuItem("분홍색");
			JMenuItem jmi10 = new JMenuItem("자주색");
		
		// 2-3. "도움말" 메뉴에 들어갈 메뉴 아이템 생성
		JMenuItem jmi11 = new JMenuItem("도움말");
		JMenuItem jmi12 = new JMenuItem("메모장 정보");
			
		// 3.   메뉴아이템 메뉴에 추가
		// 3-1. "파일" 이라는 메뉴에 들어갈 메뉴아이템 올리기
		jMenu1.add(jmi1);
		jMenu1.add(jmi2);
		jMenu1.add(jmi3);
		jMenu1.addSeparator(); // 구분선
		jMenu1.add(jmi4);
		
		// 3-2. "글자" 이라는 메뉴에 들어갈 메뉴 올리기
		jMenu2.add(jMenu4); // "글자" 메뉴에 "글자체" 메뉴 올리기
		jMenu2.addSeparator();
		jMenu2.add(jMenu5); // "글자" 메뉴에 "바탕색" 메뉴 올리기
		
		// 3-2-1. "글자체" 이라는 메뉴에 들어갈 메뉴아이템 올리기
		jMenu4.add(jmi5);
		jMenu4.add(jmi6);
		jMenu4.add(jmi7);
		
		// 3-2-2. "바탕색" 이라는 메뉴에 들어갈 메뉴아이템 올리기
		jMenu5.add(jmi8);
		jMenu5.add(jmi9);
		jMenu5.add(jmi10);
		
		// 3-3 "도움말" 이라는 메뉴에 들어갈 메뉴아이템 올리기
		jMenu3.add(jmi11);
		jMenu3.addSeparator();
		jMenu3.add(jmi12);
		
		// 4. 메뉴들 메뉴바에 올리기
		bar.add(jMenu1);
		bar.add(jMenu2);
		bar.add(jMenu3);
		
		// 5. 메뉴바를 프레임에 올리기
		setJMenuBar(bar);
		
		// 화면 설정 및 출력
		setBounds(200, 400, 500, 500);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setVisible(true);
	}
	
	public static void main(String[] args) {
		new Ex16_JMenu();
	}

}
