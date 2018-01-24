/*
	* �޼ҵ�(method)��?
	 - Ŭ�����ȿ��� �����Ǿ��� ������ �Լ���� �����ϸ� �ȴ�.
	   ���Ը��ؼ�, ��� �ൿ�̳� ������ ��ü������ �����Ͽ� �����Ѱ� �̶�� ���� �ȴ�.

	-- �޼ҵ�� �ݵ�� ����Ÿ���� �������־�� �Ѵ�.
	   ����Ÿ���� ������ �� ����Ÿ�Կ� �ش��ϴ� Ÿ��(String, int, double...)�� ������ְ�
	   ����Ÿ���� ���� �޼ҵ��� ����Ÿ���� �����ϴٶ�� ���� void �� ������ش�.

	* �޼ҵ��� ����
	  1. �ν��Ͻ� �޼ҵ� (instance method)
	     -- ��ü��.�޼ҵ��();
	  2. ����ƽ �޼ҵ�(static method == Ŭ���� �޼ҵ�)
	     -- Ŭ������.�޼ҵ��();
	 

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
	//�޼ҵ� ����
	public void infoPrint(){
	
		System.out.println("���̵� : " + userid + ", �н����� : " + passwd + ", �̸� : " + name + ", ���� : " + age + ", ���� : " + height);

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

		return name + "���� �⺻�޿� : " + beforeChangeSal + "�������� " + hopeMonthsal +" �������� ����Ǿ����ϴ�.";

	}

	

	

	public void showInformation(){
	
		String result = "======="+ name +"���� ����=======\n" +
						"1.���̵� : " + userid + "\n" +
						"2.��ȣ : " + passwd + "\n" +
						"3.���� :" + name + "\n" +
						"4.���� : " + age + "��\n" +
						"5.���� : " + height + "cm\n" +
						"6.������޿� : " + hopeMonthsal + "����";
		System.out.println(result);
		
/* 

		System.out.println("======="+ name +"���� ����=======");
		System.out.println("1.���̵� : " + userid);
		System.out.println("2.��ȣ : " + passwd);
		System.out.println("3.���� :" + name);
		System.out.println("4.���� : " + age + "��");
		System.out.println("5.���� : " + height + "cm");
		System.out.println("6.������޿� : " + hopeMonthsal + "����");

	
*/
	}
	
	public String getStrYearSal(){
	
		return MyUtil.Comma(hopeMonthsal * 12); 		
	}

}  
