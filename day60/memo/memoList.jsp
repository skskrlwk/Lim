<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" />

<%
	List<HashMap<String, String>> memolist = (List<HashMap<String, String>>)request.getAttribute("memoList");
%>	
	<table style="width: 95%;" class ="outline">
		<thead>
			<tr>
				<th width="5%" style="text-align: center;" >글번호</th>
				<th width="40%" style="text-align: center;">글내용</th>
				<th width="20%" style="text-align: center;">작성일자</th>
				<th width="10%" style="text-align: center;">IP주소</th>
				<th width="10%" style="text-align: center;">작성자</th>
				<th width="10%" style="text-align: center;">email</th>
			</tr>
		</thead>
		<tbody>
<%
	if(memolist == null){
%>		
			<tr>
				<td colspan="6">데이터가 없습니다.</td>
			</tr>	

<%			
	}else{
		for(HashMap<String, String> map :memolist){
%>			
			<tr>
				<td style="text-align: center;" ><%= map.get("idx") %></td>
				<td style="text-align: center;" ><%= map.get("msg").replaceAll("<", "&lt;") %></td> 
				<%-- HTML 에서 &nbsp; 공백      &lt; 부등호(<)   &gt; 부등호(>)   &amp; (&)   &quot;  " 이다 --%>
				<%-- <td style="text-align: center;" ><%= map.get("msg")%></td> --%> 
				<td style="text-align: center;" ><%= map.get("writedate") %></td>
				<td style="text-align: center;" ><%= map.get("cip") %></td>
				<td style="text-align: center;" ><%= map.get("name") %></td>
				<td style="text-align: center;" ><%= map.get("email") %></td>
			</tr>
<%			
		}// end of for -------------------------------------
		
	}
%>
		</tbody>
	</table>

<jsp:include page="../footer.jsp" />