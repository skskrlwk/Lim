<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, member.model.*, java.sql.*, util.my.*"  %>

<jsp:include page="../header.jsp" />

<jsp:useBean id="mdao" class="member.model.MemberDAO" scope="session" />

<%
   List<MemberVO> memberList = null; 
   
   // memberList = mdao.getAllMember();
   // 페이징 처리하기 이전의 전체회원 목록 가져오기   

   // *** 한페이지당 보여줄 행의 갯수(3개 or 5개 or 10개) 정하기  *** //
   String str_sizePerPage = request.getParameter("sizePerPage");

   int sizePerPage = 0;

   if(str_sizePerPage == null) {
	   sizePerPage = 10;
   }
   else {
	   try {
	         sizePerPage = Integer.parseInt(str_sizePerPage);
	   
	         if(sizePerPage != 3 && sizePerPage != 5 && sizePerPage != 10)
		        sizePerPage = 10;
	         
	       } catch(NumberFormatException e) {
		        sizePerPage = 10;
	       }
   } // end of if ~ else ------------------

 // *** 웹브라우저 하단부에 페이지번호(페이지바) 나타내어 주기 *** //
   // 1. 총 회원갯수를 알아오기
    int totalMemberCount = 0;
//  totalMemberCount = mdao.getTotalCount(); 
    // 검색이 없는 총회원갯수 알아오기
%>    

<%
	/* ===== 검색어 및 날짜구간 받아서 검색해주기 ===== */
	String searchType = request.getParameter("searchType");
    String searchWord = request.getParameter("searchWord");
    String period = request.getParameter("period");
    
    if(searchType == null)
    	searchType = "name";
    if(searchWord == null)
    	searchWord = "";
    if(period == null)
    	period = "";
%>

<%
    totalMemberCount = mdao.getTotalCount(searchType, searchWord, period);  
    // 검색되어진 회원갯수 알아오기
    
    int totalPage = (int)Math.ceil( (double)totalMemberCount/sizePerPage ) ;
    // 203/10 ==> 20 페이지
    // 203.0/10 ==> 20.3 페이지 ==> 21.0 페이지	==> 21 페이지 
    /* Math.ceil(20.3) ==> 21.0
       Math.ceil(20.9) ==> 21.0
       Math.ceil(20.0) ==> 20.0
       Math.ceil(21.0) ==> 21.0
    */
  // System.out.println("===> 확인용 totalPage : " + totalPage);
  // 확인용 totalPage : 21     
   
   String str_currentShowPageNo = request.getParameter("currentShowPageNo");
   int currentShowPageNo = 0; // 사용자가 보고자 하는 페이지 번호 
   
   if(str_currentShowPageNo == null) {
	   // 초기화면은 현재 페이지번호를 1 페이지로 설정한다.
	   currentShowPageNo = 1;
   }
   else {
	   // 사용자가 특정 페이지를 보고자 한 경우이다.
	   try {
	        currentShowPageNo = Integer.parseInt(str_currentShowPageNo);

	        if(currentShowPageNo > totalPage || currentShowPageNo < 1)
	        	currentShowPageNo = 1;
	        
	   } catch(NumberFormatException e){
		    currentShowPageNo = 1;
	   }
   }
   
   // 페이징 처리한 전체회원 목록 가져오기
   memberList = mdao.getAllMember(currentShowPageNo, sizePerPage); 
   
   // 페이징 처리한 검색어 및 날짜구간 검색된 회원 목록 가져오기
   if(searchWord != null) {
   	  memberList = mdao.getSearchMember(currentShowPageNo, sizePerPage, searchType, searchWord, period); 
   }
%>

<%
   /* ==== 회원삭제(회원변경)후 돌아갈 URL 페이지의 값을 알기 위해서
                    먼저 현재 URL 주소를 얻어오기 ====  */
    String currentURL = MyUtil.getCurrentURL(request);
%>

<style type="text/css">
    .th {text-align: center;}
    .td {text-align: center;}
    a:hover {text-decoration: none;}
    
    .namestyle {background-color: cyan;  /* cyan ==> 하늘색 */
                font-weight: bold;
                font-size: 12pt;
                color: blue;
                cursor: pointer; }
</style>

