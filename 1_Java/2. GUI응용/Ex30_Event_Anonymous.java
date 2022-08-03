package khie;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

/*
 * 1. Listener 인터페이스를 구현하는 방법
 * 2. Adapter 클래스를 구현하는 방법
 * 3. Frame 클래스에 Listener 구현하는 방법 - 가장 많이 사용.
 * 4. 익명 클래스를 이용하는 방법 - 많이 사용이 됨.
 */

// 4. 익명 클래스를 이용하는 방법
public class Ex30_Event_Anonymous extends JFrame{

	public Ex30_Event_Anonymous() {

		// 컨테이너
		JPanel con = new JPanel();
	
		// 컴포넌트
		JButton btn = new JButton("종료");
		
		// 컴포넌트 -> 컨테이너
		con.add(btn);
		
		// 컨테이너 -> 프레임
		add(con);
		
		// 화면 설정 및 출력
		setBounds(200, 200, 200, 200);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setVisible(true);
		
		// 이벤트 처리(익명클래스)
		btn.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {

				JOptionPane.showMessageDialog(null, "시스템을 종료합니다.");
				System.exit(0);
			}
		});
		
		
	}

	public static void main(String[] args) {
		new Ex30_Event_Anonymous();
	}

}
