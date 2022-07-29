package khie;

import java.awt.BorderLayout;
import java.awt.Panel;

import javax.swing.ButtonGroup;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JRadioButton;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.ScrollPaneConstants;

/*
 * [계산기]
 * 수 2개와 연산자를 입력 받아
 * 중간에는 결과값을
 * 하단에는 계산, 종료, 취소 버튼생성
 * 
 * 컨테이너 3개
 * 상단 : 라벨 (north)
 * 중간 : text (center)
 * 하단 : 버튼 (south)

 * ctrl + alt + 밑에 화살표 : 동일 코드 복사
 */

public class Ex21_Layout extends JFrame{

	// 기본생성자
	public Ex21_Layout() {

		setTitle("간단한 계산기");
		
		// 1. 컨테이너 생성(3개)
		Panel con1 = new Panel();	// 상단 : 입력값
		Panel con2 = new Panel();	// 중간 : 결과값
		Panel con3 = new Panel();	// 하단 : 버튼
	
		// 2. 컴포넌트 생성
		// 2-1. 상단 컨테이너 컴포넌트 (수1, 수2, 연산자)
		JLabel lNum1 = new JLabel("  수1 : ");
		JTextField tNum1 = new JTextField(5);

		JLabel lNum2 = new JLabel("  수2 : ");
		JTextField tNum2 = new JTextField(5);

		 JLabel lOp1 = new JLabel("연산자 : ");
		 JTextField tOp1 = new JTextField(5);
		
		// 라디오 버튼
		// JRadioButton rBtn1 = new JRadioButton("+");
		// JRadioButton rBtn2 = new JRadioButton("-");
		// JRadioButton rBtn3 = new JRadioButton("x");
		// JRadioButton rBtn4 = new JRadioButton("/");
		// JRadioButton rBtn5 = new JRadioButton("%");
		
		// 라디오 버튼 한개만 선택 될 수 있도록 ButtonGroup 객체 생성
		// ButtonGroup bGroup = new ButtonGroup();
		// bGroup.add(rBtn1);
		// bGroup.add(rBtn2);
		// bGroup.add(rBtn3);
		// bGroup.add(rBtn4);
		// bGroup.add(rBtn5);
		
		// 2-2. 중앙 컨테이너 컴포넌트 (값)
		JTextArea jta = new JTextArea(5,20); //5줄 20글자
		jta.setLineWrap(true);
		JScrollPane jsp = new JScrollPane(jta,ScrollPaneConstants.VERTICAL_SCROLLBAR_AS_NEEDED,ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);
		
		// 2-3. 하단 컨테이너 컴포넌트 (버튼)
		JButton btn1 = new JButton("계 산");
		JButton btn2 = new JButton("종 료");
		JButton btn3 = new JButton("취 소");
		
		// 3. 컴포넌트 -> 컨테이너
		// 3-1. 상단 컴포넌트
		con1.add(lNum1); con1.add(tNum1); 
		con1.add(lNum2); con1.add(tNum2); 
		con1.add(lOp1); con1.add(tOp1);
		// con1.add(rBtn1); con1.add(rBtn2); con1.add(rBtn3); con1.add(rBtn4); con1.add(rBtn5); 
		
		// 3-2. 중간 컴포넌트
		con2.add(jsp);
		
		// 3-3. 하단 컴포넌트
		con3.add(btn1);
		con3.add(btn2);
		con3.add(btn3);
		
		// 4. 컨테이너 -> 프레임
		// 레이아웃
		add(con1, BorderLayout.NORTH);
		add(con2, BorderLayout.CENTER);
		add(con3, BorderLayout.SOUTH);
		
		// 4. 화면 설정 및 출력
		setBounds(200, 200, 400, 300);
		
		// pack() : - JFrame에 올라는 컴포넌트를 알맞게 프레임 크기를 조절해주는 메서드
		//			- 공백 제거 메서드
		pack();
		//창고정
		//.setResizable(false);

		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setVisible(true);
	}

	public static void main(String[] args) {
		new Ex21_Layout();
		
		
	}

}
