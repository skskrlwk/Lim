package my.day15;

import java.util.Calendar;

public abstract class AbstractAnimal implements InterAnimal{
	
	protected String name;		// 이름
	protected String birthday;	// 출생일자
	private String level;		// 등급레벨
	
	
	public String getLevel() {
		return level;
	}
	
	public void setLevel(int levelNo) {
		if(1 <= levelNo && levelNo <=3 )
			this.level = "D";
		else if(4 <= levelNo && levelNo <= 6 )
			this.level = "C";
		else if(7 <= levelNo && levelNo <= 10 )
			this.level = "B";
		else if(10 < levelNo)
			this.level = "A";
	}
	
	@Override
	public int getAge() {
		Calendar currentdate = Calendar.getInstance();
		int cuurentYear = currentdate.get(Calendar.YEAR);// 현재년도
		String birthYear = birthday.substring(0, 4);
		
		int currentage = cuurentYear - Integer.parseInt(birthYear) + 1;
		return currentage;
	}
	
	
	

}
