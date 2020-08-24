<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.board.db.*" %>
<%
	String id = (String)session.getAttribute("id");
	BoardBean board = (BoardBean)request.getAttribute("boarddata");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JUNG BLOG_BOARD</title>
	<link rel="shortcut icon" href="img/favicon.ico">
	<link rel="icon" href="img/favicon.ico">
	<style>
		body {
			margin: 0;
			padding: 0;
			width: 100%;
			height: 940px;
			color: black;
			position: fixed;
		}
		
		a {
			text-decoration: none;
		}
		
		a:hover {
			font-weight: bold;
		}
		
		.header {
			width: 100%;
			height: 80px;
			background-color: black;
			color: white;
		}
		
		.info {
			width: 100%;
			background-color: black;
			color: white;
			font-size: 13px;
		}
		
		.info a {
			color: white;
		}
		
		.header_menu ul {
			text-align: center;
		}
		
		.header_menu ul li {
			display: inline;
      		list-style: none;
      		padding: 0 12px;
			font-size: 17px;
		}
		
		.header_menu a {
			color: white;
		}
		
		.board_main {
			width: 100%;
			height: auto;
			margin: 100px auto;
			text-align: center;
		}
		
		table {
			border-top: 1px solid gray;
    		border-left: 1px solid gray;
			border-collapse: collapse;
		}
		
		table th {
			border-right: 1px solid gray;
    		border-bottom: 1px solid gray;
    		background: #efefef;
			padding: 10px;
		}
		
		table td {
			border-right: 1px solid gray;
    		border-bottom: 1px solid gray;
			padding: 10px;
		}
		
		.board_main a {
			text-decoration: none;
			color: black;
		}
	</style>
	<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
	<script>
		$(document).ready(function() {
 			document.getElementById("board_chk").onclick = chkData;
		});
		
		function chkData() {
			
			if($("#subject").val() == "") {
				alert("제목을 입력하세요!");
				$("#subject").focus();
				return false;
			} 
			
		}
		
		function replyboard() {
			boardform.submit();
		}
	</script>
</head>
<body>
	<header>
		<div class="header">
			<div class="info">
				&nbsp;<%=id %>님 환영합니다!&nbsp;
				<%
					if(id.equals("admin")) {
						out.println("<a href='MemberListAction.me'>MemberList</a>");
					} else {
						out.println("<a>MyInfo</a>");
					}
			
					if(session.getAttribute("id") != null) {
						out.println("<a href='MemberLogoutAction.me'>Logout</a>");
					}
				%>
			</div>
			<div class="header_menu">
				<ul>
					<li><a href="BlogEnglish.me">MAIN</a></li>
					<li><a href="BoardList.bo">FREE BOARD</a></li>
					<li><a>Q&A</a></li>
				</ul>
			</div>
		</div>
	</header>
	<div class="board_main">
		<h1 style="font-size: 24px;">FREE BOARD</h1>
		<form action="./BoardReplyView.bo" method="post" name="boardform">
			<input type="hidden" name="BOARD_NUM" value="<%=board.getBOARD_NUM() %>">  
			<input type="hidden" name="BOARD_RE_REF" value="<%=board.getBOARD_RE_REF() %>">
			<input type="hidden" name="BOARD_RE_LEV" value="<%=board.getBOARD_RE_LEV() %>"> 
			<input type="hidden" name="BOARD_RE_SEQ" value="<%=board.getBOARD_RE_SEQ() %>">
			<input type="hidden" name="BOARD_ID" value="<%=id %>">
			<table align="center">
				<tr>
					<th>
						<div align="left">글쓴이</div>
					</th>
					<td>
						<div align="left"><%=id %></div>
					</td>
				</tr>
				<tr>
					<th>
						<div align="left">제목</div>
					</th>
					<td>
						<div align="left">
							<input name="BOARD_SUBJECT" id="subject" type="text" size="50"
					               maxlength="100" value="Re:<%=board.getBOARD_SUBJECT() %>">
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div align="left">내 용</div>
					</th>
					<td>
						<textarea name="BOARD_CONTENT" cols="67"
						      	  rows="15"></textarea>
					</td>
				</tr>
				<tr align="center" valign="middle">
					<td colspan="5">
						<a href="javascript:replyboard()" id="board_chk">[등록]</a>&nbsp;&nbsp;
						<a href="javascript:history.go(-1)">[뒤로]</a>&nbsp;&nbsp;
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>