package my.day17;

public class Member {
	
	private String id; 		// "admin" 으로 시작하는 id는 사용불가!!!
	private String passwd; 	// passwd 의 길이는 5글자 미만이면 사용불가!!!
	private String name;
	private String addr;
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) throws UserExceptionIDFail {
		
	    if(id == null)
	    	throw new UserExceptionIDFail();
	    	// ---> 오류메세지가 "ID"명에 NULL은 불가합니다.
	    else if(id != null && id.startsWith("admin"))
	    	// 문자열 id 값이 admin 으로 시작하면 
	    	throw new UserExceptionIDFail("ID명은 admin 으로 시작할 수 없습니다.다른 것으로 하세요");
	    else
	    	this.id = id;
	    		
	}
	
	public String getPasswd() {
		return passwd;
	}
	
	public void setPasswd(String passwd) throws UserExceptionPasswdFail {
		
		if(passwd == null ||(passwd != null && passwd.length() < 5))
			throw new UserExceptionPasswdFail();
		else 
			this.passwd = passwd;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getAddr() {
		return addr;
	}
	
	public void setAddr(String addr) {
		this.addr = addr;
	}

}
