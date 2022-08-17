package movie_login;

import java.awt.EventQueue;

import javax.swing.JFrame;
import java.awt.Color;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPasswordField;
import javax.swing.JTextField;
import java.awt.Font;
import javax.swing.JButton;
import javax.swing.SwingConstants;
import javax.swing.BorderFactory;
import javax.swing.ImageIcon;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.awt.event.ActionEvent;

public class SignIn {

	// 멤버변수
	Connection con = null;  		// 데이터베이스 연동
	PreparedStatement pstmt = null; // 데이터베이스에 sql 전송
	ResultSet rs = null; 			// 값 저장
	String sql = null;				// sql문
	
	private JFrame frame;
	private JTextField txtf_id;
	private JPasswordField txtf_pwd;

	// 메인메서드
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					SignIn window = new SignIn();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	// 기본생성자
	public SignIn() {
		initialize();
	}

	// 컴포넌트 출력 메서드
	private void initialize() {
		frame = new JFrame();
		frame.setTitle("로그인");
		frame.getContentPane().setBackground(Color.WHITE);
		frame.getContentPane().setLayout(null);
		
		JLabel label_id = new JLabel("아이디");
		label_id.setHorizontalAlignment(SwingConstants.CENTER);
		label_id.setFont(new Font("Dialog", Font.PLAIN, 16));
		label_id.setBounds(98, 371, 105, 34);
		frame.getContentPane().add(label_id);
		
		txtf_id = new JTextField();
		txtf_id.setBounds(226, 371, 280, 34);
		frame.getContentPane().add(txtf_id);
		txtf_id.setColumns(10);
		txtf_id.requestFocus();
		
		JButton btn_login = new JButton("로그인");
		btn_login.setBounds(526, 367, 89, 76);
		frame.getContentPane().add(btn_login);
		
		JLabel label_pwd = new JLabel("비밀번호");
		label_pwd.setHorizontalAlignment(SwingConstants.CENTER);
		label_pwd.setFont(new Font("Dialog", Font.PLAIN, 16));
		label_pwd.setBounds(98, 413, 105, 34);
		frame.getContentPane().add(label_pwd);
		
		txtf_pwd = new JPasswordField();
		txtf_pwd.setColumns(10);
		txtf_pwd.setBounds(226, 413, 280, 34);
		frame.getContentPane().add(txtf_pwd);
		
		JButton btn_signup = new JButton("회원가입하기");
		
		btn_signup.setForeground(Color.GRAY);
		btn_signup.setFont(new Font("Lucida Grande", Font.PLAIN, 12));
		btn_signup.setBounds(129, 478, 130, 44);
		btn_signup.setBorder(null); 	// 버튼 테두리 없음
		frame.getContentPane().add(btn_signup);
		
		JButton btn_find_id = new JButton("아이디찾기");
		btn_find_id.setFont(new Font("Lucida Grande", Font.PLAIN, 12));
		btn_find_id.setForeground(Color.GRAY);
		btn_find_id.setBounds(285, 479, 130, 44);
		btn_find_id.setBorder(null); 	// 버튼 테두리 없음
		frame.getContentPane().add(btn_find_id);
		
		JButton btn_find_pwd = new JButton("비밀번호찾기");
		btn_find_pwd.setFont(new Font("Lucida Grande", Font.PLAIN, 12));
		btn_find_pwd.setForeground(Color.GRAY);
		btn_find_pwd.setBounds(438, 479, 130, 44);
		btn_find_pwd.setBorder(null); 	// 버튼 테두리 없음
		frame.getContentPane().add(btn_find_pwd);
		
		JLabel logo = new JLabel(" ");
		logo.setIcon(new ImageIcon(SignIn.class.getResource("/img/tmplogo.png")));
		logo.setBounds(262, 222, 244, 115);
		frame.getContentPane().add(logo);
		frame.setBounds(100, 100, 700, 900);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		// * 이벤트 -------------------------------------------------------------------------------
			// 로그인 버튼 클릭
				btn_login.addActionListener(new ActionListener() {
					public void actionPerformed(ActionEvent e) {
						
						// 오라클 드라이버 로딩 및 데이터 베이스 연결 
						con = Movie_System.getConnection();
						
						// 멤버확인 메서드
						check();
					}
				});
	
			// 회원가입 버튼 클릭
					btn_signup.addActionListener(new ActionListener() {
						public void actionPerformed(ActionEvent e) {
							btn_signup.setForeground(Color.blue);
							SignUp.main(null);
							frame.dispose(); // 기존에 있던 창을 없애주는 메서드
						}
					});
			
			// 아이디 찾기 버튼 클릭
					btn_find_id.addActionListener(new ActionListener() {
						public void actionPerformed(ActionEvent e) {
							btn_find_id.setForeground(Color.blue);
							Find_id.main(null);
							frame.dispose(); // 기존에 있던 창을 없애주는 메서드
						}
					});
			
			// 비밀번호 찾기 버튼 클릭
					btn_find_pwd.addActionListener(new ActionListener() {
						public void actionPerformed(ActionEvent e) {
							btn_find_id.setForeground(Color.blue);
							Find_pwd.main(null);
							frame.dispose(); // 기존에 있던 창을 없애주는 메서드
						}
					});
	}

	
	// 메서드
	void check() {
		try {
			
			String id = txtf_id.getText();
			String pwd = txtf_pwd.getText();
			String input_loginInfo = id+pwd;
			
			boolean memTrue = false;		// 회원일 경우 true
			
			// sql
			sql = "select id||pwd as data_loginInfo"
				+ "  from member_info"
				+ " where id||pwd = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, input_loginInfo);
			
			rs = pstmt.executeQuery();
			
			// 데이터베이스를 확인하여 입력값이 있는지 확인 
			while(rs.next()) {
				String data_loginInfo = rs.getString("data_loginInfo");
				
				if(input_loginInfo.equals(data_loginInfo)) {
					 memTrue = true;
		 
				}else {
					memTrue = false;
				}
			}
			
			// 일치하는 아이디가 있으면 정보 반환
			if(memTrue == true) {
				MainPage.main(null);
				frame.dispose(); // 기존에 있던 창을 없애주는 메서드
			}else {
				JOptionPane.showMessageDialog(null, "일치하는 회원정보가 없습니다. \n 재시도 부탁드립니다.", "로그인", JOptionPane.PLAIN_MESSAGE);
			}

			
			// 연결자원 종료
			rs.close();
			pstmt.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	
	
}
