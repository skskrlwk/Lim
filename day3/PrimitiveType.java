/*
    === *** 자료형 *** ===
  	*자료형의 종류
  	1. 원시형 타입(primitive Type)
  	  1.1 정수형(byte, shor, int, long);
  	     -- byte(8bit == 1byte) : -128(-2^7) ~ 127(2^7 - 1)
  	     -- short(16bit == 2byte) : -32768(-2^15) ~ 32767(2^15 - 1)
  	     -- int(32bit == 4byte) : 2,147,483,648(-2^31) ~ 2,147,483,647(2^31) - 1
  	                기본은 int이다
  	     -- long(64bit == 8byte) : -9,372,036,854,775,808(-2^63) ~ 9,223,372,036,854,775,807(2^63 - 1) 
  	  
  	  1.2 실수형(float, double)
  	  	 -- flaot : 4byte 단정밀도. 소수점이하 7자리 까지 표현가능
  	  	 -- double : 8byte 배정밀도. 소수점이하 15~16자리 까지 표현가능
  	  	자바에서 실수 기본타입은 double 이다.
  	  
  	  1.3 문자형 (char)
  	    char : 자바는 유니코드 체계를 사용하므로 문자형 타입인 char 은 2byte 이며,
  	    	      범위는 0~65535 이다.(UNICODE 표 참조 http://www.tamasoft.co.jp/en/general-info/unicode.html)
  	  1.4 참(true) 또는 거짓(false)을 담아주는 타입인 boolean
  	    -- boolean 타입은 true, false 를 가진다.
  	              자바의 논리형인 boolean 은 1,0으로  호환되지 않으며 형변환도 할 수 없다. 
  	               	
*/
package my.day3;

public class PrimitiveType {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		byte bt1 = 10; // -128 ~ 127
		//byte bt2 = 200; 표현가능한 범위를 넘어서 오류.
		
		short st1 = 20000; // -32,768 ~ 32,767
		// short st2 = 40000; 표현가능한 범위를 넘어서 오류.
		
		int it1 = 5000000;
		//int it2 = 10000000000;

		long ln1 = 200000000000L; // L로 long선언
		// long ln2 = 200000000000; 기본을 int로 받기떄문에 오류
		
		int a = 9; //10진수(0~9)
		System.out.println("10진수 9 : " + a);
		
		a = 011; // 8진수(0~7) => 정수 맨앞에 접두사로 숫자 0을 붙이면 8진수로 인식한다.
		System.out.println("8진수 011 => " + a);
		
		a = 0x11; // 16진수(0~F) => 정수 맨앞에 접두사로 숫자 0x을 붙이면 16진수로 인식한다. 
		System.out.println("16진수 0x11 => " + a);
		
		System.out.println("---- *** prinf 알아보기 *** ----");
		int b = 30;
		System.out.printf("10진수 %d, 8진수 %o, 16진수 %x", b, b, b);
		
		a = 5;
		b = 2;

		System.out.println("a/b = " + (a/b)); // 정수/정수 = 몫(정수)
		
		double c = 5.0;
		System.out.println("c/b = " + (c/b)); // 실수/실수 = 실수 , 정수/실수 = 실수, 실수/정수 = 실수
		
		System.out.println("a%b = " + (a%b)); // 정수1%정수2 = 정수1을 정수2로 나눈 나머지값.
		
		System.out.println(" ==========실수형============");
		
		double db1 = 32.123456789;
		System.out.println("db1 = " + db1);
		
		float ft1 = 32.123456789F; // 자바는 실수의 기본타입이 double 이므로 float 나타내기 위해서는 숫자 뒤에f(F)를 붙여준다.
		System.out.println("ft1 = " + ft1);
		
		System.out.println("========= 문자형 ==========");
		char ch = '\u0041';// 유니코드로 표현시  4자리로 표현.
		char ch1 = '\u263A';
		char ch2 = '\uC784';
		System.out.println("ch = " + ch + "\nch1 = " + ch1 + "\nch2 = " + ch2);
		
		System.out.println("-------------------------------------");
		ch = 'A';
		System.out.println("ch = " + ch);
		
		System.out.println("-------------------------------------");
		ch = 65;//10진수 대문자 A
		
		/*
		  int (4byte) 아래의 크기인 byte(1byte), short(2byte) 타입이
		   사칙연산 (+, -, *, /)을 만나면 자동적으로 int 타입으로 자동형 변환이 일어난다. 
		 */
		
		ch = 'a';
		System.out.println("ch = " + (ch+1));//int 타입으로 자동변환
		
		// 'A' = > 65 'a' => 97 (대문자 + 32는 소문자)
		// '0' = > 48 '1' = > 49 ..... '9' = > 57
		// 문자를 10진수로 알고싶을때 ('서' + 0)으로 알수있다.
		
		System.out.println("========= boolean 타입 ==========");
		boolean bool = false;
		System.out.println("bool = " + bool);
		
		bool = 5 > 2;
		System.out.println("bool = " + bool);
		
		bool = (2.0 == 5/2);
		System.out.println("bool = " + bool);
		
		bool = ('A' == 'B'-1);//ture
		bool = ('a' != 97);//false
		
		
	}

}
