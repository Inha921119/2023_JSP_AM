<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<Map<String, Object>> articleListMap = (List<Map<String, Object>>) request.getAttribute("articleListMap");
	int cPage = (int) request.getAttribute("page");
	int from = (int) request.getAttribute("from");
	int end = (int) request.getAttribute("end");
	int totalPage = (int) request.getAttribute("totalPage");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 리스트</title>
</head>
<body>
	<h1>게시물 리스트</h1>
	
	<div>
		<a href="../home/main">메인으로 돌아가기</a>
	</div>
	<div>
		<a href="write">글쓰기</a>
	</div>
	
	<table border="1">
		<colgroup>
			<col />
			<col width="200"/>
		</colgroup>
		<tr>
			<th>번호</th>
			<th>날짜</th>
			<th>제목</th>
			<th>작성자</th>
		</tr>
		
		<% 
 		for(Map<String, Object> articleMap : articleListMap) {
		%>
			<tr>
				<td><%= articleMap.get("id") %></td>
				<td><%= articleMap.get("regDate") %></td>
				<td><a href="detail?id=<%= articleMap.get("id") %>"><%= articleMap.get("title") %></a></td>
				<td><%= articleMap.get("loginId") %></td>
			</tr>	
		<% 
 		}
 		%>
	</table>
	
	<style type="text/css">
		.paging > a.red {
			color : red;
			font-size: 1.2rem;
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
		for (int i = from; i <= end; i++) { 
		%>
			<a class="<%= cPage == i ? "red" : ""%>" href="list?page=<%= i %>"><%= i %></a>
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
	
	<form action="list">
		<select name="search-option" id="search-choose">
			<option value="title">제목</option>
			<option value="body">내용</option>
			<option value="titleBody">제목+내용</option>
		</select>
		<input type="text" name="search-keyword" placeholder="검색어를 입력하세요">
		<button>검색</button>
	</form>
</body>
</html>