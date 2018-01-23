	/*
	  
	  === 변수의 종류 ===
	  
	  1. 맴버변수(member 변수) -->
	     1.1 클래스변수(static변수)
		 1.2 인스턴스변수(instance 변수 == non static 변수)
	     -- 맴버변수가 사용되어지는 범위는 해당 클래스(지금은 MyVariable)내에서 어디서나 사용가능하다.
		 -- 맴버변수는 선언되어지는 위치는 일반적으로 해당 클래스명 바로 아래에 선언된다. 
		 -- 변수 선언후 값을 부여하지 않더라도(== 변수의 초기화) 하지 않더라도 자동적으로
		    JVM(Java Virtual Machine)이 알아서 기본값을 부여해준다.
			정수형 (byte, short, int, long)타입은 기본값인 0 으로 초기화 되고,
			실수형 (float, double)타입은 기본값이 0.0 으로 초기화 되고,
			char 타입은 기본값인 ' '(공백)으로 초기화 되고,
			Object 타입은 기본값인 null 로 초기화 된다.

		-- 클래스변수(static 변수)에 접근을 하기 위해서는
		   객체(Object)를 생성하지 않고도 바로 클래스명. 클래스변수로 접근한다.
		   클래스변수(static 변수)는 해당 클래스로 생성되어진 객체들이 공유해서 사용한다.

		-- 인스턴스변수(non static 변수)에 접근을 하기 위해서는 반드시 객체를 생성하지 않고도 바로 클래스명, 클래스변수로 접근한다.
           인스턴스변수는 해당 객체에서만 사용하는 것이다.

		-- 클래스변수(static 변수)는 클래스가 실행되어질 떄 생성되어지고,
		   인스턴스변수는 객체가 생성되어질때 생성된다.
		-- 해당 프로그램이 종료하면 클래스변수와 인스턴스변수는 더이상 쓸모없는 쓰레기(가비지)가 되므로 JVM 에서 가비지 컬렉터가 작동적으로 메모리에서 소멸시켜 준다.


	  2. 지역변수(local 변수)
	    -- 지역변수가 사용되어지는 범위는 지역변수가 생성된 {    }내에서만 사용가능하다
		-- 지역변수는 특성 메소드내에서나, 생성자(instructor)내에서 선언되어지는 것이다.
		-- 지역변수는 {  }을 벗어나면 자동적으로 소멸한다.
	
	*/

public class MyVariable
{
	// 명시적 초기화
	int a = 10; // = 은 같다가 아니라 대입한다는 뜻이다. =을 대입연산자라 부른다.
	static int b = 20;
	
	// 기본적 초기화
	int no1;
	static int no2;
	
	String name1 = "한석규";
	static String name2 = "두석규";
	
	String id;
	String pwd;
	String name;
	static String address;
	
	public static void main(String[] args) 
	{
		int c = 30;
		int no3 = 0;// 지역변수(local)는 반드시 초기화를 해주어야 한다.
		MyVariable myobj = new MyVariable();
		
		// myobj 을 클래스 MyVariable 의 객체변수라 부른다.
		// myobj 을 클래스 MyVariable 의 인스턴스(instance)라 부른다.
		// new MyVariable();를 객체(object)생성이라고 하고 인스턴스(instance)화 한다 라고도 한다.
		
		System.out.println("a : " + myobj.a);
		// "문자열" + 변수명 에서 +는 문자열 결합을 뜻한다.

		//System.out.println("b : " + b); //비권장
		//System.out.println("b : " + myobj.b); //비권장
		System.out.println("b : " + MyVariable.b); //권장
		
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
		member1.name = "손성민";
		MyVariable.address = "경기도 의정부시";
	
		MyVariable member2 = new MyVariable();
		member2.id = "Kimms";
		member2.pwd = "1q2w3e4r";
		member2.name = "김민석";
		
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
