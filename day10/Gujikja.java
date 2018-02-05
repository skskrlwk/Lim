package my.day10;

import my.util.MyUtil;

public class Gujikja {
	
	// Gujikja 클래스의 속성 정하기(추상화작업)
	
	String userid;	// 아이디
	String passwd;	// 암호
	String name;	// 성명
	int age;		// 나이
	String gender;	// 성별 "남", "여"
	String address;	// 주소
	String school;	// 학력 "대졸이상" , "초대졸", "고졸", "고졸미만"
	String mobile;	// 휴대폰 번호
	String hopejob;	// 희망직종("사무직", "생산직", "일용직"........)
	int hopemoney;	// 희망급여
	
	public Gujikja(){}
	
	public Gujikja(String userid, String passwd, String name, int age, String gender, String address, String school,
			String mobile, String hopejob, int hopemoney) {
		
		this.userid = userid;
		this.passwd = passwd;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.address = address;
		this.school = school;
		this.mobile = mobile;
		this.hopejob = hopejob;
		this.hopemoney = hopemoney;
	}
	
	
	public String showGujikja() {
		String info= " === " + name + "님의 프로필=== \n" + 
					 "1. 회원ID:" + userid + "\n" +
					 "2. 암호:" + "*****" + passwd.substring(5) + "\n" + //"qwer1234$".subString(3, 7);  --> r123  "qwer1234$".subString(3);  --> r1234$
					 "3. 성명:" + name + "\n" +
					 "4. 나이:" + age + "\n" +
					 "5. 성별:" + gender + "\n" +
					 "6. 주소:" + address + "\n" +
					 "7. 학력" + school + "\n" +
					 "8. 휴대폰:" + mobile + "\n" +
					 "9. 희망직종:" + hopejob + "\n" +
					 "10. 희망연봉:" + MyUtil.getCommaNumber(hopemoney);
		
		return info;
	}
	


}
