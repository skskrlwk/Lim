public class MyConstructorTest2  
{
	String id;
	String pwd;
	String name;
	int age;
// --�⺻������	
// �⺻�����ڴ� �Ķ���Ͱ� �ִ� �����ڰ� ���� ��� �ڵ������� ��ϵǾ�������
// �Ķ���Ͱ� �ִ� �����ڰ� ���� ��� �ڵ������� ���X
//-- �Ķ���� �����ڰ� �ִ°�쿡�� �ݵ�� �⺻�����ڸ� �������־�� �Ѵ�.

	public MyConstructorTest2(){
	}


// --�Ķ���Ͱ� �ִ� ������
	public MyConstructorTest2(String a, String b, String c, int d){
		this.id = a;
		this.pwd = b;
		this.name = c;
		this.age = d;
		
	}

	public static void main(String[] args) 
	{

		MyConstructorTest2 test = new MyConstructorTest2();

		test.id = "leess";
		test.pwd = "qwer1234";
		test.name = "�̼���";
		test.age = 25;

		System.out.println("test.id = " + tes.id);
		System.out.println("test.pwd = " + test.pwd);
		System.out.println("test.name = " + test.name);
		System.out.println("test.age = " + test.age);
		System.out.println("");

		//-- �Ķ���� �����ڰ� �ִ°�쿡�� �ݵ�� �⺻�����ڸ� �������־�� �Ѵ�.
		MyConstructorTest2 test2 = nd = " + test2.pwd);
		System.out.println("test2.name = " + test2.name);t
		System.out.println("test2.age = " + test2.age);
	    System.out.println("");ew MyConstructorTest2("youjs","qaws00","���缮", 45);
		System.out.println("test2.id = " + test2.id);
		System.out.println("test2.pw

	}
}


