public class Member
{
	String userid;
	String passwd;
	String name;
	int age;
	double height;

	public Member(){}

	public Member(String userid, String passwd, String name, int age, double height){
		
		this.userid = userid;
		this.passwd = passwd;
		this.name = name;
		this.age = age;
		this.height = height;
	
	}
	//�޼ҵ� ����
	public void infoPrint(){
	
		System.out.println("���̵� : " + userid + ", �н����� : " + passwd + ", �̸� : " + name + ", ���� : " + age + ", ���� : " + height);

	}

}  
