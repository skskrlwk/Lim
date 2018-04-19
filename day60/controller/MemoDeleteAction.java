package memo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import memo.model.MemoDAO;

public class MemoDeleteAction extends AbstractController{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		String[] delChkboxArr = req.getParameterValues("delChkbox");
		/* 
		  	req.getParameterValues("delChkbox"); 은
		  	타입이 checkbox인데 체크가 되어진것만 받아온다. 
		*/

		System.out.println("확인용 배열크기 >>>>>>>>>>> " + delChkboxArr.length);
		
		for(int i=0; i<delChkboxArr.length; i++) {
			System.out.println("확인용 idx >>>>>>>>>>> " + delChkboxArr[i]);
		}
		
		
		StringBuilder sb = new StringBuilder(); // 단일스레드
		
		for(int i=0; i<delChkboxArr.length; i++) {
			sb.append(delChkboxArr[i] + ",");	
		}
		
		String str = sb.toString();
		str = str.substring(0, str.length()-1);
		
		System.out.println("확인용 : >>>>>>>>>>> " + str);
		
		
		MemoDAO memodao = new MemoDAO();
		
		int n = memodao.deleteMemo(str);
		
		String msg = (n == delChkboxArr.length)?"선택한 메모내용 모두 글삭제 성공!!":"선택한 메모내용 모두 글삭제 실패";
		req.setAttribute("msg", msg);
		
		String url = req.getParameter("urlText");
		String loc = url;
		
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/msg.jsp");
	}

	
	
}