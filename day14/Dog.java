package my.day15;

public class Dog extends AbstractAnimal{

	private int weight;
	
	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	@Override
	public void crySound() {
		System.out.println("강아지는 멍멍 짖습니다.");
		
	}

	@Override
	public void sleep() {
		System.out.println("강아지는 개집에서 잠을 잡니다.");
		
	}

	@Override
	public String run() {
		
		return "강아지는 네발로 달려갑니다.";
	}

	@Override
	public String grade(String level) {
		
		String grade = "";
		switch (level) {
			case "A":
				grade = "인명구조견";
				break;
			case "B":
				grade = "반려견";
				break;
			case "C":
				grade = "일반견";
				break;
			case "D":
				grade = "치료요함";
				break;
	
			default:
				break;
		}
		
		return grade;
	}

	@Override
	public void showInfo() {
		 
		System.out.println(">>>> 강아지 정보 <<<<");
		System.out.println("▷이름 : " + super.name);
		System.out.println("▷출생일자 : " + super.birthday);
		System.out.println("▷현재나이 : " + super.getAge());
		System.out.println("▷등급 : " + this.grade(super.getLevel()));
		System.out.println("▷무게 : " + weight + "kg");
	}

}
