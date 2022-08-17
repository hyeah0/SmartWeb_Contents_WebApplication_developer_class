package movie_login;

import javax.swing.JFrame;

public class MainPage extends JFrame{

	public MainPage() {
		// 화면 출력
		// 하단 두개 공통 사항(개인작업시 확인용)
		setTitle("메인 페이지");
		
		setSize(700,900);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		setVisible(true);
			
	}
	
	public static void main(String[] args) {

		new MainPage();
		
	}

}
