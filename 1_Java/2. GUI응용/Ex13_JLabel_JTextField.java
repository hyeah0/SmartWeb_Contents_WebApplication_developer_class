package khie;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

/*
 * JFrame 객체 생성해서 진행시 화면전환에 있어 어려움이 있음
 * 따라서 JFrame을 상속받아 진행하는 방식을 선호
 */

// JLabel_JTextField : input 창
public class Ex13_JLabel_JTextField extends JFrame {

	// 기본생성자
	public Ex13_JLabel_JTextField() {
	
		// 타이틀
		setTitle("JLabel_JTextField 예제");
		
		// 컨테이너
		JPanel jPanel = new JPanel();
		
		// 컴포넌트
		JLabel jl1 = new JLabel("이  름 : ");
		JTextField name = new JTextField(15); // 15 글자수를 이용할 수 있다.
		
		JLabel jl2 = new JLabel("학  과 : ");
		JTextField major = new JTextField(15);
		
		JLabel jl3 = new JLabel("주  소 : ");
		JTextField addr = new JTextField(15);
		
		JButton jButton = new JButton("확인");
		
		// 컴포넌트 -> 컨테이너
		jPanel.add(jl1); jPanel.add(name);
		jPanel.add(jl2); jPanel.add(major);
		jPanel.add(jl3); jPanel.add(addr);
		jPanel.add(jButton);
		
		// 컨테이너 -> 프레임
		add(jPanel);
		
		// 화면위치 크기
		setBounds(400, 400, 250, 500);
		
		// 종료
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		// 출력
		setVisible(true);
	}
	

	
	public static void main(String[] args) {

		new Ex13_JLabel_JTextField();
	
	}

}
