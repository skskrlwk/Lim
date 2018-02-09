package my.day15;

public class Duck extends AbstractAnimal {
	
	int price;
	
	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public void crySound() {
		System.out.println("오리는 꽥꽥 소리를 냅니다.");
		
	}

	@Override
	public void sleep() {
		System.out.println("오리는 물가에서 잠을 잡니다.");
		
	}

	@Override
	public String run() {
		
		return "오리는 두발로 걷기도하고 헤엄치기도 합니다";
	}

	@Override
	public String grade(String level) {
		
		String grade = "";
		switch (level) {
			case "A":
				grade = "특1등급 오리고기";
				break;
			case "B":
				grade = "1등급 오리고기";
				break;
			case "C":
				grade = "백숙용 오리고기";
				break;
			case "D":
				grade = "구이용 오리고기";
				break;
	
			default:
				break;
		}
		
		return grade;
	}

	@Override
	public void showInfo() {
		System.out.println(">>>> 오리 정보 <<<<");
		System.out.println("▷이름 : " + super.name);
		System.out.println("▷출생일자 : " + super.birthday);
		System.out.println("▷현재나이 :" + super.getAge() );
		System.out.println("▷등급 : " + this.grade(super.getLevel()));
		System.out.println("▷무게 : " + price+ "kg");
	}
		
		
}
	
	


