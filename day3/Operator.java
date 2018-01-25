package my.day4;

public class Operator {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		System.out.println("---- 1 . 산술 연산자 : + - * / % << >> >>> ");
		
		/* 
		  x << n     x*(2의n승)의 결과값과 같다. x는 실수형은 불가능하고 정수형만 가능하다.
		  x >> n     x/(2의n승)의 결과값과 같다. x는 실수형은 불가능하고 정수형만 가능하다.
		  x >>> n 정수x를 32bit 형태의 2진수로 나타낸후 오른쪽으로 n번 이동시키고 빈자리는 0으롷 채운다.
		  
		  */
		
		int n = 10;
		System.out.println("n+3 = " + (n+3)); 
		System.out.println("n-3 = " + (n-3));
		System.out.println("n*3 = " + (n*3));
		System.out.println("n/3 = " + (n/3));
		System.out.println("n%3 = " + (n%3));
		System.out.println("n<<3 = " + (n<<3)); // 10*2의3승 = 80
		System.out.println("n>>3 = " + (n>>3)); // 10/2의3승 = 1
		System.out.println("n>>>3" + (n>>>3));
		/*
		  10을 32bit의 2진수로 나타내면
		  00000000 00000000 00000000 00001010에서 
		  00000000 00000000 00000000 00000001로 변경됨
		  		  
		 */
		
		System.out.println("---- 2.부호연산자 : + - ----");
		byte a = 5;
		short b = -9;
		System.out.println(-b); //9
		System.out.println(+a); //5
		
		System.out.println("---- 3. 증감연산자 : ++ -- ----");
		int c = 7;
		long d = 3L;
		//후위증감연산자는 다른 연산을 다 마친이후에 1을 증감 한다.
		
		c++; //c = c+1 와 같은 뜻이다 . 1증가 
		d--; //d = d-1 와 같은 뜻이다. 1감소
		System.out.println(c); //8
		System.out.println(d); //2
		
		//전위증감연산자는 먼저 1을 증감을 마친이후에 다른 연산을 한다.
		++c;
		--d;
		System.out.println(c); //9
		System.out.println(d); //1
		
		System.out.println("----4. bit별 not 연산자 : ~ ----");
		//주어진 정수값을 32bit 형태의 2진수로 바꾸어서 나타내는데
		//0은 1로 바꾸고 1은 0으로 바꾸어주는 것이다.
		
		int m =42;
		System.out.println("~m : " + ~m); // -43
		
		
		// 00000000 00000000 00000000 00101010 <== 42
		// 11111111 11111111 11111111 11010101 <== ~42
		/*
		 첫번째 bit는 부호비토 사용되어지는데
		 0은 +임(양수)을 의미하고,
		 1은 -임(음수)을 의미한다.
		 첫번째 bit가 1인경우, 즉 음수를 뜻할 경우에는 아래와 같이
		 똑같이 1이 나오는 것 중에서 마지막 1만취하고, 여기에다 그 나머지를 끝까지 취한다
		 
		 1010101
		 
		 첫번쨰 값만 -를 붙이고 나머지 값은 +로 연산을 하면 된다.
		 -1*2의6승 + 0*2의5승 + 1*2의4승 + 0*2의3승 + 1*2의2승 + 0*2의1승 + 1*2의0승
		  -64  + 0 + 16 + 0 + 4 + 0 + 1  
		 
		 */
		System.out.println("---- 5. 논리 부정 연산자 : ! ----");
		
		boolean bool = false;
		System.out.println("bool = " + bool); // false
		System.out.println("!bool = " + !bool); //ture
		
		System.out.println(" ---- 6. bit 연산자 : & | ^");
		/*
		 &(and 연산자) ==> 2개 bit 모두 1일떄만 1, 나머지는 0
		 |(or 연산자)  ==> 2개 bit 중 적어도 1개가 1이면 1, 모두 0이면 0
		 ^(xor 연산자) ==> 2개 bit 중에서 서로 달라야만 1, 같은면 0;
		 이와 같은 연산자는 연산되어지는 대상이 정수일떄만 가능하다.
		 */
		
