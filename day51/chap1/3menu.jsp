<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>오늘의 메뉴</title>
<link rel="stylesheet" type="text/css" href="/MyWeb/chap1/today.css" />
</head>
<body>
	<h3>오늘의 메뉴</h3>
	<ol style="list-style-type: decimal-leading-zero;">
	
		<li>햄버거</li>
		<li>짜장면</li>
		<li>짬뽕</li>
		<li>팔보채</li>
	
	</ol>
	<div id="today">
		<%@ include file="5today.jsp" %>
	</div>
	
</body>
</html>