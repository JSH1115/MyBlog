<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JUNG BLOG_LOGIN</title>
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
		
		.login_form {
			width: 450px;
			height: 500px;
			margin: 200px auto;
			text-align: center;
			border: 1px solid white;
			border-radius: 10px;
		}
		
		.login_form input {
			width: 300px;
			height: 35px;
			margin-top: 20px;
			border-radius: 5px;
			font-size: 15px;
		}
		
		.login_form b {
			font-size: 18px;
		}
		
		.login_button {
			padding-top: 50px;
			border: 0;
		}
		
		.login_button a {
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
		
		.login_button a:hover {
			font-weight: bold;
		}
	</style>
	<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
	<script>
		$(document).ready(function() {
     		document.getElementById("btnSend").onclick = chkData;
		});
		
		function chkData() {
			
			if($("#ID").val() == "") {
				alert("아이디를 입력하세요!");
				$("#ID").focus();
				return false;
			} 
			
			if($("#PW").val() == "") {
				alert("비밀번호를 입력하세요!");
				$("#PW").focus();
				return false;
			}
		}
	</script>
</head>
<body>
	<div class="login_form">
		<br><h1>Login</h1>
		<p>Welcome to JUNG Blog!</p>
		<form name="loginform" action="./MemberLoginAction.me" method="post">
			<b>ID</b><br>
			<input type="text" name="MEMBER_ID" id="ID" placeholder=" ID 입력"><br><br>
			<b>PASSWORD</b><br>
			<input type="password" name="MEMBER_PW" id="PW" placeholder=" PW 입력"><br>
			<div class="login_button">
				<a href="javascript:loginform.submit()" id="btnSend">Login</a><br><br>
				<a href="MemberJoin.me">Sign Up</a>
				<a href="BlogEnglish.me">HOME</a>
			</div>
		</form>
	</div>
</body>
</html>