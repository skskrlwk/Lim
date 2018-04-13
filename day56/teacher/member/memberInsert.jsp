<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="mvo" class="member.model.MemberVO" scope="page" />
<%-- 
<jsp:setProperty property="name" name="mvo" value="${param.name}" /> 
<jsp:setProperty property="userid" name="mvo" value="${param.userid}" />
<jsp:setProperty property="pwd" name="mvo" value="${param.pwd}" /> 
--%>
<jsp:setProperty property="*" name="mvo" />
<%-- 테이블의 컬럼명과 VO의 set다음에 나오는 이름과 폼의 name 의 값이
동일할 경우  <jsp:setProperty property="*" name="mvo" /> 을
사용하면 동일한 이름으로 찾아가서 대입해준다. --%>

<jsp:useBean id="mdao" class="member.model.MemberDAO" scope="session" />

<%
      int n = mdao.registerMember(mvo);

      if(n > 0) { %>
      <script type="text/javascript">
          alert("회원가입 성공!!");
          location.href="memberList.jsp";
          // 자바스크립트에서 페이지 이동은
          // location.href="이동해야할 페이지명"; 으로 한다.
      </script>
    <%  }
      else {  %>
      <script type="text/javascript">
    	  alert("회원가입 실패!!");
    	  location.href="memberform.jsp";
      </script>  
    <%  }
%>
    
    
    
    
    
    