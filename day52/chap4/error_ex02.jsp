<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>errorPage 속성과 isErrorPage 속성을 이용한 에러페이지 출력</title>
</head>
<body>
	<h1>error_ex02.jsp 페이지의 내용</h1>
	
	<h2>JSP 페이지에서 Exception 처리방법 2</h2>
	<h3>JSP 페이지 directive(지시어)에서 errorPage 속성과 isErrorPage 속성을 이용한 에러페이지 출력방법, errorPage="error_ex02.jsp" 및 isErrorPage="true"로 함</h3>
	
	잘못된 데이터가 입력되었습니다.<br />
	에러메시지 : <%= exception.getMessage() %>	<br/><br/>
	<%-- JSP 페이지 directive(지시어)에서 isErrorPage="true" 으로 해야만 내장객체인 exception을 사용할수 있다.--%>
	<a href="1numberInputFormjsp.jsp">되돌아가기</a>

</body>
</html>