public class MyConstructorTest2  
{
	String id;
	String pwd;
	String name;
	int age;
// --기본생성자	
// 기본생성자는 파라미터가 있는 생성자가 없을 경우 자동적으로 등록되어지지만
// 파라미터가 있는 생성자가 있을 경우 자동적으로 등록X
//-- 파라미터 생성자가 있는경우에는 반드시 기본생성자를 생성해주어야 한다.

	public MyConstructorTest2(){
	}


// --파라미터가 있는 생성자
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
		test.name = "이순신";
		test.age = 25;

		System.out.println("test.id = " + tes.id);
		System.out.println("test.pwd = " + test.pwd);
		System.out.println("test.name = " + test.name);
		System.out.println("test.age = " + test.age);
		System.out.println("");

		//-- 파라미터 생성자가 있는경우에는 반드시 기본생성자를 생성해주어야 한다.
		MyConstructorTest2 test2 = nd = " + test2.pwd);
		System.out.println("test2.name = " + test2.name);t
		System.out.println("test2.age = " + test2.age);
	    System.out.println("");ew MyConstructorTest2("youjs","qaws00","유재석", 45);
		System.out.println("test2.id = " + test2.id);
		System.out.println("test2.pw

	}
}


