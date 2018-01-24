import java.util.*;
import java.text.*;
public class MyUtil
{
	//--- 현재시각을 나타내기 ---
	//'같은작업을 하는 것'을 만들때 static으로 만든다.
	public static String getNowTime(){
		
		Date now = new Date();
		String today = String.format("%tF %tT" , now ,now);
		return today;

	}

	//--- 숫자를 입력받아서 콤마(,)를 찍어서 리턴시켜주는 메소드 생성하기//

	public static String Comma(long money){

		DecimalFormat df = new DecimalFormat("#,###");
		String result = df.format(money);
		return result;

	}


}
