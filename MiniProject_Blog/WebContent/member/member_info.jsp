<%@page import="net.member.db.MemberBean"%>
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
			margin: 0 auto;
			text-align: center;
		}
		
		table {
    		border-collapse: collapse;
    		text-align: center;
    		line-height: 1.5;
    		width: 380px;
    		margin: 50px auto;
			text-align: center;
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
		
		.member_info_div {
			margin: 200px auto;
			text-align: center;	
			width: 400px;
			height: 500px;
		}
		
		a {
			text-decoration: none;
			color: black;
		}
		
		a:hover {
			font-weight: bold;
		}
	</style>
</head>
<body>
	<div class="member_info_div">
		<table>
			<tr >
				<th colspan="2">
					<%=member.getMEMBER_NAME()%> 회원 입니다.
				</th>
			</tr>
			<tr align="center">
				<th>아이디</th>
				<td><%=member.getMEMBER_ID()%></td>
			</tr>
			<tr align="center">
				<th>비밀번호</th>
				<td><%=member.getMEMBER_PW()%></td>
			</tr>
			<tr align="center">
				<th>이름</th>
				<td><%=member.getMEMBER_NAME()%></td>
			</tr>
			<tr align="center">
				<th>나이</th>
				<td><%=member.getMEMBER_AGE()%></td>
			</tr>
			<tr align="center">
				<th>이메일 주소</th>
				<td><%=member.getMEMBER_EMAIL()%></td>
			</tr>
			<tr align="center">
				<td colspan="2"><a href="MemberListAction.me">리스트로 돌아가기</a></td>
			</tr>
		</table>
	</div>
</body>
</html>