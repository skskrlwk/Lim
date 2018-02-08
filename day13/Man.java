package my.day13.sub;

import my.day13.Human;

public class Man extends Human{
	
	public String goarmyday; // 입대일
	
	public void printGoarmyday() {
		System.out.println("입대일자 : " + goarmyday);
	}
	
	public Man() {}
	
	public Man(String name, float height, int weight, String goarmyday) {
		super.name = name;
		super.height = height;
		super.setWeight(weight);
		this.goarmyday = goarmyday;
		
	}



	// === 메소드의 오버라이딩(재정의)
	// 조건이 부모클래스에 존재하는 메소드이어야 한다.
	// 또한 부모클래스에 존재하던 메소드의 내용물을 뺸 나머지는 똑같아야 한다.
	// 단, 접근지정자(접근제한자)은 부모클래스의 것과 동일하든지 더커야한다.
	// 부모메소드의 접근지정자가 public 이면 자식클래스는 public 만가능
	
	@Override // 재정의
	public void showInfo() {
		
		System.out.println("▶1. 성명 : " + name);
		System.out.println("▶2. 신장 : " + height);
		System.out.println("▶3. 체중 : " + getWeight());
		System.out.println("▶4. 입대일 : " + goarmyday);
	}

	
	@Override
	public String toString(){
		String result = ">> 1.성명 : " + name + "\n" +
						">> 2.신장 : " + height + "cm\n" +
						">> 3.체중 : " + getWeight() + "kg\n" +
						">> 4.입대일자 : " + goarmyday + "\n";
				
				
		return result;
	}
	
	@Override
	public void smile(int num) {
		System.out.println("남자가 " + num + "번 웃습니다");
		for(int i =0 ; i<num; i++) {
			System.out.print("하하하 ");
			
		}
		System.out.println("");
	}
	

}
