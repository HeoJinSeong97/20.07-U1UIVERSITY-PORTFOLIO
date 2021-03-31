<%@ page language="java" 
		contentType="text/html; charset=UTF-8"
    	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login</title>
		<style type="text/css">
		@import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:ital@1&family=Kanit:wght@300&display=swap');
		body {
		margin: 0;
		padding: 0;
		font-family: 'Kanit', sans-serif;
		background: url("backg.jpg");
		background-size: cover;
		}
		.login-box{
		width: 280px;
		position: absolute;
		top: 30%;
		left: 40%;
		tranform: translate(-50%,-50%);
		color: black;
		border: 1.5px solid #B2CCFF;
		padding: 30px;
		border-radius: 24px;
		background: #fff;
		}
		.login-box h1{
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
		.textbox input{
		border: none;
		outline: none;
		background: none;
		color: #C6C6C6;
		font-size: 18px;
		width: 80%;
		float: left;
		margin: 0 10px;
		cursor: pointer;
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
.joinserch {
text-decoration: none;
color: black;
}
		</style>
	</head>
	<body>
	<form action="LoginGo.jsp" method="post">
			<h1 align="center">
				<a href="ExMain.jsp" class="h_logo">
					Class Share
				</a>
			</h1>

		<div class = "login-box">
			<h1>Login</h1>
			<div class = "textbox">
				<input type="text" placeholder="Username" name = "ID" value="">
			</div>
			
			<div class = "textbox">
				<input type="password" placeholder="Password" name = "Password" value ="">
			</div>
			<!-- 로그인버튼을 누르면 데이터베이스에 있는 유저가 있는
			경우 로그인이 성공하며, 없으면 처음 화면으로 넘어간다. -->
			<input class="btn" type="submit" name = "btn" value="Sign in" >
			<a href = "UserInsert.jsp" class = "joinserch">JoinUP</a>/<a class = "joinserch" href = "#">SerchUID</a>
		</div>
		</form>
	</body>
</html>