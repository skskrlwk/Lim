package my.day10;

import my.util.MyUtil;

public class Recruit {
	// Recruit 클래스의 속성 정하기(추상화 작업)
	
	
	Company company;// 구인회사
	String gender;	// 채용성별[1.남 / 2.여 / 3.성별무관]
	int agemin;		// 채용최소나이
	int agemax;		// 채용최대나이
	String school;	// 채용학력[1.대졸이상 / 2.초대졸 / 3.고졸 / 4.학력무관]
	
	public Recruit() {}
	
	public Recruit(Company company, String gender, int agemin, int agemax, String school) {
		
		this.company = company;
		this.gender = gender;
		this.agemin = agemin;
		this.agemax = agemax;
		this.school = school;
	}
	
	public String showRecruit() {
		String info= " === [" + company.comname + "] 회사 채용공고=== \n" + 
				 "1. 회사명 :" + company.comname + "\n" +
				 "2. 대표자명 :" + company.ceo + "\n" +
				 "3. 자본금 :" + MyUtil.getCommaNumber(company.seedmoney) + "\n" +
				 "4. 업종 :" + company.jobtype + "\n" +
				 "5. 회사주소 :" + company.addr + "\n" +
				 "6. 회사전화번호 :" + company.tel + "\n" +
				 "7. 채용성별 :" + gender + "\n" +
				 "8. 채용 나이 " + agemin + "세~ " + agemax + "세\n" +
				 "9. 채용 학력:" + school + "\n";
		
	
		return info;
	}
	
}
