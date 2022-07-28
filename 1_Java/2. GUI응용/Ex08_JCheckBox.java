package khie;

import javax.swing.*;

public class Ex08_JCheckBox extends JFrame {

	//기본생성자 호출
	public Ex08_JCheckBox() {

		//타이틀
		setTitle("과일 체크박스 예제");
		
		// 1. 컨테이너
		JPanel container = new JPanel();
		
		// 2-1 이미지 아이콘 
		ImageIcon kiwi = new ImageIcon("images/kiwi.jpg");
		ImageIcon mango = new ImageIcon("images/mango.jpg");
		ImageIcon apple = new ImageIcon("images/apple.jpg");
		
		// 2-2 컴포넌트
		JCheckBoxMenuItem menuItem1 = new JCheckBoxMenuItem("키위",kiwi);
		JCheckBoxMenuItem menuItem2 = new JCheckBoxMenuItem("망고",mango);
		JCheckBoxMenuItem menuItem3 = new JCheckBoxMenuItem("사과",apple);
		
		// 3. 컴포넌트 -> 컨테이너
		container.add(menuItem1);
		container.add(menuItem2);
		container.add(menuItem3);
		
		// 4. 컨테이너 -> 프레임
		add(container);
		
		setBounds(300, 400, 800, 800);
		// 프레임 크기 고정
		// false 일경우 프레임 크기 고정
		setResizable(false); 
		
		// 프레임에서 x 버튼 클릭시 종료 메서드
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		setVisible(true);
	}
	
	public static void main(String[] args) {
		new Ex08_JCheckBox();
	}

}
