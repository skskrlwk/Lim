package test.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class Test3Controller extends AbstractController {
	
	// 생성자
	public Test3Controller() {
		System.out.println("==> test.controller.Test3Controller 클래스의 객체가 생성되었습니다.");
	}

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res)
		throws Exception {
		
		req.setAttribute("result", "Test3Controller 에서 넘겨준 값은<span style='color: red;'>\"훈민정음 창시자\"</span> 입니다.");
		req.setAttribute("name", "세종대왕");
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/test/test3.jsp");
		/*
		  	확장자가 .java 인 파일과 .xml 인 파일에서
		    view 단 페이지의 경로를 나타낼때 맨앞의 / 는 컨텍스트명 이다.
		         즉, "/test/test3.jsp" 은 실제 "/MyMVC/WEB-INF/test/test3.jsp" 이다.
		 */
		
	};

}
