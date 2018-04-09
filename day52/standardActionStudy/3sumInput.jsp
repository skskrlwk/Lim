<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 표준액션중 forward 에 대해서 알아본다.</title>
<script type="text/javascript">
	
	function goSubmit(){
		var frm = document.myFrm;
		frm.submit();
	}

</script>
</head>
<body>
	<h2>입력한 두개의 수를 사이를 누적한 값 알아오기</h2>
	<p>
	<form name="myFrm" action="3sumCalc.jsp"> <!-- 메소드를 안쓰면 기본이 get방식 -->
		첫번쨰수 : <input type="text" name="firstNum" /><br/>
		두번쨰수 : <input type="text" name="secondNum" /><br/>
		<button type="button" onclick="goSubmit();">계산하기</button>
	</form>
</body>
</html>