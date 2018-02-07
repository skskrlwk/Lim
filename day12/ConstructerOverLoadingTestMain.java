package my.day12;

public class ConstructerOverLoadingTestMain {

	public static void main(String[] args) {
		
		ConstructerOverLoadingTest obj1 = new ConstructerOverLoadingTest("leess", "qwer1234$", "이순신", "1991-03-05");
		ConstructerOverLoadingTest obj2 = new ConstructerOverLoadingTest("eom", "qwer1234$", "엄정화", "1960-05-11");
		ConstructerOverLoadingTest obj3 = new ConstructerOverLoadingTest("youjs", "qwer1234$", "유재석", "1979-02-27");
		
		System.out.println(obj1.getName() + "님의 포인트는 " + obj1.getPoint());
		System.out.println(obj2.getName() + "님의 포인트는 " + obj2.getPoint());
		System.out.println(obj3.getName() + "님의 포인트는 " + obj3.getPoint());
	
		System.out.println("\n===================================\n");
		
		ConstructerOverLoadingTest obj4 = new ConstructerOverLoadingTest("kanghd", "qwer1234$", "강호동");
	}

}
