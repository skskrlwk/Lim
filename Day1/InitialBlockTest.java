public class InitialBlockTest
{

	String id ;
	String pwd;
	String name;

	/* -- Ŭ���� �ʱ�ȭ �� --
		  Ŭ���� �ʱ�ȭ ���� �ش� Ŭ������ �޸𸮿� ó�� �ε��Ǿ����� �� 1���� ��������ִ� ���̴�.
	
	*/
	static {System.out.println("!! Ŭ���� InitialBlockTest �ʱ�ȭ �� ������!!");}//Ŭ���� �ʱ�ȭ ��



	/* ---�ν��Ͻ� �ʱ�ȭ ��---
	      ��� �����ڿ��� ���������� ����Ǿ��� �� ��찡 �ִ°�� ��� ������ �����ڸ��� �ߺ��ǰ� ������(�ڵ�)����
		  �ν��Ͻ� �ʱ�ȭ ���� 1���� �������ָ� �ȴ�.
		  �����ں��� �ν��Ͻ� �ʱ�ȭ ���� ���� ����ȴٴ� ��.
		  �׸��� �ν��Ͻ� �ʱ�ȭ ���� ��ü�� �����Ǿ��������� ����ȴٴ� ��.
	*/
	{ System.out.println("Ŭ���� InitialBlockTest�� ��ü���� �Ϸ�!!");  }// �ν��Ͻ� �ʱ�ȭ ��


	public InitialBlockTest(){
		//System.out.println("Ŭ���� InitialBlockTest�� ��ü���� �Ϸ�");
		System.out.println("�⺻�����ڷ� ������");
	}

	public InitialBlockTest(String id, String pwd, String name){
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		//System.out.println("Ŭ���� InitialBlockTest�� ��ü���� �Ϸ�");
		System.out.println("�Ķ���Ͱ� �ִ� �����ڷ� ������");
	}

	public static void main(String[] args) 
	{
		
		InitialBlockTest test = new InitialBlockTest();
		test.id = "leess";
		test.pwd = "qwe123";
		test.name = "�̼���";
		
		System.out.println("");

		InitialBlockTest test2 = new InitialBlockTest("skskrlwk","1l2l3l","������");
		
	}
}
