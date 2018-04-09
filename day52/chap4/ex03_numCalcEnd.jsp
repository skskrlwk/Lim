<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	String str1 = request.getParameter("num1");
	String str2 = request.getParameter("num2");
	
	int num1 = Integer.parseInt(str1);
	int num2 = Integer.parseInt(str2);
	
	int sum = num1 + num2;
	
	
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>ex03_numCalcEnd.jsp 페이지</title>
<style type="text/css">
	.a{text-decoration: none;}
	a:hover {color: red;}
</style>
</head>
<body>
	<%= num1 %> + <%= num2 %> + <%= sum %><br/>
	<a href="1numberInputFormjsp.jsp">되돌아가기</a>
</body>
</html>