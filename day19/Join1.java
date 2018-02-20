package my.day20.sub1;

public class Join1 implements Runnable{
	
	private String id;
	private String passwd;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPasswd() {
		if(passwd != null) {
			return "***"+passwd.substring(3);
		}else {
			return passwd;
		}
		
	}
	
	private void showInfo() {
		System.out.println("======= join1 =========");
		System.out.println("▷ 아이디 : " + id + ", 암호 : " + passwd);
		System.out.println("");
	}

	public void setPasswd(String passwd) {
		if(passwd.length() < 5)
			System.out.println("암호는 5글자 이상이어야 합니다. 다시 입력하세요!!");
		else
			this.passwd = passwd;
	}

	@Override
	public void run() {
		showInfo();
		
	}

}
