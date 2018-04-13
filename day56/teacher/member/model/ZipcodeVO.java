package member.model;

public class ZipcodeVO {

	private String post1;
	private String post2;
	private String address;
	
	public ZipcodeVO() {}
	
	public ZipcodeVO(String post1, String post2, String address) {
		this.post1 = post1;
		this.post2 = post2;
		this.address = address;
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
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	
	
}
