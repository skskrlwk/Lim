package jdbc.day4;

public class UserDTO {
	
	private String userid;
	private String passwd;
	private String name;
	private String birthday;
	private String email;
	private String tel;
	private String address;
	private int coin;
	private int point;
	private int renttotal;
	private int mibannapcnt;
	private int delaymoney;
	
	public UserDTO() { }
	
	public UserDTO(String userid, String passwd, String name, String birthday, String email, String tel, String address,
			int coin, int point, int renttotal, int mibannapcnt, int delaymoney) {
	
		this.userid = userid;
		this.passwd = passwd;
		this.name = name;
		this.birthday = birthday;
		this.email = email;
		this.tel = tel;
		this.address = address;
		this.coin = coin;
		this.point = point;
		this.renttotal = renttotal;
		this.mibannapcnt = mibannapcnt;
		this.delaymoney = delaymoney;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getCoin() {
		return coin;
	}

	public void setCoin(int coin) {
		this.coin = coin;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getRenttotal() {
		return renttotal;
	}

	public void setRenttotal(int renttotal) {
		this.renttotal = renttotal;
	}

	public int getMibannapcnt() {
		return mibannapcnt;
	}

	public void setMibannapcnt(int mibannapcnt) {
		this.mibannapcnt = mibannapcnt;
	}

	public int getDelaymoney() {
		return delaymoney;
	}

	public void setDelaymoney(int delaymoney) {
		this.delaymoney = delaymoney;
	}
	
	

}
