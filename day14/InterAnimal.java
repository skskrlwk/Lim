/*
  	=== 인터페이스(Interface)란 ? ===
  	모든 메소드는 추상메소드(미완성메소드)로만 되어있고,
  	모든 멤버변수(속성)들은 상수변수로 (final 변수)로 되어있는 것을 말한다.
 	즉 맴버변수는 상수값이고, 메소드는 추상메소드로 구성된 것이다.
 	
 	클래스의 상속은 다중상속이 불가하지만 인터페이스는 다중 구현은 가능하다.
 */

package my.day15;

public interface InterAnimal {

	float pi = 3.14159F; //인터페이스에서 선언되어진 변수는 항상 public final static 이 생략된 변수이다.(public final static float pi =3.14159F)
	
	void crySound(); // 미완성 메소드
	// 인터페이스에서 메소드를 선언할떄는 접근제한자를 생략한다.
	// 접근제한자는 자동적으로  public abstract 이 붙어져 있기 떄문이다.(public abstract void crySound(); 와 같다)
	
	void sleep();
	
	int getAge();
	
	String run();
	
	String grade(String level);
	
	void showInfo();
	
}
