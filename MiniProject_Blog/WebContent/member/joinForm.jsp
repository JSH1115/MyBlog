<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JUNG BLOG_SIGN UP</title>
	<link rel="shortcut icon" href="img/favicon.ico">
	<link rel="icon" href="img/favicon.ico">
	<style>
		body {
			background-image: url('img/2.png');
			background-repeat: no-repeat;
			background-size : cover;
			margin: 0;
			padding: 0;
			color: white;
		}
		
		.signUp_form {
			width: 450px;
			height: 500px;
			margin: 200px auto;
			text-align: center;
			border: 1px solid white;
			border-radius: 10px;
		}
		
		.signUp_form input {
			width: 220px;
			height: 25px;
			margin-top: 5px;
			border-radius: 5px;
			margin-bottom: 5px;
		}
		
		.signUp_button {
			padding-top: 32px;
		}
		
		.signUp_button a {
			font-size: 16px;
			outline: 0;
			background-color: rgba(0, 0, 0, 0.0);
			color: white;
			border: 1px solid white;
			border-radius: 5px;
			text-decoration: none;
			margin: 0 10px;
			padding: 0 10px;
		}
		
		.signUp_button a:hover {
			font-weight: bold;
		}
		
	</style>
	<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
	<script>
		$(document).ready(function() {
	     	document.getElementById("btnSend").onclick = chkData;
		});

		function chkData() {
			var all_chk = /^[A-Za-z0-9+]*$/;
			var num_chk = /^[0-9]+$/;
			var kor_chk = /^[가-힣]+$/;
			
			if($("#ID").val() == "") {
				alert("아이디를 입력하세요!");
				$("#ID").focus();
				return false;
			}
			
			if($("#ID").val().length < 5) {
				alert("아이디는 최소5 자리 입니다!");
				$("#ID").focus();
				return false;
			} else if(!all_chk.test($("#ID").val())) {
				alert("아이디는 영어나 숫자만 사용 가능합니다!");
				$("#ID").focus();
				return false;
			}
			
			if($("#PW").val() == "") {
				alert("비밀번호를 입력하세요!");
				$("#PW").focus();
				return false;
			}
			
			if($("#PW").val().length < 5) {
				alert("비밀번호는 최소5 자리 입니다!");
				$("#PW").focus();
				return false;
			} else if(!all_chk.test($("#PW").val())) {
				alert("비밀번호는 영어나 숫자만 사용 가능합니다!");
				$("#PW").focus();
				return false;
			}
			
			if($("#NAME").val() == "") {
				alert("이름을 입력하세요!");
				$("#NAME").focus();
				return false;
			}
			
			if(!kor_chk.test($("#NAME").val())) {
				alert("이름은 한글만 가능합니다!");
				$("#NAME").focus();
				return false;
			}
			
			if($("#AGE").val() == "") {
				alert("나이을 입력하세요!");
				$("#AGE").focus();
				return false;
			}
			
			if(!num_chk.test($("#AGE").val())) {
				alert("나이는 숫자만 입력 가능합니다!");
				$("#AGE").focus();
				return false;
			}
			
			if($("#EMAIL").val() == "") {
				alert("이메일을 입력하세요!");
				$("#EMAIL").focus();
				return false;
			}
			
			alert("회원가입 완료!");
		}
	</script>
</head>
<body>
	<div class="signUp_form">
		<h1>Sign Up</h1>
		<form name="joinform" action="./MemberJoinAction.me" method="post">
			<b>ID</b><br>
			<input type="text" name="MEMBER_ID" id="ID" maxlength="10" 
			       placeholder=" 최소5~최대10, 숫자와 알파벳만 사용"/><br> 
			<b>PASSWORD</b><br>
			<input type="password" name="MEMBER_PW" id="PW" maxlength="10"
				   placeholder=" 최소5~최대10, 숫자와 알파벳만 사용"/><br>
			<b>NAME</b><br>
			<input type="text" name="MEMBER_NAME" id="NAME" maxlength="15" 
			       placeholder=" 이름 입력(한글)"/><br> 
			<b>AGE</b><br>
			<input type="text" name="MEMBER_AGE" id="AGE" maxlength="2"
			       placeholder=" 나이 입력"/><br>
			<b>EMAIL</b><br>
			<input type="text" name="MEMBER_EMAIL" id="EMAIL" maxlength="50"
			       placeholder=" 이메일 입력"/><br> 
			<div class="signUp_button">
				<a href="javascript:joinform.submit()" id="btnSend">Submit</a>&nbsp;
				<a href="javascript:joinform.reset()">Reset</a>&nbsp;
				<a href="MemberLogin.me">Login Page</a>
			</div>
		</form>
	</div>
</body>
</html>