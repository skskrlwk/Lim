<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/MyWeb/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<script src="/MyWeb/js/jquery-3.3.1.min.js"></script>
<script src="/MyWeb/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<title>개인 성향 테스트</title>

<style type="text/css">
	.my_container{border: 1px solid red;
				  margin-top: 40px;
				  width: 60%;}
	
	.form-group{margin-bottom: 30px;}

	.my_btn-group{margin-top: 50px;}
	
	.btn {margin-right: 20px;}
	
</style>

<script type="text/javascript">
	
	function goSubmit(){
		var frm = document.frmPersonTest;
		frm.method = "get";
		frm.action = "<%= request.getContextPath() %>/testPerson1.do";
		<%--
			 <%= request.getContextPath() %> 은 컨텍스트 경로명을 알려주는 것으로 
			 다이내믹웹프로젝트로 만들면 컨텍스트명이 다이내믹웹프로젝트명이 된다.
			 그러므로 여기서는 컨텍스트명이 /MyWeb 이 되어진다.
			 << 중요 !! >>
			 웹경로를 나타낼떄 맨앞에 /는
			 확장자.html 이나 .jsp 일 경우에는
			 ip주소: 포트번호이 생략된 것이고,
			 확장자가.java 이나 .xml 일 경우에는
			 ip주소 : 포트번호/컨텍스트명이 생략된 것이다.
			 
			 그래서 여기서는 확장자가 .jsp 이므로 /MyWeb/testPerson1.do 는
			 localhost:9090/MyWeb/testPerson1.do 인 것이다.
		 --%>
		frm.submit();
		
	}
	
</script>

</head>
<body>
<div class="container my_container">
	<form class="form-horizontal" name="frmPersonTest">
	<fieldset>
	
	<!-- Form Name -->
	<legend> <h2 class="text-info">개인 성향 테스트(GET)</h2></legend>
	
	<!-- Text input-->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="textinput">성 명</label>  
	  <div class="col-md-2">
	  <input id="name" name="name" type="text" placeholder="성명입력" class="form-control input-md">
	   
	  </div>
	</div>
	
	<!-- Multiple Radios (inline) -->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="radios">좋아하는 색</label>
	  <div class="col-md-4"> 
	    <label class="radio-inline" for="radios-0">
	      <input type="radio" name="color" id="radios-0" value="빨강" checked="checked">
	      	빨강
	    </label> 
	    <label class="radio-inline" for="radios-1">
	      <input type="radio" name="color" id="radios-1" value="파랑">
	      	파랑
	    </label> 
	    <label class="radio-inline" for="radios-2">
	      <input type="radio" name="color" id="radios-2" value="노랑">
	      	노랑
	    </label> 
	    <label class="radio-inline" for="radios-3">
	      <input type="radio" name="color" id="radios-3" value="초록">
	      	초록
	    </label>
	  </div>
	</div>
	
	<!-- Multiple Checkboxes (inline) -->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="checkboxes">좋아하는 음식(다중선택)</label>
	  <div class="col-md-4">
	    <label class="checkbox-inline" for="checkboxes-0">
	      <input type="checkbox" name="food" id="checkboxes-0" value="짜장면">
	      	짜장면
	     </label>
	    <label class="checkbox-inline" for="checkboxes-1">
	      <input type="checkbox" name="food" id="checkboxes-1" value="탕수육">
	      	탕수육
	    </label>
	    <label class="checkbox-inline" for="checkboxes-2">
	      <input type="checkbox" name="food" id="checkboxes-2" value="양장피">
	      	양장피
	    </label>
	    <label class="checkbox-inline" for="checkboxes-3">
	      <input type="checkbox" name="food" id="checkboxes-3" value="팔보채">
	      	팔보채
	    </label>
	    <label class="checkbox-inline" for="checkboxes-4">
	      <input type="checkbox" name="food" id="checkboxes-4" value="짬뽕">
	      	짬뽕
	    </label>
	  </div>
	</div>
	
	<!-- Select Basic -->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="selectbasic">좋아하는 동물</label>
	  <div class="col-md-2">
	    <select id="selectbasic" name="animal" class="form-control">
	      <option value="강아지" selected>강아지</option>
	      <option value="고양이">고양이</option>
	      <option value="병아리">병아리</option>
	    </select>
	  </div>
	</div>
	
	<!-- Button (Double) -->
	<div class="form-group my_btn-group">
	  
	  <label class="col-md-4 control-label" for="button1id"></label>
	  <div class="col-md-8">
	    <button type="button" id="button1id" name="button1id" class="btn btn-success" onclick="goSubmit();">확인</button>
	    <button type="reset" id="button2id" name="button2id" class="btn btn-danger">취소</button>
	  </div>
	</div>
	
	</fieldset>
	</form>
</div>

</body>
</html>