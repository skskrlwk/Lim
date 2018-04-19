package memo.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import memo.model.MemoDAO;
import memo.model.MemoVO;
import util.my.MyUtil;

public class MemoListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
				
		
		MemoDAO memodao = new MemoDAO();
		
		/* 페이징 처리하기 이전의 데이터 조회 결과물
		  List<HashMap<String, String>> memoList = memodao.getAllMemo();
		  req.setAttribute("memoList", memoList);
		 */
		
		// 1. 페이징 처리를 위해 페이지당 보여줄 메모갯수를 받아오기(10 or 5 or 3)
		String str_sizePerPage = req.getParameter("sizePerPage");
		
		int sizePerPage = 0;
		
		if(str_sizePerPage == null) {
			sizePerPage = 10;
		}else {			
			try {
				sizePerPage = Integer.parseInt(str_sizePerPage);
				
				if(sizePerPage != 10 && sizePerPage != 5 && sizePerPage != 3) {
					sizePerPage = 10;
				}
				
			} catch (NumberFormatException e) {
				sizePerPage = 10;
			}
		
		}
		
		// 2. 전체 페이지 갯수 알아오기
		int totalPage = 0;
		int totalCountMemo = memodao.getTotalCountMemo();
		
		totalPage = (int)Math.ceil((double)totalCountMemo / sizePerPage);
		
		String str_currentShowPageNo = req.getParameter("currentShowPageNo");
		int currentShowPageNo = 0;
		
		try {
			if(str_currentShowPageNo == null) {
				currentShowPageNo = 1;
				
			}else {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
				
				if(totalPage < currentShowPageNo || currentShowPageNo < 1) {
					currentShowPageNo = 1;
				}
			}
			
		}catch (NumberFormatException e) {
			currentShowPageNo = 1;
		}
		
		// 3. 페이징 처리한 데이터 조회 결과물 만들기 
		
		List<HashMap<String, String>> memoList = memodao.getAllMemo(sizePerPage, currentShowPageNo);
		req.setAttribute("memoList", memoList);
		
		// 4. 페이지바 만들기 
	/*	
		int blocksize = 10;
		int pageNo = 1;
		int loop = 1; 
		
		// 공식
		pageNo = ( (currentShowPageNo - 1) / blocksize ) * blocksize + 1;
		
	//	  	currentShowPageNo		pageNo
	//	  	-----------------------------------------
	//	  	       1				  1
	//	  	       2				  1
	//	  	      ..		
	//	  	      10				  1
	//	  	      11				 11
	//	  	      12				 11
	//	  	      ..
	//	  	      20				 11
	//	  	      21				 11
	//	  	      22				 11
	//	  	      ..
	//	  	      30				 21
		 
		
		String pageBar = "";
		
		// [이전]
		if(pageNo == 1) {
			
		}else {
			pageBar += "&nbsp;<a href='memoList.do?currentShowPageNo="+ (pageNo-1)+ "&sizePerPage="+ sizePerPage+ "'>[이전]</a>";
		}
		
		while ( !(pageNo > totalPage || loop > blocksize) ) {
			
			if(pageNo == currentShowPageNo ) {
				pageBar += "&nbsp;<span style='color: red; font-size: 13pt; font-weight: bold; text-decoration: underline;'> "
						+ pageNo + "</span>&nbsp;";
				
			}else {
				pageBar += "&nbsp;<a href='memoList.do?currentShowPageNo="+ pageNo + "&sizePerPage="+ sizePerPage
						+"' >"+ pageNo+ "</a>&nbsp;";
			}
			
			pageNo ++;
			loop++;
		}// end of while --------------------------------
		
		// pageBar = "1 2 3 4 5 6 7 8 9 10";
		
		// [다음]
		if(pageNo > totalPage) {
			
		}else {
			pageBar += "&nbsp;<a href='memoList.do?currentShowPageNo="+ pageNo+ "&sizePerPage="+ sizePerPage+ "'>[다음]</a>";
		}
		
	*/	
		req.setAttribute("sizePerPage", sizePerPage);
		// *** 메소드로 pageBar 호출하기 *** //
		String url = "memoList.do";
		int blocksize = 10;
		
		String pageBar = MyUtil.getPageBar(url, currentShowPageNo, sizePerPage, totalPage, blocksize);
		req.setAttribute("pageBar", pageBar);
		
		super.setRedirect(false);
	//	super.setViewPage("/WEB-INF/memo/memoList.jsp");
		super.setViewPage("/WEB-INF/memo/memoListJST.jsp");
		
	}

}
