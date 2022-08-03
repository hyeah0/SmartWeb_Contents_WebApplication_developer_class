package khie;

import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

//무명클래스
public class Ex32_Event_Anonymous extends JFrame{

	public Ex32_Event_Anonymous() {

		// 타이틀
		setTitle("글자 이동");
		
		// 컨테이너
		JPanel con = new JPanel();
		
		// 컴포넌트
		JLabel label = new JLabel("JAVA");
		
		// 컴포넌트 -> 컨테이너
		con.add(label);
		
		// 컨테이너 -> 프레임
		add(con);
		
		// 화면 설정 및 출력
		setBounds(200, 200, 200, 200);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setVisible(true);
		
		// 이벤트 처리
		// 컨테이너에서 특정 영역에 마우스 클릭시 이벤트 진행
		con.addMouseListener(new MouseListener() {
			
			// 버튼이 눌렸다 떼어질때
			@Override
			public void mouseReleased(MouseEvent e) {
				// TODO Auto-generated method stub
				
			}
			
			// 버튼이 눌려질때
			@Override
			public void mousePressed(MouseEvent e) {

				int x = e.getX(); // 마우스 버튼이 눌려질때 x 좌표값
				int y = e.getY(); // 마우스 버튼이 눌려질때 y 좌표값
				
				// 라벨 컴포넌트 위치를 클릭한 (x,y)로 이동
				label.setLocation(x,y);
				
			}
			
			// 컴포넌트 위에 올라가있던 마우스가 해당 컴포넌트를 떠날때
			@Override
			public void mouseExited(MouseEvent e) {
				// TODO Auto-generated method stub
				
			}
			
			// 컴포넌트 위에 마우스가 올라왔을때
			@Override
			public void mouseEntered(MouseEvent e) {
				// TODO Auto-generated method stub
				
			}
			
			// 마우스 버튼이 클릭 되었을때
			@Override
			public void mouseClicked(MouseEvent e) {
				// TODO Auto-generated method stub
				
			}
		});
		
	
	
	}
	
	public static void main(String[] args) {
		new Ex32_Event_Anonymous();
	}

}
