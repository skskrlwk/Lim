import java.text.*;

public class NumberCommaTest
{

	public static void main(String[] args){
		
		long moneny = 34567890123L;//21억이 넘어가는 수는 'L'로 long타입이라는것 을 선언해준다
		System.out.println(moneny + "원");

		// 숫자로 되어진 데이터를 세자리 마다 콤마(,)를 찍어주는 객체를 생성함.
		DecimalFormat df = new DecimalFormat("#,###");
		
		String strMoney = df.format(moneny);

		System.out.println(strMoney + "원");

		
	
	}

}