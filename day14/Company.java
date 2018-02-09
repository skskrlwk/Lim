package my.day13.test;

import my.util.MyUtil;

public class Company extends Common {

	// Company 클래스의 속성 정하기(추상화작업)
	
//	String comid;   // 회사아이디     
//	String passwd;  // 암호             
//	String comname; // 회사명          
	private String ceo;     // 대표자명       
	private long seedmoney; // 자본금          
	private String jobtype; // 업종             
//	String addr;    // 회사주소        
//	String tel;     // 회사전화번호
	
	public Company() { }
	 
	public Company(String id, String passwd, String name, String address, String tel, 
			       String ceo, long seedmoney, String jobtype) {
		
		super(id, passwd, name, address, tel);
		
		this.ceo = ceo;
		this.seedmoney = seedmoney;
		this.jobtype = jobtype;
	}
	
	public String getCeo() {
		return ceo;
	}

	public void setCeo(String ceo) {
		this.ceo = ceo;
	}

	public long getSeedmoney() {
		return seedmoney;
	}

	public void setSeedmoney(long seedmoney) {
		this.seedmoney = seedmoney;
	}

	public String getJobtype() {
		return jobtype;
	}

	public void setJobtype(String jobtype) {
		this.jobtype = jobtype;
	}

	public String showCompany() {
		
		String info = "=== 회사명 "+ super.name + " 정보 ===\n";
		
		info += super.commonInfo().replaceAll("▷이름", "▷회사명");
		
		info +=   "▷대표자명 : " + ceo + "\n"
				+ "▷자본금 : " + MyUtil.getCommaNumber(seedmoney) + "만원\n"
				+ "▷업종 : " + jobtype + "\n"
				+ "-------------------------------------------------------";
		
		return info;
		
	}
	
}
