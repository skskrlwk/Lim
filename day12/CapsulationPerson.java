/*
  	==== *** 캡슐화(은닉화) *** ====
  	
  	접근지정자		자기자신 클래스내부	동일패키지	     하위(자식)클래스		그 외의 영역
  	----------------------------------------------------------------
  	public			 O			   O		    O				O
  	protected		 O			   O			O				X
  	default			 O			   O  			X				X
  	private			 O			   X			X				X
 */

package my.day11;

public class CapsulationPerson {

	private String name;
	private int age;
	private double height;
	
	public void setName(String name) {
		this.name = name;
	}
	public void setAge(int age) {
		if(age <= 0) {
			System.out.println(">> 나이는 0보다 커야합니다.");
		}else {
			this.age = age;
		}
		
	}
	
	public int getAge() {
		return age;
	}
	
	public void setHeight(double height) {
		if(height <= 0) {
			System.out.println(">> 신장은 0보다 커야합니다");
		}else {
			this.height = height;
		}
		
	}
	public double getHeight() {
		return height;
	}
	
	public void showInfoPerson() {
		System.out.println("1. 성명 : " + name);
		System.out.println("2. 나이 : " + age + "세");
		System.out.println("3. 신장 : " + height + "cm");
	}
	
}
