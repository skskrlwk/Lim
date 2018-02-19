package my.day20.sub3;


public class BankbookSyncMain {

	public static void main(String[] args) {
		
		BankbookSync mybankbook = new BankbookSync();
		mybankbook.setAccount("987-65-4321");
		mybankbook.setBalance(10000);
		
		// 입금 스레드 구현 객체 10개 생성
		UpmoneyRunnable[] uprunArr = new UpmoneyRunnable[10];
		Thread[] thrupArr = new Thread[10];
		
		for(int i=0; i<uprunArr.length; i++) {
			UpmoneyRunnable uprunnable = new UpmoneyRunnable();
			uprunnable.setBankbook(mybankbook);
			// 여러 입금 스레드 구현 객체들이 특정 bankbook 데이터 1개를 같이 사용함.
			
			uprunnable.setUpmoney(1000);
			// 입금액 1000
			
			uprunArr[i] = uprunnable;
			thrupArr[i] = new Thread(uprunArr[i]);
		} // end of for--------------------------------
		
		// 출금 스레드 구현 객체 10개 생성 
		DownmoneyRunnable[] downrunArr = new DownmoneyRunnable[10];
		Thread[] thrdownArr = new Thread[10];
		
		for(int i=0; i<downrunArr.length; i++) {
			
			DownmoneyRunnable downrunnable = new DownmoneyRunnable();
			downrunnable.setBankbook(mybankbook);
			// 여러 출금 스레드 구현 객체들이 특정 bankbook 데이터 1개를 같이 사용함.
			
			downrunnable.setDownmoney(1000);
			// 출금액 1000
			
			downrunArr[i] = downrunnable;
			thrdownArr[i] = new Thread(downrunArr[i]);
					
		} // end of for--------------------------------
		
		for(int i=0; i<thrupArr.length; i++) {
			thrupArr[i].start();
			thrdownArr[i].start();
			//10개의 입금 스레드를 실행함
		} // end of for-------------------------------------
		/*
		  	이때 수행되는 스레드의 순서는 JVM이 결정지어 주므로 어떤 스레드가 먼저 수행되는지는 개발자는 알수가 없다.
		  	만약 각각 해당 스레드의 run 메소드에서 수행되어지는 데이터가 동일한 객체를 공유하는 내용이라면
		  	 순서를 지켜주기위해 run 메소드에서 수행되어지는 메소드에 동기화(synchronized) 처리를 반드시 해주어야 한다.
 		 */

	}// end of main()-------------------------------------------

}
