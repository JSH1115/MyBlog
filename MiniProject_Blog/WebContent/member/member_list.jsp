<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="net.member.db.*" %>
<%
	List<MemberBean> memberlist = 
				(List<MemberBean>)request.getAttribute("memberlist");
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
		
		table {
    		border-collapse: collapse;
    		text-align: center;
    		line-height: 1.5;
    		width: 400px;
		}
		
		th {
			width: 150px;
   	 		padding: 10px;
    		font-weight: bold;
    		vertical-align: top;
    		border-bottom: 1px solid #ccc;
		}
		
		td {
    		padding: 10px;
   		 	vertical-align: top;
    		border-bottom: 1px solid #ccc;
		}
		
		.member_list_div {
			margin: 200px auto;
			text-align: center;	
			border: 1px solid black;
			width: 500px;
			height: 500px;
		}
		
		.member_list_div a {
			text-decoration: none;
			color: black;
		}
		
		.member_list_div a:hover {
			font-weight: bold;
		}
	</style>
</head>
<body>
	<div class="member_list_div">
		<h3>회원 관리</h3>
		<table border="1" align="center">
			<tr>
				<th>회원 이름</th>
				<th>회원 수정</th>
				<th>회원 탈퇴</th>
			</tr>
			<%
			for(int i = 0; i< memberlist.size(); i++) {
				MemberBean member = (MemberBean)memberlist.get(i);
			%>
			<tr>
				<td>
					<a href="MemberViewAction.me?id=<%=member.getMEMBER_ID() %>">
						<%=member.getMEMBER_ID()%>
					</a>
				</td>
				<td>
					<a href="MemberUpdateAction.me?id=<%=member.getMEMBER_ID() %>">
						수정
					</a>
				</td>
				<td>
					<a href="MemberDeleteAction.me?id=<%=member.getMEMBER_ID() %>">탈퇴</a>
				</td>
			</tr>
			<%} %>
			<tr align="center">
				<td colspan="3">
					<a href="BlogEnglish.me">HOME</a>&nbsp;&nbsp;
					<a href="BoardList.bo">BOARD</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>