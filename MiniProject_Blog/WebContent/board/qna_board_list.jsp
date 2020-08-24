<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="net.board.db.*" %>
<%
	String id = null;
	if(session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	}
	List boardList = (List)request.getAttribute("boardlist");
	int listcount = ((Integer)request.getAttribute("listcount")).intValue();
	int nowpage = ((Integer)request.getAttribute("page")).intValue();
	int maxpage = ((Integer)request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer)request.getAttribute("startpage")).intValue();
	int endpage = ((Integer)request.getAttribute("endpage")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
	<title>JUNG BLOG_BOARD</title>
	<link rel="shortcut icon" href="img/favicon.ico">
	<link rel="icon" href="img/favicon.ico">
	<style>
		body {
			margin: 0;
			padding: 0;
			width: 100%;
			height: auto;
			color: black;
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
			width: 50%;
			height: auto;
			margin-top: 30px;
			border-collapse: collapse;
		}
		
		thead th {
    		padding: 10px;
    		font-weight: bold;
    		vertical-align: top;
    		color: black;
   			border-bottom: 2px solid black;
   			border-top: 2px solid black;
		}
		
		tbody td {
			padding: 10px;
			border-bottom: 1px solid gray;
		}
		
		tbody th {
			padding: 10px;
		}
		
		.board_main a {
			text-decoration: none;
			color: black;
		}
		
		.board_search {
			text-align: center;
			margin-top: -50px;
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
	<section>
		<div class="board_main">
		<h1>FREE BOARD</h1>
		<table align="center">
			<thead>
			<tr>
				<th>
					<div>번호</div>
				</th >
				<th width="40%">
					<div>제목</div>
				</th>
				<th>
					<div>글쓴이</div>
				</th>
				<th>
					<div>날짜</div>
				</th>
				<th>
					<div>조회수</div>
				</th>
			</tr>
			</thead>
			<tbody>
			<%
				int num = listcount - ((nowpage - 1) * 10);
				for(int i = 0; i < boardList.size(); i++) {
					BoardBean bl = (BoardBean)boardList.get(i);
			%>
			<tr>
				<td>
					<%=num %>
				</td>
				<td>
					<div>
					<%if(bl.getBOARD_RE_LEV() != 0) { %>
						<%for(int a = 0; a <= bl.getBOARD_RE_LEV() * 2; a++) { %>
						&nbsp;&nbsp;
						<%} %>
							&rdca;
						<%} else {%>
							
						<%} %>
						<a href="./BoardDetailAction.bo?num=<%=bl.getBOARD_NUM() %>">
							<%=bl.getBOARD_SUBJECT() %>
						</a>
					</div>
				</td>
				<td>
					<div><%=bl.getBOARD_ID() %></div>
				</td>
				<td>
					<div><%=bl.getBOARD_DATE() %></div>
				</td>
				<td>
					<div><%=bl.getBOARD_READCOUNT() %></div>
				</td>
			</tr>
			<%
				num--;
				} %>
			</tbody>
			<tbody>
			<tr>
				<th colspan="7">
					<%if(nowpage <= 1) { %>
						&lt;&nbsp;
					<%} else {%>
						<a href="./BoardList.bo?page=<%=nowpage-1 %>">&lt;</a>&nbsp;
					<%} %>
					
					<%for(int a = startpage; a <= endpage; a++) {
						if(a == nowpage) {%>
							[<%=a %>]
						<%} else { %>
							<a href="./BoardList.bo?page=<%=a %>">[<%=a %>]</a>
						<%} %>
					<%} %>
				
					<%if(nowpage >= maxpage) { %>
						&gt;
					<%} else { %>
						<a href="./BoardList.bo?page=<%=nowpage+1 %>">&gt;</a>
					<%} %>
				</th>
			</tr>
			<tr align="right">
				<th colspan="5">
					<a href="./BoardWrite.bo">[글쓰기]</a>
				</th>
			</tr>
			<tr align="right">
				<th colspan="5">
					<font size="2">글 개수 : ${listcount }</font>
				</th>
			</tr>
			</tbody>
		</table>
		<div class="board_search">
		<form name="search_list" action="BoardSearchAction.bo" method="get">
			<select name="col">
				<option value="BOARD_SUBJECT">제목</option>
				<option value="BOARD_ID">글쓴이</option>
				<option value="BOARD_CONTENT">내용</option>
			</select>
			<input type="text" name="word">
			<button type="submit">조회</button>
		</form>
		</div>
		</div>
	</section>
</body>
</html>