package my.day4;

import java.io.IOException;

public class IfTest3 {
	
public void execute(int n) {
		
		char ch = (char)n;
		String result;
		
		if( Character.isDigit(ch)) {
			result = "숫자";
		} else if(Character.isUpperCase(ch)) {
	
			result = "대문자";
		} else if(Character.isLowerCase(ch)) {
			result = "소문자";
		} else
			result = "특수기호";
		System.out.println("입력하신 " + ch + " 는 " + result +"입니다");
			
		
	}

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub

		System.out.print("글자를 입력하세요 : ");
		int n = System.in.read();
		IfTest3 obj = new IfTest3();
		 
		  obj.execute(n);
	}

}
