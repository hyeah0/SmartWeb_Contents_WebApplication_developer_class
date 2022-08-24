package movie_01_login;

import java.awt.*;
import javax.swing.*;

import connect.DBConnect;
import login.ProjectFrame;

import java.sql.*;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

// 회원가입 페이지
/*
	코드수정일 : 2022.08.18 
	as-is : 회원가입시 비밀번호, 카드비밀번호 이상있어도 회원가입 o, 팝업메세지 아이콘 유
	to-be : 회원가입시 비밀번호, 카드비밀번호 이상있어도 회원가입 x, 팝업메세지 아이콘 무
	
	코드수정일 : 2022.08.19
	as-is : 핸드폰번호, 카드번호 입력시 한번에 입력
	to-be : 핸드폰번호(3,4,4) , 카드번호(4,4,4,4) 입력시 나눠서 입력
	
	코드수정일 : 2022.08.23
	as-is : 회원가입 완료후 회원가입창 유지
	to-be : 회원가입 완료후 로그인페이지로 이동
	
*/
public class SignUp {

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
	public JTextField txtf_pwd;
	public JTextField txtf_pwd_ck;
	public JTextField txtf_name;
	public JTextField txtf_phone1;
	public JTextField txtf_phone2;
	public JTextField txtf_phone3;
	public JTextField txtf_card_num1;
	public JTextField txtf_card_num2;
	public JTextField txtf_card_num3;
	public JTextField txtf_card_num4;
	public JTextField txtf_card_pwd;

	// 아이디, 패스워드, 카드패스워드 가이드 라벨
	JLabel label_id_txt;
	JLabel label_pwd_txt;
	JLabel label_card_pwd_txt;

	String phone;
	String cardNum;

	JButton btn_id_ck;
	boolean id_ck = false; // 아이디 사용 가능할 경우 : true
	boolean pwd_ck = false; // 비밀번호 사용가능 할 경우 : true
	boolean phoneNum_ck = false; // 핸드폰번호 사용 가능할 경우 : true
	boolean cardNum_ck = false; // 카드번호 사용 가능할 경우 : true

	// 메인메서드
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					SignUp window = new SignUp();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	// 기본생성자
	public SignUp() {
		initialize();
	}

