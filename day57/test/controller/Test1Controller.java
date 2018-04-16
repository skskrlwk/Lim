package test.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class Test1Controller extends AbstractController {

	// 생성자
	public Test1Controller() {
		System.out.println("==> test.controller.Test1Controller 클래스의 객체가 생성되었습니다.");
	}

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res)
		throws Exception {
		
		req.setAttribute("result", "Test1Controller 에서 넘겨준 값은<span style='color: red;'>\"임진왜란의 구국영웅\"</span> 입니다.");
		req.setAttribute("name", "이순신");
		
		super.setRedirect(false);
		super.setViewPage("/test/test1.jsp");
		/*
		  	확장자가 .java 인 파일과 .xml 인 파일에서
		    view 단 페이지의 경로를 나타낼때 맨앞의 / 는 컨텍스트명 이다.
		         즉, "/test/test1.jsp" 은 실제 "/MyMVC/test/test1.jsp" 이다.
		 */
	};
	
}
