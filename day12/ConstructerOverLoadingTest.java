package my.day12;

import java.util.Calendar;

public class ConstructerOverLoadingTest {
	
	private String userid; // 필수입력사항
	private String passwd; // 필수입력사항
	private String name; // 필수입력사항
	private String birth; // 선택입력사항 생년월일(1991-03-05)
	private int point = 10; 
	private static int count;
	
	//static 초기화 블럭
	static{
		System.out.println("=== 여기는 static 초기화 블럭 입니다. ===");
		
	}
	
	//인스턴스 초기화 블럭
	{
		System.out.println("=== 여기는 instance 초기화 블럭 입니다. ===");
		count++;
		if(count%2 != 0)
			point = 20;
	}

	
	public ConstructerOverLoadingTest() {}

	public ConstructerOverLoadingTest(String userid, String passwd, String name, String birth) {
		
		this.userid = userid;
		this.passwd = passwd;
		this.name = name;
		this.birth = birth;
	}
	
	public ConstructerOverLoadingTest(String userid, String passwd, String name) {
		
		this.userid = userid;
		this.passwd = passwd;
		this.name = name;
		
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

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}
	
	
	

}
