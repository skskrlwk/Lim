<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="psdto" class="standardActionStudy.test.PersonDTO" />
<jsp:setProperty property="name" name="psdto" value="${param.name}"/>
<jsp:setProperty property="jubun" name="psdto" value="${param.jubun1}${param.jubun2}"/>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 입력결과(JSP 표준액션을 사용한 것)</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container">
	
	  <h2>개인정보 입력결과</h2>
	  <p>JSP 표준액션을 사용한것</p>                                                                                      
	  <div class="table-responsive">          
	  <table class="table">
	    <thead>
	      <tr>
	        <th>성명</th>
	        <th>주민번호</th>
	        <th>성별</th>
	        <th>나이</th>
	      </tr>
	    </thead>
	    <tbody>
	      <tr>
	        <td><jsp:getProperty property="name" name="psdto"/></td>
	        <td><jsp:getProperty property="jubun" name="psdto"/></td>
	        <td><jsp:getProperty property="jgender" name="psdto"/></td>
	         <td><jsp:getProperty property="jage" name="psdto"/></td>
	      </tr>
	    </tbody>
	  </table>
	</div>
</div>
</body>
</html>