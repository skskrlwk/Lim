package test.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class Test4Controller extends AbstractController {
	
	// 생성자
	public Test4Controller() {
		System.out.println("==> test.controller.Test3Controller 클래스의 객체가 생성되었습니다.");
	}

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res)
		throws Exception {
		
		req.setAttribute("result", "Test4Controller 에서 넘겨준 값은<span style='color: orange;'>\"독립운동가\"</span> 입니다.");
		req.setAttribute("name", "안중근");
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/test/test4.jsp");
		
	};

}
