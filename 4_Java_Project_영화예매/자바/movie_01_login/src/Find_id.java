package movie_01_login;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.awt.event.ActionEvent;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import java.awt.Font;
import javax.swing.SwingConstants;

import netscape.javascript.JSObject;

import javax.swing.JSeparator;
import java.awt.Color;

public class Find_id {

	// 멤버변수
	Connection con = null;  		// 데이터베이스 연동
	PreparedStatement pstmt = null; // 데이터베이스에 sql 전송
	ResultSet rs = null; 			// 값 저장
	String sql = null;				// sql문
	
	public JFrame frame;
	ProjectFrame pf = new ProjectFrame();	// 프레임(화면크기,배경,주사용컬러)
	JLabel logo;
	JButton btn_back; 
	
	public JTextField txtf_name;
	public JTextField txtf_phone1;
	public JTextField txtf_phone2;
	public JTextField txtf_phone3;

	// 메인메서드
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Find_id window = new Find_id();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	// 기본생성자
	public Find_id() {
		initialize();
	}

	// 컴포넌트 출력 메서드
	private void initialize() {
		
		// 프레임(Jframe)
		frame = pf.frame;
		frame.setTitle("아이디 찾기");
		
		// 뒤로가기 버튼 
		pf.frameBackBtn();
		btn_back = pf.btn_back;
		
		// 로고 위치
		pf.frameLogoSmall();
		logo = pf.logo;
		
		JSeparator separator = new JSeparator();
		separator.setBounds(63, 368, 582, 12);
		frame.getContentPane().add(separator);
		
		JLabel label_name = new JLabel("이름");
		label_name.setHorizontalAlignment(SwingConstants.CENTER);
		label_name.setFont(pf.font_default);
		label_name.setBounds(63, 405, 202, 38);
		frame.getContentPane().add(label_name);
		
		txtf_name = new JTextField();
		txtf_name.setColumns(10);
		txtf_name.setBounds(277, 403, 316, 44);
		frame.getContentPane().add(txtf_name);
		
		JLabel label_phone = new JLabel("핸드폰번호");
		label_phone.setHorizontalAlignment(SwingConstants.CENTER);
		label_phone.setFont(pf.font_default);
		label_phone.setBounds(63, 477, 202, 38);
		frame.getContentPane().add(label_phone);
		
		
		// ----- 핸드폰번호 컴포넌트 시작 ----------------------------------------------- //	
		// 핸드폰번호 1 ( 000-0000-0000 )
		txtf_phone1 = new JTextField();
		txtf_phone1.setColumns(3);
		txtf_phone1.setBounds(277, 477, 75, 44); 
		frame.getContentPane().add(txtf_phone1);
		
		JLabel label_phone1 = new JLabel("-");
		label_phone1.setHorizontalAlignment(SwingConstants.CENTER);
		label_phone1.setFont(pf.font_default);
		label_phone1.setBounds(355, 477, 15, 44);
		frame.getContentPane().add(label_phone1);
		
		// 핸드폰번호 2 ( 000-0000-0000 )
		txtf_phone2 = new JTextField();
		txtf_phone2.setColumns(5);
		txtf_phone2.setBounds(373, 477, 100, 44);
		frame.getContentPane().add(txtf_phone2);
		
		JLabel label_phone2 = new JLabel("-");
		label_phone2.setHorizontalAlignment(SwingConstants.CENTER);
		label_phone2.setFont(pf.font_default);
		label_phone2.setBounds(476, 477, 15, 44);
		frame.getContentPane().add(label_phone2);
		
		// 핸드폰번호 3 ( 000-0000-0000 )
		txtf_phone3 = new JTextField();
		txtf_phone3.setColumns(5);
		txtf_phone3.setBounds(493, 478, 100, 44);
		frame.getContentPane().add(txtf_phone3);
		
		JSeparator separator_1 = new JSeparator();
		separator_1.setBounds(63, 542, 582, 12);
		frame.getContentPane().add(separator_1);
		// ----- 핸드폰번호 컴포넌트 끝 ------------------------------------------------ //
		
		// 아이디찾기 버튼
		pf.framePointBtn();
		JButton btn_find_id = pf.btn_point_frame;
		btn_find_id.setText("아이디 찾기");
		btn_find_id.setBounds(239, 640, 215, 65);

		
		// * 이벤트 -------------------------------------------------------------------------------
		// 뒤로가기 버튼 클릭시 로그인 화면창으로 이동
			btn_back.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					btn_back.setForeground(Color.blue);
					SignIn.main(null);
					frame.dispose(); // 기존에 있던 창을 없애주는 메서드

				}
			});
		
		
		// 아이디 찾기 버튼 클릭
			btn_find_id.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					// 오라클 드라이버 로딩 및 데이터 베이스 연결 
					con = DBConnect.getConnection();
					
					// 아이디 찾기 메서드
					findId();
					
				}
			});

	}
	
	// 메서드
	// 아이디 찾기
		void findId() {
			try {
				
				// 지역변수
				String name = txtf_name.getText();
				String phone = txtf_phone1.getText() + "-" + txtf_phone2.getText() + "-" + txtf_phone3.getText();
				String input_idInfo = name + phone;	// 아이디와 핸드폰번호 동일한 값을 찾기 위한 임시 합쳐놓은 값(일련번호)
				
				boolean memTrue = false;		// 회원일 경우 true
				String mem_id = null;			// 회원일 경우 값 
				String mem_name = null;			// 회원일 경우 값 
				
				int choice = 1;					// 로그인 페이지 클릭시 1
				String[] choose = {"로그인페이지" , "닫기"}; 
				
				// sql
				sql = "select id "
					+ "     , MEMBERNAME "
					+ "     , MEMBERNAME || phone as data_idInfo"
					+ "  from member_info"
					+ " where MEMBERNAME || phone = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, input_idInfo);
				
				rs = pstmt.executeQuery();
				
				// 데이터베이스를 확인하여 입력값이 있는지 확인 
				while(rs.next()) {
					String data_idInfo = rs.getString("data_idInfo");
					
					if(input_idInfo.equals(data_idInfo)) {
						 mem_id = rs.getString("id");
						 mem_name = rs.getString("MEMBERNAME");
						 memTrue = true;
						 
					}else {
						memTrue = false;
					}
				}
				
				// 연결자원 종료
				rs.close();
				pstmt.close();
				
				// 일치하는 아이디가 있으면 정보 반환
				if(memTrue == true) {
					choice = JOptionPane.showOptionDialog(null, mem_name + "님의 ID는 " + mem_id + "입니다.", "아이디 찾기", 0, JOptionPane.PLAIN_MESSAGE, null,choose,choose[1]);
				}else {
					JOptionPane.showMessageDialog(null, "일치하는 회원정보가 없습니다.", "아이디 찾기", JOptionPane.PLAIN_MESSAGE);
				}

				// 로그인 페이지로 이동 클릭시 이동
				if(choice == 0) {
					SignIn signIn = new SignIn();
					SignIn.main(null);
					frame.dispose(); // 기존에 있던 창을 없애주는 메서드
				}
				
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		};
}
