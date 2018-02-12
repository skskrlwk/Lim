package my.day17;

public class MethodThrows {
	
	String hakbun;
	String name;
	String hakjum;
	
	public String getHakbun() {
		return hakbun;
	}
	public void setHakbun(String hakbun) {
		this.hakbun = hakbun;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHakjum() {
		return hakjum;
	}
	public void setHakjum(String point) throws NumberFormatException {
		
	 	int jumsu = Integer.parseInt(point);
	 	
	 	switch (jumsu) {
			case 10:
			case 9:
				this.hakjum = "A";
				break;
			case 8:
				this.hakjum = "B";
				break;
			case 7:
				this.hakjum = "C";
				break;
			case 6:
				this.hakjum = "D";
				break;
	
			default:
				this.hakbun = "F";
				break;
		}
	}

}
