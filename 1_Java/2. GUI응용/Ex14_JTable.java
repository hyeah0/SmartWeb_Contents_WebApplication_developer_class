package khie;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.ScrollPaneConstants;

// 이미 틀이 잡혀져 있어 바로 프레임에 올리기 (컴포넌트를 컨테이너에 올리지 않아도 된다.)
// JTable : 표
public class Ex14_JTable extends JFrame{

	public Ex14_JTable() {
		
		// 타이틀
		setTitle("JTable 예제");
	
		// 컴포넌트
		// 1. 배열
		String[] header = {"학생이름","국어점수","영어점수","수학점수","자바점수"};
		String[][] contents = {
				{"홍ㅇㅇ", "94", "88", "90", "90"}, // 1행 
				{"길ㅇㅇ", "84", "77", "40", "20"}, // 2행 
				{"배ㅇㅇ", "95", "92", "80", "40"}, // 3행 
				{"홍ㅇㅇ", "75", "95", "20", "91"}, // 4행 
				{"동ㅇㅇ", "82", "65", "64", "90"}, // 5행 
				{"조ㅇㅇ", "64", "77", "80", "40"}, // 6행 
				{"서ㅇㅇ", "14", "88", "90", "94"}, // 7행 
				{"주ㅇㅇ", "98", "44", "97", "98"}, // 8행 
				{"우ㅇㅇ", "88", "80", "96", "96"}, // 9행 
				{"권ㅇㅇ", "44", "54", "94", "92"}, // 10행 
		}; // ";" 마무리
		
		// 2. 테이블객체 생성
		JTable jTable = new JTable(contents, header);
		
		// 3. 스크롤바 생성
		// 3-1
		// JScrollPane jsp = new JScrollPane(view, vsbPolicy, hsbPolicy);
				// view     	 // 스크롤바가 보여질 컴포넌트 		   // table
				// vsbPolicy 	 // 수직으로 스크롤바를 보여줄지 여부 확인 // ScrollPaneConstants.VERTICAL_SCROLLBAR_AS_NEEDED
				// hsbPolicy	 // 수평으로 스크롤바를 보여줄지 여부 확인 // ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER
		JScrollPane jsp = new JScrollPane(jTable, ScrollPaneConstants.VERTICAL_SCROLLBAR_AS_NEEDED, ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);	
		
		// 컴포넌트 -> 프레임
		// add(jTable); // 스크롤바 생성 전
		add(jsp); 		// 스크롤바 생성 후
		
		// 화면설정
		setBounds(300, 200, 800, 200);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setVisible(true);
	}
	
	public static void main(String[] args) {

		new Ex14_JTable();
		
	}

}
