import java.text.*;

public class NumberCommaTest
{

	public static void main(String[] args){
		
		long moneny = 34567890123L;//21���� �Ѿ�� ���� 'L'�� longŸ���̶�°� �� �������ش�
		System.out.println(moneny + "��");

		// ���ڷ� �Ǿ��� �����͸� ���ڸ� ���� �޸�(,)�� ����ִ� ��ü�� ������.
		DecimalFormat df = new DecimalFormat("#,###");
		
		String strMoney = df.format(moneny);

		System.out.println(strMoney + "��");

		
	
	}

}