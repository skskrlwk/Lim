package my.day15;

public class Cat extends AbstractAnimal {

	private String color;
		
	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	@Override
	public void crySound() {
		System.out.println("고양이는 야옹야옹 웁니다.");
		
	}

	@Override
	public void sleep() {
		System.out.println("고양이는 쇼파위에서 잠을 잡니다");
		
	}

	@Override
	public String run() {
		
		return "고양이는 네발로 걷습니다.";
	}

	@Override
	public String grade(String level) {
		
		String grade = "";
		switch (level) {
			case "A":
				grade = "특품종 고양이";
				break;
			case "B":
				grade = "우수품종 고양이";
				break;
			case "C":
				grade = "집고양이";
				break;
			case "D":
				grade = "들고양이";
				break;
	
			default:
				break;
		}
		return grade;
		
	}

	@Override
	public void showInfo() {
		
		
	}
}
