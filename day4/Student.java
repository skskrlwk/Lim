package my.day5;

import java.util.Scanner;

public class Student {
	
	String hak,name;
	int kor,eng,math;
	
	public Student(){

		Scanner sc = new Scanner(System.in);
		
		System.out.println("-----------정보를 입력해주세요 ---------");
		System.out.print("학번을 입력해주세요 : ");
		hak = sc.nextLine();
		System.out.print("이름을 입력해주세요 : ");
		name = sc.nextLine();
		System.out.print("국어점수를 입력해주세요 : ");
		kor = Integer.parseInt(sc.nextLine());
		System.out.print("영어점수를 입력해주세요 : ");
		eng = Integer.parseInt(sc.nextLine());
		System.out.print("수학점수를 입력해주세요 : ");
		math = Integer.parseInt(sc.nextLine());
			
	}
	
	public void show() {
		
		System.out.println("----------성적 결과-----------");
		System.out.println("학번 : " +  hak);
		System.out.println("이름 : " +  name);
		System.out.println("국어 : " + kor);
		System.out.println("영어 : " +  eng);
		System.out.println("수학 : " +  math);
		System.out.println("총점 : " +  sum());
		System.out.println("평균 : " +  avg());
		System.out.println("학점 : " +  grade());
		System.out.println("선물 : " + gift());
		
			
	}
	
	public int sum() {
		int sum = kor + eng + math;
		
		return sum;
	}
	public float avg() {
		int sum = sum();
		float avg = (float)sum / 3;
		avg = (float)(Math.round(avg*10)/10.0);
		return avg;
		
	}
	
	public String grade() {
		
		/*
		switch (변수 또는 수식) { //변수 또는 수식이 조건에 해당됨
							 //변수 또는 수식의 타입은 byte, short, char, int 형이여야 한다.
							 //long, float, double 불가하다.
							 //JDK 1.7(JDK 7.0) 이후 부터는 String 타입도 허용한다.
			case 값1:
				실행문1;
				break;
				
			case 값2:
				실행문2;
				break;
	
			default:
				실행문n;
				break;
			}
		*/
		float avg = avg(); //100.0, 99.0, 88.0
		
		String str = "";
		switch ((int)avg/10) { //100, 99 ,88 -> 10, 9, 8
							   
			case 100:
			case 9: //100 or 9
				str = "A";
				break;
				
			case 8: 
				str = "B";
				break;
				
			case 7: 
				str = "C";
				break;
				
			case 6: 
				str = "D";
				break;	
			default:
				str = "F";
				break;
		}
		
		return str;
	}
	
	public String gift() {
		String gift ="";
		
		
		switch (grade()) { // String 타입은JDK 1.7(JDK 7.0)이후로 가능
			case "A":
				gift += "놀이공원이용권, ";
					
			case "B": 
				gift += "뷔페식사권, ";
								
			case "C":
				gift += "치킨, ";
				
			case "D":
				gift += "아이스크림, ";
				break;
		
			default:
				gift += "꿀밤3대";
				break;
		}
		return gift;
	}
	
	
	
	

}
