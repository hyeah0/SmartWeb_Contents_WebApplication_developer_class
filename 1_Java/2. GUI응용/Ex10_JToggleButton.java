package khie;


import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JToggleButton;

// JToggleButton : 한번누르면 on, 한번누르면 off (스위치) 
/*
 * - java.lang.Object
 	- java.awt.Component
 		- java.awt.Container
 			- javax.swing.JComponent
 				- javax.swing.AbstractButton
 					- javax.swing.JToggleButton
 */

public class Ex10_JToggleButton extends JFrame{

	public Ex10_JToggleButton() {

		setTitle("JToggleButton 예제");
		
		// 1. 컨테이너
		JPanel jPanel = new JPanel();
		
		// 2. 컴포넌트
		JToggleButton jTBtn = new JToggleButton("ToggleButton");
		
		// 3. 컴포넌트 -> 컨테이너
		jPanel.add(jTBtn);
		
		// 4. 컨테이너 -> 프레임
		add(jPanel);
		
		// 5. 화면 위치, 크기 설정
		setBounds(500, 500, 300, 300);
		
		// 6. 종료버튼
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		// 7. 실행
		setVisible(true);
		
	}
	
	public static void main(String[] args) {
		new Ex10_JToggleButton();
	}

}
