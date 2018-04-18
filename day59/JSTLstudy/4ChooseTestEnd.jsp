<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숫자를 입력받아서 1,3(남자)/2,4(여자)로 나타내기 결과</title>
</head>
<body>
	<c:choose>
		<c:when test="${param.num == '1'}">
			남자입니다.<br/>
		</c:when>
		<c:when test="${param.num == '3'}">
			남자입니다.<br/>
		</c:when>
		<c:when test="${param.num == '2'}">
			여자입니다.<br/>
		</c:when>
		<c:when test="${param.num == '4'}">
			여자입니다.<br/>
		</c:when>
		<c:otherwise>
			1,2,3,4 중 하나만 입력하세요.<br/>
		</c:otherwise>
	</c:choose>

</body>
</html>