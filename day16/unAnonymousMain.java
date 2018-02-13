package my.day18;

public class unAnonymousMain {

	public static void main(String[] args) {
		
		ButtonMusic btnmusic = new ButtonMusic();
		System.out.println(btnmusic + "을 클릭하면....");
		btnmusic.musicClick();
		
		System.out.println("\n");
		
		ButtonExit btnexit = new ButtonExit();
		System.out.println(btnexit + "을 클릭하면...");
		btnexit.exitClick();

	}

}
