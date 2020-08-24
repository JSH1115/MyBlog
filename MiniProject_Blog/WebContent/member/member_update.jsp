<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.member.db.*" %>
<%
	MemberBean member =(MemberBean)request.getAttribute("member");	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>admin_Page</title>
	<link rel="shortcut icon" href="img/favicon.ico">
	<link rel="icon" href="img/favicon.ico">
	<style>
		body {
			margin: 0;
			padding: 0;
		}
		
		.member_update_div {
			margin: 200px auto;
			text-align: center;
			border: 1px solid black;
			width: 300px;
			height: 400px;
		}
		
		.update_item {
			margin-top: -20px;
		}
		
		.update_item input {
			width: 200px;
			height: 20px;
			margin-top: 5px;
			margin-bottom: 5px;
		}
		
		.update_button {
			padding-top: 20px;
		}
		
		a {
			text-decoration: none;
			color: black;
		}
		
		a:hover {
			font-weight: bold;
		}
	</style>
	<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
     		document.getElementById("btnSend").onclick = chkData;
		});
		
		function chkData() {
			var all_chk = /^[A-Za-z0-9+]*$/;
			var num_chk = /^[0-9]+$/;
		
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
			
			if($("#AGE").val() == "") {
				alert("나이를 입력하세요!");
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
			
		}
	</script>
</head>
<body>
	<div class="member_update_div">
		<h3><%=member.getMEMBER_NAME()%> 회원 변경</h3>
		<form name="updateform" action="./MemberUpdateCompleteAction.me" method="post">
			<input type="hidden" name="MEMBER_ID" value="<%=member.getMEMBER_ID()%>"><br>
			<input type="hidden" name="MEMBER_NAME" value="<%=member.getMEMBER_NAME()%>"/><br>
			<div class="update_item">
				<b>비밀번호 변경</b><br>
				<input type="password" name="MEMBER_PW" id="PW" maxlength="10"
				   	   placeholder=" 최소5~최대10, 숫자와 알파벳만 사용"/><br>	
				<b>나이 변경</b><br>
				<input type="text" name="MEMBER_AGE" id="AGE" maxlength="2"
			           placeholder=" 나이 입력"/><br>
				<b>이메일 변경</b><br>
				<input type="text" name="MEMBER_EMAIL" id="EMAIL" maxlength="50"
			           placeholder=" 이메일 입력"/><br>
			</div>
			<div class="update_button">
				<a href="javascript:updateform.submit()" id="btnSend">변경</a><br><br>
				<a href="javascript:updateform.reset()">초기화</a>
				<a href="MemberListAction.me">리스트로 돌아가기</a>
			</div>
		</form>
	</div>
</body>
</html>