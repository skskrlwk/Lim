public class CalculatorMain
{
	public static void main(String[] args) 
	{
		Calculator cal = new Calculator();
		int sum = cal.plus(10,20);
		System.out.println("10 + 20 = " + sum);

		System.out.println("");

		sum = Calculator.hap(20,30); // public static int hap(int x, int y)������
		System.out.println("20 + 30 = " + sum);

		System.out.println("\n\n ==����ð�==:" + MyUtil.getNowTime());

	}
}
