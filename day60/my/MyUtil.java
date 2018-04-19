package util.my;

import javax.servlet.http.HttpServletRequest;

public class MyUtil {
	
	// *** 돌아갈 URL 페이지의 값을 알기 위해서 먼저 현재 URL 주소를 얻어오는 메소드
	public static String getCurrentURL(HttpServletRequest request) {
		/* === 회원삭제(회원병경)후 돌아갈 URL 페이지의 값을 알기위해서
	       	       먼저 현재 URL 주소를 얻어고기 ===  */

		String currentUrl = request.getRequestURL().toString();
		// http://localhost:9090/MyWeb/member/memberList.jsp
		
		String queryString = request.getQueryString();
		// currentShowPageNo=8&sizePerPage=5
		
		currentUrl += "?" + queryString;
		// http://localhost:9090/MyWeb/member/memberList.jsp?currentShowPageNo=8&sizePerPage=5
		
		String ctxName = request.getContextPath(); 
		// /MyWeb
		
		int index = currentUrl.indexOf(ctxName); 
		// 21
		
		int beginIndex = index + ctxName.length(); 
		// 21 + 6 => 27
		
		currentUrl = currentUrl.substring(beginIndex+1);
		// member/memberList.jsp?currentShowPageNo=8&sizePerPage=5	
		
		return currentUrl;
		
	} // end of getCurrentURL(HttpServletRequest request)
	
	// *** 페이지바 만들기 *** //
	public static String getPageBar(String url, int currentShowPageNo, int sizePerPage, int totalPage, int blocksize) {
		String pageBar ="";
		
		int pageNo = 1;
		int loop = 1; 
		pageNo = ( (currentShowPageNo - 1) / blocksize ) * blocksize + 1;
		/* 공식
		
		  	currentShowPageNo		pageNo
		  	-----------------------------------------
		  	       1				  1
		  	       2				  1
		  	      ..		
		  	      10				  1
		  	      11				 11
		  	      12				 11
		  	      ..
		  	      20				 11
		  	      21				 11
		  	      22				 11
		  	      ..
		  	      30				 21
		 */
		
		
		
		// [이전]
		if(pageNo == 1) {
			
		}else {
			pageBar += "&nbsp;<a href='"+url+"?currentShowPageNo="+ (pageNo-1)+ "&sizePerPage="+ sizePerPage+ "'>[이전]</a>";
		}
		
		while ( !(pageNo > totalPage || loop > blocksize) ) {
			
			if(pageNo == currentShowPageNo ) {
				pageBar += "&nbsp;<span style='color: red; font-size: 13pt; font-weight: bold; text-decoration: underline;'> "
						+ pageNo + "</span>&nbsp;";
				
			}else {
				pageBar += "&nbsp;<a href='"+ url+ "?currentShowPageNo="+ pageNo + "&sizePerPage="+ sizePerPage
						+"' >"+ pageNo+ "</a>&nbsp;";
			}
			
			pageNo ++;
			loop++;
		}// end of while --------------------------------
		
		// pageBar = "1 2 3 4 5 6 7 8 9 10";
		
		// [다음]
		if(pageNo > totalPage) {
			
		}else {
			pageBar += "&nbsp;<a href='"+ url+ "?currentShowPageNo="+ pageNo+ "&sizePerPage="+ sizePerPage+ "'>[다음]</a>";
		}
		
		
		return pageBar;
		
	}// end of getPageBar(String url, int currentShowPageNo, int sizePerPage, int totalPage, int blocksize)-----------------

}
