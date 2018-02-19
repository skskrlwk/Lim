package my.day20.sub3;

public class BankbookSync {
	
	private String account; // 통장계좌번호
	private long balance;
	
	
	public String getAccount() {
		return account;
	}
	
	public void setAccount(String account) {
		this.account = account;
	}
	
	public long getBalance() {
		return balance;
	}
	
	public void setBalance(long balance) {
		this.balance = balance;
	}
	
	// === 동기화 입금 메소드.
	public synchronized void deposit(long money) {
		balance += money;
		System.out.println("계좌번호 : " + account + " 입금액 => " + money + " 입금후 잔액 => " + balance);
	}
	
	// === 동기화 출금 메소드
	public void withdraw(long money) {
	
		synchronized (this) {
			if(balance - money < 0) {
				System.out.println("계좌번호 : " + account + "잔액부족 !!! 현재금액 = >" + balance + ", 출금요청금액  =>" + money );
				return;
				
			}
			balance -= money;
			System.out.println("계좌번호 : " + account + " 출금액 => " + money + " 출금후 잔액 => " + balance);
			
		}
	
	}

}
