package my.day20.sub1;

public class Join3 implements Runnable {

	private String tel;
	private String addr;
	
	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	private void showInfo() {
		System.out.println("==== Join3 =====");
		System.out.println("▷ 전화번호 : " + tel + ", 주소 : " + addr);
		System.out.println("");
		
	}

	@Override
	public void run() {
		
		showInfo();
	}

}
