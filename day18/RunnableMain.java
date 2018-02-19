package my.day20;

public class RunnableMain {

	public static void main(String[] args) {
		
		RunnableWho runwho = new RunnableWho();
		RunnableMyName runmyname = new RunnableMyName();
		
		Thread thrwho = new Thread(runwho);
		Thread thrmyname = new Thread(runmyname);

		thrwho.start();
		thrmyname.start();
		
		
	}

}
