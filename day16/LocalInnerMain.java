
// *** Inner Local class(내부 지역 클래스) : 메소드안에서 생성되어진 클래스 ***

package my.day18;

public class LocalInnerMain {
	
	String str = "대한민국"; // 인스턴스 멤버변수
	
	
	public void test() { // 인스턴스 메소드
		
		int cnt = 50; // 지역변수
	//	int num = 100; // 지역변수
		final int num = 100; // 지역상수변수
		
		System.out.println("str => " + str);
		System.out.println("num => " + num);
		
		class LocalInner{ // local inner class (named local class)
			
			String lstr = "korea";
			
			public void innerLocalmethod() {
				System.out.println("str => " + str );
				System.out.println("lstr => " + lstr);
			//	num = 200;	//내부클래스에서 클래스 밖 메소드에서 선언되어진 변수 num을 사용할수 없다.
				
				System.out.println("num => " + num);
				int no = num*2;
				System.out.println("no => " +  no);
				//내부지역클래스에서 클래스 밖 메소드에서 선언되어진 변수 num을 사용하려고 한다
			}
		}//end of class LocalInner////////////////////////////////
		// 네비게이터에 있는 클래스 이름 LocalInnerMain$1LocalInner.class
		// 외부클래스명+$+숫자+로컬클래스명.class로 생성된다.
		// 여기서 숫자는 인덱스를 의미하는데, 서로 다른 메소드 내에서 동일한 명칭의 로컬클래스가 존재할 수 있기 때문에
		// 중간에 인덱스 역할의 숫자를 붙여 구분되도록 한다.
		
		
		LocalInner local = new LocalInner();
		local.innerLocalmethod();
		
	}// end of void test()---------------------------------
	
	void exam() {
		int cnt = 70;
		
		class LocalInner {
			String lstr = "seoul";
			
			public void info() {
				System.out.println("str = " + lstr);
			}
			
		}// end of class LocalInner//////////////////////// 
		LocalInner local = new LocalInner();
		local.info();
		// local.innerLocalmethode();는 없다.
		/*
		 	지역클래스의 객체	생성은 자기(==지역클래스)가 속한 메소드 안에서만 객체생성이 가능하다.
		 	다른 메소드내에서는 객체생성이 불가하다.
		 	지역클래스가 사용되어지는 범위는 local 변수의 사용범위와 동일하다.
		 	해당 블럭을 벗어나서는 사용이 불가하므로 지역클래스는 자기가 속상한 메소드 안에서만 객체생성을 할 수 있다.
		 
		 */
		
	}// end of void exam()------------------------------------------
	
	public static void main(String[] args[]) {
		
		LocalInnerMain localtest = new LocalInnerMain();
		localtest.test();
		
		System.out.println("\n============================\n");
		localtest.exam();
		
	}

}