<script type="text/javascript">

	$(document).ready(function(){
		
		$("#sizePerPage").val("<%= sizePerPage %>");
		
		$("#searchType").val("<%= searchType %>");
		$("#searchWord").val("<%= searchWord %>");
		$("#period").val("<%= period %>");
				
		$("#sizePerPage").bind("change", function(){
			// 확인용
			// alert("페이지당 회원수의 숫자가 변경되었습니다."); 
			var frm = document.memberFrm;
			frm.method = "get";
			frm.action = "memberList.jsp";
			frm.submit();
		});// end of $("#sizePerPage").bind("change")----------
		
		$("#period").bind("change", function(){
			var frm = document.memberFrm;
			frm.method = "get";
			frm.action = "memberList.jsp";
			frm.submit();
		});// end of $("#period").bind("change")----------

		$("#searchWord").keydown(function(event){
		    if(event.keyCode == 13) {
		    	// 엔터를 했을 경우
		    	goSearch();
		    }
		});
		
		// *** currentURL 값 확인용 ***
   <%-- console.log("<%= currentURL %>"); --%>
		
		// *** queryString 값 확인용 ***
   <%-- console.log("<%= queryString %>"); --%>
		
		// *** currentURL 값 확인용 ***
		console.log("<%= currentURL %>");
		
		$(".name").hover(function(){
			                $(this).addClass("namestyle"); 
		                 }
		                ,function(){
    	                	$(this).removeClass("namestyle"); 	
		                } );
		
	});// end of $(document).ready()----------------
	
	
	function goDel(idx) {
		
		var bool = confirm(idx + "번 회원을 정말로 삭제하시겠습니까?"); 
	//	alert(bool); ==> 확인이면 true, 취소이면 false
	
	    if(bool) {
	    	var frm = document.delFrm;
	    	frm.idx.value = idx;
	    	frm.goBackURL.value = "<%= currentURL %>";
	    	frm.method = "post";
	    	frm.action = "memberDelete.jsp";
	    	frm.submit();
	    }
		
	}// end of goDel(idx)----------------------
	
	
	function goEdit(idx) {
		
		// 팝업창 띄우기
		var url = "memberEdit.jsp?idx="+idx;
		
		window.open(url, "memberEdit",
				    "left=350px, top=100px, width=700px, height=630px");
		
	}// end of goEdit(idx)---------------------
	
	
	function goSearch() {
	
	   var searchWord =	$("#searchWord").val().trim(); 
	   
	   if(searchWord == "") {
		   alert("검색어를 입력하세요!!");
		   return;
	   }
	   else {
		   var frm = document.memberFrm;
		   frm.method = "get";
		   frm.action = "memberList.jsp";
		   frm.submit();
	   }
		
	}// end of goSearch()----------------------
	
</script>

<h2 style="margin-bottom: 40px;">::: 회원전체 정보보기 :::</h2>

<form name="memberFrm">
	<select name="searchType" id="searchType">
		<option value="name" selected>회원명</option>
		<option value="userid">아이디</option>
		<option value="email">이메일</option>
	</select>
	<input type="text" name="searchWord" id="searchWord" size="25" class="box" style="margin-left: 10px; margin-right: 10px;" />
    <button type="button" onClick="goSearch();">검색</button>
    
    <div style="margin-top: 20px; margin-bottom: 20px;">
	    <div style="display: inline;">
		   <span style="color: red; font-weight: bold; font-size: 12pt;">페이지당 회원명수-</span>
		   <select id="sizePerPage" name="sizePerPage">
			   <option value="10" selected>10</option>
			   <option value="5">5</option>
			   <option value="3">3</option>
		   </select>
	    </div>
	
	    <div style="display: inline; margin-left: 20px;">
		   <select id="period" name="period">
			   <option value="" selected>날짜선택</option>
			   <option value="-1">전체</option>
			   <option value="3">최근 3일이내</option>
			   <option value="10">최근 10일이내</option>
			   <option value="30">최근 30일이내</option>
			   <option value="60">최근 60일이내</option>
		   </select>
	   </div>
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
    if(memberList != null) {
    	// 가입된 회원이 존재하는 경우
    	for(MemberVO mvo : memberList) {
%>    	
    	<tr>
    		<td class="td"><%= mvo.getIdx() %></td>
    		<td class="td name" onClick="javascript:location.href='memberDetail.jsp?idx=<%= mvo.getIdx() %>&goBackURL=<%= currentURL %>'"><%= mvo.getName() %></td>
    		<td class="td"><%= mvo.getUserid() %></td>
    		<td class="td"><%= mvo.getEmail() %></td>
    		<td class="td"><%= mvo.getAllHp() %></td>
    		<td class="td"><%= mvo.getRegisterday() %></td>
    		<td class="td"><a href="javascript:goEdit('<%= mvo.getIdx() %>');">수정</a>&nbsp;<a href="javascript:goDel('<%= mvo.getIdx() %>');">삭제</a></td> 
    	</tr>	
<%
    	}// end of for------------------
    }
    else {
    	// 가입된 회원이 없는 경우
%>    	
    	<tr>
    		<td colspan="7" style="text-align: center; color: red;" >가입된 회원이 없습니다.</td>
    	</tr>
<%    }
%>
    </tbody> 
