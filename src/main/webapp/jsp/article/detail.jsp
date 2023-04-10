<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	Map<String, Object> articleRow = (Map) request.getAttribute("articleRow");
	int loginedMemberId = (int) request.getAttribute("loginedMemberId");
%>

<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세보기</title>
</head>
<body>
	<h1><%= (int) articleRow.get("id") %>번 게시물</h1>
	
	<div>번호 : <%= (int) articleRow.get("id") %></div>
	<div>날짜 : <%= (LocalDateTime) articleRow.get("regDate") %></div>
	<div>제목 : <%= (String) articleRow.get("title") %></div>
	<div>작성자 : <%= (String) articleRow.get("loginId") %></div>
	<div>내용 : <%= (String) articleRow.get("body") %></div>
	
	<button><a href="list" style='color : inherit; text-decoration : none;'>목록</a></button>
	<button><a href="modify?id=<%= articleRow.get("id") %>" style='color : inherit; text-decoration : none;'>수정</a></button>
	<%
	if (loginedMemberId == (int) articleRow.get("id")) {
	%>
	<button><a href="doDelete?id=<%= articleRow.get("id") %>" style='color : inherit; text-decoration : none;' onclick="if(confirm('삭제하시겠습니까?') == false) return false;">삭제</a></button>
	<%
	}
	%>
</body>
</html>