package my.day13.sub;

import my.day13.Human;

// public class Woman extends Human, Parent {
 /*
   	자바에서는 상속받을 클래스는 1개만 가능하다. 다중상속 X
   	참고로 C++ 언어는 다중상속이 가능하다.
   	자바에서는 인터페이스(interface)에서는 다중구현이 가능하다.
  */
public class Woman extends Human {

	public String childbirthday; // 출산예정일
	
	public Woman() {
		//super(); 가생략되어있다.
	}
	
	public Woman(String childbirthday) {
		super();
		this.childbirthday = childbirthday;
	}

	public Woman(String name, float height, int weight, String childbirthday) {
		super(name, height, weight);
		this.childbirthday = childbirthday;
	}
	
	public void printChildbirthday() {
		System.out.println("출산예정일 : " + childbirthday);
	}
	
	public void printInfo() {
		
		System.out.println("▶1. 성명 : " + name);
		System.out.println("▶2. 신장 : " + height);
		System.out.println("▶3. 체중 : " + getWeight());
		System.out.println("▶4. 출산예정일 : " + childbirthday);
	}
	
	@Override // 재정의
	public void showInfo() {
		
		System.out.println("▶1. 성명 : " + name);
		System.out.println("▶2. 신장 : " + height);
		System.out.println("▶3. 체중 : " + getWeight());
		System.out.println("▶4. 출산예정일 : " + childbirthday);
	}
	
	// === 메소드의 오버라이딩(재정의)
		// 조건이 부모클래스에 존재하는 메소드이어야 한다.
		// 또한 부모클래스에 존재하던 메소드의 내용물을 뺸 나머지는 똑같아야 한다.
		// 단, 접근지정자(접근제한자)은 부모클래스의 것과 동일하든지 더커야한다.
		// 부모메소드의 접근지정자가 public 이면 자식클래스는 public 만가능
	
	@Override
	public String toString(){
		String result = "나는 여자입니다";
		
		
		return result;
	}
	
	@Override
	public void smile(int num) {
		System.out.println("여자가 " + num + "번 웃습니다");
		for(int i =0 ; i<num; i++) {
			System.out.print("호호호 ");
			
		}
		System.out.println("");
	}
}

