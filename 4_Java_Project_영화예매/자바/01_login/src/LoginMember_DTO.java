package movie_01_login;

public class LoginMember_DTO {

	// 변수
	private String id;
	private String memberName;
	private String cardNum;
	private int cardPwd;
	
	// getter/setter
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	
	public String getCardNum() {
		return cardNum;
	}
	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}
	public int getCardPwd() {
		return cardPwd;
	}
	public void setCardPwd(int cardPwd) {
		this.cardPwd = cardPwd;
	}
	
	
	

}
