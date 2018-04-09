<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String strnum1 = request.getParameter("num1");
	String strnum2 = request.getParameter("num2");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>try ~ catch ==> RequestDispatcher 를 이용한 에러페이지 출력</title>

<style type="text/css">
	.a{text-decoration: none;}
	a:hover {color: red;}
</style>
</head>
<body>
	<h1>error_ex01.jsp 페이지의 내용</h1>
	
	<h2>JSP 페이지에서 Exception 처리방법 1</h2>
	<h3>try ~ catch ==> RequestDispatcher 를 이용한 에러페이지 출력</h3>
	
	잘못된 데이터가 입력되었습니다.<br />
	<%= "num1 : " + strnum1 + "<br />" %>
	<%= "num2 : " + strnum2 + "<br />" %>
	<br/><br/>
	<a href="1numberInputFormjsp.jsp">되돌아가기</a>
	
</body>
</html>