package movie_01_login;

public class Member_DTO {

	// 변수
	private String id;
	private String pwd;
	private String memberName;
	private String phone;
	private String cardNum;
	private int cardPwd;
	
	// getter/setter
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
