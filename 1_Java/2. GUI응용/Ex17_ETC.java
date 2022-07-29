package khie;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.ScrollPaneConstants;

public class Ex17_ETC extends JFrame{

	public Ex17_ETC() {

		setTitle("기타예제");
	
		JPanel jPanel = new JPanel();
		
		// 컴포넌트
		// 1. 회원가입창
		JLabel jl1 = new JLabel("아이디 : ");
		JTextField id = new JTextField(15);
		
		// JPasswordField : 입력내용 숨김처리
		JLabel jl2 = new JLabel("비밀번호 : ");
		JPasswordField pwd = new JPasswordField(15);
		
		// JTextArea : 여러줄 작성
		JLabel jl3 = new JLabel("인사말 : ");
		JTextArea greeting = new JTextArea(5, 25); // 화면상 보이는 줄 : 5줄 줄이 추가될경우 스크롤바 필요
		JScrollPane jsp = new JScrollPane(greeting, ScrollPaneConstants.VERTICAL_SCROLLBAR_AS_NEEDED, ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);

		// setLineWrap() : JTextArea 컴포넌트에서 자동으로 줄바꿈 기능을 제공 메서드 boolean 타입 default false
		greeting.setLineWrap(true);
		
		//---------------------------------------------------------------------------------------------------------------//
		// 컴포넌트 -> 컨테이너
		jPanel.add(jl1); jPanel.add(id);
		jPanel.add(jl2); jPanel.add(pwd);
		
		jPanel.add(jl3); jPanel.add(jsp);
		
		// 컨테이너 -> 프레임
		add(jPanel);
		
		// 화면 설정 및 출력
		setBounds(200, 200, 280, 800);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setVisible(true);

	}
	
	public static void main(String[] args) {

		new Ex17_ETC();
		
	}

}
