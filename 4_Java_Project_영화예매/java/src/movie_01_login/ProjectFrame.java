package movie_01_login;

import java.awt.Color;
import java.awt.Font;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.SwingConstants;

public class ProjectFrame {
	
	// 변수
	public JFrame frame;
	
	// 컬러
	public Color color_point = Color.red;						// 포인트 컬러
	public Color color_btn_default = Color.gray;				// 버튼 디폴트컬러(회색)
	public Color color_guide_default = Color.gray;				// 설명글_기본 
	public Color color_guide_error = Color.red;					// 설명글_에러
	public Color color_guide_ok = new Color(25, 111, 61);		// 설명글_유효성검사시 사용 가능 데이터(초록)
	public Color color_error_back = new Color(255, 228, 225); 	// 유효성검사시 에러(연한 분홍)
	public Color color_reset = new Color(255, 255, 255); 		// 리셋컬러(하양)
	 
	// 텍스트
	public Font font_default = new Font("Lucida Grande", Font.PLAIN, 16);
	public Font font_small = new Font("Lucida Grande", Font.PLAIN, 12);
	
	// 뒤로가기 버튼
	JButton btn_back = new JButton(new ImageIcon("img/back3.png")); 
	
	// 아이디찾기, 비밀번호 찾기 페이지 로고
	ImageIcon icon_logo_small = new ImageIcon("img/tmplogo_small.png");
	JLabel logo = new JLabel("");

	// 회원가입하기, 아이디찾기, 비밀번호 찾기 로그인 페이지에 있는 버튼 프레임(텍스트색상 : 디폴트)
	JButton btn_gray_frame;
	
	// 회원가입하기, 아이디찾기, 비밀번호찾기 각 페이지별 있는 버튼 프레임(텍스트색상 : 포인트컬러)
	JButton btn_point_frame;
	
	// 라벨 공통사항
	JLabel label;
	
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
	
	// 뒤로가기 버튼
	void frameBackBtn(){
		btn_back.setBounds(22, 30, 70, 70);
		btn_back.setBorder(null);
		btn_back.setContentAreaFilled(false); 				// 버튼 투명하게
		frame.getContentPane().add(btn_back);
	}
	
	// 회원가입하기, 아이디찾기, 비밀번호 찾기 로그인 페이지에 있는 버튼 프레임(텍스트색상 : 디폴트)
	void frameGrayBtn() {
		btn_gray_frame = new JButton();
		btn_gray_frame.setFont(font_small);
		btn_gray_frame.setForeground(color_btn_default);
		btn_gray_frame.setBorder(null); 					// 버튼 테두리 없음
		btn_gray_frame.setContentAreaFilled(false); 		// 버튼 투명하게
		frame.getContentPane().add(btn_gray_frame);
	}
	
	// 회원가입하기, 아이디찾기, 비밀번호찾기 각 페이지별 있는 버튼 프레임(텍스트색상 : 포인트컬러)
	void framePointBtn() {
		btn_point_frame = new JButton();
		btn_point_frame.setFont(font_default);
		btn_point_frame.setForeground(color_point);
		btn_point_frame.setContentAreaFilled(false); 		// 버튼 투명하게
		frame.getContentPane().add(btn_point_frame);
	}
	
	// 아이디찾기, 비밀번호 찾기 페이지 로고
	void frameLogoSmall() {
		logo.setIcon(icon_logo_small);
		logo.setBounds(295, 180, 244, 115);
		frame.getContentPane().add(logo);
	}
	
	// 라벨 프레임( 텍스트필드 옆 글 )
	void frameLabel() {
		label = new JLabel();
		label.setHorizontalAlignment(SwingConstants.CENTER);
		label.setFont(font_default);
		frame.getContentPane().add(label);
	}
}
