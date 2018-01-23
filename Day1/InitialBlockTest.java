public class InitialBlockTest
{

	String id ;
	String pwd;
	String name;

	/* -- 클래스 초기화 블럭 --
		  클래스 초기화 블럭은 해당 클래스가 메모리에 처음 로딩되어질때 딱 1번만 실행시켜주는 것이다.
	
	*/
	static {System.out.println("!! 클래스 InitialBlockTest 초기화 블럭 실행함!!");}//클래스 초기화 블럭



	/* ---인스턴스 초기화 블럭---
	      모든 생성자에서 공통적으로 수행되어져 할 경우가 있는경우 라면 각각의 생성자마다 중복되게 만들지(코딩)말고
		  인스턴스 초기화 블럭에 1번만 선언해주면 된다.
		  생성자보다 인스턴스 초기화 블럭이 먼저 수행된다는 점.
		  그리고 인스턴스 초기화 블럭은 객체가 생성되어질때마다 실행된다는 것.
	*/
	{ System.out.println("클래스 InitialBlockTest의 객체생성 완료!!");  }// 인스턴스 초기화 블럭


	public InitialBlockTest(){
		//System.out.println("클래스 InitialBlockTest의 객체생성 완료");
		System.out.println("기본생성자로 생성함");
	}

	public InitialBlockTest(String id, String pwd, String name){
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		//System.out.println("클래스 InitialBlockTest의 객체생성 완료");
		System.out.println("파라미터가 있는 생성자로 생성함");
	}

	public static void main(String[] args) 
	{
		
		InitialBlockTest test = new InitialBlockTest();
		test.id = "leess";
		test.pwd = "qwe123";
		test.name = "이순신";
		
		System.out.println("");

		InitialBlockTest test2 = new InitialBlockTest("skskrlwk","1l2l3l","나기자");
		
	}
}
