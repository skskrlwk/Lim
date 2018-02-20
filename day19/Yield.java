/*
	 ===== Thread.yield 메소드  =====
	   스레드의 우선순위가 동등한 다른 스레드에게 실행기회를 넘기는 것이다.       
*/

package my.day20.sub1;

public class Yield implements Runnable {

	private String id;
	private String passwd;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPasswd() {
		
		if(passwd != null) 
			return "***"+passwd.substring(3);
		else 
			return passwd;
		
	}

	public void setPasswd(String passwd) {
		
		if(passwd.length()<5) 
			System.out.println(">>> 암호는 5글자 이상이어야 합니다. 다시 입력하세요!!");
		else
			this.passwd = passwd;
		
	}

	
	private void showInfo() { 
		
		for(int i=0; i<5; i++) {
						
			if("guest".equals(id)) {
				System.out.println(">>>> 아이디가 guest 라서 다른 아이디 사용자의 정보를 먼저 출력하고 나중에 출력합니다. <<<<");
			}
			
			System.out.println("아이디 : " + id +", 암호: " + getPasswd()+"\n");

		}// end of for----------------------------
		
	}// end of shoInfo()--------------------------
		
	
	@Override
	public void run(){
		
		if("guest".equals(id)) {
			Thread.yield();  
			// id가 guest 이라면 현재 실행중인 스레드가 block 되고 
			// 우선순위가 동등한 다른 스레드에게 실행기회를 넘긴다.
			// yield() 메소드의 작동은 운영체제에 따라 UNIX 에서는 잘 되지만 
			// Windows 에서는 안될 수도 있다.
		}
		
		showInfo();
		
	}// end of run()---------------------	
	
}
