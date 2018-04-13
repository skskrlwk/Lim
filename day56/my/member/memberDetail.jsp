<%@page import="member.model.*, java.sql.*, util.my.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" />
<jsp:useBean id="mdao" class ="member.model.MemberDAO" scope="session"/>
<%

	
	String currentURL = MyUtil.getCurrentURL(request);
	// member/memberDetail.jsp?idx=164&goBackURL=member/memberList.jsp?currentShowPageNo=8&sizePerPage=5

	String goBackURL = currentURL.substring(currentURL.indexOf("goBackURL="));
	// goBackURL=member/memberList.jsp?currentShowPageNo=8&sizePerPage=5
	
	goBackURL =  goBackURL.substring(goBackURL.indexOf("/")+1);		
	// memberList.jsp?currentShowPageNo=8&sizePerPage=5
	
	
	
	MemberVO vo = new MemberVO();
	String idx = request.getParameter("idx");
	
	
	try{
		vo = mdao.getMember(idx);
		
	}catch(SQLException e){
%>		<script type="text/javascript">
		alert("비정상적인 경로로 들어왔습니다");
		location.href = "javascript:history.back();";//이전페이지로 이동
		// 또는
		/*
			location.href = "javascript:history.go(-2);";
			location.href = "javascript:history.go(-1);";
			location.href = "javascript:history.go(-0);";
		*/
	</script>	
<%		
		
	}
	
%>
<script type="text/javascript">
	
	function goMemberList(goBackURL){
		
		location.href = goBackURL;
		
	}

</script>
<table class="outline">
	<thead>
		<tr>
	   		<th class="th">회원번호</th>
	   		<th class="th">회원명</th>
			<th class="th">아이디</th>
			<th class="th">이메일</th>
			<th class="th">휴대폰</th>
			<th class="th">주소</th>
			<th class="th">가입일자</th>
		</tr>
	</thead>
	
	<tbody>
		<tr>
			<td class="td"><%= vo.getIdx() %></td>
	   		<td class="td"><%= vo.getName() %></td>
			<td class="td"><%= vo.getUserid()%></td>
			<td class="td"><%= vo.getEmail() %></td>
			<td class="td"><%= vo.getAllHp() %></td>
			<td class="td"><%= vo.getAllAddr() %> (<%= vo.getAllPost() %>)  </td>
			<td class="td"><%= vo.getRegisterday() %> </td>
		</tr>
	</tbody>
</table>
<button onClick="goMemberList('<%= goBackURL %>');">돌아가기</button>

<jsp:include page="../footer.jsp" />