	// 메서드
	// --------------------------------------------------------------------------------------
	// 메서드 - 컴포넌트
	private void initialize() {

		// 프레임(Jframe)
		frame = pf.frame;
		frame.setTitle("회원가입");

		// 컴포넌트
		// 상단 -----------------------------------------------------------------------
		// 뒤로가기 버튼
		pf.frameBackBtn();
		btn_back = pf.btn_back;
		frame.getContentPane().add(btn_back);

		// 로고위치
		pf.frameLogoSmall();
		logo = pf.logo;
		logo.setBounds(295, 0, 244, 115);
		frame.getContentPane().add(logo);

		// 중앙 -----------------------------------------------------------------------
		pf.frameLabel();
		JLabel label_id = pf.label;
		label_id.setText("아이디");
		label_id.setBounds(63, 127, 202, 44);

		txtf_id = new JTextField();
		txtf_id.setBounds(277, 127, 316, 44);
		txtf_id.requestFocus();
		frame.getContentPane().add(txtf_id);

		label_id_txt = new JLabel("※ 숫자 또는 영문 최대 20자 가능합니다.");
		label_id_txt.setForeground(pf.color_guide_default);
		label_id_txt.setBounds(277, 166, 316, 40);
		frame.getContentPane().add(label_id_txt);

		btn_id_ck = new JButton("중복 확인");
		btn_id_ck.setBounds(602, 127, 74, 44);
		btn_id_ck.setContentAreaFilled(false); // 버튼 투명하게
		btn_id_ck.setFont(new Font("Lucida Grande", Font.PLAIN, 8));
		frame.getContentPane().add(btn_id_ck);

		pf.frameLabel();
		JLabel label_pwd = pf.label;
		label_pwd.setText("비밀번호");
		label_pwd.setBounds(63, 209, 202, 44);

		txtf_pwd = new JTextField();
		txtf_pwd.setBounds(277, 209, 316, 44);
		frame.getContentPane().add(txtf_pwd);

		pf.frameLabel();
		JLabel label_pwd_ck = pf.label;
		label_pwd_ck.setText("비밀번호확인");
		label_pwd_ck.setBounds(63, 276, 202, 44);

		txtf_pwd_ck = new JTextField();
		txtf_pwd_ck.setBounds(277, 276, 316, 44);
		frame.getContentPane().add(txtf_pwd_ck);

		label_pwd_txt = new JLabel("※ 숫자 또는 영문 최대 20자 가능합니다.");
		label_pwd_txt.setForeground(pf.color_guide_default);
		label_pwd_txt.setBounds(277, 316, 316, 40);
		frame.getContentPane().add(label_pwd_txt);

		JSeparator separator = new JSeparator();
		separator.setBounds(63, 368, 582, 12);
		frame.getContentPane().add(separator);
		// --------------------------------------------------- //

		pf.frameLabel();
		JLabel label_name = pf.label;
		label_name.setText("이름");
		label_name.setBounds(63, 405, 202, 44);

		txtf_name = new JTextField();
		txtf_name.requestFocus();
		txtf_name.setBounds(277, 405, 316, 44);
		frame.getContentPane().add(txtf_name);

		pf.frameLabel();
		JLabel label_phone = pf.label;
		label_phone.setText("핸드폰번호");
		label_phone.setBounds(63, 477, 202, 44);

		// 핸드폰번호 1 ( 000-0000-0000 )
		txtf_phone1 = new JTextField();
		txtf_phone1.setBounds(277, 477, 75, 44);
		frame.getContentPane().add(txtf_phone1);

		pf.frameLabel();
		JLabel label_phone1 = pf.label;
		label_phone1.setText("-");
		label_phone1.setBounds(355, 477, 15, 44);

		// 핸드폰번호 2 ( 000-0000-0000 )
		txtf_phone2 = new JTextField();
		txtf_phone2.setBounds(373, 477, 100, 44);
		frame.getContentPane().add(txtf_phone2);

		pf.frameLabel();
		JLabel label_phone2 = pf.label;
		label_phone2.setText("-");
		label_phone2.setBounds(476, 477, 15, 44);

		// 핸드폰번호 3 ( 000-0000-0000 )
		txtf_phone3 = new JTextField();
		txtf_phone3.setBounds(493, 478, 100, 44);
		frame.getContentPane().add(txtf_phone3);

		JSeparator separator_1 = new JSeparator();
		separator_1.setBounds(63, 542, 582, 12);
		frame.getContentPane().add(separator_1);
		// --------------------------------------------------- //

		pf.frameLabel();
		JLabel label_card_num = pf.label;
		label_card_num.setText("결제 카드번호");
		label_card_num.setBounds(63, 578, 202, 44);

		// 카드번호 1 (0000-0000-0000-0000)
		txtf_card_num1 = new JTextField();
		txtf_card_num1.setBounds(277, 578, 68, 44);
		frame.getContentPane().add(txtf_card_num1);

		pf.frameLabel();
		JLabel label_card_num1 = pf.label;
		label_card_num1.setText("-");
		label_card_num1.setBounds(346, 578, 15, 44);

		// 카드번호 2 (0000-0000-0000-0000)
		txtf_card_num2 = new JTextField();
		txtf_card_num2.setBounds(361, 578, 67, 44);
		frame.getContentPane().add(txtf_card_num2);

		pf.frameLabel();
		JLabel label_card_num2 = pf.label;
		label_card_num2.setText("-");
		label_card_num2.setBounds(428, 578, 15, 44);

		// 카드번호 3 (0000-0000-0000-0000)
		txtf_card_num3 = new JTextField();
		txtf_card_num3.setBounds(443, 578, 67, 44);
		frame.getContentPane().add(txtf_card_num3);

		pf.frameLabel();
		JLabel label_card_num3 = pf.label;
		label_card_num3.setText("-");
		label_card_num3.setBounds(510, 578, 15, 44);

		// 카드번호 4 (0000-0000-0000-0000)
		txtf_card_num4 = new JTextField();
		txtf_card_num4.setBounds(525, 578, 68, 44);
		frame.getContentPane().add(txtf_card_num4);

		pf.frameLabel();
		JLabel label_card_pwd = pf.label;
		label_card_pwd.setText("결제 카드 비밀번호");
		label_card_pwd.setBounds(63, 649, 202, 44);

		txtf_card_pwd = new JTextField(4);
		txtf_card_pwd.setColumns(10);
		txtf_card_pwd.setBounds(277, 649, 316, 44);
		frame.getContentPane().add(txtf_card_pwd);

		label_card_pwd_txt = new JLabel("※ 숫자 4자리 입력해주세요.");
		label_card_pwd_txt.setForeground(pf.color_guide_default);
		label_card_pwd_txt.setBounds(277, 689, 316, 40);
		frame.getContentPane().add(label_card_pwd_txt);

		// 하단 -----------------------------------------------------------------------
		// 회원가입 버튼
		pf.framePointBtn();
		JButton btn_signUp = pf.btn_point_frame;
		btn_signUp.setText("회원가입 하기");
		btn_signUp.setBounds(239, 770, 215, 65);

		// * 이벤트
		// -------------------------------------------------------------------------------
		// 뒤로가기 버튼 클릭시 로그인 화면창으로 이동
		btn_back.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				SignIn.main(null);
				frame.dispose(); // 기존에 있던 창을 없애주는 메서드

			}
		});

		// 아이디 확인 버튼 클릭
		btn_id_ck.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {

				if (txtf_id.getText().equals("")) {
					label_id_txt.setText("아이디를 입력해주세요. ");
					label_id_txt.setForeground(pf.color_guide_error);
					txtf_id.setBackground(pf.color_error_back); // 에러날 경우 색깔 변경
					id_ck = false;
				} else if (txtf_id.getText().length() > 20) {
					label_id_txt.setText("아이디는 20자 이내로 생성가능합니다.");
					label_id_txt.setForeground(pf.color_guide_error);
					txtf_id.setBackground(pf.color_error_back); // 에러날 경우 색깔 변경
					id_ck = false;
				} else {
					// 오라클 드라이버 로딩 및 데이터 베이스 연결
					con = DBConnect.getConnection();
					checkId();
				}
			}
		});

		// 회원가입 버튼 클릭
		btn_signUp.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {

				boolean cardPwd_ck = false; // 카드비밀번호 사용가능 할 경우 : true

				reset_txtField();

				// 아이디 유효성 검사
				if (id_ck == false) {
					btn_id_ck.setForeground(pf.color_guide_error); // 에러날 경우 버튼 글씨 색깔 변경
					btn_id_ck.setBackground(pf.color_error_back);
					JOptionPane.showMessageDialog(txtf_name, "아이디 확인 부탁드립니다.", null, JOptionPane.WARNING_MESSAGE);
					return;
				}

				// 비밀번호 유효성 검사
				if (txtf_pwd.getText().equals(txtf_pwd_ck.getText()) && txtf_pwd.getText().length() > 0
						&& txtf_pwd.getText().length() < 20) {
					label_pwd_txt.setText("사용 가능합니다.");
					label_pwd_txt.setForeground(pf.color_guide_ok);
					pwd_ck = true;
				} else if (txtf_pwd.getText().equals("")) {
					label_pwd_txt.setText("비밀번호를 입력해주세요.");
					checkPwd();
					return;
				} else if (txtf_pwd.getText().length() > 20) {
					label_pwd_txt.setText("비밀번호는 20자 이내로 생성가능합니다.");
					checkPwd();
					return;
				} else {
					label_pwd_txt.setText("비밀번호가 다릅니다.");
					checkPwd();
					return;
				}

				// 이름 공백 유효성 검사
				if (txtf_name.getText().length() == 0) {
					txtf_name.setBackground(pf.color_error_back);
					JOptionPane.showMessageDialog(txtf_name, "이름 입력 부탁드립니다.", null, JOptionPane.WARNING_MESSAGE);
					return;
				} else if (txtf_name.getText().length() > 20) {
					txtf_name.setBackground(pf.color_error_back);
					JOptionPane.showMessageDialog(txtf_name, "이름은 20자 이내로 입력 부탁드립니다.", null,
							JOptionPane.WARNING_MESSAGE);
					return;
				}

				// 핸드폰번호 유효성 검사 메서드
				checkPhoneNum();
				if (phoneNum_ck == false) {
					return;
				}

				// 카드 넘버 유효성 검사 메서드
				checkCardNum();
				if (cardNum_ck == false) {
					return;
				}

				// 카드 비밀번호 유효성 검사
				if (txtf_card_pwd.getText().length() == 4) {
					label_card_pwd_txt.setText("사용 가능합니다.");
					label_card_pwd_txt.setForeground(pf.color_guide_ok);
					cardPwd_ck = true;

				} else if (txtf_card_pwd.getText().length() != 4) {
					label_card_pwd_txt.setText("비밀번호는 4자리 작성해주세요");
					label_card_pwd_txt.setForeground(pf.color_guide_error);
					txtf_card_pwd.setBackground(pf.color_error_back);
					JOptionPane.showMessageDialog(txtf_name, "카드비밀번호 확인 부탁드립니다.", null, JOptionPane.WARNING_MESSAGE);
					cardPwd_ck = false;
					return;
				}

				// 오라클 드라이버 로딩 및 데이터 베이스 연결
				con = DBConnect.getConnection();

				// 텍스트필드에 입력값 데이터에 저장
				insert();

				// 입력값 초기화
				reset();

				// 로그인창으로 이동
				SignIn.main(null);
				frame.dispose(); // 기존에 있던 창을 없애주는 메서드

			}
		});

	}// initialize() 메서드 끝

	// 메서드 - 아이디 체크
	void checkId() {
		try {

			String input_id = txtf_id.getText();

			sql = "select id"
					+ "  from member_info"
					+ " where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, input_id);

			rs = pstmt.executeQuery();
			boolean dataTrue = rs.next(); // true 일 경우 동일 아이디 있음
			// System.out.println(dataTrue);

			if (dataTrue == false) {
				label_id_txt.setText("사용가능합니다.");
				label_id_txt.setForeground(pf.color_guide_ok);
				txtf_id.setBackground(pf.color_reset);
				id_ck = true; // 1일경우 아이디 사용 가능
			} else {
				String data_id = rs.getString("id");
				if (txtf_id.getText().equals(data_id)) {
					txtf_id.setBackground(pf.color_error_back);
					label_id_txt.setText("동일 아이디가 있습니다. 다른 아이디를 입력해 주세요.");
					label_id_txt.setForeground(pf.color_guide_error);
					id_ck = false;
				}
			}

			// 연결자원 종료
			pstmt.close();
			rs.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 메서드 - 비밀번호 체크
	void checkPwd() {
		label_pwd_txt.setForeground(pf.color_guide_error);
		txtf_pwd.setBackground(pf.color_error_back);
		txtf_pwd_ck.setBackground(pf.color_error_back);
		JOptionPane.showMessageDialog(txtf_name, "비밀번호 확인 부탁드립니다.", null, JOptionPane.WARNING_MESSAGE);
		pwd_ck = false;
	}

	// 메서드 - 핸드폰 번호 체크
	void checkPhoneNum() {

		String input_phone1 = txtf_phone1.getText();
		String input_phone2 = txtf_phone2.getText();
		String input_phone3 = txtf_phone3.getText();

		if (input_phone1.equals("") || input_phone1.length() != 3) {
			txtf_phone1.setBackground(pf.color_error_back); // 에러날 경우 색깔 변경
			JOptionPane.showMessageDialog(txtf_name, "핸드폰 번호 확인 부탁드립니다.\n(3자리 입력해주세요.)", null,
					JOptionPane.WARNING_MESSAGE);
			phoneNum_ck = false;
			return;
		} else if (input_phone2.equals("") || input_phone2.length() != 4) {
			txtf_phone2.setBackground(pf.color_error_back); // 에러날 경우 색깔 변경
			JOptionPane.showMessageDialog(txtf_name, "핸드폰 번호 확인 부탁드립니다.\n(4자리 입력해주세요.)", null,
					JOptionPane.WARNING_MESSAGE);
			phoneNum_ck = false;
			return;
		} else if (input_phone3.equals("") || input_phone3.length() != 4) {
			txtf_phone3.setBackground(pf.color_error_back); // 에러날 경우 색깔 변경
			JOptionPane.showMessageDialog(txtf_name, "핸드폰 번호 확인 부탁드립니다.\n(4자리 입력해주세요.)", null,
					JOptionPane.WARNING_MESSAGE);
			phoneNum_ck = false;
			return;
		} else {
			phoneNum_ck = true;
			phone = input_phone1 + "-" + input_phone2 + "-" + input_phone3;
		}

	};

	// 메서드 - 카드번호 체크
	void checkCardNum() {

		String[] input_cardNum = { txtf_card_num1.getText(), txtf_card_num2.getText(), txtf_card_num3.getText(),
				txtf_card_num4.getText() };

		int errorNum = 0;
		for (int i = 0; i < input_cardNum.length; i++) {
			if (input_cardNum[i].equals("") || input_cardNum[i].length() != 4) {

				errorNum = i;
				cardNum_ck = false;

				switch (errorNum) {
					case 0:
						txtf_card_num1.setBackground(pf.color_error_back); // 에러날 경우 색깔 변경
						break;
					case 1:
						txtf_card_num2.setBackground(pf.color_error_back); // 에러날 경우 색깔 변경
						break;
					case 2:
						txtf_card_num3.setBackground(pf.color_error_back); // 에러날 경우 색깔 변경
						break;
					case 3:
						txtf_card_num4.setBackground(pf.color_error_back); // 에러날 경우 색깔 변경
						break;
				}

				JOptionPane.showMessageDialog(txtf_name, "카드 번호 확인 부탁드립니다.\n(4자리 입력해주세요.)", null,
						JOptionPane.WARNING_MESSAGE);
				return;

			} else {
				errorNum = 4; // 에러 아님
				cardNum_ck = true;

				cardNum = input_cardNum[0] + "-" + input_cardNum[1] + "-" + input_cardNum[2] + "-" + input_cardNum[3];
			}
		}

	};

	// 메서드 - 회원 등록
	void insert() {
		try {

			// 1. sql ( 데이터에 회원 정보 저장 )
			sql = "insert into member_info"
					+ "     values(?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, txtf_id.getText());
			pstmt.setString(2, txtf_pwd.getText());
			pstmt.setString(3, txtf_name.getText());
			pstmt.setString(4, phone);
			pstmt.setString(5, cardNum);
			pstmt.setInt(6, Integer.parseInt(txtf_card_pwd.getText()));

			// 2. sql -> 데이터베이스
			int res = pstmt.executeUpdate();
			if (res > 0) {
				JOptionPane.showMessageDialog(txtf_name, "회원가입이 완료되었습니다.", "회원가입", JOptionPane.PLAIN_MESSAGE);
			} else {
				JOptionPane.showMessageDialog(txtf_name, "입력을 다시 해주세요.", "회원가입", JOptionPane.WARNING_MESSAGE);
			}

			// 3. 연결 자원 종료
			pstmt.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 리셋 메서드 ---------------------------------------------------------------
	// 메서드 - 리셋
	void reset() {
		txtf_id.setText("");
		txtf_pwd.setText("");
		txtf_pwd_ck.setText("");
		txtf_name.setText("");
		txtf_phone1.setText("");
		txtf_phone2.setText("");
		txtf_phone3.setText("");
		txtf_card_num1.setText("");
		txtf_card_num2.setText("");
		txtf_card_num3.setText("");
		txtf_card_num4.setText("");
		txtf_card_pwd.setText("");

		label_id_txt.setText("※ 숫자 또는 영문 최대 20자 가능합니다.");
		label_pwd_txt.setText("※ 숫자 또는 영문 최대 20자 가능합니다.");
		label_card_pwd_txt.setText("※ 숫자 4자리 입력해주세요.");
		label_id_txt.setForeground(pf.color_guide_default);
		label_pwd_txt.setForeground(pf.color_guide_default);
		label_card_pwd_txt.setForeground(pf.color_guide_default);

		txtf_id.requestFocus();
	}

	// 메서드 - 아이디 텍스트 리셋
	void reset_txt_id() {
		label_id_txt.setText("※ 숫자 또는 영문 최대 20자 가능합니다.");
		label_id_txt.setForeground(pf.color_guide_default);
	}

	// 메서드 - 텍스트필드 리셋
	void reset_txtField() {
		txtf_id.setBackground(pf.color_reset);

		txtf_pwd.setBackground(pf.color_reset);
		txtf_pwd_ck.setBackground(pf.color_reset);

		txtf_name.setBackground(pf.color_reset);

		txtf_phone1.setBackground(pf.color_reset);
		txtf_phone2.setBackground(pf.color_reset);
		txtf_phone3.setBackground(pf.color_reset);

		txtf_card_num1.setBackground(pf.color_reset);
		txtf_card_num2.setBackground(pf.color_reset);
		txtf_card_num3.setBackground(pf.color_reset);
		txtf_card_num4.setBackground(pf.color_reset);

		txtf_card_pwd.setBackground(pf.color_reset);
	}

}
