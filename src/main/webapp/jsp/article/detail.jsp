<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String inputId = request.getParameter("id");
	if (inputId == null) {
		inputId = "1";
	}
	
	int id = Integer.parseInt(inputId);
	
	
	List<Map<String, Object>> articleListMap = (List<Map<String, Object>>) request.getAttribute("articleListMap");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(<%=id %>)번 게시물</title>
</head>
<body>
	<h1>(<%=id %>)번 게시물</h1>
	<ul>
		<li>번호 : <%= articleListMap.get(0).get("id") %></li>
		<li>날짜 : <%= articleListMap.get(1).get("regDate") %></li>
		<li>제목 : <%= articleListMap.get(2).get("title") %></li>
		<li>내용 : <%= articleListMap.get(2).get("body") %></li>
	</ul>
</body>
</html>