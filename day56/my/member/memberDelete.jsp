<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class ="member.model.MemberDAO" scope="session"/>


<%
		String method = request.getMethod();
		// POST or GET
		
		if(!method.equalsIgnoreCase("post")){
			// POST 방식이 아니라면 회원삭제를 하지못하도록 한다.
			
			response.sendRedirect("../index.jsp");
			// 자바에서 페이지 이동은 response.sendRedirect("이동할 페이지명"); 이다.
			// "이동할 페이지명" 에 데이터(request, response)전달은 할 수 없고 단순히 페이지 이동만 일어난다.
			return;
		}
		
		String idx = request.getParameter("idx");
		String goBackURL = request.getParameter("goBackURL");
		// member/memberList.jsp?currentShowPageNo=8&sizePerPage=10
				
		int index = goBackURL.indexOf("/");
		// 6
		
		goBackURL = goBackURL.substring(index+1);
		
		int result = mdao.deleteMember(idx);
		
		String msg = (result>0)?"회원삭제 성공!!":"회원삭제실패!!";
		String loc = goBackURL;
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc",	loc);
		
		 		
		RequestDispatcher dispatcher = request.getRequestDispatcher("msg.jsp");
		dispatcher.forward(request, response);
		 
		 
%>
<%-- 
	또는 위의
	RequestDispatcher dispatcher = request.getRequestDispatcher("msg.jsp");
	dispatcher.forward(request, response); 을 대신하는 것이
	
	<jsp:forward page="msg.jsp" />
	
	이다.
--%>

