package khie;

import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

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

// 3. Frame 클래스에 Listner 구현
// JFrame 클래스 상속, MouseLister 인터페이스 상속
public class Ex29_Event_Frame extends JFrame implements MouseListener{

	// 기본생성자
	public Ex29_Event_Frame() {
		
		// 타이틀
		setTitle("mouselistner");
		
		// 컨테이너
		JPanel con = new JPanel();
		
		// 컴포넌트
		JButton btn = new JButton("종료");
		
		// 컴포넌트 -> 컨테이너
		con.add(btn);
		
		// 컨테이너 -> 프레임
		add(con);
		
		// 화면 설정 및 출력
		setBounds(200, 200, 500, 500);
		//pack();
		setResizable(false);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setVisible(true);
		
		// 이벤트 등록
		btn.addMouseListener(this);
		
	}
	
	// 메인 메서드
	public static void main(String[] args) {

		new Ex29_Event_Frame();
	}

	// MouseListener 인터페이스 상속 받은 메서드
	@Override
	public void mouseClicked(MouseEvent e) {
		JOptionPane.showMessageDialog(null, "시스템을 종료합니다.");
		System.exit(0); //시스템 종료 메서드
	}

	@Override
	public void mousePressed(MouseEvent e) {	}

	@Override
	public void mouseReleased(MouseEvent e) {	}

	@Override
	public void mouseEntered(MouseEvent e) {	}

	@Override
	public void mouseExited(MouseEvent e) {		}

}
