package my.day9;

public class Owner {
	
	String name;
	String address;
	String tel;
	
	public Owner() {}
	
	public Owner(String name, String address, String tel) {
		super();
		this.name = name;
		this.address = address;
		this.tel = tel;
	}
	
	public String owerInfo() {
		return name+"  "+address+"  "+tel;
	}
	
	

}
