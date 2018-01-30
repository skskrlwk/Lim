package my.day7;

import my.util.MyUtil;

public class MathRandomTest {

	/*
	 	Java.lang.Math.random() 메소드는
	 	0.0이상 1.0미만의 실수(double)값을 랜덤하게 나타내어주는 메소드이다.
	 	즉,0.0 <= 임의의 난수(실수) < 1.0
	 */
	public static void main(String[] args) {
		
		double random = Math.random();
		System.out.println(random);
		
		/*
		 	랜덤(1부터 10까지의 범위를 구한다. ==> 구간범위 : 10-1+1 = 10
		 	0.0 * 구간범위(10) ==> 0.0 (int) ==> 0 + 시작값(1) ==> 1
		 	0.34 * 구간범위(10) ==> 3.4  (int)3.4 ==> 3 + 시작값(1) == > 4
		 	0.988 * 구간범위(10) ==> 9.88  (int)9.88 ==> 9 + 시작값(1) == >10
		 	
		 	랜덤(13부터 18까지의 범위를 구한다. ==> 구간범위 : 18-13+1 = 6
		 	0.0 * 구간범위(6) ==> 0.0 (int) ==> 0 + 시작값(13) ==> 13
		 	0.34 * 구간범위(6) ==> 2.04  (int)2.04 ==> 2 + 시작값(13) == > 15
		 	0.988 * 구간범위(6) ==> 5.928  (int)5.928 ==> 5 + 시작값(13) == > 18
		 	
		 	랜덤한 정수 = (int)(Math.random()*구간범위) + 시작값;
		 	
		 */
			
		System.out.print("1부터 10 까지중 랜덤하게 발생한 값 : ");
		int ran = (int)(random*10)+1;
		System.out.println(ran);
		
		System.out.print("13부터 18 까지중 랜덤하게 발생한 값 : ");
		System.out.println(MyUtil.random(13,18));
		
		//랜덤한 영문자 출력
		System.out.println("==================================");
		char ch = (char)MyUtil.random('a', 'z');//자동 형변환
		/*ch = (char)(MyUtil.random(97, 122));*/
		

		System.out.println("a 부터 z 까지중 랜덤하게 발생한 소문자 : " + ch);
	}

}
