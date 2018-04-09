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
<title>개인 정보 입력</title>

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
		frm.method = "post";
		frm.action = "7personFormEnd.do";
		frm.submit();
		
	}
	
</script>

</head>
<body>
<div class="container my_container">
	<form class="form-horizontal" name="frmPersonTest">
	<fieldset>
	
	<!-- Form Name -->
	<legend> <h2 class="text-info">개인 정보 테스트(7personForm.do)</h2></legend>
	/MyWeb/standardActionStudy/7personForm.jsp 이 보여진다<br/><br/>
	
	<!-- Text input-->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="name">성 명</label>  
	  <div class="col-md-2">
	  <input id="name" name="name" type="text" placeholder="성명입력" class="form-control input-md">
	   
	  </div>
	</div>
	
	<!-- Text input-->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="jubun">주민번호</label>  
	  <div class="col-md-2">
	  <input id="jubun1" name="jubun1" type="text" maxlength="6" placeholder="주민번호숫자입력" class="form-control input-md">-
	   <input id="jubun2" name="jubun2" type="text" maxlength="7" placeholder="주민번호숫자입력" class="form-control input-md">
	  </div>
	</div>
	
	
	<!-- Multiple Radios (inline) -->
	<!-- <div class="form-group">
	  <label class="col-md-4 control-label" for="radios">성별</label>
	  <div class="col-md-4"> 
	  
	    <label class="radio-inline" for="radios-0">
	      <input type="radio" name="gender" id="radios-0" value="m" checked="checked">
	      	남자
	    </label> 
	    
	    <label class="radio-inline" for="radios-1">
	      <input type="radio" name="gender" id="radios-1" value="f">
	      	여자
	    </label> 
	    
	   </div>
	</div> -->
	
	<!-- Text input-->
	<!-- <div class="form-group">
	  <label class="col-md-4 control-label" for="age">나이 </label>  
	  <div class="col-md-2">
	  <input id="age" name="age" type="number" min="1" max ="100" step="1" placeholder="나이입력" class="form-control input-md">
	   
	  </div>
	</div> -->
	
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