<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h1>회원가입</h1>
	<script>
		function check() {
			let form = document.joinForm;
			
			if (form.loginId.value.trim() == "") {
				alert('아이디를 입력해주세요');
		      	return false;
			}
			if (form.loginPw.value.trim() == "") {
				alert('비밀번호를 입력해주세요');
		      	return false;
			}
			if (form.loginPwChk.value.trim() == "") {
				alert('비밀번호 확인을 입력해주세요');
		      	return false;
			}
			if (form.loginPw.value != form.loginPwChk.value) {
		      	alert( '비밀번호를 확인해주세요' );
		      	return false;
		    }
			
			if (form.name.value.trim() == "") {
				alert('이름을 입력해주세요');
		      	return false;
			}
			
			alert('%s님 회원가입이 완료되었습니다.', loginId);
		}	
	</script>
	
	<form action="doJoin" method="POST" onsubmit="return check();" name="joinForm">
		<div>
			아이디 : <input name="loginId" type="text" placeholder="아이디를 입력해주세요">
		</div>
		<div>
			비밀번호 : <input name="loginPw" type="text" placeholder="비밀번호를 입력해주세요">
		</div>
		<div>
			비밀번호 확인: <input name="loginPwChk" type="text" placeholder="비밀번호를 입력해주세요">
		<div>
			이름 : <input name="name" type="text" placeholder="이름를 입력해주세요">
		</div>
		
		<button>완료</button>
	</form>
		<button><a href="../home/main" style='color : inherit; text-decoration : none;'>뒤로가기</a></button>
</body>
</html>