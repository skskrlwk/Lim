package my.day6;

import java.util.Scanner;

/*
   ==== 반복문(loop) ==> for 문****
   *for 문의 형식
   		for(초기화; 조건식; 증감식){
   			반복해서 실행할 문장;
   		}
   		
   	*순서
   	 1) 초기화;
   	 2) 조건식; (조건식이 참(true)이라면 반복해서 실행할 문장;을 실행함.
   	 		      조건식이 거짓(false)이라면 반복해서 실행할 문장;을 실행하지않고 }을 빠져나간다.)
   	 3) 증감식
   	 4) 조건식; (조건식이 참(true)이라면 반복해서 실행할 문장;을 실행함.
   	 		      조건식이 거짓(false)이라면 반복해서 실행할 문장;을 실행하지않고 }을 빠져나간다.).....
 */


public class ForTest {
	
	public void loopName(int num, String name) {
		for(int i=0; i < num; i++) {
			System.out.println((i+1)+".설현");
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
	for (int i = 0; i < 10 ; i++) {
		System.out.println((i+1)+ ".안녕자바~");
	}
	System.out.println("------------------");
	
	ForTest ft = new ForTest();
	ft.loopName(5,"설현");
	System.out.println("-----------------------");
	
	for(int i = 0, j = 1; i < 5; i++, j+=2) {
		System.out.println( j + ".Hello Java~");
	}
	
	System.out.println("-----------------------");
	
	for(int i = 10; i > 0; i--) {
		System.out.println(i + ".Hello Eclipse~");
	}

	System.out.println("-----------------------");
	
	for(int i=0, j=10; i<5; i++, j-=2) {
		System.out.println(j + ".Hello Eclipse~");
	}
	Scanner sc = new Scanner(System.in);
	System.out.println("문자열을 입력하세요 => ") ;
	String str = sc.nextLine();
	
	int i = 0;//for문의 초기값을 선언
	try {
		System.out.println("반복횟수를 입력하세요 => ");
		int n = Integer.parseInt(sc.nextLine());
		for(; i<n; i++) { 
			System.out.println((i+1)+"."+ str);
		}
		
		
	} catch (NumberFormatException e) {
		System.out.println("반복횟수는 숫자만 입력가능합니다.\n프로그램 종료");
		return;
	}
	System.out.println("반복을 다한후의 i =>"+i);//i => 10
	
	for(;i>0;i--) {
		System.out.println(i+"."+str);
	}
	
	System.out.println("\n\n");
	
	try {
		
		int n;
		System.out.print(">> 특수문자 1개만 입력하세요=>");
		str = sc.nextLine();
		System.out.println(">> 반복 횟수를입력하세요 => ");
		i = 0;
		n = Integer.parseInt(sc.nextLine());
		
		for(;i<n;i++) {
			System.out.println((i+1)+"."+str);
		}
		for(;i>0;i--) {
			System.out.println(i+"."+str);
		}
		
	} catch (NumberFormatException e) {
		// TODO: handle exception
	}
	
	
	
	
	
	
	}

}
