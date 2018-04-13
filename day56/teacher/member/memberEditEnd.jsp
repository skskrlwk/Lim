<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="mvo" class="member.model.MemberVO" scope="page" />
<jsp:setProperty property="*" name="mvo" />

<jsp:useBean id="mdao" class="member.model.MemberDAO" scope="session" />

<%
    String method = request.getMethod();

    if(!"post".equalsIgnoreCase(method)) {
%>    	
		<script type="text/javascript">
			alert("비정상적인 경로로 들어왔습니다.");
			location.href = "javascript:history.go(-1);"; // 이전페이지로 이동 
		/*
		    location.href = "javascript:history.back();"; // 이전페이지로 이동 
		    location.href = "javascript:history.go(-2);"; // 이전이전페이지로 이동 
		    location.href = "javascript:history.go(0);";  // 현재페이지로 이동(==새로고침)       
		*/
		</script>
<%    	
    	return;
    }

    int n = mdao.updateMember(mvo); 
    String msg = (n>0)?"회원정보 수정 성공!!":"회원정보 수정 실패!!";
%>
<script type="text/javascript">
    alert("<%= msg %>");
    
    self.close(); // 팝업창 닫기(memberEdit.jsp)
    
    opener.location.reload(true); // 부모창 새로고침
</script>




    