package my.day13.test;

import my.util.MyUtil;

public class Gujikja extends Common {

	// Gujikja 클래스의 속성 정하기(추상화작업)
	
	//	String userid;  // 아이디
	//	String passwd;  // 암호
	//	String name;    // 성명
	private int age;        // 나이
	private String gender;  // 성별 "남", "여"
	//	String address; // 주소
	private String school;  // 학력 "대졸이상", "초대졸", "고졸", "고졸미만"
	//	String mobile;  // 휴대폰번호
	private String hopejob; // 희망직종("사무직", "생산직", "일용직"......)
	private int hopemoney;  // 희망급여
	
	public Gujikja() { }
	
	public Gujikja(String id, String passwd, String name, String address, String tel,
			       int age, String gender, String school, String hopejob, int hopemoney) {
		
		super(id, passwd, name, address, tel);
		
		this.age = age;
		this.gender = gender;
		this.school = school;
		this.hopejob = hopejob;
		this.hopemoney = hopemoney;
	}
	
	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getHopejob() {
		return hopejob;
	}

	public void setHopejob(String hopejob) {
		this.hopejob = hopejob;
	}

	public int getHopemoney() {
		return hopemoney;
	}

	public void setHopemoney(int hopemoney) {
		this.hopemoney = hopemoney;
	}

	public String showGujikja() {
		
		String info = "=== "+ super.name + "님의 프로필 ===\n";
		
		info += super.commonInfo().replaceAll("▷이름", "▷사용자 이름");
		
		info +=   "▷나이 : " + age + "\n"
				+ "▷성별 : " + gender + "\n"
				+ "▷학력 : " + school + "\n"
				+ "▷희망직종 : " + hopejob + "\n"
				+ "▷희망연봉 : " + MyUtil.getCommaNumber(hopemoney) +"만원\n"
				+ "-------------------------------------------------------";
		
		return info;
	}
	
	
}
