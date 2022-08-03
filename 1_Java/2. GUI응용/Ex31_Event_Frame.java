package khie;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class Ex31_Event_Frame extends JFrame implements ActionListener{

	JLabel result;
	
	public Ex31_Event_Frame() {

		// 타이틀
		setTitle("이벤트 예제");
		
		// 컨테이너
		JPanel container = new JPanel();
	
		// 컴포넌트
		JButton male = new JButton("남자");
		JButton female = new JButton("여자");
		JLabel jl1 = new JLabel("당신의 성별은? >>> ");
		
		// 결과 출력 컴포넌트
		result = new JLabel("");
		result.setForeground(Color.BLUE); //글자색 지정
		
		// 컴포넌트 -> 컨테이너
		container.add(male);
		container.add(female);
		container.add(jl1);
		container.add(result);
		
		// 컨테이너 -> 프레임
		add(container);
		
		// 화면 설정 및 출력
		setBounds(200, 200, 200, 200);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setVisible(true);
		
		// 이벤트처리
		// 이벤트를 받을 컴포넌트에 이벤트 리스너 등록
		male.addActionListener(this);
		female.addActionListener(this);
		
	}
	
	
	public static void main(String[] args) {

		new Ex31_Event_Frame();
	}


	@Override
	public void actionPerformed(ActionEvent e) {
		
		/* 
		 * getActionCommand()
		 * 이벤트를 처리한 컴포넌트(버튼)의 타이틀(문자열)을 가져오는 메서드 
		 */ 
		
		String str = e.getActionCommand();
		result.setText(str);
	}

}