<%
 
    
%>    
    <thead>
    	<tr>
    		<th colspan="4" class="th">
<%
        int pageNo = 1; // pageNo 가 실제 화면에 보여지는 페이지번호 이다. 
        
        int blockSize = 10; // 1개 블럭(토막)당 보여지는 페이지번호의 갯수.
        // 1 2 3 4 5 6 7 8 9 10  -- 1개블럭
        // 11 12 13 14 15 16 17 18 19 20  -- 1개블럭
        
        int loop = 1;
        /*
           loop 는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 갯수(지금은 10개)까지만 
                    증가하는 용도이다. 
        */
        
        pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;
        // !!!! 공식이다 !!!!
        
        /* 
           1 2 3 4 5 6 7 8 9 10  -- 첫번째 블럭의 페이지번호 시작값(pageNo)은 1 이다.
           11 12 13 14 15 16 17 18 19 20  -- 두번째 블럭의 페이지번호 시작값(pageNo)은 11 이다.
           
           currentShowPageNo     pageNo
           -----------------------------
                 1                 1  == ((1 - 1)/10) * 10 + 1
                 2                 1  == ((2 - 1)/10) * 10 + 1
                 3                 1
                 4                 1
                 5                 1
                 6                 1
                 7                 1 
                 8                 1
                 9                 1
                 10                1  == ((10 - 1)/10) * 10 + 1
                 11               11  == ((11 - 1)/10) * 10 + 1
                 12               11  == ((12 - 1)/10) * 10 + 1
                 13               11  == ((13 - 1)/10) * 10 + 1
                 14               11
                 15               11
                 16               11
                 17               11 
                 18               11
                 19               11
                 20               11  == ((20 - 1)/10) * 10 + 1
                 21               21  == ((21 - 1)/10) * 10 + 1
                 22               21  == ((22 - 1)/10) * 10 + 1
                 23               21
                 ...              ...
                 29               21
                 30               21  == ((30 - 1)/10) * 10 + 1
        */ 
        
     // **** [이전] 만들기 **** //	
     if(pageNo == 1) {
    	// 공백으로 둔다. 
     }
     else {
%>
    	 <a href="memberList.jsp?currentShowPageNo=<%= pageNo - 1 %>&sizePerPage=<%= sizePerPage %>&searchType=<%= searchType %>&searchWord=<%= searchWord %>&period=<%= period %>">[이전]</a>&nbsp;  
<%     }

	 while(!(loop > blockSize || pageNo > totalPage)) {
		if(pageNo == currentShowPageNo) {
%>
		<span style="color: red; font-size: 13pt; font-weight: bold; text-decoration: underline;"><%= pageNo %></span>&nbsp;	
<%		}
		else {
%>
			<a href="memberList.jsp?currentShowPageNo=<%= pageNo %>&sizePerPage=<%= sizePerPage %>&searchType=<%= searchType %>&searchWord=<%= searchWord %>&period=<%= period %>"><%= pageNo %></a>&nbsp;	
<%		}

	    pageNo++;
        loop++;
	 }// end of while----------------------
    		
    // **** [다음] 만들기 **** //
     if(pageNo > totalPage) {
        // 공백으로 둔다. 
     }
     else {
%>    	
    	<a href="memberList.jsp?currentShowPageNo=<%= pageNo %>&sizePerPage=<%= sizePerPage %>&searchType=<%= searchType %>&searchWord=<%= searchWord %>&period=<%= period %>">[다음]</a> 
<%    }
%>   
    		</th>
    		<th colspan="3">
    		  <span style="color: red; font-weight: bold; ">현재[<%= currentShowPageNo %>]페이지</span> / 총[<%= totalPage %>]페이지 &nbsp;	
    		  회원수 : 총&nbsp;<%= totalMemberCount %> 명
    		</th>
    	</tr>
    </thead>
</table>

<%-- 회원정보 삭제하는 폼생성하기 --%>
<form name="delFrm">
	<input type="hidden" name="idx" />
	<input type="hidden" name="goBackURL" />
</form>

<jsp:include page="../footer.jsp" />



