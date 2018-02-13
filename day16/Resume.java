package my.day18;

public class Resume {

	String name;
	String birthday;
	String tel;
	
	class School{
		
		String elementname;
		String middlename;
		String highname;
		String univername;
		
		String schoolInfo() {
			String result = "초등학교 : " + elementname + "\n중학교 : " + middlename +
								"\n고등학교 : " + highname + "\n대학교 : " + univername + "\n";
			
			return result;
		}// end of void schoolInfo()-------------------------------------------
		
	}// end of School/////////////////////////////////////
	
	void printInfo(School school) {
		System.out.println("1. 지원자명 : " + name);
		System.out.println("2. 생년월일 : " + birthday);
		System.out.println("3. 연락처 : " + tel);
		System.out.println("4. 학력사항 : ");
	// 	Resume.School sch = this.new School(); //정식표현
	//	School sch = new School(); 			   //약식표현 	sch.schoolInfo 새로운 객체를 생성해서 Null값이 나온다.
		
		System.out.println(school.schoolInfo());
	}
	
}//end of Resume//////////////////////////////
