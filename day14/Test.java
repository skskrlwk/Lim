package my.day15;

public class Test {

	public static void main(String[] args) {
		
		int r = 2;
		final float fi = 3.14159F; // final 변수를 상수변수라 부른다.
		
		System.out.println("원둘레 = >" + 2*fi*r);

	//	fi = 0; final로 선언해서 오류발생.
		System.out.println("원둘레 = >" + 2*fi*r);
		
	}

}
