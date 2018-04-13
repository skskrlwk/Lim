<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxname = request.getContextPath();
%>
<jsp:useBean id="mdao" class="member.model.MemberDAO" scope="session" />
<%--
     mdao 객체가  메모리상에 존재하면 존재하는 mdao 객체를 사용하고
         만약에 객체가  메모리상에 존재하지 않으면 생성해서 사용한다.
         
	 scope="page"         ==> 생성되어진 객체(지금은 "mdao")가 사용되어지는 범위가 이파일(지금은 idcheck.jsp)에서만 사용가능하다. 
	 scope="request"      ==> 생성되어진 객체(지금은 "mdao")가 사용되어지는 범위가 이파일 및(지금은 idcheck.jsp) 넘겨지는 파일(폼상에 지정된 action 파일)에서만 사용가능하다. 
	 scope="session"      ==> 생성되어진 객체(지금은 "mdao")가 사용되어지는 범위가 이파일 및(지금은 idcheck.jsp) 모든 파일에서 사용가능하다. 
	 scope="application"  ==> 생성되어진 객체(지금은 "mdao")가 사용되어지는 범위가 이파일 및(지금은 idcheck.jsp) 모든 파일에서 사용가능하다. 
	  
 --%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복 ID 검사하기</title>

<link rel="stylesheet" type="text/css" href="<%= ctxname %>/css/style.css" />
<script type="text/javascript" src="<%= ctxname %>/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">

	$(document).ready(function() {
		
		$("#error").hide();
		
		$("#userid").keydown(function(event){
		//	console.log(event.keyCode);
		    if(event.keyCode == 13) {
		    	// 엔터를 했을 경우
		    	goCheck();
		    }
		});
		
	});// end of $(document).ready()--------------

	function goCheck() {
		
		var userid = $("#userid").val().trim();
		
		if(userid == "") {
			$("#error").show();
			
			$("#userid").val("");
			$("#userid").focus();
			return;
		}
		else {
			$("#error").hide();
			
			var frm = document.frmIdcheck;
			frm.method = "post";
			frm.action = "idcheck.jsp";
			frm.submit();
		}
	}// end of goCheck()---------------
	
	// **** 팝업창에서 부모창으로 값 넘기기 일반적인 방법 ****//
/* 	function setUserID(userid) {
		var openerfrm = opener.document.registerFrm;
		// opener는 팝업창을 열게한 부모창을 말한다.
		// 여기서 부모창은 memberform.jsp 페이지이다.
		
		openerfrm.userid.value = userid;
		openerfrm.pwd.focus();
		
		self.close();
		// 여기서 self 는 팝업창 자기자신을 말한다.
		// 지금의 self 는 idcheck.jsp 페이지 이다.
	}// end of setUserID(userid)--------------------- 
*/
	
	
	// **** 팝업창에서 부모창으로 값 넘기기 jQuery를 사용한 방법 ****//
	function setUserID(userid) {
	//  $("#userid", opener.document).val(userid);
	//  또는	
	    $(opener.document).find("#userid").val(userid);
	
	//	$("#pwd", opener.document).focus();
	//  또는
	    $(opener.document).find("#pwd").focus();
		
		self.close();
		// 여기서 self 는 팝업창 자기자신을 말한다.
		// 지금의 self 는 idcheck.jsp 페이지 이다.
		
	}// end of setUserID(userid)-----------------

</script>

</head>
<body style="background-color: #fff0f5;">
<%
	String method = request.getMethod();
%>
	<span style="font-size: 10pt; font-weight: bold;"><%= method %></span>
<%
	if("get".equalsIgnoreCase(method)) {
		// 전송방식이 GET 이라면 ID중복검사를 하기위한 폼을 띄워주어야 한다.
%>		
		<form name="frmIdcheck">
			<table style="width: 95%; height: 90%;">
				<tr>
					<td style="text-align: center;">
						아이디를 입력하세요<br style="line-height: 200%;"/>
						<input type="text" id="userid" name="userid" size="20" class="box" /><br style="line-height: 300%;"/> 
						<span id="error" style="color: red; font-size: 12pt; font-weight: bold;">아이디를 입력하세요!!</span><br/><br/>   
						<button type="button" class="box" onClick="goCheck();">확인</button>
					</td>
				</tr>
			</table>
		</form>
<%	}
	else {
		// 전송방식이 POST 이라면
		String userid = request.getParameter("userid");
		
		boolean isUSEuserid = mdao.idDuplicateCheck(userid); 
		// userid 가 중복이라면 false 리턴.
		// userid 가 중복이 아니라면 true 리턴.
		
		if(isUSEuserid) {
			// userid 가 중복이 아니라면 사용가능한 아이디 이라고 알려준다.
%>		
		<br style="line-height: 200%;" />
		<br style="line-height: 200%;" />
		<div align="center">
			ID로[<span style="color: red; font-weight: bold;"><%= userid %></span>] 사용가능합니다.
			<br/><br/><br/>
			<button type="button" onClick="setUserID('<%= userid %>');">닫기</button> 
		</div>
<%			
		}
		else {
			// userid 가 중복이라면 사용 불가능한 아이디 이라고 알려준다.
%>			<br style="line-height: 200%;" />
			<div align="center">
				[<span style="color: red; font-weight: bold;"><%= userid %></span>] 는 이미 사용중 입니다.
				<br/>
				<form name="frmIdcheck">
					<table style="width: 95%; height: 90%;">
						<tr>
							<td style="text-align: center;">
								아이디를 입력하세요<br style="line-height: 200%;"/>
								<input type="text" id="userid" name="userid" size="20" class="box" /><br style="line-height: 300%;"/>
								<span id="error" style="color: red; font-size: 12pt; font-weight: bold;">아이디를 입력하세요!!</span><br/><br/>    
								<button type="button" class="box" onClick="goCheck();">확인</button>
							</td>
						</tr>
					</table>
				</form> 
			</div>	
			
<%		}// end of if ~ else----------
		
	}// end of if ~ else--------------
%>

</body>
</html>






