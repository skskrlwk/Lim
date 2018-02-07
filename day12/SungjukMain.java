package my.day11;

import java.util.Scanner;

public class SungjukMain {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		Student[] studentArr = new Student[3];
		studentArr[0] = new Student();
		studentArr[1] = new Student();
		studentArr[2] = new Student();
		
		Sungjuk[] sungjukArr = new Sungjuk[3];
		
		studentArr[0].setHak(1001);
		studentArr[0].setName("한석규");
		studentArr[0].setPhone("010-1111-1111");
				
		studentArr[1].setHak(1002);
		studentArr[1].setName("두석규");
		studentArr[1].setPhone("010-2222-2222");
		
		studentArr[2].setHak(1003);
		studentArr[2].setName("세석규");
		studentArr[2].setPhone("010-3333-3333");
	
		for(int i=0; i<sungjukArr.length; i++) {
			sungjukArr[i] = new Sungjuk();
			sungjukArr[i].setStudent(studentArr[i]);
			System.out.println(sungjukArr[i].getStudent().getName()+"님의 성적입력");
			
			do {
				try {
					System.out.print("국어점수를 입력하세요");
					int kor = Integer.parseInt(sc.nextLine());
					sungjukArr[i].setKor(kor);
					if(sungjukArr[i].getKor() == 0)
						continue;
					else
						break;
					
				}catch (NumberFormatException e) {
					System.out.println("정수입력만 가능합니다.");
				}
			
			} while (true);
			
			do { 
				try {
					System.out.print("영어점수를 입력하세요");
					sungjukArr[i].setEng(Integer.parseInt(sc.nextLine()));
					if(sungjukArr[i].getKor() == 0)
						continue;
					else
						break;
					
				}catch (NumberFormatException e) {
					System.out.println("정수입력만 가능합니다.");
				}
				
			} while (true);
			
			do {
				try {
					System.out.print("수학점수를 입력하세요");
					sungjukArr[i].setMath(Integer.parseInt(sc.nextLine()));
					if(sungjukArr[i].getMath() == 0)
						continue;
					else
						break;
					
				} catch (NumberFormatException e) {
					System.out.println("정수입력만 가능합니다.");
				}
				
			} while (true);
			sungjukArr[i].setSum();
		    sungjukArr[i].avg();
		}
		
		System.out.println("---------------------------------------------------------");
		System.out.println("학생명\t 국어\t 영어 \t 수학\t 총점\t 평균\t 학점");
		System.out.println("---------------------------------------------------------");
		for(int i=0; i<sungjukArr.length; i++) {
			System.out.println(sungjukArr[i].getStudent().getName() + "\t" + sungjukArr[i].getKor() + "\t" + sungjukArr[i].getEng() 
								+ "\t" + sungjukArr[i].getMath() + "\t" + sungjukArr[i].getSum() + "\t" + sungjukArr[i].avg() + "\t" +
								sungjukArr[i].grade());
		}
		

	}

}

/*
   	학생 3명 입력해서 배열로 저장
  	각 학생별로 국어,영어,수학점수를 입력해서 배열로 저장
  	------------------------------------------
  	학생명 	국어	영어	수학	총점	평균	학점
  	------------------------------------------
  	한석규		
  	두석규
  	세석규
  	
 */

