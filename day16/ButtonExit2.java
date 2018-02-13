package my.day18;

public class ButtonExit2 {
	
	@Override
	public String toString() {
		return "프로그램 종료버튼";
	}
	
	public void exitClick() {
		
		InterButtonClick inter = new InterButtonClick() {
			
			@Override
			public void click() {
				System.out.println("프로그램을 종료합니다");
				
			}
		};
		inter.click();
	}

}
