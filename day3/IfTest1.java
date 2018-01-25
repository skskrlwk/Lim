package my.day4;

import java.util.Scanner;

public class IfTest1 {
	
	
	
	public void execute(int n) {
		
		String result = ( holjak(n)==0?"짝수입니다":"홀수입니다");
		System.out.println("입력하신 숫자 " + n +"은 :" + result);
		
	}
	
	public int holjak(int n) {
		// 파라미터(매개변수)  n 값이 홀수라면 1을 리턴시키고 아니라면 0을 리턴
		int a = n;
		
		if( n%2 == 1 ) 
			return 1;
		else 
			return 0;
		
	}
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		System.out.println("정수를 입력하세요 = ");
		
		int n = Integer.parseInt(sc.nextLine());
		
		IfTest1 obj = new IfTest1();
		obj.execute(n);

		sc.close();
	}

}
