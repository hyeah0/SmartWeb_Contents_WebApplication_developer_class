package movie_01_login;

public class LoginMember_DTO {

	// 변수
		private static String id;
		private static String pwd;
		private static String memberName;
		private static String phone;
		private static String cardNum;
		private static int cardPwd;
		
	// getter/setter
		public static String getId() {
			return id;
		}
		public static void setId(String id) {
			LoginMember_DTO.id = id;
		}
		public static String getPwd() {
			return pwd;
		}
		public static void setPwd(String pwd) {
			LoginMember_DTO.pwd = pwd;
		}
		public static String getMemberName() {
			return memberName;
		}
		public static void setMemberName(String memberName) {
			LoginMember_DTO.memberName = memberName;
		}
		public static String getPhone() {
			return phone;
		}
		public static void setPhone(String phone) {
			LoginMember_DTO.phone = phone;
		}
		public static String getCardNum() {
			return cardNum;
		}
		public static void setCardNum(String cardNum) {
			LoginMember_DTO.cardNum = cardNum;
		}
		public static int getCardPwd() {
			return cardPwd;
		}
		public static void setCardPwd(int cardPwd) {
			LoginMember_DTO.cardPwd = cardPwd;
		}
	
}
