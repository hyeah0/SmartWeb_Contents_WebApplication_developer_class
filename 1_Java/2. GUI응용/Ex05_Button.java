package khie;

import java.awt.Button;
import java.awt.Container;
import java.awt.Frame;
import java.awt.Panel;

public class Ex05_Button extends Frame{
	
	// 기본생성자
	public Ex05_Button() {
		// 프레임 > 컨테이너 > 컴포넌트
		
		setTitle("Button 예제");
		
		// 1. 컨테이너 생성
		/* - java.lang.Object
 			- java.awt.Component
 				- java.awt.Container
 					- java.awt.Panel
		 */
		Panel container = new Panel();
		
		// 2. 컴포넌트 생성
		//    버튼 객체 생성
		// 	  윈도우 한글 깨짐 / 맥 한글 안깨짐
		Button btn1 = new Button("button1");
		
		// 3. 컴포넌트를 컨테이너에 올려야한다.
		//    Panel 클래스 = 컨테이너
		
		container.add(btn1);
		
		//4. 컨테이너 -> 프레임
		add(container);
		
		setBounds(100,100,300,300);
		setVisible(true);
		
	}
	
	public static void main(String[] args) {
		new Ex05_Button();
	}

}
