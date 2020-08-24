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
		<table align="center">
			<tr>
				<th>
					<div align="left">제목</div>
				</th>
				<td> 
					<div align="left"><%=board.getBOARD_SUBJECT() %></div>
				</td>
			</tr>
			<tr>
				<th>
					<div align="left">내 용</div>
				</th>
				<td style= "font-family:돋음; font-size:12">
					<table border="0" width="400" height="250"
						   style="table-layout:fixed">
						<tr>
							<td valign="top" style= "font-family:돋음; font-size:12">
								<div align="left">
									<%=board.getBOARD_CONTENT() %>
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<th>
					<div align="left">첨부파일</div>
				</th>
				<td>
				<%if(!(board.getBOARD_FILE() == null)) { %>
					<div align="left">
						<a href="./boardupload/<%=board.getBOARD_FILE() %>">
							<%=board.getBOARD_FILE() %>
						</a>
					</div>
				<%} %>
				</td>
			</tr>
			<tr>
				<td colspan="5">
					<font size="2">
						<a href="./BoardReplyAction.bo?num=<%=board.getBOARD_NUM() %>">
							[답변]
						</a>&nbsp;&nbsp;
						<a href="./BoardModify.bo?num=<%=board.getBOARD_NUM() %>">
							[수정]
						</a>&nbsp;&nbsp;
						<a href="./BoardDeleteAction.bo?num=<%=board.getBOARD_NUM() %>">
							[삭제]
						</a>&nbsp;&nbsp;
						<a href="./BoardList.bo">
							[목록]
						</a>&nbsp;&nbsp;
					</font>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>