<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 표준액션중 include 에 대해서 알아본다</title>
</head>
<body>
	<h3>책소개</h3>
	도서명: 향수 <br/>
	저자 : 김시온 <br/>
	페이지수 : 300페이지<br/>
	<jsp:include page="1bookcopyright.jsp" />
	가격: 20,000원<br/>
</body>
</html>