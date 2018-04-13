<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.*, util.my.*" %>

<jsp:include page="../header.jsp" />

<jsp:useBean id="mdao" class="member.model.MemberDAO" scope="session" />    
<%
	String idx = request.getParameter("idx");
    String currentURL = MyUtil.getCurrentURL(request);
    
    System.out.println("==> 확인용 currentURL : " + currentURL);
 // ==> 확인용 currentURL : member/memberDetail.jsp?idx=154&goBackURL=member/memberList.jsp?currentShowPageNo=17&sizePerPage=3

	String goBackURL = currentURL.substring(currentURL.indexOf("goBackURL="));	
 // goBackURL=member/memberList.jsp?currentShowPageNo=17&sizePerPage=3

	goBackURL = goBackURL.substring(goBackURL.indexOf("/")+1);	 
 // memberList.jsp?currentShowPageNo=17&sizePerPage=3
		 
	MemberVO mvo = mdao.getMemberOneByIdx(idx);
%>    
<style type="text/css">
	table#personInfoTbl {
		border: 0px solid gray;
		border-collapse: collapse;
		width: 50%;
		margin-top: 3%;
	}
	
	table#personInfoTbl tr {
		line-height: 300%;
	}
	
	table#personInfoTbl td {
		border: 0px solid gray;
		border-collapse: collapse;
		font-size: 14pt;
	}
	
	table#personInfoTbl td.title {
		text-align: justify;
		font-size: 14pt;
		font-weight: bold;
	}
</style>    

<script type="text/javascript">
  
  function goMemberList(goBackURL) {
	  console.log(goBackURL);
	  location.href = goBackURL;
  }

</script>

<div class="container">
	<table id="personInfoTbl">
		<tr>
		  <td class="title">▷ 회원번호</td>
		  <td><%= mvo.getIdx() %></td>
		</tr>
		
		<tr>
		  <td class="title">▷ 성명</td>
		  <td><%= mvo.getName() %></td>
		</tr>
		
		<tr>
		  <td class="title">▷ 아이디</td>
		  <td><%= mvo.getUserid() %></td>
		</tr>
		
		<tr>
		  <td class="title">▷ 비밀번호</td>
		  <td><%= mvo.getPwd() %></td>
		</tr>
		
		<tr>
		  <td class="title">▷ 이메일</td>
		  <td><%= mvo.getEmail() %></td>
		</tr>
		
		<tr>
		  <td class="title">▷ 연락처</td>
		  <td><%= mvo.getAllHp() %></td>
		</tr>
		
		<tr>
		  <td class="title">▷ 우편번호</td>
		  <td><%= mvo.getAllPost() %></td>
		</tr>
		
		<tr>
		  <td class="title">▷ 주소</td>
		  <td><%= mvo.getAllAddr() %></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
			   <button type="button" style="margin-top: 30px; background-color: navy; color: white; width: 100px; border: none;" onClick="goMemberList('<%= goBackURL %>');">회원목록</button>  
			</td>
		</tr>
	</table>
</div>

<jsp:include page="../footer.jsp" />


