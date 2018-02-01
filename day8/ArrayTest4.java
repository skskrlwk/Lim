/*
  	=== 2차원 배열 ===
  	
 */


package my.day8;

import javax.security.auth.Subject;

public class ArrayTest4 {

	public static void main(String[] args) {
		
		int[][] point = new int[4][3];
		
		point[0][0] = 10;
		point[0][1] = 20;
		point[0][2] = 30;
		
		point[1][0] = 40;
		point[1][1] = 50;
	//	point[1][2] = 60;
		
		point[2][0] = 70;
		point[2][1] = 80;
		point[2][2] = 90;
		
		point[3][0] = 100;
		point[3][1] = 110;
		point[3][2] = 120;
		
		
		System.out.println("point.length = >" + point.length);
		// point.length = > 4  
		System.out.println("point[0].length = > " + point[0].length );
		// point.length[0] = > 3 
		System.out.println("point[1].length = > " + point[1].length );
		// point.length[1] = > 3 
		
		System.out.println("\n-----------------------------\n");
		
		for(int j=0; j<point[0].length; j++) {
			String comma = (j< point[0].length -1)?", ":"\n";
			System.out.print(point[0][j] + comma);
		}
		//10, 20, 30
		
		for(int j=0; j<point[0].length; j++) {
			String comma = (j< point[1].length -1)?", ":"\n";
			System.out.print(point[1][j] + comma);
		}
		
		System.out.println("\n-------------------\n");
		//40, 50, 0
		for(int i=0;i < point.length; i++) {
			for(int j=0; j < point[i].length; j++) {
				
				String comma = (j< point[i].length -1)?", ":"\n";
				System.out.print(point[i][j] + comma);
			}
				
		}/*10, 20, 30
		   40, 50, 0
		   70, 80, 90
		   100, 110, 120*/
		
		System.out.println("\n====================\n");
		
		
		int[][] val = new int[4][];
	/*	
		val[0][0] = 10;
		val[0][1] = 20;
		val[0][2] = 30;
		
		val[1][0] = 40;
		val[1][1] = 50;
	//	val[1][2] = 60;
		
		val[2][0] = 70;
		val[2][1] = 80;
		val[2][2] = 90;
		
		val[3][0] = 100;
		val[3][1] = 110;
		val[3][2] = 120;
		System.out.println("val.length ==> " + val.length);
		
		// Exception in thread "main" java.lang.NullPointerException
		열에 대한 배열의 크기를 설정하지 않았으므로 NullPointerException 이 발생한다.
		아래와 같이 열에 대한 크기를 설정해주어야만 데이터값(점수) 을 입력할 수 있다.
 	*/
		val[0] = new int[3]; //val[0]행의 '열' 값을 설정해준다
		val[1] = new int[2];
		val[2] = new int[3];
		val[3] = new int[3];
		
		val[0][0] = 10;
		val[0][1] = 20;
		val[0][2] = 30;
		
		val[1][0] = 40;
		val[1][1] = 50;
	//	val[1][2] = 60; <== 입력이 불가함!! //Exception in thread "main" java.lang.ArrayIndexOutOfBoundsException: 2
		
		val[2][0] = 70;
		val[2][1] = 80;
		val[2][2] = 90;
		
		val[3][0] = 100;
		val[3][1] = 110;
		val[3][2] = 120;
		
		System.out.println("val.length ==> " + val.length);
		// val.length ==> 4
		System.out.println("val[0].length ==> " + val[0].length);
		// val[0].length ==> 3
		System.out.println("val[1].length ==> " + val[1].length);
		// val[0].length ==> 2
		
		for(int i=0;i < val.length; i++) {
			for(int j=0; j < val[i].length; j++) {
				String comma = (j< val[i].length -1)?", ":"\n";
				System.out.print(val[i][j] + comma);
			}
				
		}
		/*10, 20, 30
		  40, 50
	  	  70, 80, 90
		  100, 110, 120*/
		
		System.out.println("\n###########################\n");
		
		int[][] jumsu = {{10,20,30},
						 {40,50},
						 {60,70,80},
						 {90,100,110}};
		
		System.out.println("jumsu.length ==> " + jumsu.length);
		// jumsu.length ==> 4
		System.out.println("jumsu[0].length ==> " + jumsu[0].length);
		// jumsu[0].length ==> 3
		System.out.println("jumsu[1].length ==> " + jumsu[1].length);
		// jumsu[0].length ==> 2
		
		for(int i=0;i < jumsu.length; i++) {
			for(int j=0; j < jumsu[i].length; j++) {
				String comma = (j< jumsu[i].length -1)?", ":"\n";
				System.out.print(jumsu[i][j] + comma);
			}
				
		}
		/*10, 20, 30
		  40, 50
	  	  70, 80, 90
		  100, 110, 120*/
		
		System.out.println("\n==============================================\n");
		
		Student[] studentArr = {new Student("kh0001","한석규",91,92,93), 
								new Student("kh0002","두석규",81,82,83),
								new Student("kh0003","세석규",71,72,73),
								new Student("kh0004","네석규",81,100,92)};
		
		for(int i=0; i<studentArr.length; i++) {
			studentArr[i].showInfo();
		}
		
		System.out.println("\n========================================\n");
		
		// Student 배열 studentArr에 저장된 데이터중 학점이 "A" 인 학생만
		// 아래와 같이 나오도록 만들기
		// 성명 	평균점수	학점		
		// 한석규	92.0	 A
		// 네석규  91.0     A
		System.out.println("=====================");
		System.out.println("성명\t평균점수\t학점");
		System.out.println("=====================");
		int flag = 0;
		for(int i=0; i< studentArr.length; i++) {
			if( studentArr[i].getHakjum().equals("D")) {
				System.out.println(studentArr[i].name+"\t"+studentArr[i].getAvg() + "\t" + studentArr[i].getHakjum());
				flag = 1;
			}
		}
		if(flag == 0)
			System.out.println("데이터가 없습니다.");
		
		// ==== >>>>배열의 복사<<<< ====
		/*
		  	배열은 한번 생성하면 그 크기를 변경할 수 없기 떄문에
		  	더 많은 저장공간이 필요하다면 현재 사용중인 배열보다 더 큰 배열을 새로 만들고
		  	이전 배열로 부터 내용을 복사해야 한다.
		  	배열간의 내용을 복사하려면 for문을 사용하거나 
		  	System 클래스의 arraycopy() 메소드를 사용하면 된다.
		*/
		Student[] newstudentArr = new Student[studentArr.length+2];
		
		for(int i=0; i < studentArr.length; i++) {
			newstudentArr[i] = studentArr[i];
		}
		
		newstudentArr[4] = new Student("kh0005","오석규",71,81,91); 
		newstudentArr[5] = new Student("kh0006","육석규",51,61,71);
		
		flag = 0;
		for(int i=0; i< newstudentArr.length; i++) {
			if( newstudentArr[i].getHakjum().equals("D")) {
				System.out.println(newstudentArr[i].name+"\t"+newstudentArr[i].getAvg() + "\t" + newstudentArr[i].getHakjum());
				flag = 1;
			}
		}
		if(flag == 0)
			System.out.println("데이터가 없습니다.");
		/*
		   Exception in thread "main" java.lang.ArrayIndexOutOfBoundsException: 4
		      배열의 인덱스 4에서 초과했다라는 오류 메세지.
		 */
		
		System.out.println("\n\n");
		Student[] newstudentArr2 = new Student[10];
		newstudentArr2[0] = new Student("ss001","일순신",10,20,30);
		newstudentArr2[1] = new Student("ss002","이순신",100,100,100);
		int cnt = 0;
		for(int i=0; i<newstudentArr2.length; i++) {
			if(newstudentArr2[i] != null)
				cnt++;
		}
		System.out.println("cnt = "+ cnt);
		
		for(int i=0; i<newstudentArr.length; i++) {
			newstudentArr2[i+cnt] = newstudentArr[i];
		}
		
		for(int i=0; i<newstudentArr2.length; i++) {
			if(newstudentArr2[i] != null)
				System.out.println(newstudentArr2[i].name);
		}
		
		System.out.println("\n$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$\n");
		
		System.arraycopy(newstudentArr, 0, newstudentArr2, 0, newstudentArr.length);
		
		
		/*
		 	System.arraycopy(src, srcPos, dest, destPos, length);
		 	
		 	==> 배열 src의 내용을 새배열 dest 로 복사하는데, 
		 		복사할 내용은 배열 src의 인덱스 srcPos 의 위치부터 시작해서
		 		length 만큼을 새배열 dest 의 인덱스 destPos인 위치에 복사한다.
		 		이때 복사되어지는 새배열 dest 의 위치가 적절하지 못하여 
		 		복사하려는 내용(src)보다 여유공간이 적으면 ArrayIndexOutOfBoundsException 이 발생한다.
		 */
		for(int i=0; i<newstudentArr2.length; i++) {
			if(newstudentArr2[i] != null)
				System.out.println("널 아님 = > ["+ i +"]");
			else
				System.out.println("널 임 = > ["+ i +"]");
		}
		
		for(int i=0; i<newstudentArr2.length; i++) {
			if(newstudentArr2[i] != null)
				System.out.println(newstudentArr2[i].name);
		}
		
		
		
	}// end of main()-------------------------------

}// end of class ArrayTest4//////////////////////////
