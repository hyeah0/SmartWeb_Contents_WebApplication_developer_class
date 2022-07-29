package khie;

import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JPanel;

// JComboBox : 드롭다운
public class Ex11_JComboBox extends JFrame {

	// 기본생성자
	public Ex11_JComboBox() {
	
		// 타이틀
		setTitle("JComboBox 예제");
		
		// 1. 컨테이너
		JPanel jPanel = new JPanel();
		
		// 2. 컴포넌트
		// 2-1 배열 생성 
		String[] job = {"회사원", "의사", "변호사", "검사", "무직"};
		// 2-2 콤보박스 객체 생성
		JComboBox<String> jcb = new JComboBox<String>(job);

		// 콤보박스 초기값 설정 후 화면 출력
		// 방법1
		// .setSelectedIndex(인덱스) : 인덱스값을 통해 초기값 설정 
		// jcb.setSelectedIndex(4);
		
		// 방법2
		// .setSelectedItem("배열값") : 배열값을 통해 초기값 설정
		jcb.setSelectedItem("의사");
		
		// 3. 컴포넌트 -> 컨테이너
		jPanel.add(jcb);
		
		// 4. 컨테이너 -> 프레임 
		add(jPanel);
		
		// 5. 화면위치, 크기 설정
		setBounds(300, 300, 500, 500);
		
		// 6. 종료
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		// 7. 화면 출력
		setVisible(true);
	
	}
	
	public static void main(String[] args) {

		new Ex11_JComboBox();
		
	}

}
