<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>오늘의 일정</title>
<link rel="stylesheet" type="text/css" href="/MyWeb/chap1/today.css" />
</head>
<body>
	<h3>오늘의 일정</h3>
	<ol style="list-style-type: decimal;">
	
		<li>기상</li>
		<li>식사</li>
		<li>놀기</li>
		<li>취침</li>
	
	</ol>
	<div id="today">
		<%@ include file="5today.jsp" %>
	</div>
</body>
</html>