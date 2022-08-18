package movie_01_login;

import java.awt.Panel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.net.ssl.ExtendedSSLSession;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class MainPage extends JFrame{

	// 멤버변수
		Connection con = null;  		// 데이터베이스 연동
		PreparedStatement pstmt = null; // 데이터베이스에 sql 전송
		ResultSet rs = null; 			// 값 저장
		String sql = null;				// sql문
		
		static String main_id;
		Object[] idArr ;
		JButton[] btnarr;
		JPanel panel;
	
	// 기본생성자
	public MainPage() {
			
		// 화면 출력
				// 하단 두개 공통 사항(개인작업시 확인용)
			
				
				setTitle("메인 페이지");
				panel = new JPanel();
				
				JButton btn = new JButton(main_id);
				btn.setBounds(100, 100, 200, 200);
				panel.add(btn);
				add(btn);
				
				// 멤버전체 가져오기 
//				total();
				
				setSize(700,900);
				setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
				
				setVisible(true);
	}
	
	// 인자생성자
	public MainPage(String id) {
		
	}
	
	// 메인메서드
	public static void main(String[] args) {

		new MainPage();
		
	}
	
	

}
