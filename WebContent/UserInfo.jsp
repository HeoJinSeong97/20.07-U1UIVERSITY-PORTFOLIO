<%@ page language="java" 
		contentType="text/html; charset=UTF-8"
    	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>User Information</title>
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
		</style>
	</head>
	<body>
	<jsp:useBean id="UserSs" scope="session" class="smartit.u1classm.UIDSession"></jsp:useBean>
	<%
	String str = UserSs.getId();
	%>
	<%
	if(UserSs.ckid(str)){
		response.sendRedirect("ExMain.jsp");	
	}else{
		%>
		<h1 align="center">
			<a href="ExMain.jsp" class="h_logo">
				Class Share
			</a>
		</h1>
		<div class = "User_InfoBox">
			<h1>User<br> Information</h1>
			<div class = "textbox">
				ID: <%=UserSs.getId() %>
			</div>
			<div class = "textbox">
				Name: <%=UserSs.getName() %>
			</div>
			<div class = "textbox">
				Email: <%=UserSs.getEmail() %>
			</div>
			<div class = "textbox">
				Birthday: <%=UserSs.getBirthday() %>
			</div>
			<!-- 로그인버튼을 누르면 데이터베이스에 있는 유저가 있는
			경우 로그인이 성공하며, 없으면 처음 화면으로 넘어간다. -->
			<input class="btn" type="button" name = "btn" value="Go to Update" onclick="location.href='UserUpdate.jsp?id=<%= UserSs.getId()%>'">
			<%} %>
		</div>
	</body>
</html>