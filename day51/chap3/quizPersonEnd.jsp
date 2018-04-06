<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
  String ctxPath = request.getContextPath();

  String name  = request.getParameter("name");
  String color = request.getParameter("color");
  String[] foodArr = request.getParameterValues("food");
  String animal = request.getParameter("animal");
  
  /* name  = "홍길동";
  color = "빨강";
  foodArr = new String[] {"짜장면","짬뽕","탕수육","양장피","팔보채"};
  animal = "강아지"; */
  
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%= ctxPath %>/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<script src="<%= ctxPath %>/js/jquery-3.3.1.min.js"></script>
<script src="<%= ctxPath %>/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> 

<title>개인취향 테스트 결과 이미지로 보여주기</title>

<style type="text/css">
    .my_container {border: 0px solid red;
                   width: 90%;
                   margin: 0 auto;}
                   
	.my_well {border: 0px solid red;
	          width: 33%;
	          margin-top: 20px;
	          margin-left: 30%;
	          padding-left: 25px;
	          }
	          
	.mydiv {margin-bottom: 20px;}          
</style>

<script type="text/javascript">

	$(document).ready(function(){
		
	<%
	  switch(color) {
		case "빨강": %>
			var imgcolor = setImg("red.png");  
	<%	break;
		
		case "파랑": %>
			var imgcolor = setImg("blue.png"); 
	<%	break;
			
		case "노랑": %>
			var imgcolor = setImg("yellow.png");  
	<%	break;	
	  }	
	  
	  switch(animal) {
		case "강아지": %>
			var imganimal = setImg("dog.png");      
	<%	break;
		
		case "고양이": %>
			var imganimal = setImg("cat.png");  
	<%	break;
			
		case "금붕어": %>
			var imganimal = setImg("fish.png");  
	<%	break;	
	  } %>
	  
	  var imgfoods = "";
	  
	<%  
	  if(foodArr != null) {
		  for(int i=0; i<foodArr.length; i++) {
			  switch(foodArr[i]) {
				case "짜장면": %>
					var imgfood = setImg("jjm.png");      
			<%	break;
				
				case "짬뽕": %>
					var imgfood = setImg("jjbong.png");  
			<%	break;
					
				case "탕수육": %>
					var imgfood = setImg("tangsy.png");  
			<%	break;	
			
				case "양장피": %>
				    var imgfood = setImg("yang.png");  
		    <%	break;
		    
				case "팔보채": %>
			    	var imgfood = setImg("palbc.png");  
	    	<%	break;
			  }	  
			%>  
			  imgfoods += imgfood + "<span style='margin: 10px;'>&nbsp;</span>";
	   <%  }// end of for--------------------------
		  
	  } // end of if-------------- %>
		
	  $("#divcolor").html(imgcolor);
	  $("#divanimal").html(imganimal);
	  $("#divfood").html(imgfoods);
	  
	});// end of $(document).ready()----------------------

	function setImg(filename) {
		var result = "<img src='<%= ctxPath %>/chap3/images/"+filename+"' />";  
		return result;
	}
</script>

</head>
<body>

<div class="container my_container">
  <div class="well well-sm my_well">
  	<h3 class="text-info"><%= name %>님의 성향 테스트 결과</h3>
  </div>
  <div class="mydiv">
      색상:<div id="divcolor"></div>
  </div>
  
  <div class="mydiv">
      동물:<div id="divanimal"></div>
  </div>
  
  <div class="mydiv">
      음식:<div id="divfood"></div>
  </div>
  
  
</div>

</body>
</html>