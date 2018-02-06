package my.day10;

import my.util.MyUtil;

public class Company {
	
	// Company 클래스의 속성 정하기 (추상화작업)
	
	String comid;  	// 회사아이디
	String passwd; 	// 암호		
	String comname;	// 회사명 		
	String ceo;		// 대표자명	
	int seedmoney;	// 자본금		
	String jobtype;	// 업종		
	String addr;	// 회사주소	
	String tel;		// 회사전화번호 
	
	
	public Company() {}
	
	public Company(String comid, String passwd, String comname, String ceo, int seedmoney, String jobtype, String addr,
			String tel) {
		
		this.comid = comid;
		this.passwd = passwd;
		this.comname = comname;
		this.ceo = ceo;
		this.seedmoney = seedmoney;
		this.jobtype = jobtype;
		this.addr = addr;
		this.tel = tel;
	}
	

	public String showCompany() {
		String info= " === " + comname + "회사 프로필=== \n" + 
				 "1. 회사ID:" + comid + "\n" +
				 "2. 암호:" + "*****" + passwd.substring(5) + "\n" + //"qwer1234$".subString(3, 7);  --> r123  "qwer1234$".subString(3);  --> r1234$
				 "3. 회사명:" + comname + "\n" +
				 "4. 대표자명:" + ceo + "\n" +
				 "5. 자본금:" + seedmoney + "\n" +
				 "6. 업종:" + jobtype + "\n" +
				 "7. 회사주소:" + addr + "\n" +
				 "8. 회사 전화번호:" + tel + "\n" ;
	
		return info;
		
	}//end of showCompany()--------------------------------
}
