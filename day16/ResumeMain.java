package my.day18;

import java.util.Scanner;


public class ResumeMain {

	public static void main(String[] args) {
		
		
		Resume rs1 = new Resume();
		rs1.name = "한석규";
		rs1.birthday = "1980-05-25";
		rs1.tel = "010-1111-1111";
		
		Resume.School sch= rs1.new School();
		sch.elementname = "서울초등학교";
		sch.middlename = "서울중학교";
		sch.highname = "서울고등학교";
		sch.univername = "서울대학교";
		
		
		rs1.printInfo(sch);
		

		
	}

}
