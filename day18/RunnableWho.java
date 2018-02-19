package my.day20;

public class RunnableWho extends Parent implements Runnable {

	@Override
	public void run() {
		
		while(true) {
			System.out.println("당신은 누구세요??");
			super.smile();
		}
		
	}// end of void run()----------------------------------------

	
}
