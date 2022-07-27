package exam9;

import java.util.Scanner;

import javax.swing.JOptionPane;

class ProductSearchData{
	
	//1열 : 상품명
	//2열 : 상품정보
	String[][] proTable = new String[3][2]; // 3행 2열
	
	// 기본생성자
	ProductSearchData() {
		proTable[0][0] = "세탁기";
		proTable[0][1] = "드럼 세탁기 최신형";
		proTable[1][0] = "냉장고";
		proTable[1][1] = "지펠 냉장고 최신형";
		proTable[2][0] = "Tv";
		proTable[2][1] = "HDTV 150인치 최신모델";
	}
	
	// 인자생성자
	
	// 멤버메서드
	String search(String productName){
		String pInfo = null;
		for(int i=0; i<proTable.length; i++) {
			if(productName.equals(proTable[i][0])) {
				pInfo = proTable[i][1];
			}
		}
		return pInfo;
	}
}


public class Ex9_1_ProductSearch {

	public static void main(String[] args) {
		
		// Scanner sc = new Scanner(System.in);
		ProductSearchData psd = new ProductSearchData();
		
		// 배열 출력
		System.out.printf("%s\t%s\n","상품명","   상품정보");
		for(int i=0; i<psd.proTable.length; i++) {
			for(int j=0; j<psd.proTable[i].length; j++) {
				System.out.print(psd.proTable[i][j]+"\t");
			}
			System.out.println();
		}
		
		// 검색
		String pSearch = JOptionPane.showInputDialog("검색할 상품명을 입력하세요.");
		String info = psd.search(pSearch);

		try {
			info.length();
			JOptionPane.showMessageDialog(null, info);
		}catch(Exception e) {
			JOptionPane.showMessageDialog(null, "해당상품이 없습니다.");
		}
	}
}


// ----------------------------------------------------------------------------------//
// 배열 생성 및 데이터 입력
// for(int i=0; i<psd.proTable.length; i++) {
//	for(int j=0; j<psd.proTable[i].length; j++) {
//		if(j==0) {
//			psd.proTable[i][j] = JOptionPane.showInputDialog("상품명을 입력하세요.");
//		}else {
//			psd.proTable[i][j] = JOptionPane.showInputDialog("상품정보를 입력하세요."); 
//		}
//	}
// }

// 고의 발생 에러 
// String search = JOptionPane.showInputDialog("검색할 상품명을 입력하세요.");
// try {
//	 for(int i=0; i<psd.proTable.length; i++) {
//		if(search.equals(psd.proTable[i][0])) {
//			JOptionPane.showMessageDialog(null,psd.proTable[i][1]);
//			break;
//		}
//		else {
//			Exception e = new Exception("고의로 발생시킨 예외");
//	        throw e;
//		}
//	}
// }catch(Exception e) {
//	 JOptionPane.showMessageDialog(null,"해당 상품이 없습니다.");
// }
