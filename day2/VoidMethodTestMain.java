
public class VoidMethodTestMain 
{
	public static void main(String[] args) 
	{
		
		Member member1 = new Member("kangkc","qwes123","강감찬",34,178.9,250);
		Member member2 = new Member("suji","asd123","수지",39,188.3,300);
		
		member1.infoPrint();
		
		System.out.println("======================================================");

		member2.infoPrint();
			
		System.out.println("======================================================");

		String name = member1.getName();
		String pw = member1.getPw();
		int age = member1.getAge();	
		double height = member1.getHeight();
		int hopeYearSal = member1.getHopeYearSal();

		System.out.println(name + "님의 암호는 : "+ pw +"이며 \n나이는 : " + age + "세 이고\n 신장은 : " + height + "cm 이고\n희망연봉은 : " + hopeYearSal + "만원 입니다.");

		System.out.println("======================================================");
		member1.changeMyInfo("1q2w3e4r",52,195.2,400);

		name = member1.getName();
		pw = member1.getPw();
		age = member1.getAge();	
		height = member1.getHeight();
		hopeYearSal = member1.getHopeYearSal();
		

		System.out.println(name + "님의 암호는 : "+ pw +"이며 \n나이는 : " + age + "세 이고\n 신장은 : " + height + "cm 이고\n희망연봉은 : " + hopeYearSal + "만원 입니다.");
	
		
		System.out.println("======================================================");

		String result = member1.setHopeMonthsal(800);
		System.out.println(result);
		

		System.out.println("======================================================");
		member1.showInformation();

		System.out.println("======================================================");
		Member member3 = new Member("lesss","zxc123","이순신",49,180.3,5000000);

		String strYearSal = member3.getStrYearSal();
		
		System.out.println(member3.getName() + "님의 연급여는 : " + strYearSal +"원 입니다.");

		System.out.println("종료시각 : " + MyUtil.getNowTime());


	}
}
