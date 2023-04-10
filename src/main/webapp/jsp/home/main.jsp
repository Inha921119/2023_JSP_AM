<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int loginedMemberId = (int) request.getAttribute("loginedMemberId");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>
	<h1>메인 페이지</h1>
	
	<%
	if (loginedMemberId == -1) {
	%>
		<button><a href="../member/join" style='color : inherit; text-decoration : none;' >회원가입</a></button>
		<button><a href="../member/login" style='color : inherit; text-decoration : none;' >로그인</a></button>
	<%
	}
	%>
	
	<%
	if (loginedMemberId != -1) {
	%>
		<button><a href="../member/doLogout" style='color : inherit; text-decoration : none;' >로그아웃</a></<button>
	<%
	}
	%>
	
	<button><a href="../article/list" style='color : inherit; text-decoration : none;' >게시물 리스트</a></button>
	
</body>
</html>