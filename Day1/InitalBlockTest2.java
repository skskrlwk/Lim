//인스턴스 변수의 초기화 순서
//JVM 기본값 --> 명시적초기화 --> 인스턴스 초기화 블럭 --> 파라미터가 있는 생성자 

public class InitalBlockTest2
{
	String id = "leess";
	String name = "이순신";
	int age = 27; 
	{ id = "youjs";  name = "유재석";  age = 30; } //인스턴스 초기화 블럭


	public InitalBlockTest2(){}; //기본생성자
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
	
		InitalBlockTest2 test2 = new InitalBlockTest2("iyou","아이유",27);
		System.out.println("id : " + test2.id + ", name : " + test2.name + ", age : " + test2.age);
	}
}
