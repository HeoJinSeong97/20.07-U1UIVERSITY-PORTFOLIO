<%@page import="java.sql.PreparedStatement"%>
<%@page import="smartit.u1classm.DBUtill"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" 
		contentType="text/html; charset=UTF-8"
    	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>UserInfoUpdate</title>
		<style type="text/css">
		@import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:ital@1&family=Kanit:wght@300&display=swap');
		body {
		margin: 0;
		padding: 0;
		font-family: 'Kanit', sans-serif;
		background: url("backg.jpg");
		background-size: cover;
		}
		.User_InfoBox {
		width: 300px;
		position: absolute;
		top: 20%;
		left: 40%;
		tranform: translate(-50%,-50%);
		color: black;
		border: 1.5px solid #B2CCFF;
		padding: 30px;
		border-radius: 24px;
		background: #fff;
		}
		.User_InfoBox h1{
		font-size: 40px;
		border-bottom: 6px solid #B2CCFF;
		margin-bottom: 50px;
		padding: 13px 0;
		}
		.textbox{
		width: 100%;
		overflow: hidden;
		font-size: 20px;
		padding: 8px 0;
		margin: 8px 0;
		border-bottom: 1px solid #B2CCFF;
		}
		.btn {
		width: 100%;
		background: none;
		border: 2px solid #B2CCFF;
		color: black;
		padding: 5px;
		font-size: 18px;
		cursor: pointer;
		margin: 12px 0;
		border-radius: 24px;
		}
		.btn:hover {
		border: 2px solid #0054FF;
		}
		.h_logo {
text-decoration: none;
font-size: 40px;
color: #fff;
margin-left: 50px;
}
.textbox input {
	width: 200px;
}
		</style>
	</head>
	<body>
		업데이트중..
		<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		Connection conn = DBUtill.getMySqlConnection();
		String sql = "update memotable set password = ?, name = ?, birthday = ?, email = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		%>
		<jsp:useBean id="UserSs" scope="session" class="smartit.u1classm.UIDSession"></jsp:useBean>
		<h1 align="center">
			<a href="ExMain.jsp" class="h_logo">
				Class Share
			</a>
		</h1>
		<form action="UserUpdateGo.jsp?id=<%= UserSs.getId()%>" method="post">
		<div class = "User_InfoBox">
			<h1>User<br> UpDate</h1>
			<div class = "textbox">
				ID: <%=UserSs.getId() %>
			</div>
			<div class = "textbox">
				Name: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" placeholder="NAME" name = "name" value="<%=UserSs.getName() %>">
			</div>
			<div class = "textbox">
				Email: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" placeholder="Email@Email.com" name = "email" value="<%=UserSs.getEmail() %>">
			</div>
			<div class = "textbox">
				Birthday: <input type="text" placeholder="YYMMDD" name = "birthday" value="<%=UserSs.getBirthday() %>">
			</div>
			<%
			%>
			<!-- 로그인버튼을 누르면 데이터베이스에 있는 유저가 있는
			경우 로그인이 성공하며, 없으면 처음 화면으로 넘어간다. -->
			<input class="btn" type="submit" value="Go to Update">
		</div>
		</form>
	</body>
</html>