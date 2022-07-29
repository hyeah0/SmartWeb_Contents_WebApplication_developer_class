package khie;

import java.awt.BorderLayout;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

/*
 * - 대표적인 대치관리자의 종류
 * 	 1) FlowLayout
 * 	 2) BorderLayout
 *   3) GridLayout
 *   4) CardLayour
 *   
 * 2) BorderLayout 배치관리자
 * 	- 배치 : 동, 서, 남, 북 , 중앙
 */

public class Ex19_BorderLayout extends JFrame{

	public Ex19_BorderLayout() {

		setTitle("BorderLayout 예제");
		
		JPanel container = new JPanel();
		
		// 1. 컴포넌트
		JButton btn1 = new JButton("North");
		JButton btn2 = new JButton("South");
		JButton btn3 = new JButton("East");
		JButton btn4 = new JButton("West");
		JButton btn5 = new JButton("Center");
		
		// 배치관리자
		// 형식)
		//		1. 기본생성자 : new BorderLayout();
		//		2. 인자생성자 : new BorderLayout(수평간격, 수직간격);
		// 					  - 수평간격 : 좌우 컴포넌트 사이의 간격 - 기본값 0px
		//					  - 수직간격 : 상하 컴포넌트 사이의 간격 - 기본값 0px
		
		// container.setLayout(new BorderLayout());
		container.setLayout(new BorderLayout(10,30));
		
		// ★★★ 컴포넌트 -> 컨테이너
		container.add(btn1, BorderLayout.NORTH);
		container.add(btn2, BorderLayout.SOUTH);
		container.add(btn3, BorderLayout.EAST);
		container.add(btn4, BorderLayout.WEST);
		container.add(btn5, BorderLayout.CENTER);
		
		// 컨테이너 -> 패키지
		add(container);
		
		// 화면 설정 및 출력
		setBounds(200, 200, 700, 700);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setVisible(true);
	}
	
	public static void main(String[] args) {
		new Ex19_BorderLayout();
	}

}
