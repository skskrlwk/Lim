//�ν��Ͻ� ������ �ʱ�ȭ ����
//JVM �⺻�� --> ������ʱ�ȭ --> �ν��Ͻ� �ʱ�ȭ �� --> �Ķ���Ͱ� �ִ� ������ 

public class InitalBlockTest2
{
	String id = "leess";
	String name = "�̼���";
	int age = 27; 
	{ id = "youjs";  name = "���缮";  age = 30; } //�ν��Ͻ� �ʱ�ȭ ��


	public InitalBlockTest2(){}; //�⺻������
	public InitalBlockTest2(String id, String name, int age){

		this.id = id;
		this.name = name;
		this.age = age;
	}

	public static void main(String[] args) 
	{
		InitalBlockTest2 test = new InitalBlockTest2();
		System.out.println("id : " + test.id + ", name : " + test.name + ", age : " + test.age); 
		System.out.println("");
	
		InitalBlockTest2 test2 = new InitalBlockTest2("iyou","������",27);
		System.out.println("id : " + test2.id + ", name : " + test2.name + ", age : " + test2.age);
	}
}
