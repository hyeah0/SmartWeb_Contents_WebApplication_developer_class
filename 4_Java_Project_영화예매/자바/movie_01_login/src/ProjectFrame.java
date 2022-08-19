package movie_01_login;

import java.awt.Color;
import java.awt.Font;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;

public class ProjectFrame {
	
	// 변수
	public JFrame frame;
	
	// 컬러변수
	public Color color_point = Color.red;						// 포인트 컬러
	public Color color_btn_default = Color.gray;				// 버튼 디폴트컬러(회색)
	public Color color_guide_default = Color.gray;				// 설명글_기본 
	public Color color_guide_error = Color.red;					// 설명글_에러
	public Color color_guide_ok = new Color(25, 111, 61);		// 설명글_유효성검사시 사용 가능 데이터(초록)
	public Color color_error_back = new Color(255, 228, 225); 	// 유효성검사시 에러(연한 분홍)
	public Color color_reset = new Color(255, 255, 255); 		// 리셋컬러(하양)
	 
	// 텍스트변수
	public Font font_default = new Font("Lucida Grande", Font.PLAIN, 16);
	public Font font_small = new Font("Lucida Grande", Font.PLAIN, 12);
	
	// 뒤로가기 버튼
	ImageIcon icon_back = new ImageIcon("src/img/back3.png");
	JButton btn_back = new JButton(); 
	
	public ProjectFrame() {
	
		frame = new JFrame();
		frame.getContentPane().setBackground(Color.WHITE);
		frame.getContentPane().setLayout(null);
		frame.setBounds(100, 100, 700, 900);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	
	}
	
	// 메인메서드
	public static void main(String[] args) {
		new ProjectFrame();
	}
	
	void frameBackBtn(){
		btn_back.setBounds(22, 30, 70, 70);
		btn_back.setIcon(icon_back);
		btn_back.setBorder(null);
		btn_back.setContentAreaFilled(false); // 버튼 투명하게
	}
}
