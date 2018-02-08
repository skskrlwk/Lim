
/*
  	*** 상속(Inheritance)에 대해서 알아본다 ***
  	상속은 어떤 클래스들을 생성할때 추상화되어진 결과물(맴버변수, 메소드)들이
  	교집합이 있다면, 이것들만 빼내서 새로운 클래스(교집합, 부모클래스)를 만들어서 관리하는 것이 유지보수 측면에서 좋다.
 
 */




package my.day13;

public class Human {
	
	protected String name;
	protected float height;
	private int weight;
	
	public Human() {
		System.out.println(">>> 휴먼의 기본생성자 호출");
	}
	
	public Human(String name, float height, int weight) {
		
		this.name = name;
		this.height = height;
		this.weight = weight;
	}



	public void setWeight(int weight) {
		if(weight > 0)
			this.weight = weight;
	}
	
	public int getWeight() {
		return weight;
	}
	
	public void showInfo() {
		System.out.println("1.성명 : "+name+", 2.신장 : " + height + ", 3. 몸무게 : " + weight);
	}
	
	public void smile(int num) {
		System.out.println("사람이 " + num + "번 웃습니다");
	}

}
