/*

  === 생성자(constructor) 구성하기

  * 생성자(constructor)란?
  -- 객체를 생성(클래스명 객체변수명 = new 클래스명();)할때 마다
     자동적으로 호출되어지는 어떠한 행위를 기술한것 이라고 생각하면 된다.
  
  * 생성자의 지켜야할 규칙
    1. 생성자의 이름은 반드시 클래스명과 같아야 한다.
	2. 생성자는 반환타입(리턴타입)을 기술하면 안된다.

	*생성자의 주된 역할은 일반적으로 맴버변수(인스턴스변수, 클래스변수(static 변수))의 
     초기화를 하고자 하는데 있다.

*/


public class MyConstructorTest
{
	String name;
	int age;
	String addr;

	public MyConstructorTest(){
		
		name = "이순신";
		age = 25;
		addr = "서울시 종로구";
		System.out.println("MyConstructorTest 객체 생성완료");
	}
	

	
	 // 파리머타가 있는 생성자
	public MyConstructorTest(String name, int age, String addr){
		//멤버변수명과 지역변수명이 동일할 경우 지역변수명이 우선한다. name = name
		//동일할 경우 구분을 짓기 위한 방법은 this.맴버변수명 으로 구분한다.
		this.name = name;
		this.age = age;
		this.addr = addr;
		System.out.println("파라미터가 있는 MyConstructorTest : ");
	}
	
	public static void main(String[] args) 
	{
	
	 
	 System.out.println("여기는 첫줄 입니다.");
	 
	 MyConstructorTest test = new MyConstructorTest(); 
	 System.out.println("test.name : " + test.name);
	 System.out.println("test.age : " + test.age);
	 System.out.println("test.addr : " + test.addr);

	 MyConstructorTest test2 = new MyConstructorTest(); 
	 System.out.println("test2.name : " + test2.name);
	 System.out.println("test2.age : " + test2.age);
	 System.out.println("test2.addr : " + test2.addr);

	 System.out.println("");

	 MyConstructorTest test3 = new MyConstructorTest("유관순", 23, "인천광역시 부평동");
	 System.out.println("test3.name : " + test3.name);
	 System.out.println("test3.age : " + test3.age);
	 System.out.println("test3.addr : " + test3.addr);

	 MyConstructorTest test4 = new MyConstructorTest("안준근", 30, "서울시 강북구");
	 System.out.println("test4.name : " + test4.name);
	 System.out.println("test4.age : " + test4.age);
	 System.out.println("test4.addr : " + test4.addr);



	 
	 test.myPrint();
	 test.myPrint();
	
	}

	public void myPrint(){
		System.out.println("안녕하세요??");
	}

}
