package my.day3.quiz;

public class Student {

	String hak, name;
	int kor, eng, math;
	byte kor1,eng1,math1;
	
	public Student() {
		
	}
	public Student(String hak, String name, int kor, int eng, int math ) {
		
		this.hak = hak;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
		
		
	}
	
	public int sum(int kor, int eng, int math) {
	
		int result = kor + eng + math;
		
		return result;
	}
	
	public double avg(int kor, int eng, int math) {
	
		int sum = kor + eng + math;
		double avg = (double)sum / 3;
		return avg;
	}
	
	public Student(String hak, String name, byte kor1, byte eng1, byte math1 ) {
		
		this.hak = hak;
		this.name = name;
		this.kor1 = kor1;
		this.eng1 = eng1;
		this.math1 = math1;
		
		
	}
	
	public short sum1(byte kor1, byte eng1, byte math1) {
	
		short result = (short) (kor1 + eng1 + math1);
		
		return result;
	}
	
	public float avg1(byte kor1, byte eng1, byte math1) {
	
		short sum = (short) (kor1 + eng1 + math1);
		float avg = (float)sum / 3;
		return avg;
	}
	
	
	
	
	
	
	public String getExecute() {
		
		String result = "==============" + name  + "님의 성적결과==============\n"+
						"1. 학번 : " + hak + "\n" +
				        "2. 성명 : " + name + "\n" +
						"3. 국어점수 : " + kor + "\n" +
						"4. 영어점수 : " + eng + "\n" +
						"5. 수학점수 : " + math + "\n" + 
						"합계 = " + sum(kor,eng,math) +"\n" +
						"평균 = " + avg(kor,eng,math) + "\n";
				
		
		return result;
	}
	
	public String getExecute1() {
		
		String result = "==============" + name  + "님의 성적결과==============\n"+
						"1. 학번 : " + hak + "\n" +
				        "2. 성명 : " + name + "\n" +
						"3. 국어점수 : " + kor1 + "\n" +
						"4. 영어점수 : " + eng1 + "\n" +
						"5. 수학점수 : " + math1 + "\n" + 
						"합계 = " + sum1(kor1,eng1,math1) +"\n" +
						"평균 = " + avg1(kor1,eng1,math1) + "\n";
				
		
		return result;
	}
	
	
}
