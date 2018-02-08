package my.day13;

public class Parent {

	String name;
	
	public Parent() {
		System.out.println("Parent 클래스의 기본생성자 호출함.");
		name = "부모님";
	}
	
	public Parent(String name) {
		System.out.println("Parent 클래스의 파리머터 생성자 호출");
		this.name = name;
	}
	
	public static void main(String[] args) {
	
		Parent pt1 = new Parent();
		System.out.println("pt1.name = " + pt1.name);
		System.out.println("\n\n");
		Parent pt2 = new Parent("이순신");
		System.out.println("pt2.name = " + pt2.name);
		
		/*
		   Parent 클래스의 기본생성자 호출함.
		   pt1.name = 부모님
		   Parent 클래스의 파리머터 생성자 호출
		   pt2.name = 이순신
		*/

	}

}
