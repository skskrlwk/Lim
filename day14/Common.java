package my.day13.test;

public class Common {

	protected String id;      // 아이디 (사용자아이디, 회사아이디)
	protected String passwd;  // 암호
	protected String name;    // 사용자명, 회사명
	protected String address; // 사용자주소, 회사주소
	protected String tel;     // 사용자전화번호, 회사전화번호 
	
	public Common() { }
	
	public Common(String id, String passwd, String name, String address, String tel) {
		this.id = id;
		this.passwd = passwd;
		this.name = name;
		this.address = address;
		this.tel = tel;
	}

	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
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
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public String commonInfo() {
		String commonInfo = "▷아이디 : "+id+"\n"
				          + "▷암호 : "+passwd+"\n"
						  + "▷이름 : "+name+"\n"
						  + "▷주소 : "+address+"\n"
						  + "▷연락처 : "+tel+"\n";
		
		return commonInfo;
	}
	
	
	
}
