<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<Map<String, Object>> articleListMap = (List<Map<String, Object>>) request.getAttribute("articleListMap");
	int cPage = (int) request.getAttribute("page");
	int totalPage = (int) request.getAttribute("totalPage");
	int totalCount = (int) request.getAttribute("totalCount");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 리스트</title>
</head>
<body>
	<div><a href="../home/main">홈으로 돌아가기</a></div>
	<h1>게시물 리스트</h1>
	<h2>전체 게시글 수 : <%= totalCount %>개</h2>
	<button><a href="write" style='color : inherit; text-decoration : none;'>글쓰기</a></button>
	
	<table border="1" bordercolor="green">
		<colgroup>
			<col />
			<col width="200">
		</colgroup>
		<tr>
			<th>번호</th>
			<th>날짜</th>
			<th>제목</th>
		</tr>
		
		<%for(Map<String, Object> articleMap : articleListMap){ %>
			<tr>
				<td><%= articleMap.get("id") %></td>
				<td><%= articleMap.get("regDate") %></td>
				<td><a href="detail?id=<%= articleMap.get("id") %>"><%= articleMap.get("title") %></a></td>
			</tr>
		<% 
		} 
		%>
	</table>
	<style type="text/css">
		.paging > a.red {
			color : inherit;
			text-decoration : none;
			cursor : inherit;
		}
	</style>
	
	<div class="paging">
		<% 
			if (cPage > 1) {
		%>
				<a href="list?page=1">◀</a>
		<%
			}
		%>		
		<%
		int pageSize = 10;
		int from = ((cPage - 1) / pageSize) * pageSize + 1;
		int end = from + pageSize - 1;
		
		if (cPage > totalPage) cPage = totalPage;
		if (end > totalPage) end = totalPage;
		
		for (int i = from; i <= end; i++) { 
		%>
		<a class="<%= cPage == i ? "red" : ""%> "href="list?page=<%= i %>"><%= i %></a>
		<%
		} 
		%>
		
		<% 
			if (cPage < totalPage) {
		%>
				<a href="list?page=<%= totalPage %>">▶</a>
		<%
			}
		%>	
	</div>
</body>
</html>