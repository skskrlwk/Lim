	/*
	  
	  === ������ ���� ===
	  
	  1. �ɹ�����(member ����) -->
	     1.1 Ŭ��������(static����)
		 1.2 �ν��Ͻ�����(instance ���� == non static ����)
	     -- �ɹ������� ���Ǿ����� ������ �ش� Ŭ����(������ MyVariable)������ ��𼭳� ��밡���ϴ�.
		 -- �ɹ������� ����Ǿ����� ��ġ�� �Ϲ������� �ش� Ŭ������ �ٷ� �Ʒ��� ����ȴ�. 
		 -- ���� ������ ���� �ο����� �ʴ���(== ������ �ʱ�ȭ) ���� �ʴ��� �ڵ�������
		    JVM(Java Virtual Machine)�� �˾Ƽ� �⺻���� �ο����ش�.
			������ (byte, short, int, long)Ÿ���� �⺻���� 0 ���� �ʱ�ȭ �ǰ�,
			�Ǽ��� (float, double)Ÿ���� �⺻���� 0.0 ���� �ʱ�ȭ �ǰ�,
			char Ÿ���� �⺻���� ' '(����)���� �ʱ�ȭ �ǰ�,
			Object Ÿ���� �⺻���� null �� �ʱ�ȭ �ȴ�.

		-- Ŭ��������(static ����)�� ������ �ϱ� ���ؼ���
		   ��ü(Object)�� �������� �ʰ� �ٷ� Ŭ������. Ŭ���������� �����Ѵ�.
		   Ŭ��������(static ����)�� �ش� Ŭ������ �����Ǿ��� ��ü���� �����ؼ� ����Ѵ�.

		-- �ν��Ͻ�����(non static ����)�� ������ �ϱ� ���ؼ��� �ݵ�� ��ü�� �������� �ʰ� �ٷ� Ŭ������, Ŭ���������� �����Ѵ�.
           �ν��Ͻ������� �ش� ��ü������ ����ϴ� ���̴�.

		-- Ŭ��������(static ����)�� Ŭ������ ����Ǿ��� �� �����Ǿ�����,
		   �ν��Ͻ������� ��ü�� �����Ǿ����� �����ȴ�.
		-- �ش� ���α׷��� �����ϸ� Ŭ���������� �ν��Ͻ������� ���̻� ������� ������(������)�� �ǹǷ� JVM ���� ������ �÷��Ͱ� �۵������� �޸𸮿��� �Ҹ���� �ش�.


	  2. ��������(local ����)
	    -- ���������� ���Ǿ����� ������ ���������� ������ {    }�������� ��밡���ϴ�
		-- ���������� Ư�� �޼ҵ峻������, ������(instructor)������ ����Ǿ����� ���̴�.
		-- ���������� {  }�� ����� �ڵ������� �Ҹ��Ѵ�.
	
	*/

public class MyVariable
{
	// ����� �ʱ�ȭ
	int a = 10; // = �� ���ٰ� �ƴ϶� �����Ѵٴ� ���̴�. =�� ���Կ����ڶ� �θ���.
	static int b = 20;
	
	// �⺻�� �ʱ�ȭ
	int no1;
	static int no2;
	
	String name1 = "�Ѽ���";
	static String name2 = "�μ���";
	
	String id;
	String pwd;
	String name;
	static String address;
	
	public static void main(String[] args) 
	{
		int c = 30;
		int no3 = 0;// ��������(local)�� �ݵ�� �ʱ�ȭ�� ���־�� �Ѵ�.
		MyVariable myobj = new MyVariable();
		
		// myobj �� Ŭ���� MyVariable �� ��ü������ �θ���.
		// myobj �� Ŭ���� MyVariable �� �ν��Ͻ�(instance)�� �θ���.
		// new MyVariable();�� ��ü(object)�����̶�� �ϰ� �ν��Ͻ�(instance)ȭ �Ѵ� ��� �Ѵ�.
		
		System.out.println("a : " + myobj.a);
		// "���ڿ�" + ������ ���� +�� ���ڿ� ������ ���Ѵ�.

		//System.out.println("b : " + b); //�����
		//System.out.println("b : " + myobj.b); //�����
		System.out.println("b : " + MyVariable.b); //����
		
		System.out.println("c : " + c);

		System.out.println("----------------------------");
		
		System.out.println("no1 : " + myobj.no1);
		System.out.println("no2 : " + MyVariable.no2);
		System.out.println("no3 : " + no3);

		System.out.println("----------------------------");
		
		System.out.println("nam1 : " + myobj.name1);
		System.out.println("name2 : " + MyVariable.name2);

		System.out.println("----------------------------");

		MyVariable member1 = new MyVariable();
		member1.id = "sonsm";
		member1.pwd = "qwer1234";
		member1.name = "�ռ���";
		MyVariable.address = "��⵵ �����ν�";
	
		MyVariable member2 = new MyVariable();
		member2.id = "Kimms";
		member2.pwd = "1q2w3e4r";
		member2.name = "��μ�";
		
		System.out.println("member1.id :" + member1.id);
		System.out.println("member1.pwd :" + member1.pwd);
		System.out.println("member1.name :" + member1.name);
		System.out.println("member1.address : " + member1.address);

		System.out.println("member2.id :" + member2.id);
		System.out.println("member2.pwd :" + member2.pwd);
		System.out.println("member2.name :" + member2.name);
		System.out.println("member1.address : " + member2.address);


	}


}
