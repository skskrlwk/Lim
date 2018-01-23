/*

  === ������(constructor) �����ϱ�

  * ������(constructor)��?
  -- ��ü�� ����(Ŭ������ ��ü������ = new Ŭ������();)�Ҷ� ����
     �ڵ������� ȣ��Ǿ����� ��� ������ ����Ѱ� �̶�� �����ϸ� �ȴ�.
  
  * �������� ���Ѿ��� ��Ģ
    1. �������� �̸��� �ݵ�� Ŭ������� ���ƾ� �Ѵ�.
	2. �����ڴ� ��ȯŸ��(����Ÿ��)�� ����ϸ� �ȵȴ�.

	*�������� �ֵ� ������ �Ϲ������� �ɹ�����(�ν��Ͻ�����, Ŭ��������(static ����))�� 
     �ʱ�ȭ�� �ϰ��� �ϴµ� �ִ�.

*/


public class MyConstructorTest
{
	String name;
	int age;
	String addr;

	public MyConstructorTest(){
		
		name = "�̼���";
		age = 25;
		addr = "����� ���α�";
		System.out.println("MyConstructorTest ��ü �����Ϸ�");
	}
	

	
	 // �ĸ���Ÿ�� �ִ� ������
	public MyConstructorTest(String name, int age, String addr){
		//���������� ������������ ������ ��� ������������ �켱�Ѵ�. name = name
		//������ ��� ������ ���� ���� ����� this.�ɹ������� ���� �����Ѵ�.
		this.name = name;
		this.age = age;
		this.addr = addr;
		System.out.println("�Ķ���Ͱ� �ִ� MyConstructorTest : ");
	}
	
	public static void main(String[] args) 
	{
	
	 
	 System.out.println("����� ù�� �Դϴ�.");
	 
	 MyConstructorTest test = new MyConstructorTest(); 
	 System.out.println("test.name : " + test.name);
	 System.out.println("test.age : " + test.age);
	 System.out.println("test.addr : " + test.addr);

	 MyConstructorTest test2 = new MyConstructorTest(); 
	 System.out.println("test2.name : " + test2.name);
	 System.out.println("test2.age : " + test2.age);
	 System.out.println("test2.addr : " + test2.addr);

	 System.out.println("");

	 MyConstructorTest test3 = new MyConstructorTest("������", 23, "��õ������ ����");
	 System.out.println("test3.name : " + test3.name);
	 System.out.println("test3.age : " + test3.age);
	 System.out.println("test3.addr : " + test3.addr);

	 MyConstructorTest test4 = new MyConstructorTest("���ر�", 30, "����� ���ϱ�");
	 System.out.println("test4.name : " + test4.name);
	 System.out.println("test4.age : " + test4.age);
	 System.out.println("test4.addr : " + test4.addr);



	 
	 test.myPrint();
	 test.myPrint();
	
	}

	public void myPrint(){
		System.out.println("�ȳ��ϼ���??");
	}

}
