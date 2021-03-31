<%@ page language="java" 
		contentType="text/html; charset=UTF-8"
    	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
		<style type="text/css">
		@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
		body{
		margin: 0;
		padding: 0;
		font-family: 'Nanum Gothic', sans-serif;
		/* background: url("backg.jpg"); */
		background-size: cover;
		}
		.topUserinfo {
		
		}
		.t {
		width:150px;
		height: 100px;
		margin-right: 10px;
		margin-top: 65px;
		align-self: center;
		float:right;
		background-color: white;
		border: 1.5px solid #B2CCFF;
		border-radius: 8px;
		}
		.topli1{
		margin-left: 10px;
		margin-top:25px;
		float: left;
		margin-right: 10px;
		}
		.topli2{
		align-self: center;
		
		}
		.topli2 a{
		text-decoration: none;
		color: black;
		}
		.topli2 input{
		text-decoration: none;
		color: black;
		background-color: white;
		font-size: 10px;
		margin-left: 0px;
		margin-top: 10px;
		border-radius: 12px;
		padding-bottom: 1px;
		}
		.tableContain {
		padding: 10px;
		}
		.tableContain table, td{
		border: 1.5px solid #B2CCFF;
		border-radius: 8px;
		}
		.h_logo {
text-decoration: none;
font-size: 40px;
color: #B2CCFF;
margin-left: 60px;
}
h1 {
padding: 10px;

}
#titleM {
		width: 300px;
		background-color: #EAEAEA;
		border: white;
		}
		#btnIN {
		border-radius: 6px;
		margin-left: 5px;
		margin-right: 5px;
		border: 2px solid #B2CCFF;
		background-color: white;
		}
		.tableContain textarea {
		margin: 1px; 
		width: 985px; 
		height: 345px;
		border-radius: 8px;
		resize: none;
		}
		#typeinfo {
		color: #8C8C8C;
		font-size: 13px;
		}
		</style>
	</head>
	<body>
		<jsp:useBean id="UserSs" scope="session" class="smartit.u1classm.UIDSession"></jsp:useBean>
	
		<%
		String type = request.getParameter("type");
		if(type.equals("free")){
			type = "자유";
		}else if(type.equals("nomal")){
			type = "일반";
		}
		%>
		<form action="InsertMemoBoxGo.jsp?type=<%=type %>&id=<%=UserSs.getId() %>" method="post">
		<div class = "topUserinfo">
		<div class = "t">
			<div class = "topli1">
				<i class="far fa-user-circle fa-3x"></i>
			</div>
			<div class = "topli2">
				<h6><%=UserSs.getId() %><br>
				<a href = "#">내정보</a><br>
				<input type="button" value= "Logout" onclick="location.href = 'ExMain.jsp'"></h6>
			</div>
		</div>
	</div>
	<h1 align="center">
		<a href="ExMainLogin.jsp" class="h_logo">
			Class Share
		</a>
	</h1>
	
	<h1>게시글입력</h1>
		<div class = "tableContain">
		<table border="1" width = "1000" height = "500">
			<tr>
				<td width="100" height="40">작성자: <%=UserSs.getId() %></td>
			</tr>
			<tr>
				<td height="40">제목: <input type="text"  id="titleM" name = "memotitle"  maxlength="20" placeholder="제목작성"> </td>
			</tr>
			<tr>
				<td height="40" id="typeinfo"><%=type %>게시판</td>
			</tr>
			<tr>
				<td ><textarea rows="" cols="" name = "txtarea"></textarea> </td>
			</tr>
			<tr>
				<td align="right" height="40"><input type="reset"  id="btnIN" value="초기화"><input type="submit" value="등록"  id="btnIN" > </td>
			</tr>
		</table>
	</div>
	</form>
	</body>
</html>