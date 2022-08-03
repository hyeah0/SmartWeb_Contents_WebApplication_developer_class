package khie;

import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

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

// 2. Adapter 클래스 구현 
class B  extends MouseAdapter {

	// 마우스 클릭시 시스템 종료 팝업창 
	@Override
	public void mouseClicked(MouseEvent e) {
		JOptionPane.showMessageDialog(null, "시스템 종료");
		System.exit(0); // 시스템 종료 메서드
	}
}

public class Ex28_Event_Adapter extends JFrame {

	public Ex28_Event_Adapter() {

		// 컨테이너 생성
		JPanel container = new JPanel();
		
		// 컴포넌트 생성
		JButton exit = new JButton("종 료");
		
		// 컴포넌트 -> 컨테이너
		container.add(exit);
		
		// 컨테이너 -> 프레임
		add(container);
		
		// 화면 설정 및 출력
		setBounds(100, 100, 300, 300);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setVisible(true);
		
		// B b = new B();
		// exit 컴포넌트에 이벤트 등록  
		 exit.addMouseListener(new B()); 
		 // ??? new b() ?? 생성자??
	}
	
	
	public static void main(String[] args) {
		new Ex28_Event_Adapter();
	}

}
