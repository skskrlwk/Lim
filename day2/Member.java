/*
	* 메소드(method)란?
	 - 클래스안에서 구현되어진 일종의 함수라고 생각하면 된다.
	   쉽게말해서, 어떠한 행동이나 행위를 구체적으로 서술하여 정의한것 이라고 보면 된다.

	-- 메소드는 반드시 리턴타입을 정의해주어야 한다.
	   리턴타입이 있으면 그 리턴타입에 해당하는 타입(String, int, double...)을 기술해주고
	   리턴타입이 없는 메소드라면 리턴타입이 없습니다라는 뜻의 void 를 기술해준다.

	* 메소드의 종류
	  1. 인스턴스 메소드 (instance method)
	     -- 객체명.메소드명();
	  2. 스태틱 메소드(static method == 클래스 메소드)
	     -- 클래스명.메소드명();
	 

*/


public class Member
{
	String userid;
	String passwd;
	String name;
	int age;
	double height;
	int hopeMonthsal;



	public Member(){}

	public Member(String userid, String passwd, String name, int age, double height, int hopeMonthsal){
		
		this.userid = userid;
		this.passwd = passwd;
		this.name = name;
		this.age = age;
		this.height = height;
		this.hopeMonthsal = hopeMonthsal;
	
	}
	//메소드 정의
	public void infoPrint(){
	
		System.out.println("아이디 : " + userid + ", 패스워드 : " + passwd + ", 이름 : " + name + ", 나이 : " + age + ", 신장 : " + height);

	}

	public String getName(){
		
		return name;
	}

	public String getPw(){
	
		return passwd;
	}

	public int getAge(){
	
		return age;
	}
	
	public double getHeight(){
	
		return height;
	}

	public void changeMyInfo(String passwd, int age, double height, int hopeMonthsal){
	
		this.passwd = passwd;
		this.age = age;
		this.height = height;
		this.hopeMonthsal = hopeMonthsal;
	
	}

	public int getHopeYearSal(){
	
		return hopeMonthsal * 12;
		
	}

	public String setHopeMonthsal(int newHopeMonthsal){
	
		int beforeChangeSal = hopeMonthsal;
		hopeMonthsal = newHopeMonthsal;

		return name + "님의 기본급여 : " + beforeChangeSal + "만원에서 " + hopeMonthsal +" 만원으로 변경되었습니다.";

	}

	

	

	public void showInformation(){
	
		String result = "======="+ name +"님의 정보=======\n" +
						"1.아이디 : " + userid + "\n" +
						"2.암호 : " + passwd + "\n" +
						"3.성명 :" + name + "\n" +
						"4.나이 : " + age + "세\n" +
						"5.신장 : " + height + "cm\n" +
						"6.희망월급여 : " + hopeMonthsal + "만원";
		System.out.println(result);
		
/* 

		System.out.println("======="+ name +"님의 정보=======");
		System.out.println("1.아이디 : " + userid);
		System.out.println("2.암호 : " + passwd);
		System.out.println("3.성명 :" + name);
		System.out.println("4.나이 : " + age + "세");
		System.out.println("5.신장 : " + height + "cm");
		System.out.println("6.희망월급여 : " + hopeMonthsal + "만원");

	
*/
	}
	
	public String getStrYearSal(){
	
		return MyUtil.Comma(hopeMonthsal * 12); 		
	}

}  
