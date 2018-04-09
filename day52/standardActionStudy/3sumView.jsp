<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String first = request.getParameter("firstNum");
	String second = request.getParameter("secondNum");
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과물 보여주기(EL 사용)</title>
</head>
<body>

	<h3>스크립틀릿 사용</h3> <br/><br/>
	<%= first %>부터 <%= second %> 까지의 합은?<br/>
	결과값 : <span style="color: red;"> ${sum} </span> <%-- ${sum}  setAttribute의 키값을 불러온다. --%>

</body>
</html>