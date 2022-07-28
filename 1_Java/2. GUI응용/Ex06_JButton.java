package khie;

import javax.swing.*;

public class Ex06_JButton extends JFrame {
	
	// 기본생성자
	public Ex06_JButton() {
		
		setTitle("JButton 예제");
		
		// 1. 컨테이너 생성
		JPanel jPanel = new JPanel();
		
		// 2. 컴포넌트 생성
		JButton jBtn1 = new JButton("JButton 1");
		JButton jBtn2 = new JButton("한글버튼 2");
		JButton jBtn3 = new JButton("버튼 3");
		
		// 3. 컴포넌트 -> 컨테이너에 올리기
		jPanel.add(jBtn1);
		jPanel.add(jBtn2);
		jPanel.add(jBtn3);
		
		// 4. 컨테이너 -> 프레임에 올리기
		add(jPanel);
	
		setBounds(100,300,500,800);
		setVisible(true);
		
	}
	
	public static void main(String[] args) {
		new Ex06_JButton();
	}

}
