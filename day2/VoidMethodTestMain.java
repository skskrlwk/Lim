
public class VoidMethodTestMain 
{
	public static void main(String[] args) 
	{
		
		Member member1 = new Member("kangkc","qwes123","������",34,178.9,250);
		Member member2 = new Member("suji","asd123","����",39,188.3,300);
		
		member1.infoPrint();
		
		System.out.println("======================================================");

		member2.infoPrint();
			
		System.out.println("======================================================");

		String name = member1.getName();
		String pw = member1.getPw();
		int age = member1.getAge();	
		double height = member1.getHeight();
		int hopeYearSal = member1.getHopeYearSal();

		System.out.println(name + "���� ��ȣ�� : "+ pw +"�̸� \n���̴� : " + age + "�� �̰�\n ������ : " + height + "cm �̰�\n��������� : " + hopeYearSal + "���� �Դϴ�.");

		System.out.println("======================================================");
		member1.changeMyInfo("1q2w3e4r",52,195.2,400);

		name = member1.getName();
		pw = member1.getPw();
		age = member1.getAge();	
		height = member1.getHeight();
		hopeYearSal = member1.getHopeYearSal();
		

		System.out.println(name + "���� ��ȣ�� : "+ pw +"�̸� \n���̴� : " + age + "�� �̰�\n ������ : " + height + "cm �̰�\n��������� : " + hopeYearSal + "���� �Դϴ�.");
	
		
		System.out.println("======================================================");

		String result = member1.setHopeMonthsal(800);
		System.out.println(result);
		

		System.out.println("======================================================");
		member1.showInformation();

		System.out.println("======================================================");
		Member member3 = new Member("lesss","zxc123","�̼���",49,180.3,5000000);

		String strYearSal = member3.getStrYearSal();
		
		System.out.println(member3.getName() + "���� ���޿��� : " + strYearSal +"�� �Դϴ�.");

		System.out.println("����ð� : " + MyUtil.getNowTime());


	}
}
