public class MethodInnerMethodTest
{

	public String calc(int a, int b, int c){
		

		return "���ġ : " + avg(a, b, c);	
	}

	public double avg(int a, int b , int c){
		
		int result = sum(a,b,c); //���� Ŭ�������� ������ �׳� �ҷ��ü� �ִ�.
		double result2 = (double)result/3;// '(double)'��  casting �����ڷ� result�� ���� �Ǽ��� �����ͷ� ����.
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
