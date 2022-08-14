## Jbutton

### 1. 일반 버튼

### 2. for문을 이용한 버튼

### 3. 배열을 통한 버튼

### 4. 이차원 배열을 통한 버튼1

### 4. 이차원 배열을 통한 버튼2

- 좌석버튼

### 코드

```
package GUI;

import java.awt.*;
import javax.swing.*;
import java.awt.event.*;

public class P4_Button extends JFrame implements ActionListener{

	JButton button;
	JLabel label;

	public P4_Button() {

		JPanel con = new JPanel();

//		--------- 일반 버튼1 ------------------------------------------------------------
		ImageIcon icon = new ImageIcon("img/cupcake.png");
		ImageIcon icon2 = new ImageIcon("img/imgSmile.png");

		label = new JLabel();
		label.setIcon(icon2);
		label.setBounds(350,500,150,150);
		label.setVisible(false);										// 버튼 클릭시 확인 할 수 있게 이벤트 처리

		button = new JButton();
		button.setBounds(200,100,400,400); 								// 가로 padding, 세로 padding, 버튼 크기 가로, 버튼크기 세로
		button.addActionListener(this);	  								// actionPerformed(ActionEvent e)  오버라이딩
		// button.addActionListener(e -> System.out.println("hi!"));	// 버튼클릭시 콘솔창 텍스트 (람다식)
		button.setText("I'm button!");
		button.setFocusable(false); 									// default : true : 버튼 선택되어있음 / false : 버튼 선택되어있지 않음.
		button.setIcon(icon);											// 버튼에 이미지 삽입
		button.setHorizontalTextPosition(JButton.CENTER);				// 버튼 내부 텍스트 가로정렬 타입
		button.setVerticalTextPosition(JButton.BOTTOM);					// 버튼 내부 텍스트 세로정렬 타입
		button.setFont(new Font("Comic sans", Font.BOLD, 25));			// 버튼 내부 텍스트 폰트, 특징, 크기
		button.setIconTextGap(20);										// 버튼 내부 아이콘과 텍스트 사이 크기
		button.setForeground(Color.pink);								// 버튼 내부 텍스트 컬러
		button.setBackground(Color.orange);								// 버튼 컬러 ( 이슈 : 색상 확인 되지 않음 )
		// button.setBorder(BorderFactory.createEtchedBorder());		// 버튼 3d효과
		// button.setBorder(BorderFactory.createDashedBorder(Color.pink));


		this.add(label);		// 컴포넌트 -> 프레임
		this.add(button);		// 컴포넌트 -> 프레임
		this.setLayout(null);	// 없을 경우 화면 가득 버튼 생성
		this.setSize(800,800);	// 화면 크기


//		--------- for 버튼 -------------------------------------------------------------
//		for(int i=0; i<5; i++) {
//			for(int j=0; j<5; j++) {
//				con.add(new JButton(i +"-" + j));
//
//			}
//			add(con);
//		}


//		--------- 일차원 배열 -------------------------------------------------------------
//		String[] name = {"1","2","3"};
//		JButton[] btn = new JButton[3];
//		for(int i=0; i<3; i++) {
//			btn[i] = new JButton(name[i]);
//			btn[i].setVisible(true);
//			con.add(btn[i]);
//		}
//		add(con);


//		--------- 이차원 배열 -------------------------------------------------------------
//      JPanel con = new JPanel(new GridLayout(3,5,10,10));
//		String[] name = {"1","2","3"};
//		JButton[][] btn = new JButton[3][5];
//		for(int i=0; i<3; i++) {
//			for(int j=0; j<5; j++) {
//				btn[i][j] = new JButton(name[i]);
//				btn[i][j].setVisible(true);
//				con.add(btn[i][j]);
//			}
//		}
//		add(con);



//		--------- 영화좌석 버튼 -------------------------------------------------------------
//		JPanel con = new JPanel(new GridLayout(5,6,10,10));
//		JButton[][] seat = new JButton[5][6];
//		boolean[][] seatFlag = new boolean[5][6];
//
//		// char 65는 "A" 기호
//		char alpa = 65;
//
//
//		// 5행 6열 좌석
//		// i = 행
//		for(int i=0; i<seat.length; i++) {
//
//			// 숫자로된 알파벳을 문자타입으로 변환
//			String alpaSeat = String.valueOf(alpa);
//
//			// 좌석 표시(j = 열)
//			for(int j=0; j<seat[i].length; j++) {
//
//				int r = i;
//				int c = j;
//
//				String seatsName = alpaSeat+(j+1)+"";
//				seat[i][j] = new JButton(seatsName);
//				// seat[i][j].setBorder(null);
//
//				con.add(seat[i][j]);
//				add(con);
//
//				// 좌석 클릭시 색상 변경 + 동일좌석 두번클릭시 원래 색상으로 변경
//				seat[i][j].addMouseListener(new MouseAdapter() {
//
//					@Override
//					public void mouseClicked(MouseEvent e) {
//
//						// 클릭했을경우
//						if(e.getButton() == 1 && seatFlag[r][c] == false) {
//							System.out.println(seatsName + " 버튼 눌림");
//							seat[r][c].setBackground(new Color(4,20,30));
//							seatFlag[r][c] = true;
//
//						}else if(e.getButton() == 1 && seatFlag[r][c] == true) {
//							System.out.println(seatsName + " 버튼 한번 더 눌림");
//							seat[r][c].setBackground(Color.white);
//
//							seatFlag[r][c] = false;
//						}
//
//					}
//				});
//
//
//			}
//			alpa++;
//		}


		//setBounds(100, 100, 200, 200);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		//pack();
		setVisible(true);
	}


	@Override
	public void actionPerformed(ActionEvent e) {

		if(e.getSource()==button) {
			// System.out.println("hi!");				// 버튼 클릭시 콘솔창에 텍스트 출력
			// button.setEnabled(false);				// 버튼 클릭시 더이상 클릭 안되게 설정
			label.setVisible(true);

		}
	}


	public static void main(String[] args) {

		new P4_Button();
	}

}
```
