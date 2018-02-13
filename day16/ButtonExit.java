package my.day18;

public class ButtonExit {
	
	@Override
	public String toString() {
		return "프로그램 종료버튼";
	}
	
	public void exitClick() {
		ButtonExitAction action = new ButtonExitAction();
		action.click();
		
	}

}
