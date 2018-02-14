package my.day19;

public class Member {
	
	private String id;
	private String password;
	private String name;
	private int age;
	private String address;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Member() {}
	
	public Member(String id, String password, String name, int age, String address) {
		
		this.id = id;
		this.password = password;
		this.name = name;
		this.age = age;
		this.address = address;
	}
	
	public String showInfo() {
		
		String result = ">>> "+ id + " 님의정보<<<\n" +  
						"▷아이디 : " + id + "\n" +
						"▷암호 : " + password + "\n" +
						"▷성명 : " + name + "\n" +
						"▷나이 : " + age + "\n" +
						"▷주소 : " + address + "\n";
		return result;
	}
	
	

}