		int x1 = 3;
		int y1 = 5;
		System.out.println("x1 & y1 => " + (x1 & y1));
		
		/*
			 00000011 <= 3;
		   & 00000101 <= 5;
			 -------------
			 00000001 <= 1;
		 */
		
		System.out.println("x1 | y1 => " + (x1 & y1));
		
		/*
			 00000011 <= 3;
		   & 00000101 <= 5;
			 -------------
			 00000111 <= 7;
		 */
		
		System.out.println("x1 ^ y1 => " + (x1 & y1));
		
		/*
			 00000011 <= 3;
		   & 00000101 <= 5;
			 -------------
			 00000110 <= 6;
		 */
		
		System.out.println("---- 7. 논리 연산자 : & | && || ----");
		/*
		 	논리 연산자 & | & || 에 대상은 참,거짓이다.
				 	
		 */
		int a1=50 , b1=60;
		
		if((a1 > b1) & (a1 > 0)) 
		//   false  & true = false
			System.out.println("Hello");
		else if ((b1 > a1) | (b1 < 0))
		//         true	| false = true
			System.out.println("Java");
		else
			System.out.println("몰라요");
		
		System.out.println("=========================");
		
		if((a1 > b1) && (a1 > 0)) 
		//   false  && 실행없이  스킵 => false
				System.out.println("Hello");
		else if ((b1 > a1) || (b1 < 0))
		//         true  ||  스킵 => true
				System.out.println("Java");
		else
				System.out.println("몰라요");
		
		System.out.println("---------퀴즈1----------");
		int i = 1;
		int j = i++; //j = 1 =>> i = 2
		if((i > ++j) & (i++ == j)) 
	    //   false  & true  
			i = i+j;  // 3
		System.out.println("i = " + i);// 3
		
		System.out.println("---------퀴즈2----------");
		
		int m1=0, n1=1;
		if ((m1++ == 0) | (n1++ == 2))
		//   true  | false	
			m1=42;
		System.out.println("m1 = " + m1 + ", n1 = " + n1); // 42 2
		
		System.out.println("---------퀴즈3----------");
		
		boolean k1 = false , k2 = false;
		boolean k3 = ((k1 = true) | (k2 = true));
		//               k1 =true , k2 = true , k3 =true
		System.out.println(k1+", "+k2+", "+k3); 
		
		System.out.println("----- 8 비교 연산자  :  == != <= >= ----");
		System.out.println("----- 9.할당 연산자 (연산후 대입연산자)");
		i = 1;
		i += 3; // i = i + 3
		System.out.println("i = " + i); //i=4
		j=10;
		j-=3;
		System.out.println("j = " + j); //7
	
			
			
		System.out.println("---- 10.삼항 연산자(if~else와 같음) -----");
		/*
		  변수선언 = (조건식)?값1:값2//변수를 선언하고 나서 값을 부여하고자 할때 사용 
		  						 조건식이 참이라면 값1을 거짓일경우 값2.
		 */
 		a = 50;
 		b = 60;
 		int result = (a>b)?a:b;// result = 60
 		
 		
 		String result1 = (a<b)?"b가더큽니다":"a가더큽니다"; // result1 = b가더큽니다.
 		
 		System.out.println("\n==== 시험퀴즈 ==== ");
		// 연산자의 우선순위
 		/* 단항연산자 +(부호) - ~ () ++ --               높음
 		      산술연산자 * / +(더하기) -(빼기) >> << >>>        
 		      비교연산자  < > <= >= == !=
 		      논리연산자 & | && || 
 		      삼항연산자 ?:
 		      대입연산자  = += -= *= /= %= >>= <<= >>>=    낮음
 		*/
 		
 		int su = 10;
 		String strResult = (su >>> 3 >= 2 ) && (1 > 0)?"참입니다.":"거짓입니다";
 		System.out.println(strResult); //거짓입니다.
		
	}

}
