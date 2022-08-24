
package movie_01_login;

import javax.swing.*;

import connect.DBConnect;
import main.Mainpage;

import java.sql.*;
import java.awt.EventQueue;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import main.Mainpage;

// 로그인 페이지
/*
	코드수정일 : 2022.08.18 
	as-is : 로그인시 회원 정보 저장될 수 있는 클래스 파일 x
	to-be : 로그인시 회원 정보 저장가능 (클래스명 : LoginMember_DTO / 정보 : id, memberName, cardNum, cardPwd)
	
	코드수정일 : 2022.08.19
	as-is : 페이지별 중복부분(페이지크기, 포인트컬러, 텍스트) 수정시 하나씩 변경 필요
	to_be : 페이지별 중복부분(페이지크기, 포인트컬러, 텍스트) 수정시 ProjectFrame 클래스만 변경 
	
*/

public class SignIn {

	// * 변수 -----------------------------------------------------
	Connection con = null; // 데이터베이스 연동
	PreparedStatement pstmt = null; // 데이터베이스에 sql 전송
	ResultSet rs = null; // 값 저장
	String sql = null; // sql문

	public JFrame frame;
	ProjectFrame pf = new ProjectFrame(); // 프레임(화면크기,배경,주사용컬러)

	// 입력된 아이디, 비밀번호
	JTextField txtf_id;
	JPasswordField txtf_pwd;

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

	// 메서드
	// --------------------------------------------------------------------------------------
	// 메서드 - 컴포넌트
	private void initialize() {

		// 프레임(Jframe)
		frame = pf.frame;
		frame.setTitle("로그인");

		// 컴포넌트
		// 상단 -----------------------------------------------------------------------
		// 로고
		JLabel logo = new JLabel(" ");
		logo.setIcon((new ImageIcon("src/img/tmplogo.png")));
		logo.setBounds(262, 222, 244, 115);
		frame.getContentPane().add(logo);

		// 중앙 -----------------------------------------------------------------------
		pf.frameLabel();
		JLabel label_id = pf.label;
		label_id.setText("아이디");
		label_id.setBounds(98, 371, 105, 34);

		txtf_id = new JTextField();
		txtf_id.setBounds(226, 371, 280, 34);
		txtf_id.requestFocus();
		frame.getContentPane().add(txtf_id);

		JButton btn_login = new JButton("로그인");
		btn_login.setBounds(526, 367, 89, 76);
		btn_login.setContentAreaFilled(false); // 버튼 투명하게
		frame.getContentPane().add(btn_login);

		pf.frameLabel();
		JLabel label_pwd = pf.label;
		label_pwd.setText("비밀번호");
		label_pwd.setBounds(98, 413, 105, 34);

		txtf_pwd = new JPasswordField();
		txtf_pwd.setBounds(226, 413, 280, 34);
		frame.getContentPane().add(txtf_pwd);

		pf.frameGrayBtn();
		JButton btn_signup = pf.btn_gray_frame;
		btn_signup.setText("회원가입하기");
		btn_signup.setBorder(null); // 버튼 테두리 없음
		btn_signup.setBounds(129, 478, 130, 44);

		pf.frameGrayBtn();
		JButton btn_find_id = pf.btn_gray_frame;
		btn_find_id.setText("아이디찾기");
		btn_find_id.setBorder(null); // 버튼 테두리 없음
		btn_find_id.setBounds(285, 479, 130, 44);

		pf.frameGrayBtn();
		JButton btn_find_pwd = pf.btn_gray_frame;
		btn_find_pwd.setText("비밀번호찾기");
		btn_find_pwd.setBorder(null); // 버튼 테두리 없음
		btn_find_pwd.setBounds(438, 479, 130, 44);

		// * 이벤트
		// -------------------------------------------------------------------------------
		// 로그인 버튼 클릭
		btn_login.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {

				// 오라클 드라이버 로딩 및 데이터 베이스 연결
				con = DBConnect.getConnection();

				// 멤버확인 메서드
				check();
			}
		});

		// 회원가입 버튼 클릭
		btn_signup.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				SignUp.main(null);
				frame.dispose(); // 기존에 있던 창을 없애주는 메서드
			}
		});

		// 아이디 찾기 버튼 클릭
		btn_find_id.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Find_id.main(null);
				frame.dispose(); // 기존에 있던 창을 없애주는 메서드
			}
		});

		// 비밀번호 찾기 버튼 클릭
		btn_find_pwd.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Find_pwd.main(null);
				frame.dispose(); // 기존에 있던 창을 없애주는 메서드
			}
		});
	}

	// 메서드 - 아이디, 비밀번호 체크
	void check() {
		try {

			String input_id = txtf_id.getText();
			String input_pwd = txtf_pwd.getText();
			String input_loginInfo = input_id + input_pwd;

			boolean memTrue = false; // 회원일 경우 true

			// 회원정보 변수
			String login_id = null;
			String login_pwd = null;
			String login_memberName = null;
			String login_phone = null;
			String login_cardNum = null;
			int login_cardPwd = 0;

			// sql
			sql = "select id||pwd as data_loginInfo"
					+ "     , id , pwd, membername, phone, cardnum, cardpwd "
					+ "  from member_info"
					+ " where id||pwd = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, input_loginInfo);

			rs = pstmt.executeQuery();

			// 데이터베이스를 확인하여 입력값이 있는지 확인
			while (rs.next()) {
				String data_loginInfo = rs.getString("data_loginInfo");

				if (input_loginInfo.equals(data_loginInfo)) {
					memTrue = true;
					login_id = rs.getString("id");
					login_pwd = rs.getString("pwd");
					login_memberName = rs.getString("membername");
					login_phone = rs.getString("phone");
					login_cardNum = rs.getString("cardnum");
					login_cardPwd = rs.getInt("cardpwd");

				} else {
					memTrue = false;
				}
			}

			// 로그인이 되었을 경우
			// logingMemberDTO에 회원 정보저장
			LoginMember_DTO loginMem_dto = new LoginMember_DTO();

			if (memTrue == true) {
				// logingMemberDTO에 로그인 회원 정보저장
				loginMem_dto.setId(login_id);
				loginMem_dto.setPwd(login_pwd);
				loginMem_dto.setMemberName(login_memberName);
				loginMem_dto.setPhone(login_phone);
				loginMem_dto.setCardNum(login_cardNum);
				loginMem_dto.setCardPwd(login_cardPwd);

				JOptionPane.showMessageDialog(txtf_id, login_memberName + "님 반갑습니다.", null, JOptionPane.PLAIN_MESSAGE);

				// 메인페이지로 이동
				Mainpage mainpage = new Mainpage();
				mainpage.main(null);
				frame.dispose(); // 기존에 있던 창을 없애주는 메서드

			} else {
				JOptionPane.showMessageDialog(txtf_id, "일치하는 회원정보가 없습니다. \n 재시도 부탁드립니다.", "로그인",
						JOptionPane.PLAIN_MESSAGE);
			}

			// 연결자원 종료
			rs.close();
			pstmt.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
