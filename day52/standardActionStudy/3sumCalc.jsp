<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String fisrtStr = request.getParameter("firstNum");
	String secondStr = request.getParameter("secondNum");
	
	int firstNum = Integer.parseInt(fisrtStr);
	int secondNum = Integer.parseInt(secondStr);
	
	int sum = 0;
	for(int i=firstNum; i<=secondNum; i++){
		sum += i;
	}
	/* === request 는 폼에 있는 값을 읽어오는 역할도 있지만
	                저장소 기능을 하는 역할도 있다. === */
	       
	// request.setAttribute("sum", new Integer(sum) ); // setAttribute(키값, 객체) 불러올떄는 키값으로  불러온다.
	// 또는 아래와 같이 사용한다 . 왜냐하면 auto boxing 기능에 따라 가능하기 때문이다.
	request.setAttribute("sum", sum);
	
%>   
<jsp:forward page="3sumView.jsp"></jsp:forward>