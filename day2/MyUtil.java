import java.util.*;
import java.text.*;
public class MyUtil
{
	//--- ����ð��� ��Ÿ���� ---
	//'�����۾��� �ϴ� ��'�� ���鶧 static���� �����.
	public static String getNowTime(){
		
		Date now = new Date();
		String today = String.format("%tF %tT" , now ,now);
		return today;

	}

	//--- ���ڸ� �Է¹޾Ƽ� �޸�(,)�� �� ���Ͻ����ִ� �޼ҵ� �����ϱ�//

	public static String Comma(long money){

		DecimalFormat df = new DecimalFormat("#,###");
		String result = df.format(money);
		return result;

	}


}
