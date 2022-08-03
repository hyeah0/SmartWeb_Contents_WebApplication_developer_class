package khie;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.*;

/*
 * Event Handler(이벤트 핸들러)?
 * - 각 컴포넌트에 대하여 특정 행위를 하였을 때 그 행위에 대한
 *   작업을 처리할 수 있도록 하는 것을 말함.
 *   사용자 또는 프로그램에 의해 발생할 수 있는 하나의 사건.
 * - 이벤트를 처리하는 자바 프로그램 코드로써 클래스를 만듦.
 *   이벤트 리스너는 인터페이스를 제공하며, 개발자는 이 인터페이스를
 *   상속을 받고 추상메서드를 구현하여 이벤트 리스너를 작성한다.
 * - 현재 발생한 이벤트에 관한 정보를 가진 객체를 말함.
 *   이벤트 리스너에게 전달이 됨.
 * - 각 컴포넌트별 이벤트 처리 메서드 : add로 시작하여 Listener
 *   로 끝나는 메서드.
 * - 이벤트 관련 클래스 : Listener 인터페이스, Adapter 클래스,
 *                    Event 클래스
 * - 이벤트 리스너는 모두가 다 인터페이스임(xxxListener)
 *   이벤트 리스너는 이벤트를 처리하는 프로그램 코드를 말함.
 *   이벤트 리스너는 컴포넌트에 연결되어 있어야 작동을 함.
 *   즉, 화면에 구성된 컴포넌트들은 이벤트 리스너를 하나씩 가지고 있음.
 * - 컴포넌트와 이벤트 리스너를 연결시키는 메서드 : addXXXXListener()
 *   ==> XXXX는 리스너 이름.
 *   
 * - 이벤트 리스너 작성 과정
 *   1) 이벤트와 이벤트 리스너 선택 
 *      ==> 목적에 적합한 이벤트와 리스너 인터페이스 선택.
 *   2) 이벤트와 리스너 클래스 작성
 *      ==> 리스너 인터페이스를 상속받은 클래스를 작성하고
 *          추상메서드를 모두 구현.
 *   3) 이벤트 리스너 등록
 *      ==> 이벤트를 받을 컴포넌트에 이벤트 리스너 등록
 */

/*
 * Event Handler 클래스 생성 방법 - 4가지
 * 1. Listener 인터페이스를 구현하는 방법
 * 2. Adapter 클래스를 구현하는 방법
 * 3. Frame 클래스에 Listener 구현하는 방법 - 가장 많이 사용.
 * 4. 익명 클래스를 이용하는 방법 - 많이 사용이 됨. 
 */

class A implements ActionListener {

	@Override
	public void actionPerformed(ActionEvent e) {
		
		JOptionPane.showMessageDialog(null, "시스템 종료");
		
		System.exit(0);   // 시스템을 종료시키는 메서드.
		
	}
	
}

public class Ex27_Event_Listener extends JFrame{

	public Ex27_Event_Listener() {
		
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
		
		// 이벤트 처리
		// 이벤트 클래스 객체 생성
		A a = new A();
		
		// 이벤트 등록
		exit.addActionListener(a);
	}
	
	public static void main(String[] args) {

		new Ex27_Event_Listener();
	}

}
