package my.day18;

public class AnonymousMain {

	public static void main(String[] args) {
		
		ButtonMusic2 btnmusic = new ButtonMusic2();
		System.out.println(btnmusic + "을 클릭하면....");
		btnmusic.musicClick();
		
		ButtonExit2 btnexit = new ButtonExit2();
		System.out.println(btnexit + "을 클릭하면 .....");
		btnexit.exitClick();

	}

}
