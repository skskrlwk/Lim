<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset=UTF-8>
<title>JSP 페이지에서 Exception 처리 방법 3가지</title>

<script type="text/javascript">
	
	function goSubmit(btn){
		
		switch (btn) {
			case 'btn1':
				frm1.submit();
				break;
				
			case 'btn2':
				frm2.submit();
				break;
				
			case 'btn3':
				frm3.submit();
				break;
				
			default:
				alert('해당되는 버튼이 없습니다.');
				break;
		}
		
	}

</script>

</head>
<body>
	
	<h2> try ~ catch == RequestDispatcher 를 이용한 에러페이지 출력 </h2>
	<form name="frm1" action="ex01_numCalcEnd.jsp" method="post">
		num1 : <input type="text" name="num1"  /> <br />
		num2 : <input type="text" name="num2"  /> <br />
		<button type="button" id="btn1" onclick="goSubmit('btn1');">전송</button>	
	</form>
	<br />
	
	<h2> JSP 페이지 directive(지시어)에서 errorPage 속성과 isErrorPage 속성을 이용한 에러페이지 출력방법, errorPage="error_ex02.jsp" 및 isErrorPage="true"로 함 </h2>
	<form name="frm2" action="ex02_numCalcEnd.jsp" method="post">
		num1 : <input type="text" name="num1"  /> <br />
		num2 : <input type="text" name="num2"  /> <br />
		<button type="button" id="btn2" onclick="goSubmit('btn2');">전송</button>	
	</form>
	<br />
	
	<h2> web.xml 파일을 이용한 에러페이지 출력</h2>
	<form name="frm3" action="ex03_numCalcEnd.jsp" method="post">
		num1 : <input type="text" name="num1"  /> <br />
		num2 : <input type="text" name="num2"  /> <br />
		<button type="button" id="btn3"  onclick="goSubmit('btn3');">전송</button>	
	</form>
</body>
</html>