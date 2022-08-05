package khie;

import java.awt.Color;
import java.awt.event.KeyEvent;

import javax.swing.JFrame;
import javax.swing.JLabel;

public class Ex33_Event extends JFrame{

	public Ex33_Event() {
	
		setTitle("키 이벤트 처리");
		JPanel container = new JPanel();
		JLabel label = new JLabel();
		container.add(label);
		add(container);
		
		/*
		 * 키 이벤트는 포커스가 위치해 있어야 키 이벤트가 발생을 한다.
		 * 강제적으로 포커스 설정이 필요
		 * 키 이벤트는 포커스를 받을 수 있는 컴포넌트를 우선적으로 입력받기 위해 
		 * setFocusable(true)
		 */
		
		container.setFocusable(true);
	
		// 화면 설정 및 출력
		setBounds(100,100,500,500);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setVisible(true);
		
		
		// 키보드 눌렀다가 땠을때 실행 메서드
		container.addKeyListener(new KeyListener() {
			
			@Override
			public void keyTyped(KeyEvent e) {		}
			
			@Override
			public void keyReleased(KeyEvent e) {

				String str = KeyEvent.getKeyText(e.getKeyCode());
				label.setText(str + "키가 입력되었습니다.");
				
				if(e.getKeyCode() == KeyEvent.VK_F1) {
					container.setBackground(Color.black);
				}else if(e.getKeyCode() == KeyEvent.VK_ESCAPE) {
					container.setBackground(Color.pink);
				}
		
			}
	
			@Override
			public void keyPressed(KeyEvent e) {	}
	
		});
	
	}
	
	
	
	public static void main(String[] args) {

		
		
		
		
		
	}

}
