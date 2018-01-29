package my.day6;

import java.util.Scanner;

public class Gugudan {

	
	public void sum(int num1, int num2) {
		int sum=0;
		for(int i=num1; i<num2+1; i++ ) {
			sum += i;
		}
		System.out.println(num1+"부터 "+num2+"까지의 합은 = " + sum);
	}//end of sum(int num1, int num2)----------------------------
	
	public void gugudan(int num1, int num2) {
		
		for(int i=num1; i<num2+1; i++) {
			for(int j=1; j<10; j++) {
				String tab = (j==9)?"\n":"\t";
				System.out.print(i+"*"+j+"="+(i*j)+tab);
			}
		}
	}//end of gugudan(int num1, int num2)---------------------------
		
	public static void main(String[] args) {
				
		for(int i=0,row=1; i<9; i++,row++) {
			for(int j=0,col=2; j<8; j++,col++) {
				String tab = (col==9)?"\n":"\t";
				System.out.print(col+"*"+row+"="+(col*row)+tab);
			}
		}
		
		
		/*for(int i=2; i<10; i++) {
			for(int j=1; j<10; j++) {
				String tab = (j==9)?"\n":"\t";
				System.out.print(i+"*"+j+"="+(i*j)+tab);
			}
		}*/
		
		
		int a,b,sum = 0;
		Scanner sc = new Scanner(System.in);
		Gugudan obj = new Gugudan();
		/*
	 	문제1)
	 	첫번째 수 => 2
	 	두번째 수 => 10
	 	결과) 2부터 10까지의 합은 54입니다.
		 */
		try {
			
			System.out.println("첫번째 수를 입력해주세요 : ");
			a = Integer.parseInt(sc.nextLine());
			System.out.println("두번째 수를 입력해주세요 : ");
			b = Integer.parseInt(sc.nextLine());
			obj.sum(a,b);
						
		} catch (NumberFormatException e) {
			System.out.println("숫자만 입력해주세요");
		}		
		
		/*
		 	문제2)
		 	시작단 => 5
		 	마지막단 =>8
		 	결과 = 5단부터 8단까지 보여주기
		 */
		try {
			System.out.println("첫번쨰 단을 입력해주세요 : ");
			a = Integer.parseInt(sc.nextLine());
			System.out.println("두번째 단을 입력해주세요 : ");
			b = Integer.parseInt(sc.nextLine());
			obj.gugudan(a, b);						
		} catch (NumberFormatException e) {
			System.out.println("숫자만 입력해주세요");
		}
		

	}//end main(String[] args)-------------------

}//end Gugudan------------------------------------------
