package khie;

import javax.swing.*;
//import javax.swing.ButtonGroup;
//import javax.swing.JFrame;
//import javax.swing.JPanel;
//import javax.swing.JRadioButton;

// 라디오 버튼은 버튼 그룹에 추가해야 한개만 선택할 수 있다.

public class Ex09_JRadioButton_d14 extends JFrame{

	// 기본생성자 호출
	public Ex09_JRadioButton_d14() {

		setTitle("JRadioButton 예제");
		
		// 1. 경량컨테이너 생성
		JPanel jPanel = new JPanel();
		
		// 2. 컴포넌트 생성
		// 	2-1. 라디오 버튼생성
		JRadioButton radioBtn1 = new JRadioButton("오렌지", true); // true 체크된 상태
		JRadioButton radioBtn2 = new JRadioButton("사과");
		JRadioButton radioBtn3 = new JRadioButton("바나나");
		JRadioButton radioBtn4 = new JRadioButton("딸기");
		
		//  2-2 라디오 버튼 ButtonGroup에 올려야 한다.
		ButtonGroup bGroup = new ButtonGroup();
		bGroup.add(radioBtn1);
		bGroup.add(radioBtn2);
		bGroup.add(radioBtn3);
		bGroup.add(radioBtn4);
		
		// 3. 컴포넌트 -> 컨테이너
		jPanel.add(radioBtn1);
		jPanel.add(radioBtn2);
		jPanel.add(radioBtn3);
		jPanel.add(radioBtn4);
		
		// 4. 컨테이너 -> 프레임
		add(jPanel);
		
		// 창 위치와 크기 설정
		setBounds(400, 300, 300, 200);
		
		// 종료 버튼 종료
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		// 화면 출력
		setVisible(true);
	}
	
	public static void main(String[] args) {
	
		// Ex09_JRadioButton_d14 클래스에 기본생성자만 존재하고 기본생성자만 사용하여
		// Ex09_JRadioButton_d14 e 생략가능하다. 
		// == Ex09_JRadioButton_d14 e = new Ex09_JRadioButton_d14();
		
		new Ex09_JRadioButton_d14(); 
	}
}
