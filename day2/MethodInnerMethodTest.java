public class MethodInnerMethodTest
{

	public String calc(int a, int b, int c){
		

		return "평균치 : " + avg(a, b, c);	
	}

	public double avg(int a, int b , int c){
		
		int result = sum(a,b,c); //같은 클래스내에 있으면 그냥 불러올수 있다.
		double result2 = (double)result/3;// '(double)'는  casting 연산자로 result를 강제 실수형 데이터로 변경.
		return result2;

	}

	public int sum(int a, int b, int c){
		
		int result = a+b+c;
		return result;
	}

	public void ShowResult(int a, int b, int c){
		
		System.out.println(calc(a,b,c));
	
	}


}
