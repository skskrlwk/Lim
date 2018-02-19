package my.day20;

public class RunnableMyName extends Parent implements Runnable {

	@Override
	public void run() {
		
		while(true) {
			System.out.println("저는 Java입니다.");
			super.goodmorning();
		}
		
	}

}
