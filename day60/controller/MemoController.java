package memo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class MemoController extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		// super.setRedirect(false);
		super.setViewPage("/WEB-INF/memo/memoForm.jsp");
		
		
	}

}
