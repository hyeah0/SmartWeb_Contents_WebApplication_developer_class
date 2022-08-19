package movie_01_login;

import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.*;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;

import java.sql.*;
import java.util.Arrays;

// 회원가입 페이지
/*
	코드수정일 : 2022.08.18 
	as-is : 회원가입시 비밀번호, 카드비밀번호 이상있어도 회원가입 o, 팝업메세지 아이콘 유
	to-be : 회원가입시 비밀번호, 카드비밀번호 이상있어도 회원가입 x, 팝업메세지 아이콘 무
	
	코드수정일 : 2022.08.19
	as-is : 핸드폰번호, 카드번호 입력시 한번에 입력
	to-be : 핸드폰번호(3,4,4) , 카드번호(4,4,4,4) 입력시 나눠서 입력
	
*/
public class SignUp {

	// * 변수 -----------------------------------------------------
	Connection con = null;  		// 데이터베이스 연동
	PreparedStatement pstmt = null; // 데이터베이스에 sql 전송
	ResultSet rs = null; 			// 값 저장
	String sql = null;				// sql문
	
	Member_DTO mem_dto = new Member_DTO();
	
	public JFrame frame;
	public JTextField txtf_id;
	public JTextField txtf_pwd;
	public JTextField txtf_pwd_ck;
	public JTextField txtf_name;
	// public JTextField txtf_phone;
	public JTextField txtf_phone1;
	public JTextField txtf_phone2;
	public JTextField txtf_phone3;
	// public JTextField txtf_card_num;
	public JTextField txtf_card_num1;
	public JTextField txtf_card_num2;
	public JTextField txtf_card_num3;
	public JTextField txtf_card_num4;
	public JTextField txtf_card_pwd;

	JLabel label_id_txt;
	JLabel label_pwd_txt;
	JLabel label_card_pwd_txt;
	
	String phone;
	String cardNum;
	
	JButton btn_id_ck;
	int id_ck = 0;					// 아이디 사용 가능할 경우 : 1 
	boolean phoneNum_ck = false; 	// 핸드폰번호 사용 가능할 경우 : true
	boolean cardNum_ck = false; 	// 카드번호 사용 가능할 경우 : true
	
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

