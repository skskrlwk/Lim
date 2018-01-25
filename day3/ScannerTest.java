package my.day4;

import java.util.Scanner;

public class ScannerTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in); // System.in ==> 키보드
		
		
		System.out.print("정수를 입력하세요 : " );
		int n = sc.nextInt();
		System.out.println("입력한 정수의 값은 : " + n);
		String s = sc.nextLine(); //엔터를 잡아주기위해서.
		
		System.out.print("문자열 단어를 입력하세요 => ");
		
		String word = sc.next();
		System.out.println("입력한 단어는 : " + word);
		s = sc.nextLine();
		
		System.out.print("문자열 단어를 입력하세요 => ");
		String str = sc.nextLine();
		System.out.println("입력하신 문자열은 : " + str);
		
		System.out.println("\n======================\n");
		
		System.out.print("정수를 입력하세요 : " );
	    n = Integer.parseInt(sc.nextLine());
		System.out.println("입력한 정수의 값은 : " + n);
		
		System.out.print("문자열 단어를 입력하세요 => ");
		
		word = sc.nextLine();
		System.out.println("입력한 단어는 : " + word);
		
		System.out.print("문자열 단어를 입력하세요 => ");
		str = sc.nextLine();
		System.out.println("입력하신 문자열은 : " + str);
		
	}

}
