package memo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class MemoWriteEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String method = req.getMethod();
	
		if(!"post".equalsIgnoreCase(method)) {
			// post방식으로 들어온것이 아니라면
			req.setAttribute("msg", "잘못된 경로로 들어왔습니다.");
			req.setAttribute("loc", "javascript:history.back();");
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			
			return;
			
		} else {
			// post방식으로 들어온것 이라면
			
			// 1./WEB-INF/memo/memo.jsp 에서
			//   사용자가 입력한 작성자(userid)와 메모내용(msg)을 가져와야 한다.
			String userid = req.getParameter("userid");
			String msg = req.getParameter("msg");
			
		}
		
	}// end of execute(HttpServletRequest req, HttpServletResponse res)----------------------------------
	
	
	
}
