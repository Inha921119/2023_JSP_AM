<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
</head>
<body>
	<h1>게시물 작성</h1>
	
	<form action="doWrite" method="POST">
		<div>
			제목 : <input name="title" type="text" placeholder="제목을 입력해주세요">
		</div>
		<div>
			내용 : <textarea name="body" cols="200" rows="50" type="text" placeholder="내용을 입력해주세요"></textarea>
		</div>
		
		<button>작성</button>
	</form>
		<button><a href="list" style='color : inherit; text-decoration : none;'>목록</a></button>
</body>
</html>