package khie;

import javax.swing.*;

public class Ex07_JCheckBox extends JFrame {

	public Ex07_JCheckBox() {
		
		setTitle("체크박스 만들기");
		
		// 1. 컨테이너 생성
		JPanel jPanel = new JPanel();
		
		// 2. 컴포넌트 생성
		JCheckBox jCheckBox1 = new JCheckBox("게임");
		JCheckBox jCheckBox2 = new JCheckBox("여행", true); // true 값을 작성하면 default로 체크된다.
		JCheckBox jCheckBox3 = new JCheckBox("영화감상");
		JCheckBox jCheckBox4 = new JCheckBox("서핑");
		JCheckBox jCheckBox5 = new JCheckBox("tv보기");
	
		// 3. 컴포넌트 -> 컨테이너
		jPanel.add(jCheckBox1);
		jPanel.add(jCheckBox2);
		jPanel.add(jCheckBox3);
		jPanel.add(jCheckBox4);
		jPanel.add(jCheckBox5);
		
		// 4. 컨테이너 -> 프레임
		add(jPanel);
		
		setBounds(400, 300, 500, 300);
		setVisible(true);
	}
	
	public static void main(String[] args) {
		new Ex07_JCheckBox();
	}

}
