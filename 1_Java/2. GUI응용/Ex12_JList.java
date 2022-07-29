package khie;

import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JList;
import javax.swing.JPanel;

//JList : 리스트
public class Ex12_JList extends JFrame{

	public Ex12_JList() {
		
		// 타이틀
		setTitle("JList 예제");
		
		// 1. 컨테이너
		JPanel jPanel = new JPanel();
		
		// 2. 컴포넌트
		// 2-1 배열 생성 
		String[] kimbap = {"삼각김밥", "원조김밥", "야채김밥", "참치김밥", "멸치김밥"};
		// 2-2 콤보박스 객체 생성
		JList<String> jList = new JList<String>(kimbap);
		
		// 3. 컴포넌트 -> 컨테이너
		jPanel.add(jList);
		
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

		new Ex12_JList();
		
	}

}
