package memo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import memo.model.MemoDAO;
import memo.model.MemoVO;

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
			
			
			// 2.클라이언트의 IP Address 얻어오기
			String cip = req.getRemoteAddr();
			// System.out.println("==> 확인용 cip : " + cip);
			
			/*
			  이클립스 메뉴의 
			  Run --> Run Configuration
			  	  --> Arguments 탭
			  	  --> VM arguments 속에 맨뒤에
			  	  --> 한칸 띄우고 -Djava.net.preferIPv4Stack=true
			  	  	    을 추가한다
			 */
			
			
			MemoVO memovo = new MemoVO();
			memovo.setUserid(userid);
			memovo.setMsg(msg.replaceAll("<", "&lt;"));
			memovo.setCip(cip);
			
			MemoDAO memodao = new MemoDAO();
			
			int n = memodao.memoInsert(memovo);
			
			if(n == 0) {
				// 존재하지 않는 userid 를 입력한 경우
				req.setAttribute("msg", "가입된 회원이 아니므로 메모글쓰기 불가합니다.");
				req.setAttribute("loc", "javascript:history.back();");
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
				
				return;
				
			}else {
				// 존재하는 userid 를 입력한 경우
				req.setAttribute("msg", "메모입력 성공");
				req.setAttribute("loc", "memoList.do"); // javascript: 는 생략가능
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
				
				
			}
			
			
		}
		
	}// end of execute(HttpServletRequest req, HttpServletResponse res)----------------------------------
	
	
	
}
