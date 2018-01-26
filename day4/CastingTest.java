
/*
		 	===== 데이터형 변환하기 =====
		 	1.묵시적 형변환(자동 형변환)
		 	  --> 크기가 작은 것에서 크기가 큰쪽으로는 자동적으로 형변환이 일어난다.
		 	2. 강제형변환(casting)
		 	  --> 크기가 큰 것에서 작은 쪽으로는 자동적으로 형변환이 불가능하므로
		 	            크기가 큰 데이터 타입을 크기가 작은 데이터타입으로 강제적으로 형을 변경해준다.
		 	            이때 사용하는 것이 () 라는 casting 연산자 이다.
		   ======================================================> 자동형 변환 가능
		     byte --> short -->  int  -->  long   --> float  --> dobule
		    (1byte)   (2byte)	(4byte)	 (8byte)     (4byte)	(8byte)
		    
		    		   char
		    		 (2byte)
		      자동형 변환 불가 <================================================= 
		 */
package my.day3;

public class CastingTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		byte bt1 = 10;
		int a1 = bt1;
		
		int a2 = 30;
		byte bt2 = (byte)a2;//casting 연산자
		
		long ln1 = 9234567890L;
		float ft1 = ln1;
		
		float ft2 = 12.3F;
		long ln2 = (long)ft2;
		System.out.println("ln2 : " + ln2);//소수부 삭제.
		
		double db1 = 123.456789;
		System.out.println("db1 : " + db1 + ", (int)db1 : " + (int)db1);
		
		

	}

}
