package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {

	// === 추상메소드선언 ===
	/*
	  	1. 인터페이스에서 메소드 선언시 자동으로
	  	   public abstract 지정자가 붙는다.
	  	
	  	2. 인터페이스에서 변수 선언시 자동적으로
	  	   public static final 이 붙으므로 상수변수가 된다.
	 */
	
	void execute(HttpServletRequest req, HttpServletResponse res) throws Exception;
	
	
	
}
