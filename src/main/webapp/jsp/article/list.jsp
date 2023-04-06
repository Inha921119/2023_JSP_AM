<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<Map<String, Object>> articleListMap = (List<Map<String, Object>>) request.getAttribute("articleListMap");
	int cPage = (int) request.getAttribute("page");
	int totalPage = (int) request.getAttribute("totalPage");
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
		<% for (int i = 1; i <= 10; i++) { %>
		<a class="<%= cPage == i ? "red" : ""%> "href="list?page=<%= i %>"><%= i %></a>
		<% } %>
	</div>
</body>
</html>