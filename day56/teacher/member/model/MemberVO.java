package member.model;

/*
  VO(Value Object) 또는  DTO(Data Transfer Object) 생성하기 
*/

public class MemberVO {

	private int idx;            // 회원번호(시퀀스로 데이터가 들어온다)
	private String userid;      // 회원아이디
	private String name;        // 회원명
	private String pwd;         // 비밀번호
	private String email;       // 이메일
	private String hp1;         // 휴대폰 번호
	private String hp2;   
	private String hp3;   
	private String post1;       // 우편번호
	private String post2;  
	private String addr1;       // 주소
	private String addr2;       // 상세주소
	private String registerday; // 가입일자
	private int status;         // 회원탈퇴유무   1:사용가능(가입중) / 0:사용불능(탈퇴) 
	
	public MemberVO() { }
	
	public MemberVO(int idx, String userid, String name, String pwd, String email, String hp1, String hp2, String hp3,
			String post1, String post2, String addr1, String addr2, String registerday, int status) {
		this.idx = idx;
		this.userid = userid;
		this.name = name;
		this.pwd = pwd;
		this.email = email;
		this.hp1 = hp1;
		this.hp2 = hp2;
		this.hp3 = hp3;
		this.post1 = post1;
		this.post2 = post2;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.registerday = registerday;
		this.status = status;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHp1() {
		return hp1;
	}

	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}

	public String getHp2() {
		return hp2;
	}

	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}

	public String getHp3() {
		return hp3;
	}

	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}

	public String getPost1() {
		return post1;
	}

	public void setPost1(String post1) {
		this.post1 = post1;
	}

	public String getPost2() {
		return post2;
	}

	public void setPost2(String post2) {
		this.post2 = post2;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getRegisterday() {
		return registerday;
	}

	public void setRegisterday(String registerday) {
		this.registerday = registerday;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	public String getAllHp() {
		return hp1+"-"+hp2+"-"+hp3;
	}
	
	public String getAllPost() {
		return post1+"-"+post2;
	}
	
	public String getAllAddr() {
		return addr1+" "+addr2;
	}
	
}
