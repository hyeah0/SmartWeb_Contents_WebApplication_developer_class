package khie;

import java.awt.Color;

import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTabbedPane;
import javax.swing.JTextField;

// JTabbedPane : - 리스트를 누를때마다 해당하는 페이지로 이동
//				 - 리스트 갯수별 컨테이너 필요
public class Ex15_JTabbedPane extends JFrame{

	public Ex15_JTabbedPane() {

		setTitle("JTabbedPane 예제");
	
		// 0. JTabbedPane 객체 생성
		JTabbedPane tab = new JTabbedPane();
		
		// 1. 탭의 갯수만큼의 컨테이너 필요
		JPanel container1 = new JPanel();
		JPanel container2 = new JPanel();
		JPanel container3 = new JPanel();
		
			// 1-2. 컨테이너별 배경색 상이하게 설정
			container1.setBackground(Color.GRAY);
			container2.setBackground(Color.ORANGE);
			container3.setBackground(Color.GREEN);
		
		// 2. 컴포넌트 생성(탭 갯수만큼)
			// 2-1. 첫번째 탭에 올라갈 컴포넌트 생성(버튼)
			JButton btn1 = new JButton("버튼1");
			JButton btn2 = new JButton("버튼2");
			JButton btn3 = new JButton("버튼3");
			
			// 2-2 두번째 탭에 올라갈 컴포넌트 생성(체크박스)
			JCheckBox jcb1 = new JCheckBox("프랑스");
			JCheckBox jcb2 = new JCheckBox("영국");
			JCheckBox jcb3 = new JCheckBox("스페인");
			JCheckBox jcb4 = new JCheckBox("벨기에");
			
			// 2-3 세번째 탭에 올라갈 컴포넌트 생성
			JLabel jl1 = new JLabel("이름 : ");
			JTextField name1 = new JTextField(15);
			
			JLabel jl2 = new JLabel("이름 : ");
			JTextField name2 = new JTextField(15);
			
			JLabel jl3 = new JLabel("이름 : ");
			JTextField name3 = new JTextField(15);	
		
		// 3. 컴포넌트 -> 컨테이너
			// 3-1. 첫번째 탭에 올라갈 컨테이너
			container1.add(btn1);
			container1.add(btn2);
			container1.add(btn3);
			
			// 3-2. 두번째 탭에 올라갈 컨테이너
			container2.add(jcb1);
			container2.add(jcb2);
			container2.add(jcb3);
			container2.add(jcb4);
			
			// 3-3. 세번째 탭에 올라갈 컨테이너
			container3.add(jl1); container3.add(name1); 
			container3.add(jl2); container3.add(name2); 
			container3.add(jl3); container3.add(name3); 	
		
		// 4. 컨테이너 -> 텝 (각각의 컨테이너를 JTabbedPane 탭에 올리기)
		tab.add("버튼 탭", container1);
		tab.add("체크박스 탭", container2);
		tab.add("네임 탭", container3);
			
		// 5. 탭 -> 프레임
		add(tab);
		
		// 화면설정 및 출력
		setBounds(200, 300, 800, 800);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setVisible(true);
		
		
	}
	
	public static void main(String[] args) {

		new Ex15_JTabbedPane();
	}

}
