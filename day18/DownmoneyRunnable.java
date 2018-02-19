package my.day20.sub3;

public class DownmoneyRunnable implements Runnable {

	private BankbookSync bankbook;
	private long downmoney;
	
	
	public BankbookSync getBankbook() {
		return bankbook;
	}

	public void setBankbook(BankbookSync bankbook) {
		this.bankbook = bankbook;
	}

	public long getDownmoney() {
		return downmoney;
	}

	public void setDownmoney(long downmoney) {
		this.downmoney = downmoney;
	}


	@Override
	public void run() {
		
		try {
			Thread.sleep(500); // 0.5초 동안만 스레드가 block 하도록 한다
			
			bankbook.withdraw(downmoney);
			// 특정 계좌에 돈을 출금한다.
		} catch (InterruptedException e) {
			e.printStackTrace();
		} 
		
		
	}

}
