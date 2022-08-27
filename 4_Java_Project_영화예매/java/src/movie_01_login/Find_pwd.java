package login;

import java.awt.EventQueue;

import java.awt.*;
import java.awt.event.*;
import java.sql.*;
import javax.swing.*;

import connect.DBConnect;

// 비밀번호 찾기 페이지

public class Find_pwd {

	// * 변수 -----------------------------------------------------
	Connection con = null; // 데이터베이스 연동
	PreparedStatement pstmt = null; // 데이터베이스에 sql 전송
	ResultSet rs = null; // 값 저장
	String sql = null; // sql문

	public JFrame frame;
	ProjectFrame pf = new ProjectFrame(); // 프레임(화면크기,배경,주사용컬러)
	JLabel logo;
	JButton btn_back;

	public JTextField txtf_id;
	public JTextField txtf_name;
	public JTextField txtf_phone1;
	public JTextField txtf_phone2;
	public JTextField txtf_phone3;

	// 메인메서드
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Find_pwd window = new Find_pwd();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	// 기본생성자
	public Find_pwd() {
		initialize();
	}

	// 메서드
	// --------------------------------------------------------------------------------------
	// 메서드 - 컴포넌트
	private void initialize() {

		// 프레임(Jframe)
		frame = pf.frame;
		frame.setTitle("비밀번호 찾기");

		// 컴포넌트
		// 상단
		// ----------------------------------------------------------------------------------
		// 뒤로가기 버튼
		pf.frameBackBtn();
		btn_back = pf.btn_back;

		// 로고 위치
		pf.frameLogoSmall();
		logo = pf.logo;

		// 중앙
		// ----------------------------------------------------------------------------------
		JSeparator separator = new JSeparator();
		separator.setBounds(63, 295, 582, 12);
		frame.getContentPane().add(separator);

		pf.frameLabel();
		JLabel label_id = pf.label;
		label_id.setText("아이디");
		label_id.setBounds(63, 340, 202, 44);

		txtf_id = new JTextField();
		txtf_id.setBounds(277, 340, 316, 44);
		frame.getContentPane().add(txtf_id);
		txtf_id.setColumns(10);

		pf.frameLabel();
		JLabel label_name = pf.label;
		label_name.setText("이름");
		label_name.setBounds(63, 405, 202, 38);

		txtf_name = new JTextField();
		txtf_name.setColumns(10);
		txtf_name.setBounds(277, 405, 316, 44);
		frame.getContentPane().add(txtf_name);

		pf.frameLabel();
		JLabel label_phone = pf.label;
		label_phone.setText("핸드폰번호");
		label_phone.setBounds(63, 477, 202, 38);

		// 핸드폰번호 1 ( 000-0000-0000 )
		txtf_phone1 = new JTextField();
		txtf_phone1.setColumns(3);
		txtf_phone1.setBounds(277, 477, 75, 44);
		frame.getContentPane().add(txtf_phone1);

		JLabel label_phone1 = new JLabel("-");
		label_phone1.setHorizontalAlignment(SwingConstants.CENTER);
		label_phone1.setFont(new Font("Lucida Grande", Font.PLAIN, 16));
		label_phone1.setBounds(355, 477, 15, 44);
		frame.getContentPane().add(label_phone1);

		// 핸드폰번호 2 ( 000-0000-0000 )
		txtf_phone2 = new JTextField();
		txtf_phone2.setColumns(5);
		txtf_phone2.setBounds(373, 477, 100, 44);
		frame.getContentPane().add(txtf_phone2);

		JLabel label_phone2 = new JLabel("-");
		label_phone2.setHorizontalAlignment(SwingConstants.CENTER);
		label_phone2.setFont(new Font("Lucida Grande", Font.PLAIN, 16));
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

		// 하단
		// ----------------------------------------------------------------------------------
		// 비밀번호찾기 버튼
		pf.framePointBtn();
		JButton btn_find_pwd = pf.btn_point_frame;
		btn_find_pwd.setText("비밀번호 찾기");
		btn_find_pwd.setBounds(239, 640, 215, 65);

		// * 이벤트
		// -------------------------------------------------------------------------------
		// 뒤로가기 버튼 클릭시 로그인 화면창으로 이동
		btn_back.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				btn_back.setForeground(Color.blue);
				SignIn.main(null);
				frame.dispose(); // 기존에 있던 창을 없애주는 메서드

			}
		});

		// 비밀번호 찾기 버튼 클릭
		btn_find_pwd.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {

				// 오라클 드라이버 로딩 및 데이터 베이스 연결
				con = DBConnect.getConnection();

				// 아이디 찾기 메서드
				findPwd();
			}
		});

	}

	// 메서드 - 비밀번호 찾기
	void findPwd() {
		try {

			// 지역변수
			String id = txtf_id.getText();
			String name = txtf_name.getText();
			String phone = txtf_phone1.getText() + "-" + txtf_phone2.getText() + "-" + txtf_phone3.getText();
			String input_pwdInfo = id + name + phone; // 아이디와 핸드폰번호 동일한 값을 찾기 위한 임시 합쳐놓은 값(일련번호)

			boolean memTrue = false; // 회원일 경우 true
			String mem_name = null; // 회원일 경우 값
			String mem_pwd = null; // 회원일 경우 값

			int choice = 1; // 로그인 페이지 클릭시 1
			String[] choose = { "로그인페이지", "닫기" };

			// sql
			sql = "select id"
					+ "     , pwd"
					+ "     , MEMBERNAME "
					+ "     , id || MEMBERNAME || phone as data_pwdInfo"
					+ "  from member_info"
					+ " where id || MEMBERNAME || phone = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, input_pwdInfo);

			rs = pstmt.executeQuery();

			// 데이터베이스를 확인하여 입력값이 있는지 확인
			while (rs.next()) {
				String data_pwdInfo = rs.getString("data_pwdInfo");

				if (input_pwdInfo.equals(data_pwdInfo)) {
					mem_name = rs.getString("MEMBERNAME");
					mem_pwd = rs.getString("pwd");
					memTrue = true;

				} else {
					memTrue = false;
				}
			}

			// 일치하는 아이디가 있으면 정보 반환
			if (memTrue == true) {
				choice = JOptionPane.showOptionDialog(txtf_name, mem_name + "님의 비밀번호는 " + mem_pwd + "입니다.", "비밀번호 찾기",
						0, JOptionPane.PLAIN_MESSAGE, null, choose, choose[1]);
			} else {
				JOptionPane.showMessageDialog(txtf_name, "일치하는 회원정보가 없습니다.", "비밀번호 찾기", JOptionPane.PLAIN_MESSAGE);
			}

			// 연결자원 종료
			rs.close();
			pstmt.close();
			con.close();

			// 로그인 페이지로 이동 클릭시 이동
			if (choice == 0) {
				SignIn signIn = new SignIn();
				SignIn.main(null);
				frame.dispose(); // 기존에 있던 창을 없애주는 메서드
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	};

}
