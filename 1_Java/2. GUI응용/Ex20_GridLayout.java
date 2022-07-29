package khie;

import java.awt.GridBagLayout;
import java.awt.GridLayout;

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
 * 3) GridLayout 배치관리자
 * 	- 격자 모양의 배치관리자
 * 	- 행과 열로 화면이 구성된다.
 * 	- 기준 : 무조건 행이 기준이 된다.
 * 	
 */

public class Ex20_GridLayout extends JFrame{

	// 기본생성자
	public Ex20_GridLayout() {

		setTitle("GridLayout 배치관리자");
	
		// 컨테이너
		JPanel container = new JPanel();
		
		// 컴포넌트
		JButton btn1 = new JButton("1");
		JButton btn2 = new JButton("2");
		JButton btn3 = new JButton("3");
		
		JButton btn4 = new JButton("4");
		JButton btn5 = new JButton("5");
		JButton btn6 = new JButton("6");
		
		JButton btn7 = new JButton("7");
		JButton btn8 = new JButton("8");
		JButton btn9 = new JButton("9");
		
		JButton btn10 = new JButton("*");
		JButton btn11 = new JButton("0");
		JButton btn12 = new JButton("#");
		
		// 배치관리자
		// 형식 )
		//      기본생성자 : new GridLayout();			// single row
		//		인자생성자 : new GridLayout(행수, 열수);
		// 		인자생성자 : new GridLayout​(int rows,int cols,int hgap,int vgap);
		// 				   ㄴ new GridLayout​(행, 열, 수평, 수직);	
		
		// container.setLayout(new GridLayout(4, 3));
		container.setLayout(new GridLayout(4, 3, 5, 10));
		
		// 컴포넌트 -> 컨테이너
		// for(int i=1; i<=12; i++) {
		//	String = "btn" + i;
		//	container.add(btn1);
		// }
		
		container.add(btn1);
		container.add(btn2);
		container.add(btn3);
		container.add(btn4);
		container.add(btn5);
		container.add(btn6);
		container.add(btn7);
		container.add(btn8);
		container.add(btn9);
		container.add(btn10);
		container.add(btn11);
		container.add(btn12);
		
		// 컨테이너 -> 패키지
		add(container);
		
		// 화면 설정 및 출력
		setBounds(200, 300, 400, 500);
		setResizable(false); // 창고정
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setVisible(true);
	}
	
	
	public static void main(String[] args) {
		new Ex20_GridLayout();
	}

}
