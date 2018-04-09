<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 입력결과(서블릿을 사용한 것)</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container">
	
	  <h2>개인정보 입력결과</h2>
	  <p>서블릿을 사용한 것</p>                                                                                      
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
	        <td>${name}</td>
	        <td>${jubun}</td>
	        <td>${gender}</td>
	         <td>${age}</td>
	      </tr>
	    </tbody>
	  </table>
	</div>
</div>
</body>
</html>