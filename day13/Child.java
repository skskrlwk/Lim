package my.day13;

public class Child extends Parent {

	int age;
	
	public Child() {
		//super(); => 부모의 기본생성자가 생략되어져 있다.
		System.out.println("Child 클래스의 기본생성자 호출");
	}
	
	public Child(int age) {
		System.out.println("Child 클래스 파라미터 int age 인 생성자 호출함.");
		this.age = age;
		
	}
	
	public Child(String name, int age) {
		//생성자내에서 다른 생성자[ super() 또는 this() ]를 호출할 경우 무조건 첫번째줄에 선언해줘야 한다.
		super(name);// 자식클래스의 생성자내에 부모클래스의 생성자를 명시적으로 호출한 것.
		System.out.println("Child 클래스 파라미터 String name, int age인 생성자를 호출함");
		this.age = age;
	}

	public static void main(String[] args) {
		
		Child child1 = new Child();
		System.out.println("child1.name = " + child1.name); 
		System.out.println("child1.age = " + child1.age); 
		/*
		Parent 클래스의 기본생성자 호출함.
		Child 클래스의 기본생성자 호출
		child1.name = 부모님
		*/
		System.out.println("\n");
		Child child2 = new Child(26);
		System.out.println("child2.name = " + child2.name); 
		System.out.println("child2.age = " + child2.age); 
		/*
		Parent 클래스의 기본생성자 호출함.
		Child 클래스 파라미터 int age 인 생성자 호출함.
		child2.name = 부모님
		child2.age = 26
		*/
		System.out.println("\n");
		Child child3 = new Child("엄정화", 45);
		System.out.println("child3.name = " + child3.name); 
		System.out.println("child3.age = " + child3.age); 
		
		/*
		Parent 클래스의 파리머터 생성자 호출
		Child 클래스 파라미터 String name, int age인 생성자를 호출함
		child3.name = 엄정화
		child3.age = 45
 		*/
	}

}
