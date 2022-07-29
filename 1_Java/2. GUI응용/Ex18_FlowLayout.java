package khie;

import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

/*
 * 배치관리자(Layout)
 * - 화면(Frame)에 컴포넌트들을 배치하는 방법을 알려주는 관리자
 * - 대표적인 대치관리자의 종류
 * 	 1) FlowLayout
 * 	 2) BorderLayout
 *   3) GridLayout
 *   4) CardLayour
 * 
 * 1) FlowLayout 배치관리자(default)
 * 	- 배치 : 중앙 -> 좌 -> 우
 * 	- 상단 중앙에 컴포넌트 배치
 * 	- 화면이 넘칠 경우 밑(아래) 중앙에 배치가 되다.
 * 	- 배치관리자를 지정하지 않은 경우, default로 FlowLayout 배치관리자로 배치를 한다.
 * 
 */

public class Ex18_FlowLayout extends JFrame{

	//기본생성자
	public Ex18_FlowLayout() {
		
		setTitle("FlowLayout 배치관리자");
	
		JPanel container = new JPanel();
		
		// 1. 컴포넌트 생성
		JButton jbtn1 = new JButton("버튼1");
		JButton jbtn2 = new JButton("버튼2");
		JButton jbtn3 = new JButton("버튼3");
		JButton jbtn4 = new JButton("버튼4");

		// 컴포넌트를 컨테이너에 올리기 전에 배치관리자 지정
		// 1-1. 배치관리자 적용
		// 		형식)
		//			컨테이너 참조변수.setLayout(인자);
		//	인자 형식)
		//			new FlowLayout()
		//			new FlowLayout(정렬 - 왼쪽, 오른쪽, 중앙(default) )
		//			new FlowLayout(정렬시 수평간격, 수직간격 설정)__default 5px , margin
		// 						   수평간격 : 좌우 컴포넌트 사이 간격
		//						   수직간격 : 상하 간격
		//
		//    		container.setLayout(new 배치관리자(FlowLayout.왼쪽오른쪽중앙,수평간격,수직간격));
		
		// 왼쪽정렬
		container.setLayout(new FlowLayout(FlowLayout.LEFT,20,50));
		
		// 2. 컴포넌트 -> 컨테이너
		container.add(jbtn1);
		container.add(jbtn2);
		container.add(jbtn3);
		// container.add(jbtn4);
		
		// 3. 컨테이너 -> 프레임
		add(container);
		
		// 화면 설정 및 출력
		setBounds(200, 200, 400, 400);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setVisible(true);	
	}
	
	public static void main(String[] args) {
		new Ex18_FlowLayout();
	}

}
