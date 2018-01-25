package my.day4;

import java.io.IOException;
import java.util.Scanner;

public class IfTest2 {

	
	public void execute(int n) {
		
		char ch = (char)n;
		String result = "";
		
		if(('A' <= ch && ch <='Z') || ('a' <= ch && ch<='z')) {
			result = "영문자";
		} else if ('0' <= ch && ch <= '9') {
			result = "숫자";
		} else 
			result = "특수기호";
		System.out.println("입력하신 " + ch + " 는 " + result +"입니다");
			
		
	}
	
	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
	  System.out.println("글자1개를 입력하세요");	
	  int n = System.in.read();
	  System.out.println("n : " + n);
	  
	  IfTest2 obj = new IfTest2();
	  obj.execute(n);
	  
	}

}
