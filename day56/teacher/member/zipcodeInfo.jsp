<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*, member.model.*, java.sql.*" %>
    
<jsp:useBean id="mdao" class="member.model.MemberDAO" scope="session" />
<%--
     mdao 객체가  메모리상에 존재하면 존재하는 mdao 객체를 사용하고
         만약에 객체가  메모리상에 존재하지 않으면 생성해서 사용한다.
         
	 scope="page"         ==> 생성되어진 객체(지금은 "mdao")가 사용되어지는 범위가 이파일(지금은 idcheck.jsp)에서만 사용가능하다. 
	 scope="request"      ==> 생성되어진 객체(지금은 "mdao")가 사용되어지는 범위가 이파일 및(지금은 idcheck.jsp) 넘겨지는 파일(폼상에 지정된 action 파일)에서만 사용가능하다. 
	 scope="session"      ==> 생성되어진 객체(지금은 "mdao")가 사용되어지는 범위가 이파일 및(지금은 idcheck.jsp) 모든 파일에서 사용가능하다. 
	 scope="application"  ==> 생성되어진 객체(지금은 "mdao")가 사용되어지는 범위가 이파일 및(지금은 idcheck.jsp) 모든 파일에서 사용가능하다. 
	  
 --%>
 
<%
    String ctxname = request.getContextPath();

	String dong = request.getParameter("dong");
    // 사용자가 조회하고자 입력한 동이름을 가져오기
    
    List<ZipcodeVO> zipcodeList = mdao.getZipcode(dong);
%>    
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호 검색 결과</title>

<link rel="stylesheet" type="text/css" href="<%= ctxname %>/css/style.css" />
<script type="text/javascript" src="<%= ctxname %>/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">

    // *** 팝업창에서 부모창으로 값 넘기기 - 일반적인 방법 ***//
	/* 
	function goMove(post1, post2, address) {
		var frm = opener.window.document.registerFrm;
		frm.post1.value = post1;
		frm.post2.value = post2;
		frm.addr1.value = address;
		
		frm.addr2.focus();
		
		self.window.close(); // 팝업창 닫기
	} */
    
	// *** 팝업창에서 부모창으로 값 넘기기 - jQuery를 사용한 방법 ***//
	function goMove(post1, post2, address) {
		
		$("#post1", opener.document).val(post1);
		$("#post2", opener.document).val(post2);
		$("#addr1", opener.document).val(address);
		
		$("#addr2", opener.document).focus();
		
		self.window.close(); // 팝업창 닫기
	}

</script>

</head>
<body style="background-color: #fff0f5;">
<div align="center">
 <table style="width: 98%;" class="outline">
    <thead>
    	<tr>
    		<th style="font-size: 10pt; text-align: center; width: 15%;">우편번호1</th>
    		<th style="font-size: 10pt; text-align: center; width: 15%;">우편번호2</th>
    		<th style="font-size: 10pt; text-align: center; width: 70%;">주소</th>
    	</tr>
    </thead>
    <tbody>
<%    
        if(zipcodeList != null) {
        	// 검색되어진 동이름이 우편테이블에 존재하는 경우
        	for(ZipcodeVO zipvo : zipcodeList) { %>
        		<tr>
        		   <td style="text-align: center;"><%= zipvo.getPost1() %></td>
        		   <td style="text-align: center;"><%= zipvo.getPost2() %></td>
        		   <td style="cursor: pointer;" onClick="goMove('<%= zipvo.getPost1() %>','<%= zipvo.getPost2() %>','<%= zipvo.getAddress() %>');"><%= zipvo.getAddress() %></td>	
            	</tr>
      <%	}
        	
        }
        else {  
        	// 우편번호 테이블에 검색한 동이름 존재하지 않는 경우
      %>  	
        	<tr>
        		<td colspan="3" align="center">
        		    <span style="color: red; font-weight: bold;">해당주소가 없습니다.</span>
        		</td>
        	</tr>
      <%  }
%>
    </tbody>
 </table>
</div>
</body>
</html>