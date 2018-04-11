<%@page import="member.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" />

<jsp:useBean id="mdao" class ="member.model.MemberDAO" scope="session"/>
<%
	// 한페이지당 보여줄 해의 갯수(3개 ro 5개 or 10개) 정하기
	String str_sizePerPage = request.getParameter("sizePerPage");
	
	int sizePerPage = 0;

	if(str_sizePerPage == null){
		sizePerPage = 10;
		
	}else{
		
		try{
			sizePerPage = Integer.parseInt(str_sizePerPage); 
			
			if(sizePerPage != 3 && sizePerPage != 5 && sizePerPage != 10){
				sizePerPage = 10;
			}
			
		}catch(NumberFormatException e){
			sizePerPage = 10;
		}
		
		
	}// end of if ~ else --------------------------------

	// *** 웹브라우저 하단부에 페이지번호(페이지바) 나타내어 주기
	
	// 1. 총 회원갯수를 알아오기
	int totalMemberCount = 0;
	totalMemberCount = mdao.getTotalCount();
	
	int totalPage = (int)Math.ceil( (double)totalMemberCount / sizePerPage );

	
	List<MemberVO> memberList = null;

	//페이징 처리하기 이전의 전체회원 목록 가져오기
	// memberList = mdao.getAllMember();
	
	String str_currentShowPageNo =request.getParameter("currentShowPageNo");
	int currentShowPageNo = 0; // 사용자가 보고자 하는 페이지 번호
	
	if(str_currentShowPageNo == null){
		// 초기화면은 현재 페이지번호를 1페이지로 설정한다.
		currentShowPageNo = 1;
		
	}else{
		// 사용자가 특정 페이지를 보고자하는 경우이다.
		try{
			currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
			
			if(currentShowPageNo > totalPage || currentShowPageNo < 1 ){
				currentShowPageNo = 1;
			}
			
		}catch(NumberFormatException e){
			currentShowPageNo = 1;
		}
		
		
	}
	
	// 페이징 처리한 전체회원 목록가져오기
	memberList = mdao.getAllMember(currentShowPageNo, sizePerPage);

	
%>



<style type="text/css">
	.th {text-align: center;}
	.td {text-align: center;}
	a:hover {text-decoration: none;}

</style>

<script type="text/javascript">
	
	$(document).ready(function (){
		
		$("#idx").hide(); 
		$("#sizePerPage").val("<%= sizePerPage %>");
		
		$("#sizePerPage").bind("change", function(){ // 셀렉트박스의 값이 변경될때 실행
			var frm = document.memberFrm;
			frm.method = "get";
			frm.action = "memberList.jsp";
			frm.submit();
			
		});// end of ("#sizePerPage").bind("change")----------------------------
		
	});
	
	function goDel(idx){
	
		var bool = confirm(idx+"번 회원을 삭제하시겠습니까?"); // 확인이면 true, 취소이면 false
		
		if(bool){
			
			var frm = document.delFrm;
			frm.idx.value = idx;
			frm.method = "post";
			frm.action = "memberDelete.jsp"
			frm.submit();
			
		}
		
		
	}

</script>

<h2>::: 회원전체 정보보기 :::</h2>

<form name="memberFrm">
	
	<div>
		<span style="color: red; font-weight: bold; font-size: 12pt;">페이지당 회원명수</span>
		<select id="sizePerPage" name="sizePerPage">
			<option value="10" selected>10</option>
			<option value="5">5</option>
			<option value="3">3</option>
		</select>
	</div>

</form>


<table class="outline">
	<thead>
		<tr>
	   		<th class="th">회원번호</th>
	   		<th class="th">회원명</th>
			<th class="th">아이디</th>
			<th class="th">이메일</th>
			<th class="th">휴대폰</th>
			<th class="th">가입일자</th>
			<th class="th">수정&nbsp;|&nbsp;삭제</th>
		</tr>
	</thead>
	<tbody>
<%	 
	if(memberList != null){
		// 가입된 회원이 존재하는 경우	
		for(MemberVO mvo: memberList){
%>			<tr>
				<td class="td"><%= mvo.getIdx() %></td>
				<td class="td"><%= mvo.getName() %></td>
				<td class="td"><%= mvo.getUserid() %></td>
				<td class="td"><%= mvo.getEmail() %></td>
				<td class="td"><%= mvo.getAllHp() %></td>
				<td class="td"><%= mvo.getRegisterday() %></td>
				<td class="td">수정&nbsp;<a href="javascript:goDel('<%= mvo.getIdx() %>')" >삭제</a></td>
			</tr>
<%		}// end of for------------------------
		
	 } else {
		//  가입된 회원이 없는 경우
%>		
		<tr>
			<td colspan="7" style="text-align: center; color: red;">가입된 회원이 없습니다.</td>
		</tr>
<%	 }
%>
	</tbody>

	
	<thead>
		<tr>
			<th colspan="4" class="th">
<%			
		int pageNo = 1; // 실제 화면에 보여지는 페이지 번호이다.

		int blockSize = 10; // 1개 블럭(토막)당 보여지는 페이지번호의 수
		
		int loop = 1;	// loop 는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 수(지금은 10개)까지만 증가하는 용도
	
		pageNo = ( (currentShowPageNo - 1) / blockSize ) * blockSize + 1 ;
		/*
			1 2 3 4 5 6 7 8 9 10 -- 첫번째 블럭의 페이지번호 시작값(pageNo)은 1 이다.
			11 12 13 14 15 16 17 18 19 20 -- 두번째 블럭의 페이지번호 시작값(pageNo)은 11 이다.
		*/
		// **** [이전] 만들기 **** //
		if(pageNo == 1){
			// 공백으로 둔다.
		}else{
%>			<a href="memberList.jsp?currentShowPageNo=<%= pageNo-1 %>&sizePerPage=<%= sizePerPage %>">[이전]&nbsp;</a>	

<%		}
		
		while(!(loop > blockSize || pageNo > totalPage)){
			if(pageNo == currentShowPageNo){
%>				<span style="color: red; font-weight: bold; font-size: 13pt; text-decoration: underline; "><%= pageNo %></span>&nbsp;
				
<%			}else{
%>				<a href="memberList.jsp?currentShowPageNo=<%= pageNo %>&sizePerPage=<%= sizePerPage %>"><%= pageNo %></a>&nbsp;
<%			}
				
			pageNo++;
			loop++;
			
		}// end of while ----------------------------------
		
		// **** [다음] 만들기 **** //
		if(pageNo > totalPage) {
			// 공백으로 둔다.
		} else {
%>			<a href="memberList.jsp?currentShowPageNo=<%= pageNo %>&sizePerPage=<%= sizePerPage %>">[다음]</a>
			
<%		}
%>			
			
			
			</th>
			<th colspan="3">
				현재 <span style="color: red; font-weight: bold;">[<%= currentShowPageNo %>]</span> 페이지&nbsp;/ 총[<%= totalPage %>] 페이지
				회원수 : 총[<%= totalMemberCount  %>] 명
			</th>
		</tr>
	</thead>
	
	
</table>

<%-- 회원정보 삭제하는 폼생성하기 --%>

<form name="delFrm">
	<input type="text" id="idx" name="idx" />
</form>

<jsp:include page="../footer.jsp" />