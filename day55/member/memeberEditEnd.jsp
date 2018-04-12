<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="mdao" class ="member.model.MemberDAO" scope="session"/>

<jsp:useBean id="mvo" class="member.model.MemberVO" scope="page" />
<jsp:setProperty property="*" name="mvo"/> 
<%--
	 테이블의 컬럼명과 VO의 set다음의 나오는 이름과 폼의 name의 값이 동일할 경우
     <jsp:setProperty property="*" name="mvo"/> 을 사용하면 동일한 이름으로 찾아가서 대입해준다.
--%>

<%
	String method = request.getMethod();
	String msg = "";
	
	if(method.equalsIgnoreCase("post")){
		int n= mdao.updateMember(mvo);
		msg = (n>0)?"회원정보 수정 성공!!":"회원정보 수정 실패!!";
%>		
		<script type="text/javascript">
		
			alert("<%= msg %>");
			
			self.close(); //팝업창 닫기(memberEdit.jsp)
			
			opener.location.reload(true);	// 부모창 새로고침
			
		</script>
		
<%	}else{
%>		
		<script type="text/javascript">
			alert("잘못된 페이지 접근방법입니다.!!");
			location.href = "javascript:history.go(-1);";  // 이전페이지로 이동
			/*
				location.href = "javascript:history.back();"; // 이전페이지로 이동
				location.href = "javascript:history.go(-2);"; // 이전이전페이지
				location.href = "javascript:history.go(0);"; // 현재페이지로 이동(==새로고침)
			*/
		</script>
<%		
		return;
	}
	
%>
