package my.day11;

public class Sungjuk {
	
	private Student student;// 학생
	private int kor;//국어
	private int eng;//영어
	private int math;//수학
	private int sum;//총점
	
	
	public Student getStudent() {
		return student;
	}
	
	public void setStudent(Student student) {
		this.student = student;
	}
	
	public int getKor() {
		return kor;
	}
	
	public void setKor(int kor) {
		if(kor < 0 || kor > 100) {
			System.out.println("0~100사이의 수만 입력만 가능합니다");
		}else {
			this.kor = kor;
		}
		
	}
	
	public int getEng() {
		return eng;
	}
	
	public void setEng(int eng) {
		if(eng < 0 || eng > 100) {
			System.out.println("0~100사이의 수만 입력만 가능합니다");
		}else {
			this.eng = eng;
		}
	}
	
	public int getMath() {
		return math;
	}
	
	public void setMath(int math) {
		if(math < 0 || math >100) {
			System.out.println("0~100사이의 수만 입력만 가능합니다");
		}else {
			this.math = math;
		}
	}
	
	public int getSum() {
		return sum;
	}
	
	public void setSum() {
		this.sum = getKor()+getEng()+getMath();
	}
	
	public double avg() {
		double result = Math.round((double)(getSum()/3.0)*10)/10.0;
		return result;
	}
	
	public String grade() {
		
		if(avg() >= 90) {
			return "A";
		}else if(80 <= avg() && avg()<90) {
			return "B";
		}else if(70 <= avg() && avg()<80) {
			return "C";
		}else if(60 <= avg() && avg()<70) {
			return "D";
		}else 
			return "F";
		
	}
	
	

}
