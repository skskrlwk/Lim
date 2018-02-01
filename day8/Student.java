package my.day8;

public class Student {

	String hakbun;
	String name;
	int kor;
	int eng;
	int math;
	
	public Student() { }
	
	public Student(String hakbun, String name, int kor, int eng, int math) { 
		this.hakbun = hakbun;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
	}
	
	public int getSum() {
		return kor+eng+math;
	}
	
	public double getAvg() {
		int total = getSum();
		double avg = (double)total/3;
		return Math.round(avg*10)/10.0;
	}
	
	public String getHakjum() {
		
	/*	
		switch (변수 또는 수식) {  // 변수 또는 수식이 조건에 해당됨.
		                       // 변수 또는 수식의 타입은    
			                   // byte, short, char, int 형이어야 한다.
			                   // long 은 불가하다. float, double 불가하다.
			                   // JDK 1.7 (== JDK 7.0) 이후 부터는 String 타입도 허용한다.     
			case 값1: 
				실행문1;
				break;  // { } 을 빠져나간다.
				
			case 값2:
				실행문2;
				break;  // { } 을 빠져나간다.	
	
			case 값3:
				실행문3;
				break;  // { } 을 빠져나간다.
	
			default:
			       실행문n;
				break;  // { } 을 빠져나간다.
		}
	*/
		String hakjum = "";
		
		double avg = getAvg(); // 100.0  94.3  85.2  71.3  68.7  52.6  49.3 
		
		switch ((int)avg/10) { // 100  94  85  71  68  52  49 
		                       // 10   9   8   7   6   5   4 
			case 10:
			case 9:
				hakjum = "A";
				break;
	
			case 8:
				hakjum = "B";
				break;
				
			case 7:
				hakjum = "C";
				break;
				
			case 6:
				hakjum = "D";
				break;	
				
			default:
				hakjum = "F";
				break;
		}
			
		return hakjum;
	}
	
	
	public String getGift() {
		
		String gift = "";
		
		switch (getHakjum()) {
			case "A":
				gift += "놀이공원이용권, ";
			
			case "B":
				gift += "뷔페식사권, ";	
			
			case "C":
				gift += "치킨, ";
				
			case "D":
				gift += "아이스크림";
				break;
				
			default:
				gift += "꿀밤3대";
				break;
		}
		
		return gift;
	}
	
	
	public String getExecute() {
		String result = "1. 학번: " + hakbun + "\n"+ 
	                    "2. 성명: " + name + "\n"+
	                    "3. 국어: " + kor + "\n"+
	                    "4. 영어: " + eng + "\n"+
	                    "5. 수학: " + math + "\n"+
	                    "6. 총점: " + getSum() + "\n"+
	                    "7. 평균: " + getAvg() + "\n"+
	                    "8. 학점: " + getHakjum() + "\n"+ 
	                    "9. 선물: " + getGift() + "\n";
		
		return result;
	}
	
	
	public void showInfo() {
		String result = getExecute();
		System.out.println(result);
	} 
	
	// 학점이 "F"인 학생들만 출력해주는 메소드
	public static void failStudent(Student[] studentArr) {
		
		for(int i=0; i < studentArr.length; i++) {
			if(studentArr[i].getHakjum().equals("F"))
				studentArr[i].showInfo();
			
		}// end of for---------------------------------
		
	}// end of failStudent(Student[] studentArr)-----------------------
	
	
	//파라미터로 학생들을 받아서 학점이 "A"인 학생들만 이름을 변경하여 학생들을 리턴시켜주는 메소드.
	public static Student[] veryGoodStudent(Student[] studentArr) {
		
		for(int i=0; i < studentArr.length; i++) {
			if(studentArr[i].getHakjum().equals("A"))
				studentArr[i].name += "참잘했어요" ;
			
		}// end of for---------------------------------
		
		
		return studentArr;
		
		
	}// end of veryGoodStudent(Student[] studentArr)------------------
	
}// end of class Student///////////////////////////////////////
