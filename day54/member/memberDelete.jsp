<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class ="member.model.MemberDAO" scope="session"/>


	
	$(document).ready(function (){
<%
		String str_idx = request.getParameter("idx");
		int idx = Integer.parseInt(str_idx);
		
		int result = mdao.deleteMember(idx);
		
		if(result == 1){
%>		<script type="text/javascript">
			alert("<%= idx  %>님 회원탈퇴 성공!!");
			location.href="memberList.jsp"; 
			
		</script>
<%		}else {
%>		<script type="text/javascript">
			alert("회원탈퇴 실패!!");
			location.href="memberList.jsp"; 
			
		</script>
<%		}
%>
		
		
		
	});
	