	// 컴포넌트 출력 메서드
	private void initialize() {
		frame = new JFrame();
		frame.setTitle("회원가입");
		frame.getContentPane().setBackground(Color.WHITE);
		frame.setBounds(100, 100, 700, 900);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		// 컴포넌트
		// 상단 ----------------------------------------------------------------------------------
		ImageIcon icon_back = new ImageIcon("src/img/back3.png"); 
		JButton btn_back = new JButton();
		btn_back.setBounds(22, 30, 70, 70);
		btn_back.setIcon(icon_back);
		btn_back.setBorder(null);
		btn_back.setContentAreaFilled(false); // 버튼 투명하게
		frame.getContentPane().add(btn_back);
		
		JLabel logo = new JLabel(" ");
		logo.setIcon(new ImageIcon(SignIn.class.getResource("/img/tmplogo_small.png")));
		logo.setBounds(295, 0, 244, 115);
		frame.getContentPane().add(logo);
		
		// 중간 -----------------------------------------------------------------------
		JLabel label_id = new JLabel("아이디");
		label_id.setHorizontalAlignment(SwingConstants.CENTER);
		label_id.setFont(new Font("Lucida Grande", Font.PLAIN, 16));
		label_id.setBounds(63, 127, 202, 44);
		frame.getContentPane().add(label_id);
		
		txtf_id = new JTextField();
		txtf_id.setFocusable(true);
		txtf_id.setBounds(277, 127, 316, 44);
		frame.getContentPane().add(txtf_id);
		
		label_id_txt = new JLabel("※ 숫자 또는 영문 최대 20자 가능합니다.");
		label_id_txt.setForeground(Color.GRAY);
		label_id_txt.setBounds(277, 166, 316, 40);
		frame.getContentPane().add(label_id_txt);
		
		btn_id_ck = new JButton("아이디 확인");
		btn_id_ck.setBounds(602, 127, 74, 44);
		btn_id_ck.setContentAreaFilled(false); // 버튼 투명하게
		frame.getContentPane().add(btn_id_ck);
		
		JLabel label_pwd = new JLabel("비밀번호");
		label_pwd.setHorizontalAlignment(SwingConstants.CENTER);
		label_pwd.setFont(new Font("Lucida Grande", Font.PLAIN, 16));
		label_pwd.setBounds(63, 209, 202, 44);
		frame.getContentPane().add(label_pwd);
		
		txtf_pwd = new JTextField();
		txtf_pwd.setColumns(10);
		txtf_pwd.setBounds(277, 209, 316, 44);
		frame.getContentPane().add(txtf_pwd);
		
		JLabel label_pwd_ck = new JLabel("비밀번호확인");
		label_pwd_ck.setHorizontalAlignment(SwingConstants.CENTER);
		label_pwd_ck.setFont(new Font("Lucida Grande", Font.PLAIN, 16));
		label_pwd_ck.setBounds(63, 276, 202, 44);
		frame.getContentPane().add(label_pwd_ck);
		
		txtf_pwd_ck = new JTextField();
		txtf_pwd_ck.setColumns(10);
		txtf_pwd_ck.setBounds(277, 276, 316, 44);
		frame.getContentPane().add(txtf_pwd_ck);
		
		label_pwd_txt = new JLabel("※ 숫자 또는 영문 최대 20자 가능합니다.");
		label_pwd_txt.setForeground(Color.GRAY);
		label_pwd_txt.setBounds(277, 316, 316, 40);
		frame.getContentPane().add(label_pwd_txt);
		
		JSeparator separator = new JSeparator();
		separator.setBounds(63, 368, 582, 12);
		frame.getContentPane().add(separator);
	
		// ---------------------------------------------------------------------------- //
		
		JLabel label_name = new JLabel("이름");
		label_name.setHorizontalAlignment(SwingConstants.CENTER);
		label_name.setFont(new Font("Lucida Grande", Font.PLAIN, 16));
		label_name.setBounds(63, 405, 202, 44);
		frame.getContentPane().add(label_name);
		
		txtf_name = new JTextField();
		txtf_name.requestFocus();
		txtf_name.setBounds(277, 405, 316, 44);
		frame.getContentPane().add(txtf_name);
		
		JLabel label_phone = new JLabel("핸드폰번호");
		label_phone.setHorizontalAlignment(SwingConstants.CENTER);
		label_phone.setFont(new Font("Lucida Grande", Font.PLAIN, 16));
		label_phone.setBounds(63, 477, 202, 44);
		frame.getContentPane().add(label_phone);
		
		// ----- 핸드폰번호 컴포넌트 시작 ----------------------------------------------- //		
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
		
		// ----- 핸드폰번호 컴포넌트 끝 ------------------------------------------------ //

		JLabel label_card_num = new JLabel("결제 카드번호");
		label_card_num.setHorizontalAlignment(SwingConstants.CENTER);
		label_card_num.setFont(new Font("Lucida Grande", Font.PLAIN, 16));
		label_card_num.setBounds(63, 578, 202, 44);
		frame.getContentPane().add(label_card_num);
		
		// ----- 카드 넘버 컴포넌트 시작 ----------------------------------------------- //
		txtf_card_num1 = new JTextField();
		txtf_card_num1.setColumns(4);
		txtf_card_num1.setBounds(277, 578, 66, 44);
		frame.getContentPane().add(txtf_card_num1);
		
		JLabel label_card_num1 = new JLabel("-");
		label_card_num1.setHorizontalAlignment(SwingConstants.CENTER);
		label_card_num1.setFont(new Font("Lucida Grande", Font.PLAIN, 16));
		label_card_num1.setBounds(346, 578, 15, 44);
		frame.getContentPane().add(label_card_num1);
		
		txtf_card_num2 = new JTextField();
		txtf_card_num2.setColumns(4);
		txtf_card_num2.setBounds(364, 578, 66, 44);
		frame.getContentPane().add(txtf_card_num2);
		
		JLabel label_card_num2 = new JLabel("-");
		label_card_num2.setHorizontalAlignment(SwingConstants.CENTER);
		label_card_num2.setFont(new Font("Lucida Grande", Font.PLAIN, 16));
		label_card_num2.setBounds(427, 578, 15, 44);
		frame.getContentPane().add(label_card_num2);
		
		txtf_card_num3 = new JTextField();
		txtf_card_num3.setColumns(4);
		txtf_card_num3.setBounds(447, 578, 66, 44);
		frame.getContentPane().add(txtf_card_num3);
		
		JLabel label_card_num3 = new JLabel("-");
		label_card_num3.setHorizontalAlignment(SwingConstants.CENTER);
		label_card_num3.setFont(new Font("Lucida Grande", Font.PLAIN, 16));
		label_card_num3.setBounds(508, 578, 15, 44);
		frame.getContentPane().add(label_card_num3);
		
		txtf_card_num4 = new JTextField();
		txtf_card_num4.setColumns(4);
		txtf_card_num4.setBounds(527, 578, 66, 44);
		frame.getContentPane().add(txtf_card_num4);
		// ----- 카드 넘버 컴포넌트 끝 ------------------------------------------------ //
		
		JLabel label_card_pwd = new JLabel("결제 카드 비밀번호");
		label_card_pwd.setHorizontalAlignment(SwingConstants.CENTER);
		label_card_pwd.setFont(new Font("Lucida Grande", Font.PLAIN, 16));
		label_card_pwd.setBounds(63, 649, 202, 44);
		frame.getContentPane().add(label_card_pwd);
		
		txtf_card_pwd = new JTextField(4);
		txtf_card_pwd.setColumns(10);
		txtf_card_pwd.setBounds(277, 649, 316, 44);
		frame.getContentPane().add(txtf_card_pwd);
		
		label_card_pwd_txt = new JLabel("※ 숫자 4자리 입력해주세요.");
		label_card_pwd_txt.setForeground(Color.GRAY);
		label_card_pwd_txt.setBounds(277, 689, 316, 40);
		frame.getContentPane().add(label_card_pwd_txt);
		
		// 하단 -----------------------------------------------------------------------
		JButton btn_signUp = new JButton("회원가입 하기");
		btn_signUp.setForeground(Color.RED);
		btn_signUp.setFont(new Font("Lucida Grande", Font.PLAIN, 20));
		btn_signUp.setBounds(239, 770, 215, 65);
		btn_signUp.setContentAreaFilled(false); // 버튼 투명하게
		frame.getContentPane().add(btn_signUp);
		
		
		// * 이벤트 -------------------------------------------------------------------------------
		// 뒤로가기 버튼 클릭시 로그인 화면창으로 이동
			btn_back.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					btn_back.setForeground(Color.blue);
					SignIn.main(null);
					frame.dispose(); // 기존에 있던 창을 없애주는 메서드

				}
			});
			
		// 아이디 확인 버튼 클릭
			btn_id_ck.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					
					if(txtf_id.getText().equals("")) {
						label_id_txt.setText("아이디를 입력해주세요. ");
						label_id_txt.setForeground(Color.red);
						id_ck = 0;
					}else if(txtf_id.getText().length()>20) {
						label_id_txt.setText("아이디는 20자 이내로 생성가능합니다.");
						label_id_txt.setForeground(Color.red);
						id_ck = 0;
					}else {
						//오라클 드라이버 로딩 및 데이터 베이스 연결
						con = DBConnect.getConnection();
						checkId();
					}
				}
			});
			
		// 회원가입 버튼 클릭
			btn_signUp.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					
					boolean pwd_ck = false; 	// 비밀번호 사용가능 할 경우 : true
					boolean cardPwd_ck = false; // 카드비밀번호 사용가능 할 경우 : true
					
					// 아이디 유효성 검사
					if(id_ck != 1) {
						JOptionPane.showMessageDialog(null, "아이디 확인 부탁드립니다.", null, JOptionPane.WARNING_MESSAGE);
						return;
					}
					
					// 비밀번호 유효성 검사
					if(txtf_pwd.getText().equals(txtf_pwd_ck.getText()) && txtf_pwd.getText().length()>0) {
						label_pwd_txt.setText("사용 가능합니다.");
						label_pwd_txt.setForeground(Color.green);
						pwd_ck = true;
						
					}else {
						label_pwd_txt.setText("비밀번호가 다릅니다.");
						label_pwd_txt.setForeground(Color.red);
						JOptionPane.showMessageDialog(null, "비밀번호 확인 부탁드립니다.", null , JOptionPane.WARNING_MESSAGE);
						pwd_ck = false;
						return;
					}
					
					// 이름 공백 유효성 검사
					if(txtf_name.getText().length()==0){
						JOptionPane.showMessageDialog(null, "이름 입력 부탁드립니다.", null, JOptionPane.WARNING_MESSAGE);
						return;
					}
					
					// 핸드폰번호 유효성 검사 메서드
					txtf_phone1.setBackground(new Color(255, 255, 255));
					txtf_phone2.setBackground(new Color(255, 255, 255));
					txtf_phone3.setBackground(new Color(255, 255, 255));
					checkPhoneNum();
					if(phoneNum_ck == false) {
						return;
					}
				
					// 카드 넘버 유효성 검사 메서드
					txtf_card_num1.setBackground(new Color(255, 255, 255));
					txtf_card_num2.setBackground(new Color(255, 255, 255));
					txtf_card_num3.setBackground(new Color(255, 255, 255));
					txtf_card_num4.setBackground(new Color(255, 255, 255));
					checkCardNum();
					if(cardNum_ck == false) {
						return;
					}
					
					// 카드 비밀번호 유효성 검사
					if(txtf_card_pwd.getText().length()==4) {
						label_card_pwd_txt.setText("사용 가능합니다.");
						label_card_pwd_txt.setForeground(Color.green);
						cardPwd_ck = true;
						
					}else if(txtf_card_pwd.getText().length() != 4){
						label_card_pwd_txt.setText("비밀번호는 4자리 작성해주세요"); 
						label_card_pwd_txt.setForeground(Color.red);
						JOptionPane.showMessageDialog(null, "카드비밀번호 확인 부탁드립니다.", null, JOptionPane.WARNING_MESSAGE);
						cardPwd_ck = false;
						return;
						
					}
					
					// 오라클 드라이버 로딩 및 데이터 베이스 연결 
					con = DBConnect.getConnection();
					
					// mem_dto 객체에 값 저장
					mem_dto.setId(txtf_id.getText());
					mem_dto.setPwd(txtf_pwd.getText());
					mem_dto.setMemberName(txtf_name.getText());
					mem_dto.setPhone(phone);
					mem_dto.setCardNum(cardNum);
					mem_dto.setCardPwd(Integer.parseInt(txtf_card_pwd.getText()));
				
					// mem_dto에 입력된 값 데이터에 입력 메서드
					insert(mem_dto);
					
					// 입력값 초기화 
					reset_txt();
					reset();
						
				}
			});
		
	}// initialize() 메서드 끝
	

	// 메서드 - 아이디 체크 -----------------------------------------------------------------
		void checkId() {
			try {
				
				String input_id = txtf_id.getText();
				
				sql = "select id"
					+ "  from member_info"
					+ " where id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, input_id);
				
				rs = pstmt.executeQuery();
				boolean dataTrue = rs.next(); 	// true 일 경우 동일 아이디 있음
				// System.out.println(dataTrue);
				
				if(dataTrue == false) {
					id_ck =1;
					label_id_txt.setText("사용가능합니다.");
					label_id_txt.setForeground(Color.green);
					id_ck = 1;  // 1일경우 아이디 사용 가능
				}else {
						String tmp = rs.getString("id");
						if(txtf_id.getText().equals(tmp)) {
							label_id_txt.setText("동일 아이디가 있습니다. 다른 아이디를 입력해 주세요.");
							label_id_txt.setForeground(Color.red);
							id_ck = 0;
						}
				}
	
				// 연결자원 종료
				pstmt.close();
				rs.close();
	
	
			}catch(Exception e) {
				e.printStackTrace();
			}
		}

	// 메서드 - 핸드폰 번호 체크 -------------------------------------------------------------
		void checkPhoneNum() {
			
			String input_phone1 = txtf_phone1.getText();
			String input_phone2 = txtf_phone2.getText();
			String input_phone3 = txtf_phone3.getText();
			
			if(input_phone1.equals("") || input_phone1.length() !=3) {
				txtf_phone1.setBackground(new Color(255, 228, 225)); // 에러날 경우 색깔 변경
				JOptionPane.showMessageDialog(null, "핸드폰 번호 확인 부탁드립니다.\n(3자리 입력해주세요.)",null,JOptionPane.WARNING_MESSAGE);
				phoneNum_ck = false;
				return;
			}else if (input_phone2.equals("") || input_phone2.length() !=4) {
				txtf_phone2.setBackground(new Color(255, 228, 225)); // 에러날 경우 색깔 변경
				JOptionPane.showMessageDialog(null, "핸드폰 번호 확인 부탁드립니다.\n(4자리 입력해주세요.)",null,JOptionPane.WARNING_MESSAGE);
				phoneNum_ck = false;
				return;
			}else if(input_phone3.equals("") || input_phone3.length() !=4) {
				txtf_phone3.setBackground(new Color(255, 228, 225)); // 에러날 경우 색깔 변경
				JOptionPane.showMessageDialog(null, "핸드폰 번호 확인 부탁드립니다.\n(4자리 입력해주세요.)",null,JOptionPane.WARNING_MESSAGE);
				phoneNum_ck = false;
				return;
			}else {
				phoneNum_ck = true;
				phone = input_phone1 + "-" + input_phone2 + "-" + input_phone3;
			}
			
		};

	
	// 메서드 - 카드번호 체크 -----------------------------------------------------------------
		void checkCardNum() {
		
			String[] input_cardNum = {txtf_card_num1.getText() , txtf_card_num2.getText(), txtf_card_num3.getText(), txtf_card_num4.getText()};

			int errorNum = 0;
			for(int i=0; i<input_cardNum.length; i++) {
				if(input_cardNum[i].equals("") || input_cardNum[i].length()!=4) {
				
					errorNum = i;
					JOptionPane.showMessageDialog(null, "카드 번호 확인 부탁드립니다.\n(4자리 입력해주세요.)",null,JOptionPane.WARNING_MESSAGE);	
					cardNum_ck = false;
				
					switch(errorNum) {
						case 0 :
							txtf_card_num1.setBackground(new Color(255, 228, 225)); // 에러날 경우 색깔 변경
							break;
						case 1 :
							txtf_card_num2.setBackground(new Color(255, 228, 225)); // 에러날 경우 색깔 변경
							break;
						case 2 :
							txtf_card_num3.setBackground(new Color(255, 228, 225)); // 에러날 경우 색깔 변경
							break;
						case 3 :
							txtf_card_num4.setBackground(new Color(255, 228, 225)); // 에러날 경우 색깔 변경
							break;		
					}
				
					return;
					
				}else {
					errorNum = 4; // 에러 아님
					cardNum_ck = true;
					
					cardNum = input_cardNum[0] + "-" + input_cardNum[1] + "-" + input_cardNum[2] + "-" +input_cardNum[3];
				}
			}
			
			
			
		};
		
	// 메서드 - 회원 등록 -------------------------------------------------------------------
		void insert(Member_DTO mem_dto) {
			try {
				
				// 1. sql ( 데이터에 회원 정보 저장 )
				sql = "insert into member_info"
					+ "     values(?, ?, ?, ?, ?, ?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, mem_dto.getId());
				pstmt.setString(2, mem_dto.getPwd());
				pstmt.setString(3, mem_dto.getMemberName());
				pstmt.setString(4, mem_dto.getPhone());
				pstmt.setString(5, mem_dto.getCardNum());
				pstmt.setInt(6, mem_dto.getCardPwd());
				
				// 2. sql -> 데이터베이스
				int res = pstmt.executeUpdate();
				if(res>0) {
					JOptionPane.showMessageDialog(null, "회원가입이 완료되었습니다.","회원가입",JOptionPane.PLAIN_MESSAGE);
				}else {
					JOptionPane.showMessageDialog(null, "입력을 다시 해주세요.","회원가입",JOptionPane.WARNING_MESSAGE);
				}
				
				// 3. 연결 자원 종료
				pstmt.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	
	// 자주 사용하는 메서드 ---------------------------------------------------------------
		// 메서드 - 리셋 ---------------------------------------
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
				txtf_card_pwd.setText("");
				
				txtf_id.requestFocus();
			}
	
		// 메서드 - 텍스트 리셋 ---------------------------------------
			void reset_txt() {
				label_id_txt.setText("※ 숫자 또는 영문 최대 20자 가능합니다.");
				label_pwd_txt.setText("※ 숫자 또는 영문 최대 20자 가능합니다.");
				label_card_pwd_txt.setText("※ 숫자 4자리 입력해주세요.");
				label_id_txt.setForeground(Color.gray);
				label_pwd_txt.setForeground(Color.gray);
				label_card_pwd_txt.setForeground(Color.gray);
			}
		
		// 메서드 - 아이디 텍스트 리셋
			void reset_txt_id() {
				label_id_txt.setText("※ 숫자 또는 영문 최대 20자 가능합니다.");
				label_id_txt.setForeground(Color.gray);
			}
}
