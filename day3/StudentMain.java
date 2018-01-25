package my.day3.quiz;

public class StudentMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//학번(string) 이름(string) 국어(int) 영어(int) 수학(int)
		Student lee = new Student("no1", "lee", 80, 70, 90);
		Student kim = new Student("no2", "kim", (byte)60, (byte)100, 90);
		
		System.out.println(lee.getExecute());
		System.out.println(kim.getExecute());
		
		
		
		

	}

}
